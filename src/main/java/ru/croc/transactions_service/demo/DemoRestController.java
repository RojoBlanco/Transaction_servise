package ru.croc.transactions_service.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
public class DemoRestController {

    @GetMapping(value="/test", produces="application/json; charset=UTF-8")
    public static GreetingRecord isAliveResponse(){
        return new GreetingRecord(200, "Hi! I am Transactions Service! And I am ALIVE!");
    }

}
