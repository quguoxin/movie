package com.movie.www.controller;

import com.movie.www.bean.MyResponseBody;
import com.movie.www.entity.UserInfo;
import com.movie.www.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserInfoController {
    @Autowired
    private UserInfoService userInfoService;
    @RequestMapping("/findUserInfoByUid")
    @ResponseBody
    public MyResponseBody findUserInfoByUid(int uId){
        List<UserInfo> list=userInfoService.findUserInfoByUid(uId);
        MyResponseBody myResponeBody=new MyResponseBody();
        myResponeBody.setCode(200);
        myResponeBody.setData(list);
        return myResponeBody;
    }


    @RequestMapping("/updateUserInfoByUid")
    @ResponseBody
    public MyResponseBody updateUserInfoByUid(UserInfo userInfo, HttpSession session, HttpServletRequest request){
        MyResponseBody myResponeBody=new MyResponseBody();
        int uId= (int) session.getAttribute("uId");
        //String portrait=(String) session.getAttribute("fileName");
        //String portrait= (String) request.getAttribute("fileName");
        userInfo.setPortrait("11.jpg");
        userInfo.setuId(uId);
        int n=userInfoService.updateUserInfoByUid(userInfo);
        if (n>0){
            myResponeBody.setCode(200);
            myResponeBody.setMsg("修改成功!");
        }else {
            myResponeBody.setCode(-1);
            myResponeBody.setMsg("修改失败!");
        }
        return myResponeBody;
    }
}
