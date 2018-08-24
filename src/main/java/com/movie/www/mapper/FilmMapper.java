package com.movie.www.mapper;


import com.movie.www.entity.Film;

import java.util.List;
import java.util.Map;

public interface  FilmMapper {

    int findCount(Film film);

    List<Film> findListByPage(Map<String, Object> map);

    int addFilm(Film film);

    int updateFilm(Film film);

    int deleteFilm(int fId );
}
