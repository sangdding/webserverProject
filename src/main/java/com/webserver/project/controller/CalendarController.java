package com.webserver.project.controller;

import com.webserver.project.SessionConstants;
import com.webserver.project.model.dto.BristolStoolDto;
import com.webserver.project.model.dto.CalendarDto;
import com.webserver.project.model.dto.UserInfoDto;
import com.webserver.project.service.BristolStoolService;
import com.webserver.project.service.CalendarService;
import com.webserver.project.service.dietService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
public class CalendarController {

    private final CalendarService calendarService;
    private final BristolStoolService bristolStoolService;
    private final dietService dietservice;

    @RequestMapping(value = "/calendar")//,method = RequestMethod.GET
    public String CalendarView(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        UserInfoDto userInfoDto = (UserInfoDto)session.getAttribute(SessionConstants.LOGIN_USER); // 세션에 저장된 유저 정보를 불러온다.
        if(userInfoDto != null) model.addAttribute("user_name", userInfoDto.getUserName());
        return "calendar";
    }

    @RequestMapping(value = "selectPopup")
    public String selectPopupView() {
        return "selectPopup";
    }

    @RequestMapping(value = "selectPopup.do")
    public String selectPopupDo(String calDate, String menu, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("date", calDate);
        System.out.println(calDate + menu);
        if(Objects.equals(menu, "bmPopup")) {
            return "redirect:/bmPopup";
        } else if(Objects.equals(menu, "bmInfo")) {
            return "redirect:/bmInfo";
        } else if(Objects.equals(menu, "dietPopup")) {
            return "redirect:/dietPopup";
        } else {
            return "redirect:/dietInfo";
        }
    }

    @RequestMapping(value = "bmPopup")
    public String bmPopupView() {
        return "bmPopup";
    }

    @RequestMapping(value = "dietPopup")
    public String dietPopupView() {
        return "dietPopup";
    }

    @RequestMapping(value= "bmInfo")
    public String bminfoView(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String calDate = (String) session.getAttribute("date");
        bristolStoolService.findInfo(calDate, model);
        return "bmInfo";
    }

    @RequestMapping(value="dietInfo")
    public String dietinfoView(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String calDate = (String) session.getAttribute("date");
        dietservice.findInfo(calDate, model);
        return "dietInfo";
    }

    @RequestMapping(value = "/bmPopup.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String bmPopup(HttpServletRequest request, CalendarDto calendarDto, @Valid BristolStoolDto bristolStoolDto, BindingResult bindingResult) {
        HttpSession session = request.getSession();
        if(bindingResult.hasErrors()) {
            return "redirect:/bmPopup";
        }
        UserInfoDto userInfoDto = (UserInfoDto)session.getAttribute(SessionConstants.LOGIN_USER);
        calendarService.save(calendarDto, userInfoDto.getUserId(), userInfoDto.getUserPassword());
        bristolStoolService.save(bristolStoolDto, calendarDto.getCalDate());
        return "redirect:/calendar";
    }

    @RequestMapping(value = "/dietPopup.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String dietPopup(HttpServletRequest request, String diet, CalendarDto calendarDto, BindingResult bindingResult) {
        HttpSession session = request.getSession();
        if(bindingResult.hasErrors()) {
            return "redirect:/dietPopup";
        }
        UserInfoDto userInfoDto = (UserInfoDto)session.getAttribute(SessionConstants.LOGIN_USER);
        calendarService.save(calendarDto, userInfoDto.getUserId(), userInfoDto.getUserPassword());
        String date = (String) session.getAttribute("date");
        dietservice.setDiet(date, diet);
        return "redirect:/calendar";
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
