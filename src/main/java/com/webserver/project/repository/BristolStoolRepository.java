package com.webserver.project.repository;


import com.webserver.project.model.dto.BristolStoolDto;
import com.webserver.project.model.entity.BristolStoolInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BristolStoolRepository extends JpaRepository<BristolStoolInfo, Long> {
}
