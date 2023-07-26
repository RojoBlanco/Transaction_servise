package ru.croc.transactions.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import org.eclipse.xtend.lib.annotations.Data;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CashbackTransactionDTO {
    private UUID bankAccountNumber;
    private BigDecimal balanceAfterTransaction;
    private BigDecimal transactionSum;
    private UUID organisationCode;
    private String operationCategory;
    private Timestamp date;
    private BigDecimal cashback;
}