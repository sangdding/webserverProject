package com.webserver.project.repository;

import com.webserver.project.model.entity.dietInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface dietRepository extends JpaRepository<dietInfo, Long> {
}
