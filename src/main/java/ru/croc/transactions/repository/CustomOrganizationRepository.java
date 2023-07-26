package ru.croc.transactions.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.croc.transactions.domain.Organization;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface CustomOrganizationRepository extends JpaRepository<Organization, Long> {
    Optional<Organization> findByCode(UUID code);
}
