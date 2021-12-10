package com.webserver.project.repository;

import com.webserver.project.model.entity.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserInfo, Long> {

    UserInfo findByUserIdAndPassword(String id, String password);

    boolean existsByUserId(String id);
}
