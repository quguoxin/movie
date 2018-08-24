package com.movie.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class BreakController {
   @RequestMapping("/Platoon")
   public String toPlatoon(){
        return "platoon";
    }
    @RequestMapping("/order")
    public String toOrder(){
       return "order";
    }
    @RequestMapping("/filmDetail")
    private String toFilm(){
       return "hotplay";
    }
}
