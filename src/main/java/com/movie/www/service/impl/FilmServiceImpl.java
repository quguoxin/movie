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
    public List<Film> findListByPage(int offset, int limit,Film film) {
        Map<String,Object> map=new HashMap<>(  );
        map.put( "offset",offset );
        map.put( "limit",limit );
        map.put( "film",film );
        return filmMapper.findListByPage(map);
    }

    @Override
    public int findCount(Film film) {
        return filmMapper.findCount(film);
    }

    @Override
    public int addFilm(Film film) {
        return filmMapper.addFilm(film);
    }

    @Override
    public int updateFilm(Film film) {
        return filmMapper.updateFilm(film);
    }

    @Override
    public int deleteFilm(int fId) {
        return filmMapper.deleteFilm(fId);
    }


}
