package ru.croc.transactions_service.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TransactionDTO {
    private UUID bankAccountNumber;
    private UUID organisationCode;
    private double transactionSum;
    private double balanceAfterTransaction;

    @NotBlank(message = "Operation category should not be blank!")
    private String operationCategory;
    private Timestamp date;
}
