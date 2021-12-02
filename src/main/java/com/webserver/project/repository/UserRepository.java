package com.webserver.project.repository;

import com.webserver.project.model.UserInfo;
import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserInfo, Long> {

    Optional<UserInfo> findByUserId(String id);

    Optional<UserInfo> findByPassword(String password);

    String findNameByUserId(String id);

    boolean existsByUserId(String id);
}
