package com.webserver.project.controller;

import com.webserver.project.SessionConstants;
import com.webserver.project.model.dto.UserInfoDto;
import com.webserver.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Map;

@Controller
@RequiredArgsConstructor

public class MainController {

    private final UserService userService;

    @RequestMapping(value = "/login")
    public String LoginView() {
        return "login";
    }

    @RequestMapping(value = "/register")
    public String RegisterView() {
        return "register";
    }

    @RequestMapping(value="/login.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String Login(@Valid UserInfoDto userinfo, BindingResult bindingResult, Model model, HttpServletRequest request) {
        Map<String, String> errorInfo = userService.LoginId(userinfo.getUserId(), userinfo.getUserPassword());
        HttpSession session = request.getSession();
        if(!errorInfo.isEmpty()) {
            return "login";
        }
        userService.setUserName(userinfo, userinfo.getUserId(), userinfo.getUserPassword());
        session.setAttribute(SessionConstants.LOGIN_USER, userinfo);
        model.addAttribute("user_id", userinfo.getUserName());
        return "calendar";
    }

    @RequestMapping(value="/register.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String UserRegister(@Valid UserInfoDto userinfo, BindingResult bindingResult, Model model) {
        Map<String, String> errorInfo = userService.checkExistId(userinfo.getUserId()); //error정보 저장할 객체
        //만약 에러가 났으면
        if(!errorInfo.isEmpty()) {
            String key = String.valueOf(errorInfo.keySet());
            return "register";
        } //다시 가입하세용
        userService.save(userinfo); //회원가입 성공!
        return "login"; //성공했으면 login으로 가즈아!
    }

    @RequestMapping(value="/logout.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String Logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session != null) {
            session.invalidate();
        }
        return "login";
    }
}
