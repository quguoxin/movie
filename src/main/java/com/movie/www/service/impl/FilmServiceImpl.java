package com.movie.www.service.impl;

import com.movie.www.entity.Film;
import com.movie.www.mapper.FilmMapper;
import com.movie.www.service.FilmService;
import com.movie.www.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.Date;
import java.util.List;

@Service
public class FilmServiceImpl implements FilmService {

    @Autowired
    private FilmMapper filmMapper;
    //正在热映
    @Override
    public List<Film> findIngFilm() {
        return filmMapper.findIngFilm();
    }

    @Override
    public List<Film> findNewFilm() {
        return filmMapper.findNewFilm();
    }

    @Override
    public List<Film> findFilmByParams(int pageNo, int pageSize, Film film) {
        Map<String,Object> map=new HashMap<>();
        map.put("pageNo",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);
        map.put("film",film);
        return filmMapper.findFilmByParams(map);
    }

    @Override
    public int findCount(Film film) {
        return filmMapper.findCount(film);
    }

    @Override
    public List<Film> findFilmById(int fId) {
        return filmMapper.findFilmById(fId);
    }

    @Override
    public List<Film> findListByPage(int offset, int limit, Film film) {
        return null;
    }

    @Override
    public int addFilm(Film film) {
        return 0;
    }

    @Override
    public int updateFilm(Film film) {
        return 0;
    }

    @Override
    public int deleteFilm(int fId) {
        return 0;
    }

    @Override
    public int findfidByFFileName(String fileName) {
        Film film=filmMapper.findfidByFFileName(fileName);
        if(film !=null){
            return film.getfId();
        }else {
            return 0;
        }
    }
}
