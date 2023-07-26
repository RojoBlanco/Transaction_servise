package ru.croc.transactions.service;

import ru.croc.transactions.dto.CashbackTransactionDTO;
import ru.croc.transactions.dto.TransactionDTO;

public interface CustomTransactionsService {
    CashbackTransactionDTO handleCashbackTransaction(TransactionDTO transactionDTO);
}
