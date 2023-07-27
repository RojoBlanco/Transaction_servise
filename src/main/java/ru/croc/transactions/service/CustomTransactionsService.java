package ru.croc.transactions.service;

import ru.croc.transactions.dto.TransactionDTO;

public interface CustomTransactionsService {
    TransactionDTO handleCashbackTransaction(TransactionDTO transactionDTO);
}
