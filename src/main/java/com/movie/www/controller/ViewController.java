package com.movie.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ViewController {

    @RequestMapping("/toView")
    public String toView(String vn){
       if(vn.equals("userInfo")){
            return "userInfo";
        }if(vn.equals("filmInfo")){
            return "filmInfo";
        }if(vn.equals("platoon")){
            return "platoon";
        }if(vn.equals("orderInfo")){
            return "orderInfo";
        }

        return "";
    }

}
