package com.movie.www.service;

import com.movie.www.entity.Film;

import java.util.List;

public interface FilmService {
    public List<Film> findFilmByParams(int pageNo, int pageSize, Film film);
    public int findCount(Film film);
    public List<Film> findFilmById(int fId);

    List<Film> findListByPage(int offset, int limit, Film film);

    int addFilm(Film film);

    int updateFilm(Film film);

    int deleteFilm(int fId);
}
