package com.movie.www.controller;

import com.movie.www.bean.ApartFilm;
import com.movie.www.bean.MyResponseBody;
import com.movie.www.service.FilmRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping("/film")
public class FilmRankController {
    @Autowired
   private FilmRankService filmRankService;
    @RequestMapping("/getHotPlay")
    @ResponseBody
public MyResponseBody selectByScore(){
   List<ApartFilm> list=filmRankService.selectByScore();
   MyResponseBody myResponseBody=new MyResponseBody();
   myResponseBody.setCode(200);
   myResponseBody.setMsg("热映口碑榜");
   myResponseBody.setData(list);
   return myResponseBody;
}
@RequestMapping("/getWillPlay")
@ResponseBody
public MyResponseBody selectByPrice(){
    List<ApartFilm> list=filmRankService.selectByPrice();
    MyResponseBody myResponseBody=new MyResponseBody();
    myResponseBody.setCode(200);
    myResponseBody.setMsg("最受期待榜");
    myResponseBody.setData(list);
    return myResponseBody;
}
}
