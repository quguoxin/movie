package com.movie.www.service;

import com.movie.www.entity.Film;

import java.util.List;

public interface FilmService {
    List<Film> findListByPage(int offset, int limit,Film film);

    int findCount(Film film);

    int addFilm(Film film);

    int updateFilm(Film film);

    int deleteFilm(int uId);
}
