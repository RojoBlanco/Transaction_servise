package ru.croc.transactions.exceptions;

public class OperationCategoryNotFoundException extends RuntimeException {
    public OperationCategoryNotFoundException(String message) {
        super(message);
    }
}
