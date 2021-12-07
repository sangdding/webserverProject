package com.webserver.project.repository;

import com.webserver.project.model.UserInfo;
import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserInfo, Long> {

    UserInfo findByUserIdAndPassword(String id, String password);

    boolean existsByUserId(String id);
}
