package com.movie.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class login {

    @RequestMapping(value = "/doLogin")
    public String doLogin(String phone,String password){
        return "main";
    }
}
