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

@XFWObject
@Table(name = "operation_category")
public class OperationCategory {
    @Id
    @XFWElementLabel("Unique operation identifier")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "operation_category_seq")
    @SequenceGenerator(name = "operation_category_seq", sequenceName = "operation_category_seq", allocationSize = 1)
    private Long id;

    @XFWElementLabel("Category name")
    @Column(name = "name", nullable = false)
    private String name;

    @XFWElementLabel("Cashback percent given by this category")
    @Column(name = "cashback_percent", nullable = false)
    private BigDecimal cashbackPercent;

    @XFWElementLabel("Contribution status of the category")
    @Column(name = "status", nullable = false)
    private ContributionStatus status;
}
