package com.movie.www.service.impl;

import com.movie.www.bean.SelectSeatBean;
import com.movie.www.entity.Film;
import com.movie.www.entity.Order;
import com.movie.www.entity.Platoon;
import com.movie.www.mapper.FilmMapper;
import com.movie.www.mapper.OrderMapper;
import com.movie.www.mapper.PlatoonMapper;
import com.movie.www.service.PlatoonService;
import org.springframework.beans.factory.annotation.Autowired;
import com.movie.www.bean.PlatoonBean;
import com.movie.www.entity.Film;
import com.movie.www.mapper.PlatoonMapper;
import com.movie.www.service.PlatoonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.List;

@Service
public class PlatoonServiceImpl implements PlatoonService{

    @Autowired
    private PlatoonMapper platoonMapper;
    @Autowired
    private FilmMapper filmMapper;
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public SelectSeatBean findSelectSeatBean(int pId) {
        Platoon platoon=platoonMapper.findPlatoon(pId);//获取排片对象
        Film film=filmMapper.findFilmByFid(platoon.getfId());//获取电影对象
        List<Order> list=orderMapper.findSeatList(pId);
        String str="";
        for(int i=0;i<list.size();i++){
            String str2=list.get(i).getSeatNo();
            str+=str2.substring(1,str2.length());
        }
        String[] seatNoArray=str.split(",");
        SelectSeatBean selectSeatBean=new SelectSeatBean();
        selectSeatBean.setpId(pId);
        selectSeatBean.setHallNo(platoon.getHallNo());
        selectSeatBean.setfId(platoon.getfId());
        selectSeatBean.setFileName(film.getFileName());
        selectSeatBean.setPlayDate(platoon.getPlayDate());
        selectSeatBean.setPiayTime(platoon.getPiayTime());
        selectSeatBean.setFilePrice(film.getFilePrice());
        selectSeatBean.setSeatNoArray(seatNoArray);
        return selectSeatBean;
    }

    @Override
    public List<PlatoonBean> findPlatoonByParams(int fId) {
        return  platoonMapper.findPlatoonByParams(fId);
    }

    @Override
    public int findCount(PlatoonBean platoonBean) {
        return platoonMapper.findCount(platoonBean);
    }

    @Override
    public int addPlatoon(Platoon platoon) {
        return platoonMapper.addPlatoon(platoon);
    }
    @Override
    public int findCountForAdmin(Platoon platoon) {
        return platoonMapper.findCountForAdmin(platoon);
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
