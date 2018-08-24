package com.movie.www.controller;

import com.movie.www.entity.UserInfo;
import com.movie.www.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserInfoService userInfoService;
    //验证登录
    @RequestMapping(value = "/doLogin")
    public String doLogin(UserInfo userInfo,HttpSession session){
        return userInfoService.findUserByPhoneAndPassword(userInfo,session);
    }
}
