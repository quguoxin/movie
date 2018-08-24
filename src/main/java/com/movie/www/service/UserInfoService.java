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

}
