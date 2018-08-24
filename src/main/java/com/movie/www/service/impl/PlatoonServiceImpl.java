package com.movie.www.service.impl;

import com.movie.www.bean.PlatoonBean;
import com.movie.www.entity.Film;
import com.movie.www.mapper.PlatoonMapper;
import com.movie.www.service.PlatoonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PlatoonServiceImpl implements PlatoonService{
    @Autowired
    private PlatoonMapper platoonMapper;
    @Override
    public List<PlatoonBean> findPlatoonByParams(int fId) {
       return  platoonMapper.findPlatoonByParams(fId);
    }

    @Override
    public int findCount(PlatoonBean platoonBean) {
        return platoonMapper.findCount(platoonBean);
    }
}
