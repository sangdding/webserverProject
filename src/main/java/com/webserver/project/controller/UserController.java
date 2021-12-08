package com.webserver.project.controller;

import com.webserver.project.model.UserInfoDto;
import com.webserver.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


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
    public String Login(UserInfoDto userinfo, Model model) {
        Map<String, String> errorInfo = userService.LoginId(userinfo.getUserId(), userinfo.getUserPassword(), userinfo);


        if(!errorInfo.isEmpty()) {
            String key = String.valueOf(errorInfo.keySet());
            model.addAttribute(key, errorInfo.get(key));
            return "redirect:/login";
        }

        model.addAttribute("success", "로그인에 성공하셨습니다!");
        return "main";
    }

    @RequestMapping(value="/register.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String UserRegister(UserInfoDto userinfo, Model model) {

        Map<String, String> errorInfo = userService.checkExsistId(userinfo.getUserId()); //error정보 저장할 객체

        //만약 에러가 났으면
        if(!errorInfo.isEmpty()) {
            String key = String.valueOf(errorInfo.keySet());
            model.addAttribute(key, errorInfo.get(key));
            return "redirect:/register";
        } //다시 가입하세용

        userService.save(userinfo); //회원가입 성공!
        return "login"; //성공했으면 main으로 가즈아!
    }
}
