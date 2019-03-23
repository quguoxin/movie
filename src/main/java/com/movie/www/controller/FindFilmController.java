package com.movie.www.controller;

import com.movie.www.bean.MyResponseBody;
import com.movie.www.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/findFilm")
public class FindFilmController {

    @Autowired
    private FilmService filmService;

    @RequestMapping("/findFilmByFileName")
    @ResponseBody
    public MyResponseBody findFilmByFileName(String fileName){
        int fId= filmService.findfidByFFileName(fileName);
        MyResponseBody myResponseBody=new MyResponseBody();
        myResponseBody.setCode(200);
        myResponseBody.setMsg("没有找打相关电影哦!请重新输入");
        myResponseBody.setData(fId);
        return myResponseBody;
    }
}
