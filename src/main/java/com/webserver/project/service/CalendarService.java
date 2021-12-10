package com.webserver.project.service;

import com.webserver.project.model.dto.CalendarDto;
import com.webserver.project.model.dto.UserInfoDto;
import com.webserver.project.model.entity.CalendarInfo;
import com.webserver.project.repository.CalRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CalendarService {

    private final CalRepository calRepository;

    public void save(CalendarDto calendarDto) {
        calRepository.save(CalendarInfo.builder()
                .calDate(calendarDto.getCalDate())
                .bm(calendarDto.getBm())
                .diet(calendarDto.getDiet())
                .build());
    } // 캘린더를 만들어 볼까요옹? 하하핳핳하
}
