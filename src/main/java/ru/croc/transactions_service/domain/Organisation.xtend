package ru.croc.transactions_service.domain;

import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.SequenceGenerator;

import ru.croc.ctp.jxfw.core.generator.meta.XFWObject;
import java.util.UUID;

@XFWObject
public class Operation {
    /**
     * Идентификатор категории
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_table_seq")
    @SequenceGenerator(name = "user_table_seq", sequenceName = "user_table_seq", allocationSize = 1)
    private Long id;

    /**
     * Номер банковскгого счета
     */
    private UUID code;

     /**
         * Процент кэшбека
         */
    private Double cashbackPercent;

       /**
            * Статус изменения
            */
       private ContributionStatus status;


}
