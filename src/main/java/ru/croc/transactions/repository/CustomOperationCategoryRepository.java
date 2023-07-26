package ru.croc.transactions.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.croc.transactions.domain.OperationCategory;

import java.util.Optional;

@Repository
public interface CustomOperationCategoryRepository extends JpaRepository<OperationCategory, Long> {
    Optional<OperationCategory> findByName(String name);
}
