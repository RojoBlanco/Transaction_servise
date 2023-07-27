package ru.croc.transactions.api;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.croc.transactions.dto.TransactionDTO;
import ru.croc.transactions.service.CustomTransactionsService;

@RestController
@RequestMapping("/api/v1/transactions")
@Slf4j
@RequiredArgsConstructor
public class TransactionsRestController {
    private final CustomTransactionsService transactionsService;

    @PostMapping("/handle-cashback-transaction")
    public TransactionDTO handleCashbackTransaction(@Valid @RequestBody TransactionDTO transactionDTO) {
        log.info("Received transactionDTO: {}", transactionDTO);
        return transactionsService.handleCashbackTransaction(transactionDTO);
    }
}
