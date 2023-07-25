package ru.croc.transactions_service.api;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.croc.transactions_service.dto.TransactionDTO;

@RestController
@RequestMapping("/api/v1/transactions")
@Slf4j
public class TransactionHandlingController {
    @PostMapping("/handle-transaction")
    public void handleTransaction(@Valid @RequestBody TransactionDTO transactionDTO) {
        log.info("Received transaction with bankAccountNumber: {}",
                transactionDTO.getBankAccountNumber());
    }
}
