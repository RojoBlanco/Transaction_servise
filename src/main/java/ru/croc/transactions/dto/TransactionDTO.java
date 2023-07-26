package ru.croc.transactions.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TransactionDTO {
    private UUID bankAccountNumber;
    private BigDecimal balanceAfterTransaction;
    private BigDecimal transactionSum;
    private UUID organisationCode;
    private String operationCategory;
    private Timestamp date;
}
