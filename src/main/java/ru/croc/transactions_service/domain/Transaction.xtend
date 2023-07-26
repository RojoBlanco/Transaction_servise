package ru.croc.transactions_service.domain;


import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Column;

import ru.croc.ctp.jxfw.core.generator.meta.XFWObject;
import java.util.UUID;
import java.sql.Timestamp;

@XFWObject
@Table(name = "transactions")
public class Transaction {
    /**
     * Transaction ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "transactions_seq")
    @SequenceGenerator(name = "transactions_seq", sequenceName = "transactions_seq", allocationSize = 1)
    private Long id;

    /**
     * Bank account number
     */
     @Column(name = "bank_account_number", nullable = false)
    private UUID bankAccount;

    /**
     * transaction_sum
     */
     @Column(name = "transaction_sum", nullable = false)
    private Double transactionSum;

    /**
     * balance_before_transaction
     */
     @Column(name = "balance_before_transaction", nullable = false)
    private Double balanceBeforeTransaction;

    /**
     * Transaction time
     */
     @Column(name = "date", nullable = false)
    private Timestamp date;



    /**
     * Organization code
     */
    @Column(name = "organization_code", nullable = false)
    private UUID organizationCode;
    /**
     * Category name
     */
    @Column(name = "operation_category", nullable = false)
    private String operationCategory;

}
