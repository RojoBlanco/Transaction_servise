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
     * Идентификатор трансакции
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "transactions_seq")
    @SequenceGenerator(name = "transactions_seq", sequenceName = "transactions_seq", allocationSize = 1)
    private Long id;

    /**
     * Номер банковскгого счета
     */
     @Column(name = "bank_account_number", nullable = false)
    private UUID bankAccount;

     /**
     * ID клиента
     */
     @Column(name = "client_id", nullable = false)
    private Long clientId;

    /**
     * Время транзакции
     */
     @Column(name = "date", nullable = false)
    private Timestamp date;
    /**
     * Сумма транзакции
     */
     @Column(name = "transaction_sum", nullable = false)
    private Double transactionSum;
    /**
     * Баланс до транзакции
     */
     @Column(name = "balance_before_transaction", nullable = false)
    private Double balanceBeforeTransaction;

    /**
     * Код организации
     */
     @Column(name = "organization_code", nullable = false)
    private UUID organizationCode;
    /**
     * Имя категории
     */
     @Column(name = "operation_category", nullable = false)
    private String operationCategory;

}
