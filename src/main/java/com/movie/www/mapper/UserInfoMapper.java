package com.movie.www.mapper;

import com.movie.www.entity.UserInfo;

import java.util.List;
import java.util.Map;

public interface UserInfoMapper {
    //验证登录
    UserInfo findUserByPhoneAndPassword(UserInfo userInfo);
    public int addUserInfo(UserInfo userInfo);
    public UserInfo findUserByPhone(String phone);
    public int updateUserInfoByUid(UserInfo userInfo);
    public List<UserInfo> findUserInfoByUid(int uId);

    List<UserInfo> findListByPage(Map<String, Object> map);

    int findCount(UserInfo userInfo);

    int addUser(UserInfo userInfo);

    int updateUser(UserInfo userInfo);

    int deleteUser(int uId);
}
