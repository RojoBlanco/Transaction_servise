package ru.croc.transactions.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.croc.transactions.domain.OrganizationFlexibleCashback;

import java.util.List;
import java.util.UUID;

@Repository
public interface CustomFlexibleOrganizationCashbackRepository extends JpaRepository<OrganizationFlexibleCashback, Long> {
    List<OrganizationFlexibleCashback> findAllByOrganizationCode(UUID organizationCode);
}
