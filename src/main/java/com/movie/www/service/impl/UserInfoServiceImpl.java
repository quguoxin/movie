package com.movie.www.service.impl;

import com.movie.www.service.UserInfoService;
import com.movie.www.sms.SmsUtils;
import com.movie.www.util.JedisUtil;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Override
    public void addSms(String phone) {
      int randomCode= (int) ((Math.random()*9000)+1000);
        JedisUtil jedisUtil=JedisUtil.getInstance();
        jedisUtil.add(phone+"-code",randomCode+"",60);
        SmsUtils.sendOneSms(randomCode+"",phone,"12345uutuyr33311");
    }
}
