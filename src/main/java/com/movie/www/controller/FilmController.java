package com.movie.www.controller;

import com.movie.www.bean.MyResponseBody;
import com.movie.www.bean.PageBean;
import com.movie.www.entity.Film;
import com.movie.www.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/film")
public class FilmController {
    @Autowired
    private FilmService filmService;
    @RequestMapping(value = ("/findAll"))
    @ResponseBody
    public MyResponseBody findFilmByParams(int pageNo, int pageSize, Film film){
        List<Film> list=filmService.findFilmByParams(pageNo,pageSize,film);
        int totalCount=filmService.findCount(film);
        int totalPage = (totalCount % pageSize == 0) ? (totalCount / pageSize) : ((totalCount / pageSize) + 1);
        MyResponseBody myResponeBody=new MyResponseBody();
        PageBean<Film> pageBean=new PageBean<Film>(pageNo,pageSize,totalPage,totalCount,list);
        myResponeBody.setCode(200);
        myResponeBody.setData(pageBean);

        return myResponeBody;
    }
    @RequestMapping(value = ("/findCount"))
    @ResponseBody
    public int findCount(Film film){
        return filmService.findCount(film);
    }

    @RequestMapping(value = "/findOneFilm")
    @ResponseBody
    public MyResponseBody findFilmById(int fId){
        List<Film> list=filmService.findFilmById(fId);
        MyResponseBody myResponeBody=new MyResponseBody();
        myResponeBody.setCode(200);
        myResponeBody.setData(list);
        return myResponeBody;
    }
}
