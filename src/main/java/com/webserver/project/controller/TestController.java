package com.webserver.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping("/bmPopup")
    public String shit() {
        return "bmPopup";
    }
}
