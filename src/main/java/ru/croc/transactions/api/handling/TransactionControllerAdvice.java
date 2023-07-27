package ru.croc.transactions.api.handling;

import feign.FeignException;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import ru.croc.transactions.dto.ResponseMessage;
import ru.croc.transactions.exceptions.CardNotFoundException;
import ru.croc.transactions.exceptions.OperationCategoryNotFoundException;
import ru.croc.transactions.exceptions.OrganizationNotFoundException;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class TransactionControllerAdvice {
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Map<String, String> handleValidationExceptions(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });

        return errors;
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({CardNotFoundException.class, FeignException.class,
            OrganizationNotFoundException.class, OperationCategoryNotFoundException.class})
    public ResponseMessage handleBankAccountNotFoundException(Exception exception) {
        return ResponseMessage.builder()
                .message(exception.getMessage())
                .build();
    }
}
