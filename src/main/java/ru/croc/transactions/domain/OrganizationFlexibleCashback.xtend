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
@Table(name = "organization_flexible_cashback")
public class OrganizationFlexibleCashback {
    @Id
    @XFWElementLabel("Unique transaction identifier")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "organization_flexible_cashback_seq")
    @SequenceGenerator(name = "organization_flexible_cashback_seq", sequenceName = "organization_flexible_cashback_seq", allocationSize = 1)
    private Long id;

    @XFWElementLabel("Organization code")
    @Column(name = "organization_code", nullable = false)
    private UUID organizationCode;

    @XFWElementLabel("Min transaction sum to get that cashback percent")
    @Column(name = "min_transaction_sum", nullable = false)
    private BigDecimal minTransactionSum;

    @XFWElementLabel("Cashback percent of the organization")
    @Column(name = "cashback_percent", nullable = false)
    private BigDecimal cashbackPercent;
}
