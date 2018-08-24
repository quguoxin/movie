package com.movie.www.controller;

import com.movie.www.bean.MyResponseBody;
import com.movie.www.entity.Film;
import com.movie.www.mapper.FilmMapper;
import com.movie.www.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/homePage")
public class homePageController {

    @Autowired
    private FilmService filmService;

    //正在热映
    @RequestMapping("/getIngFilm")
    @ResponseBody
    public MyResponseBody getIngFilm(){
        List<Film> list=filmService.findIngFilm();
        MyResponseBody myResponseBody=new MyResponseBody();
        myResponseBody.setCode(200);
        myResponseBody.setMsg("显示正在热映的电影");
        myResponseBody.setData(list);
        return myResponseBody;
    }

    //正在热映
    @RequestMapping("/getNewFilm")
    @ResponseBody
    public MyResponseBody getNewFilm(){
        List<Film> list=filmService.findNewFilm();
        MyResponseBody myResponseBody=new MyResponseBody();
        myResponseBody.setCode(200);
        myResponseBody.setMsg("显示还没上映的电影");
        myResponseBody.setData(list);
        return myResponseBody;
    }
}
