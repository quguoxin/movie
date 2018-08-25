package com.movie.www.controller;

import com.movie.www.bean.MyResponseBody;
import com.movie.www.entity.UserInfo;
import com.movie.www.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserInfoService userInfoService;
    //验证登录
    @RequestMapping(value = "/doLogin")
    @ResponseBody
    public MyResponseBody doLogin(UserInfo userInfo, HttpSession session){
        String url= userInfoService.findUserByPhoneAndPassword(userInfo,session);
        MyResponseBody myResponeBody=new MyResponseBody();
        myResponeBody.setCode(200);
        myResponeBody.setData(url);
        myResponeBody.setMsg("密码或账号错误，请重新输入！");
        return myResponeBody;
    }
}
