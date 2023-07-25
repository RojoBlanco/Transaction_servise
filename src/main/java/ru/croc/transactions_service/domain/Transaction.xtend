package ru.croc.transactions_service.domain;


import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.SequenceGenerator;

import ru.croc.ctp.jxfw.core.generator.meta.XFWObject;
import java.util.UUID;
import java.sql.Timestamp;

@XFWObject
public class Transaction {
    /**
     * Идентификатор трансакции
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_table_seq")
    @SequenceGenerator(name = "user_table_seq", sequenceName = "user_table_seq", allocationSize = 1)
    private Long id;

    /**
     * Номер банковскгого счета
     */
    private UUID bankAccount;

     /**
         * ID клиента
         */
    private Long clientId;

    /**
     * Время транзакции
     */
    private Timestamp date;
    /**
     * Сумма транзакции
     */
    private Double transactionSum;
    /**
     * Баланс до транзакции
     */
    private Double balanceBeforeTransaction;

    /**
     * Код организации
     */
    private UUID organisationCode;
    /**
     * Имя категории
     */
    private String operationCategory;

}
