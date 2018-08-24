package com.movie.www.mapper;

import com.movie.www.bean.ApartFilm;

import java.util.List;

public interface FilmRankMapper {
    List<ApartFilm> selectByScore();

    List<ApartFilm> selectByPrice();
}
