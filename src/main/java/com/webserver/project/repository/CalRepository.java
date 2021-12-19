package com.webserver.project.repository;

import com.webserver.project.model.entity.CalendarInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CalRepository extends JpaRepository<CalendarInfo, Long> {
//    @Modifying
//    @Query("UDATE Calendar WHERE ")
    CalendarInfo findByCalDate(String calDate);

    boolean existsByCalDate(String calDate);
}
