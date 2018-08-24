package com.movie.www.mapper;

import com.movie.www.entity.Platoon;

import java.util.List;
import java.util.Map;


public interface PlatoonMapper {
    public int addPlatoon(Platoon platoon);
    public int findCount(Platoon platoon);
    public List<Platoon> findListByPage(Map<String,Object> map);
    public int updatePlatoon(Platoon pId);

    int delPlatoon(Platoon platoon);
}
