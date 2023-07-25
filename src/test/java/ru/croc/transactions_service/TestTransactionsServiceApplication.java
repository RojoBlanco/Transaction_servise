package ru.croc.transactions_service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.TestConfiguration;

@TestConfiguration(proxyBeanMethods = false)
public class TestTransactionsServiceApplication {

	public static void main(String[] args) {
		SpringApplication.from(TransactionsServiceApplication::main).with(TestTransactionsServiceApplication.class).run(args);
	}

}
