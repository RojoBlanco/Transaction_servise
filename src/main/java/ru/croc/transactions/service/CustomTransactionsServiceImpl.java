package ru.croc.transactions.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.croc.transactions.domain.ContributionStatus;
import ru.croc.transactions.domain.OperationCategory;
import ru.croc.transactions.domain.Organization;
import ru.croc.transactions.dto.BankAccountDTO;
import ru.croc.transactions.dto.CardDTO;
import ru.croc.transactions.dto.CashbackTransactionDTO;
import ru.croc.transactions.dto.TransactionDTO;
import ru.croc.transactions.exceptions.CardNotFoundException;
import ru.croc.transactions.repository.CustomOperationCategoryRepository;
import ru.croc.transactions.repository.CustomOrganizationRepository;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class CustomTransactionsServiceImpl implements CustomTransactionsService {
    private static final String CARDS_SERVICE_URL = "http://localhost:8080/api/v1/cards/get-card-type";
    private static final BigDecimal MIN_BALANCE_BEFORE_TRANSACTION_DEFAULT_HIPSTER_CARD = BigDecimal.valueOf(30000);
    private static final BigDecimal MIN_BALANCE_BEFORE_TRANSACTION_GOLD_HIPSTER_CARD = BigDecimal.valueOf(50000);
    private static final String HIPSTER_DEFAULT_CARD_NAME = "HIPSTER_DEFAULT";
    private static final String HIPSTER_GOLD_CARD_NAME = "HIPSTER_GOLD";

    private final RestTemplate restTemplate = new RestTemplate();

    private final CustomOrganizationRepository organizationRepository;
    private final CustomOperationCategoryRepository operationCategoryRepository;

    @Override
    public CashbackTransactionDTO handleCashbackTransaction(TransactionDTO transactionDTO) {
        CardDTO cardDTO = restTemplate.postForObject(CARDS_SERVICE_URL, BankAccountDTO.builder()
                .bankAccount(transactionDTO.getBankAccountNumber())
                .build(), CardDTO.class);

        if (cardDTO == null) {
            throw new CardNotFoundException("Card with bank account " + transactionDTO.getBankAccountNumber() +
                    " was not found!");
        }

        log.info("Received cardDTO: cardTypeName={}, cashbackPercent={}", cardDTO.getCardTypeName(),
                cardDTO.getCashbackPercent());

        boolean wasMinBalanceBeforeTransaction = checkMinBalanceBeforeTransaction(cardDTO,
                transactionDTO.getTransactionSum(), transactionDTO.getBalanceAfterTransaction());

        boolean wasTransactionInLastPeriod = checkWasTransactionInLastPeriod(transactionDTO);

        BigDecimal finalCashback = BigDecimal.ZERO;
        if (wasMinBalanceBeforeTransaction && wasTransactionInLastPeriod) {
            finalCashback = calculateFinalCashback(cardDTO, transactionDTO);
        }

        return CashbackTransactionDTO.builder()
                .bankAccountNumber(transactionDTO.getBankAccountNumber())
                .balanceAfterTransaction(transactionDTO.getBalanceAfterTransaction())
                .transactionSum(transactionDTO.getTransactionSum())
                .organisationCode(transactionDTO.getOrganisationCode())
                .operationCategory(transactionDTO.getOperationCategory())
                .date(transactionDTO.getDate())
                .cashback(finalCashback)
                .build();
    }

    private BigDecimal calculateFinalCashback(CardDTO cardDTO, TransactionDTO transactionDTO) {
        BigDecimal cardCashbackPercent = cardDTO.getCashbackPercent();
        BigDecimal organizationCashbackPercent = getOrganizationCashbackPercent(transactionDTO.getOrganisationCode());
        BigDecimal operationCategoryCashbackPercent = getOperationCategoryCashbackPercent(transactionDTO.getOperationCategory());

        BigDecimal finalCashbackPercent = findMaxCashbackPercent(cardCashbackPercent,
                organizationCashbackPercent, operationCategoryCashbackPercent);

        log.info("Final max cashback percent is: {}%", finalCashbackPercent);
        return finalCashbackPercent;
    }

    private boolean checkWasTransactionInLastPeriod(TransactionDTO transactionDTO) {
        return true;
    }

    private boolean checkMinBalanceBeforeTransaction(CardDTO cardDTO, BigDecimal transactionSum,
                                                     BigDecimal balanceAfterTransaction) {
        BigDecimal balanceBeforeTransaction = balanceAfterTransaction.subtract(transactionSum);
        if (cardDTO.getCardTypeName().equals(HIPSTER_DEFAULT_CARD_NAME)) {
            return balanceBeforeTransaction.compareTo(MIN_BALANCE_BEFORE_TRANSACTION_DEFAULT_HIPSTER_CARD) > 0;
        }

        if (cardDTO.getCardTypeName().equals(HIPSTER_GOLD_CARD_NAME)) {
            return balanceBeforeTransaction.compareTo(MIN_BALANCE_BEFORE_TRANSACTION_GOLD_HIPSTER_CARD) > 0;
        }

        return true;
    }

    private BigDecimal getOrganizationCashbackPercent(UUID organisationCode) {
        Optional<Organization> organization = organizationRepository.findByCode(organisationCode);
        if (organization.isEmpty()) {
            return BigDecimal.ZERO;
        }

        if (!organization.get().getStatus().equals(ContributionStatus.APPROVED)) {
            return BigDecimal.ZERO;
        }

        return organization.get().getCashbackPercent();
    }

    private BigDecimal getOperationCategoryCashbackPercent(String operationCategoryName) {
        Optional<OperationCategory> operationCategory = operationCategoryRepository.findByName(operationCategoryName);
        if (operationCategory.isEmpty()) {
            return BigDecimal.ZERO;
        }

        if (!operationCategory.get().getStatus().equals(ContributionStatus.APPROVED)) {
            return BigDecimal.ZERO;
        }

        return operationCategory.get().getCashbackPercent();
    }

    private BigDecimal findMaxCashbackPercent(BigDecimal cardCashbackPercent, BigDecimal organizationCashbackPercent,
                                              BigDecimal operationCategoryCashbackPercent) {
        BigDecimal maxFromCardAndOrganization = cardCashbackPercent.max(organizationCashbackPercent);
        return maxFromCardAndOrganization.max(operationCategoryCashbackPercent);
    }
}
