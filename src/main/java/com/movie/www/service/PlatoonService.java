package com.movie.www.service;

import com.movie.www.bean.PlatoonBean;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PlatoonService {
    public List<PlatoonBean> findPlatoonByParams(int fId);
    public int findCount(PlatoonBean platoonBean);
}
