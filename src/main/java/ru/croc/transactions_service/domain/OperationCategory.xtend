package ru.croc.transactions_service.domain;


import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Column;

import ru.croc.ctp.jxfw.core.generator.meta.XFWObject;
import java.util.UUID;
import java.sql.Timestamp;

@XFWObject
@Table(name = "operation_category")
public class OperationCategory {
    /**
     * Category ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "operation_category_seq")
    @SequenceGenerator(name = "operation_category_seq", sequenceName = "operation_category_seq", allocationSize = 1)
    private Long id;

    /**
     * name of category
     */
     @Column(name = "name", nullable = false)
    private String name;

     /**
     * Cashback percentage
     */
     @Column(name = "cashback_percent",nullable = false)
    private Double cashbackPercent;

    /**
    * Change Status
    */
      @Column(name = "status",nullable = false)
       private ContributionStatus status;


}
