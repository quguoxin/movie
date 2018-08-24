package com.movie.www.mapper;

import com.movie.www.entity.UserInfo;

import java.util.List;

public interface UserInfoMapper {
    //验证登录
    UserInfo findUserByPhoneAndPassword(UserInfo userInfo);
    public int addUserInfo(UserInfo userInfo);
    public UserInfo findUserByPhone(String phone);
    public int updateUserInfoByUid(UserInfo userInfo);
    public List<UserInfo> findUserInfoByUid(int uId);
}
