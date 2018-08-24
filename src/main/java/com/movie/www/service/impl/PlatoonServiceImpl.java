package com.movie.www.service.impl;

import com.movie.www.entity.Platoon;
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
    public int addPlatoon(Platoon platoon) {
        return platoonMapper.addPlatoon(platoon);
    }
    @Override
    public int findCount(Platoon platoon) {
        return platoonMapper.findCount(platoon);
    }

    @Override

    public List<Platoon> findListByPage(int startIndex, int pageSize, Platoon platoon) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("startIndex",startIndex);
        map.put("pageSize",pageSize);
        map.put("platoon",platoon);
        List<Platoon> list = platoonMapper.findListByPage(map);

        return list;
    }

    @Override
    public int updatePlatoon(Platoon platoon) {
        return platoonMapper.updatePlatoon(platoon);
    }

    @Override
    public int delPlatoon(Platoon platoon) {
        return platoonMapper.delPlatoon(platoon);
    }
}
