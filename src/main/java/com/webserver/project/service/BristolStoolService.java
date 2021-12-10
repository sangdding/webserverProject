package com.webserver.project.service;

import com.webserver.project.model.dto.BristolStoolDto;
import com.webserver.project.model.entity.BristolStoolInfo;
import com.webserver.project.model.dto.CalendarDto;
import com.webserver.project.repository.BristolStoolRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

@RequiredArgsConstructor
@Service
public class BristolStoolService {

    private final BristolStoolRepository bristolStoolRepository;

    public void getTwoWeekInfo(CalendarDto calendarDto, Model model) {

        Calendar calendar = new GregorianCalendar();
        SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMdd");
        String chkDate = SDF.format(calendar.getTime());
        int value;
        for(int i = 0; i < 14; i++) {
            value = Integer.parseInt(chkDate);
            for(int j = 0; j < 14; j++) {

            }
            calendar.add(Calendar.DATE, -1);
        }
    }

    public void save(BristolStoolDto bristolStoolDto) {
        bristolStoolRepository.save(BristolStoolInfo.builder()
                .color(bristolStoolDto.getColor())
                .shape(bristolStoolDto.getShape())
                .smell(bristolStoolDto.getSmell()).build());
    } // 똥 상태정보 저장
}
