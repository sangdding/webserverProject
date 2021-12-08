package com.webserver.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConditionController {

    @RequestMapping(value = "calander/dm")
    public String dm() {
        return "dm";
    }

    @RequestMapping(value="calander/diet")
    public String diet() {
        return "diet";
    }

}
