package ru.croc.transactions.clients;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import ru.croc.transactions.dto.BankAccountDTO;
import ru.croc.transactions.dto.CardDTO;

@FeignClient(name = "cards", url = "http://cards-service-8082:8082/api/v1/cards")
public interface CardsClient {
    @PostMapping("/get-card-type")
    CardDTO getCardType(BankAccountDTO bankAccountDTO);
}
