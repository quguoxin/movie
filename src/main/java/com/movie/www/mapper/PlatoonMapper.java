package com.movie.www.mapper;

import com.movie.www.entity.Platoon;


import com.movie.www.bean.PlatoonBean;

import java.util.List;
import java.util.Map;

public interface PlatoonMapper {
    Platoon findPlatoon(int pId);
    public List<PlatoonBean> findPlatoonByParams(int fId);
    public int findCount(PlatoonBean platoonBean);

}
