package com.movie.www.service;

import com.movie.www.entity.UserInfo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import java.util.List;

@Service
public interface UserInfoService {
    //验证登录
    String findUserByPhoneAndPassword(UserInfo userInfo,HttpSession session);
    public void addSms(String phone);
    public int addUserInfo(UserInfo userInfo);
    public UserInfo findUserByPhone(String phone);
    public int updateUserInfoByUid(UserInfo userInfo);
    public List<UserInfo> findUserInfoByUid(int uId);

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
