package com.webserver.project.service;

import com.webserver.project.model.dto.CalendarDto;
import com.webserver.project.model.entity.BristolStoolInfo;
import com.webserver.project.model.entity.CalendarInfo;
import com.webserver.project.model.entity.UserInfo;
import com.webserver.project.repository.CalRepository;
import com.webserver.project.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CalendarService {

    private final CalRepository calRepository;
    private final UserRepository userRepository;

    public void save(CalendarDto calendarDto, String userId, String userPassword) {
        UserInfo userInfo;
        userInfo = userRepository.findByUserIdAndPassword(userId, userPassword);
        CalendarInfo calendarInfo = CalendarInfo.builder()
                .calDate(calendarDto.getCalDate())
                .userInfo(userInfo)
                .build();
        calRepository.save(calendarInfo);
    } // 캘린더를 만들어 볼까요옹? 하하핳핳하
}
