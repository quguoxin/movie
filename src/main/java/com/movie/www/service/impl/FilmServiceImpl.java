package com.movie.www.service.impl;

import com.movie.www.entity.Film;
import com.movie.www.mapper.FilmMapper;
import com.movie.www.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FilmServiceImpl implements FilmService {
    @Autowired
    private FilmMapper filmMapper;
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
}
