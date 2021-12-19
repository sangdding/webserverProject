package com.webserver.project.service;

import com.webserver.project.model.entity.BristolStoolInfo;
import com.webserver.project.model.entity.CalendarInfo;
import com.webserver.project.model.entity.dietInfo;
import com.webserver.project.repository.CalRepository;
import com.webserver.project.repository.dietRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@RequiredArgsConstructor
public class dietService {

    private final CalRepository calRepository;
    private final dietRepository dietrepository;

    public void findInfo(String calDate, Model model) {
        CalendarInfo calendarInfo = calRepository.findByCalDate(calDate);
        dietInfo dietinfo = calendarInfo.getDietInfos().get(0);
        model.addAttribute("diet", dietinfo.getDiet());
    }

    public void setDiet(String date, String diet) {
        CalendarInfo calendarInfo = calRepository.findByCalDate(date);
        dietInfo dietinfo = new dietInfo();
        dietinfo.setDiet(diet);
        dietinfo.setCalendarInfo(calendarInfo);
        dietrepository.save(dietinfo);
    }
}
