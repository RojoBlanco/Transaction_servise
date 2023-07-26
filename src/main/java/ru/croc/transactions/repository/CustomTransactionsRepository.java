package ru.croc.transactions.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.croc.transactions.domain.Transaction;

import java.util.List;
import java.util.UUID;

@Repository
public interface CustomTransactionsRepository extends JpaRepository<Transaction, Long> {
    List<Transaction> findAllByBankAccount(UUID bankAccount);
}
