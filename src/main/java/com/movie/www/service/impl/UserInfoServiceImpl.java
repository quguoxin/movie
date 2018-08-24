package com.movie.www.service.impl;

import com.movie.www.entity.UserInfo;
import com.movie.www.mapper.UserInfoMapper;
import com.movie.www.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
