package com.movie.www.mapper;


import com.movie.www.entity.Film;

import java.util.List;

import com.movie.www.entity.Film;

import java.util.List;
import java.util.Map;

public interface  FilmMapper {
    /*public List<Film> findFilmByParams(int pageNo, int pageSize, Film film);*/
    public int findCount(Film film);

    public List<Film> findIngFilm();

    public List<Film> findNewFilm();

    Film findFilmByFid(int fId);

    List<Film> findFilmByParams(Map<String, Object> map);

    List<Film> findFilmById(int fId);

    Film findfidByFFileName(String fileName);


    int findCountForAdmin(Film film);

    List<Film> findListByPage(Map<String, Object> map);

    int addFilm(Film film);

    int updateFilm(Film film);

    int deleteFilm(int fId );
}
