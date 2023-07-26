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
     * Category ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "organization_seq")
    @SequenceGenerator(name = "organization_seq", sequenceName = "organization_seq", allocationSize = 1)
    private Long id;

    /**
     *Bank account number
     */
    @Column(name = "code",nullable = false)
    private UUID code;

     /**
     * cashback_percent
     */
    @Column(name = "cashbackPercent",nullable = false)
    private Double cashbackPercent;

    /**
    * Change Status
    */
    @Column(name = "status",nullable = false)
    private ContributionStatus status;
}
