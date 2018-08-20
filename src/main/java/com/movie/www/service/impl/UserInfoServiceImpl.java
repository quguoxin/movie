package com.movie.www.service.impl;

import com.movie.www.entity.UserInfo;
import com.movie.www.mapper.UserInfoMapper;
import com.movie.www.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;
    //验证登录
    @Override
    public String findUserByPhoneAndPassword(UserInfo userInfo) {
        UserInfo userInfo1=userInfoMapper.findUserByPhoneAndPassword(userInfo);

        if(userInfo1!=null){
            if(userInfo1.getUserName().equals("admin")){
                return "adminPage";
            }else {
                return "main";
            }
        }
        return "login_user";
    }
}
