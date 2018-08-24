package com.movie.www.controller;

import com.movie.www.bean.MyResponeBody;
import com.movie.www.entity.UserInfo;
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
    public MyResponeBody register(UserInfo userInfo,String smsNumber){
    MyResponeBody myResponeBody=new MyResponeBody();
    String oldCode= JedisUtil.getInstance().getByKey(userInfo.getPhone()+"-code");
    if (!StringUtils.isNotEmpty(oldCode)){
        myResponeBody.setCode(9988);
        myResponeBody.setMsg("你的验证码已过期");
        return myResponeBody;
    }
    if (smsNumber.equals(oldCode)){
        int num=userInfoService.addUserInfo(userInfo);
        if (num>0){
            myResponeBody.setCode(200);
            myResponeBody.setMsg("注册成功");
        }else if (num==-2){
            myResponeBody.setCode(-2);
            myResponeBody.setMsg("手机号码已被注册");
        }else{
            myResponeBody.setCode(-1);
            myResponeBody.setMsg("注册失败");
        }
    }else {
       myResponeBody.setCode(9999);
       myResponeBody.setMsg("你输入的验证码不正确");
    }
    return myResponeBody;
    }
}
