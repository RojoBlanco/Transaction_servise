package ru.croc.transactions.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.croc.transactions.clients.CardsClient;
import ru.croc.transactions.domain.ContributionStatus;
import ru.croc.transactions.domain.OperationCategory;
import ru.croc.transactions.domain.Organization;
import ru.croc.transactions.domain.OrganizationFlexibleCashback;
import ru.croc.transactions.domain.Transaction;
import ru.croc.transactions.dto.BankAccountDTO;
import ru.croc.transactions.dto.CardDTO;
import ru.croc.transactions.dto.CashbackTransactionDTO;
import ru.croc.transactions.dto.TransactionDTO;
import ru.croc.transactions.exceptions.OperationCategoryNotFoundException;
import ru.croc.transactions.exceptions.OrganizationNotFoundException;
import ru.croc.transactions.repository.CustomFlexibleOrganizationCashbackRepository;
import ru.croc.transactions.repository.CustomOperationCategoryRepository;
import ru.croc.transactions.repository.CustomOrganizationRepository;
import ru.croc.transactions.repository.CustomTransactionsRepository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class CustomTransactionsServiceImpl implements CustomTransactionsService {
    private static final String DEFAULT_CARD_NAME = "DEFAULT_CARD";
    private static final long TIME_FROM_LAST_HIPSTOCARD_TRANSACTION = 2592000000L;

    private final CustomOrganizationRepository organizationRepository;
    private final CustomOperationCategoryRepository operationCategoryRepository;
    private final CustomTransactionsRepository transactionRepository;
    private final CustomFlexibleOrganizationCashbackRepository flexibleOrganizationCashbackRepository;
    private final CardsClient cardsClient;

    @Override
    public CashbackTransactionDTO handleCashbackTransaction(TransactionDTO transactionDTO) {
        CardDTO cardDTO = cardsClient.getCardType(BankAccountDTO.builder()
                .bankAccount(transactionDTO.getBankAccountNumber()).build());

        log.info("Received cardDTO: cardTypeName={}, cashbackPercent={}, minBalanceForCashback={}",
                cardDTO.getCardTypeName(), cardDTO.getCashbackPercent(), cardDTO.getMinBalanceForCashback());

        boolean wasMinBalanceBeforeTransaction = checkMinBalanceBeforeTransaction(cardDTO,
                transactionDTO.getTransactionSum(), transactionDTO.getBalanceAfterTransaction());

        boolean wasTransactionInLastPeriod = checkWasTransactionInLastPeriod(transactionDTO);

        BigDecimal finalCashbackPercent = BigDecimal.ZERO;
        if (wasMinBalanceBeforeTransaction && wasTransactionInLastPeriod && !cardDTO.getCardTypeName().equals(DEFAULT_CARD_NAME)) {
            finalCashbackPercent = calculateFinalCashbackPercent(cardDTO, transactionDTO);
        }

        saveTransactionToDatabase(transactionDTO);

        return CashbackTransactionDTO.builder()
                .bankAccountNumber(transactionDTO.getBankAccountNumber())
                .balanceAfterTransaction(transactionDTO.getBalanceAfterTransaction())
                .transactionSum(transactionDTO.getTransactionSum())
                .organisationCode(transactionDTO.getOrganisationCode())
                .operationCategory(transactionDTO.getOperationCategory())
                .date(transactionDTO.getDate())
                .cashback(transactionDTO.getTransactionSum().multiply(finalCashbackPercent).divide(BigDecimal.valueOf(100)))
                .build();
    }

    private boolean checkMinBalanceBeforeTransaction(CardDTO cardDTO, BigDecimal transactionSum,
                                                     BigDecimal balanceAfterTransaction) {
        BigDecimal balanceBeforeTransaction = balanceAfterTransaction.subtract(transactionSum);
        log.info("balanceBeforeTransaction={}", balanceAfterTransaction);
        return balanceBeforeTransaction.compareTo(cardDTO.getMinBalanceForCashback()) > 0;
    }

    private boolean checkWasTransactionInLastPeriod(TransactionDTO transactionDTO) {
        List<Transaction> transactions = transactionRepository.findAllByBankAccount(transactionDTO.getBankAccountNumber());
        for (Transaction transaction : transactions) {
            long msBetweenTransactions = transactionDTO.getDate().getTime() - transaction.getDate().getTime();
            if (msBetweenTransactions <= TIME_FROM_LAST_HIPSTOCARD_TRANSACTION) {
                log.info("Found transaction in last period");
                return true;
            }
        }

        return false;
    }

    private BigDecimal calculateFinalCashbackPercent(CardDTO cardDTO, TransactionDTO transactionDTO) {
        BigDecimal cardCashbackPercent = cardDTO.getCashbackPercent();
        BigDecimal organizationCashbackPercent = getOrganizationCashbackPercent(transactionDTO.getOrganisationCode());
        BigDecimal operationCategoryCashbackPercent = getOperationCategoryCashbackPercent(transactionDTO.getOperationCategory());
        BigDecimal flexibleOrganizationCashback = getFlexibleOrganizationCashback(transactionDTO.getOrganisationCode(),
                transactionDTO.getTransactionSum());

        BigDecimal finalCashbackPercent = findMaxCashbackPercent(cardCashbackPercent,
                organizationCashbackPercent, operationCategoryCashbackPercent, flexibleOrganizationCashback);

        log.info("Final max cashback percent is: {}%", finalCashbackPercent);
        return finalCashbackPercent;
    }

    private BigDecimal getOrganizationCashbackPercent(UUID organisationCode) {
        Optional<Organization> organization = organizationRepository.findByCode(organisationCode);
        if (organization.isEmpty()) {
            throw new OrganizationNotFoundException("Organization with this code is not in database!");
        }

        if (!organization.get().getStatus().equals(ContributionStatus.APPROVED)) {
            return BigDecimal.ZERO;
        }

        return organization.get().getCashbackPercent();
    }

    private BigDecimal getOperationCategoryCashbackPercent(String operationCategoryName) {
        Optional<OperationCategory> operationCategory = operationCategoryRepository.findByName(operationCategoryName);
        if (operationCategory.isEmpty()) {
            throw new OperationCategoryNotFoundException("Operation category with this name is not in database!");
        }

        if (!operationCategory.get().getStatus().equals(ContributionStatus.APPROVED)) {
            return BigDecimal.ZERO;
        }

        return operationCategory.get().getCashbackPercent();
    }

    private BigDecimal getFlexibleOrganizationCashback(UUID organisationCode, BigDecimal transactionSum) {
        List<OrganizationFlexibleCashback> organizationFlexibleCashbacks =
                flexibleOrganizationCashbackRepository.findAllByOrganizationCode(organisationCode);

        BigDecimal flexibleOrganizationCashback = BigDecimal.ZERO;
        for (OrganizationFlexibleCashback organizationFlexibleCashback : organizationFlexibleCashbacks) {
            if (transactionSum.compareTo(organizationFlexibleCashback.getMinTransactionSum()) >= 0) {
                flexibleOrganizationCashback = flexibleOrganizationCashback.max(organizationFlexibleCashback.getCashbackPercent());
            }
        }

        return flexibleOrganizationCashback;
    }

    private BigDecimal findMaxCashbackPercent(BigDecimal cardCashbackPercent, BigDecimal organizationCashbackPercent,
                                              BigDecimal operationCategoryCashbackPercent,
                                              BigDecimal flexibleOrganizationCashback) {
        BigDecimal maxFromCardAndOrganization = cardCashbackPercent.max(organizationCashbackPercent);
        BigDecimal maxFromOperationAndFlexible = operationCategoryCashbackPercent.max(flexibleOrganizationCashback);
        return maxFromCardAndOrganization.max(maxFromOperationAndFlexible);
    }

    private void saveTransactionToDatabase(TransactionDTO transactionDTO) {
        Transaction transaction = buildTransactionFromDTO(transactionDTO);
        transactionRepository.save(transaction);
    }

    private Transaction buildTransactionFromDTO(TransactionDTO transactionDTO) {
        Transaction transaction = new Transaction();
        transaction.setBankAccount(transactionDTO.getBankAccountNumber());
        transaction.setBalanceBeforeTransaction(transactionDTO.getBalanceAfterTransaction()
                .subtract(transactionDTO.getTransactionSum()));
        transaction.setTransactionSum(transactionDTO.getTransactionSum());
        transaction.setOrganizationCode(transactionDTO.getOrganisationCode());
        transaction.setOperationCategory(transactionDTO.getOperationCategory());
        transaction.setDate(transactionDTO.getDate());

        return transaction;
    }
}
