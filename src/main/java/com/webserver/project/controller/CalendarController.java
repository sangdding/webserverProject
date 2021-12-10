package com.webserver.project.controller;

import com.webserver.project.SessionConstants;
import com.webserver.project.model.dto.BristolStoolDto;
import com.webserver.project.model.dto.CalendarDto;
import com.webserver.project.model.dto.UserInfoDto;
import com.webserver.project.service.BristolStoolService;
import com.webserver.project.service.CalendarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class CalendarController {

    private CalendarService calendarService;
    private BristolStoolService bristolStoolService;

    @RequestMapping(value = "/calendar")//,method = RequestMethod.GET
    public String CalendarView(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        UserInfoDto userInfoDto = (UserInfoDto)session.getAttribute(SessionConstants.LOGIN_USER); // 세션에 저장된 유저 정보를 불러온다.
        model.addAttribute("user_name", userInfoDto.getUserName());
        return "calendar";
    }

    @RequestMapping(value = "/bmPopup.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String bmPopup(HttpServletRequest request, CalendarDto calendarDto, @Valid BristolStoolDto bristolStoolDto, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            return "bmPopup";
        }

        bristolStoolService.save(bristolStoolDto);
        return "calendar";
    }

    @RequestMapping(value = "/bm")
    public String bm(CalendarDto calendarDto, Model model) {

        return "BristolInfo";
    }

    @RequestMapping(value="/diet")
    public String diet() {
        return "diet";
    }

}
