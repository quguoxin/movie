package com.movie.www.service;

import com.movie.www.entity.UserInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserInfoService {
    public void addSms(String phone);
    String findUserByPhoneAndPassword(UserInfo userInfo);
    public int addUserInfo(UserInfo userInfo);
    public UserInfo findUserByPhone(String phone);
    public int updateUserInfoByUid(UserInfo userInfo);
    public List<UserInfo> findUserInfoByUid(int uId);

}
