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
import java.util.UUID;

@XFWObject
@Table(name = "organization")
public class Organization {
    @Id
    @XFWElementLabel("Unique organization identification")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "organization_seq")
    @SequenceGenerator(name = "organization_seq", sequenceName = "organization_seq", allocationSize = 1)
    private Long id;

    @XFWElementLabel("Organization code")
    @Column(name = "code", nullable = false)
    private UUID code;

    @XFWElementLabel("Name of the organization")
    @Column(name = "name", nullable = false)
    private String name;

    @XFWElementLabel("Cashback percent of the organization")
    @Column(name = "cashbackPercent", nullable = false)
    private BigDecimal cashbackPercent;

    @XFWElementLabel("Contribution status of the organization")
    @Column(name = "status", nullable = false)
    private ContributionStatus status;
}
