package com.movie.www.service;

import com.movie.www.bean.SelectSeatBean;

import com.movie.www.bean.PlatoonBean;
import com.movie.www.entity.Platoon;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PlatoonService {

    int addPlatoon(Platoon platoon);
    int findCountForAdmin(Platoon platoon);
    List<Platoon> findListByPage(int offset, int limit, Platoon platoon);
    int updatePlatoon(Platoon platoon);

    int delPlatoon(Platoon platoon);

    //返回SelectSeatBean
    public SelectSeatBean findSelectSeatBean(int pid);
    public List<PlatoonBean> findPlatoonByParams(int fId);
    public int findCount(PlatoonBean platoonBean);
}
