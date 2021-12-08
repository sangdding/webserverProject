package com.webserver.project.repository;

import com.webserver.project.model.CalendarDto;
import com.webserver.project.model.CalendarInfo;
import com.webserver.project.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;

@Repository
public interface CalRepository extends JpaRepository<CalendarInfo, Long> {
//    @Modifying
//    @Query("UDATE Calendar WHERE ")
}
