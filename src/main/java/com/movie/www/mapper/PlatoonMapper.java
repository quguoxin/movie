package com.movie.www.mapper;


import com.movie.www.bean.PlatoonBean;

import java.util.List;
import java.util.Map;

public interface PlatoonMapper {
    public List<PlatoonBean> findPlatoonByParams(int fId);
    public int findCount(PlatoonBean platoonBean);

}
