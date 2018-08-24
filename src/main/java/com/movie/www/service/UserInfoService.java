package com.movie.www.service;

import com.movie.www.entity.UserInfo;

import java.util.List;

public interface UserInfoService {
    //验证登录
    String findUserByPhoneAndPassword(UserInfo userInfo);
    //分页
    List<UserInfo> findListByPage(int offset, int limit,UserInfo userInfo);

    int findCount(UserInfo userInfo);


    //增加
    int addUser(UserInfo userInfo);
    //修改
    int updateUser(UserInfo userInfo);
    //删除
    int deleteUser(int uId);


}
