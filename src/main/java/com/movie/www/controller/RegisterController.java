package com.movie.www.controller;

import com.movie.www.bean.MyResponeBody;
import com.movie.www.service.UserInfoService;
import com.movie.www.util.JedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class RegisterController {
    @Autowired
    private UserInfoService userInfoService;
@RequestMapping(value = "/sendsms")
@ResponseBody
    public MyResponeBody sendSms(String phone){
    MyResponeBody myResponeBody=new MyResponeBody();
    userInfoService.addSms(phone);
    myResponeBody.setCode(200);
    myResponeBody.setMsg("短信发送成功");
     return myResponeBody;
    }
    @RequestMapping("/register")
    @ResponseBody
    public MyResponeBody register(String userName,String password,String phone,String code){
    MyResponeBody myResponeBody=new MyResponeBody();
    String oldCode= JedisUtil.getInstance().getByKey(phone+"");
    if (StringUtils.isNotEmpty(oldCode)){
        myResponeBody.setCode(9998);
        myResponeBody.setMsg("你的验证码已过期");
        return myResponeBody;
    }
    if (code.equals(oldCode)){
       myResponeBody.setCode(200);
       myResponeBody.setMsg("短信发送成功");
    }else {
       myResponeBody.setCode(9999);
       myResponeBody.setMsg("你输入的验证码不正确");
    }
    return myResponeBody;
    }
}
