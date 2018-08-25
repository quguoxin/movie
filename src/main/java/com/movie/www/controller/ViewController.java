package com.movie.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ViewController {

    @RequestMapping("/toView")
    public String toView(String vn){
        if(vn.equals("main")){
            return "main";
        }else if(vn.equals("homePage")){
            return "homePage";
        }else if(vn.equals("movieList")){
            return "movieList";
        }else if(vn.equals("rankingList")){
            return "rankingList";
        }else if(vn.equals("personalCenter")){
            return "personalCenter";
        }else if(vn.equals("myOrder")){
            return "myOrder";
        }else if(vn.equals("basicInfo")){
            return "basicInfo";
        }else if(vn.equals("allMovies")){
            return "allMovies";
        }else if(vn.equals("hotplay")){
            return "hotplay";
        }else if(vn.equals("movieInfo")){
            return "movieInfo";
        }else if(vn.equals("selectSeat")){
            return "selectSeat";
        }else if(vn.equals("userInfo")){
            return "userInfo";
        }else if(vn.equals("filmInfo")){
            return "filmInfo";
        }else if(vn.equals("platoon")){
            return "platoon";
        }else if(vn.equals("orderInfo")){
            return "orderInfo";
        }else if(vn.equals("adminPage")){
            return "adminPage";
        }
        return "";
    }

}
