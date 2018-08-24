package com.movie.www.service.impl;

import com.movie.www.bean.ApartFilm;
import com.movie.www.mapper.FilmRankMapper;
import com.movie.www.service.FilmRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FilmRankServiceImpl  implements FilmRankService{
    @Autowired
    private FilmRankMapper filmRankMapper;
    @Override

    public List<ApartFilm> selectByScore() {
        return filmRankMapper.selectByScore();
    }

    @Override
    public List<ApartFilm> selectByPrice() {
        return filmRankMapper.selectByPrice();
    }
}
