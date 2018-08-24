package com.movie.www.service;

import com.movie.www.bean.ApartFilm;
import com.movie.www.mapper.FilmRankMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface FilmRankService {

    public List<ApartFilm> selectByScore();


    List<ApartFilm> selectByPrice();
}
