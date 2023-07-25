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
@Table(name = "organisation")
public class Organisation {
    /**
     * Идентификатор категории
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "organisation_seq")
    @SequenceGenerator(name = "organisation_seq", sequenceName = "organisation_seq", allocationSize = 1)
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
