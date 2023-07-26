package ru.croc.transactions.domain;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import ru.croc.ctp.jxfw.core.domain.meta.XFWElementLabel;
import ru.croc.ctp.jxfw.core.generator.meta.XFWObject;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.UUID;

@XFWObject
@Table(name = "transactions")
public class Transaction {
    @Id
    @XFWElementLabel("Unique transaction identifier")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "transaction_seq")
    @SequenceGenerator(name = "transaction_seq", sequenceName = "transaction_seq", allocationSize = 1)
    private Long id;

    @XFWElementLabel("Bank account number")
    @Column(name = "bank_account_number", nullable = false)
    private UUID bankAccount;

    @XFWElementLabel("Transaction date")
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @XFWElementLabel("Transaction sum")
    @Column(name = "transaction_sum", nullable = false)
    private BigDecimal transactionSum;

    @XFWElementLabel("Balance on a bank account before transaction")
    @Column(name = "balance_before_transaction", nullable = false)
    private BigDecimal balanceBeforeTransaction;

    @XFWElementLabel("Organization code of a transaction")
    @Column(name = "organization_code", nullable = false)
    private UUID organizationCode;

    @XFWElementLabel("Transaction category name")
    @Column(name = "operation_category", nullable = false)
    private String operationCategory;
}
