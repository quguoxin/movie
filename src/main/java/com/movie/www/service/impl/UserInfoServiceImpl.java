package com.movie.www.service.impl;

import com.movie.www.entity.UserInfo;
import com.movie.www.mapper.UserInfoMapper;
import com.movie.www.service.UserInfoService;
import com.movie.www.sms.SmsUtils;
import com.movie.www.util.JedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;
    @Override
    public void addSms(String phone) {
     int randomString=(int) ((Math.random()*9000)+1000);
        JedisUtil jedisUtil=JedisUtil.getInstance();
        jedisUtil.add(phone+"-code",randomString+"",300);
        SmsUtils.sendOneSms(randomString+"",phone,"ewrijvhowuqouo11");
    }

    @Override
    public String findUserByPhoneAndPassword(UserInfo userInfo, HttpSession session) {
        UserInfo userInfo1 = userInfoMapper.findUserByPhoneAndPassword(userInfo);
        if (userInfo1 != null) {
            if (userInfo1.getUserName().equals("admin")) {
                return "adminPage";
            } else {
                session.setAttribute("uId", userInfo1.getuId());
                session.setAttribute("touxiang",userInfo1.getPortrait());
                return "main";
            }
        }
        return "login_user";
    }

    @Override
    public int addUserInfo(UserInfo userInfo) {
        UserInfo info = userInfoMapper.findUserByPhone(userInfo.getPhone());
        if (info!=null){
            return -2;
        }else {
            int num = userInfoMapper.addUserInfo(userInfo);
            return num;
        }
    }
    @Override
    public UserInfo findUserByPhone(String phone) {
        return userInfoMapper.findUserByPhone(phone);
    }

    @Override
    public int updateUserInfoByUid(UserInfo userInfo) {
        return userInfoMapper.updateUserInfoByUid(userInfo);
    }

    @Override
    public List<UserInfo> findUserInfoByUid(int uId) {
        return null;
    }


    @Override
    public List<UserInfo> findListByPage(int offset, int limit,UserInfo userInfo) {
        Map<String, Object> map = new HashMap<>();
        map.put( "offset", offset );
        map.put( "limit", limit );
        map.put( "userInfo",userInfo );
        return  userInfoMapper.findListByPage(map);
    }

    @Override
    public int findCount(UserInfo userInfo) {
        return userInfoMapper.findCount(userInfo);
    }

    @Override
    public int addUser(UserInfo userInfo) {
        return userInfoMapper.addUser(userInfo);
    }

    @Override
    public int updateUser(UserInfo userInfo) {
        return userInfoMapper.updateUser(userInfo);
    }

    @Override
    public int deleteUser(int uId) {
        return userInfoMapper.deleteUser(uId);
    }


}
