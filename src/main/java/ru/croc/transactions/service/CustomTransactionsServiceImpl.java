package ru.croc.transactions.service;

import org.springframework.stereotype.Service;
import ru.croc.transactions.dto.CashbackTransactionDTO;
import ru.croc.transactions.dto.TransactionDTO;

import java.math.BigDecimal;

@Service
public class CustomTransactionsServiceImpl implements CustomTransactionsService {
    @Override
    public CashbackTransactionDTO handleCashbackTransaction(TransactionDTO transactionDTO) {
        return CashbackTransactionDTO.builder()
                .bankAccountNumber(transactionDTO.getBankAccountNumber())
                .balanceAfterTransaction(transactionDTO.getBalanceAfterTransaction())
                .transactionSum(transactionDTO.getTransactionSum())
                .organisationCode(transactionDTO.getOrganisationCode())
                .operationCategory(transactionDTO.getOperationCategory())
                .date(transactionDTO.getDate())
                .cashback(BigDecimal.ZERO)
                .build();
    }
}
