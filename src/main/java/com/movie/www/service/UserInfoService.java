package com.movie.www.service;

import com.movie.www.entity.UserInfo;

public interface UserInfoService {
    //验证登录
    String findUserByPhoneAndPassword(UserInfo userInfo);
}
