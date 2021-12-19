package com.webserver.project.service;

import com.webserver.project.model.dto.BristolStoolDto;
import com.webserver.project.model.entity.BristolStoolInfo;
import com.webserver.project.model.dto.CalendarDto;
import com.webserver.project.model.entity.CalendarInfo;
import com.webserver.project.repository.BristolStoolRepository;
import com.webserver.project.repository.CalRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Optional;

@RequiredArgsConstructor
@Service
public class BristolStoolService {

    private final CalRepository calRepository;
    private final BristolStoolRepository bristolStoolRepository;

    public void findInfo(String calDate, Model model) {
        CalendarInfo calendarInfo = calRepository.findByCalDate(calDate);
        BristolStoolInfo bristolStoolinfo = calendarInfo.getBristolStoolInfos().get(0);
        model.addAttribute("color", bristolStoolinfo.getColor());
        model.addAttribute("shape", bristolStoolinfo.getShape());
        model.addAttribute("smell", bristolStoolinfo.getSmell());
        model.addAttribute("time", bristolStoolinfo.getTime());
    }

    public void save(BristolStoolDto bristolStoolDto, String calDate) {
        CalendarInfo calendarInfo = calRepository.findByCalDate(calDate);
        BristolStoolInfo bristolStoolInfo = BristolStoolInfo.builder()
                .color(bristolStoolDto.getColor())
                .shape(bristolStoolDto.getShape())
                .smell(bristolStoolDto.getSmell())
                .time(bristolStoolDto.getTime())
                .build();
        bristolStoolInfo.setCalendarInfo(calendarInfo);
        bristolStoolRepository.save(bristolStoolInfo);
    } // 똥 상태정보 저장
}
