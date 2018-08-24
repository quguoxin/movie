package com.movie.www.service;

import com.movie.www.entity.Platoon;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PlatoonService {
    int addPlatoon(Platoon platoon);
    int findCount(Platoon platoon);
    List<Platoon> findListByPage(int offset, int limit, Platoon platoon);
    int updatePlatoon(Platoon platoon);

    int delPlatoon(Platoon platoon);
}
