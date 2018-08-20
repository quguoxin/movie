package com.movie.www.mapper;

import com.movie.www.entity.UserInfo;

public interface UserInfoMapper {
    //验证登录
    UserInfo findUserByPhoneAndPassword(UserInfo userInfo);
}
