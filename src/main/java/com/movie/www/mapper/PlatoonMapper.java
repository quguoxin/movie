package com.movie.www.mapper;

import com.movie.www.entity.Platoon;


import com.movie.www.bean.PlatoonBean;

import java.util.List;
import java.util.Map;

public interface PlatoonMapper {
    Platoon findPlatoon(int pId);
    public List<PlatoonBean> findPlatoonByParams(int fId);
    public int findCount(PlatoonBean platoonBean);


    public int addPlatoon(Platoon platoon);
    public int findCountForAdmin(Platoon platoon);
    public List<Platoon> findListByPage(Map<String,Object> map);
    public int updatePlatoon(Platoon pId);

    int delPlatoon(Platoon platoon);

}
