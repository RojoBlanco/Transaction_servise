package ru.croc.transactions_service.domain;

import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Column;

import ru.croc.ctp.jxfw.core.generator.meta.XFWObject;
import java.util.UUID;

@XFWObject
@Table(name = "organization")
public class Organization {
    /**
     * Идентификатор категории
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "organization_seq")
    @SequenceGenerator(name = "organization_seq", sequenceName = "organization_seq", allocationSize = 1)
    private Long id;

    /**
     * Номер банковскгого счета
     */
     @Column(name = "code",nullable = false)
    private UUID code;

     /**
     * Процент кэшбека
     */
      @Column(name = "cashbackPercent",nullable = false)
    private Double cashbackPercent;

       /**
       * Статус изменения
       */
       @Column(name = "status",nullable = false)
       private ContributionStatus status;


}
