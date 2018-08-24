package com.movie.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ViewController {

    @RequestMapping("/toView")
    public String toView(String vn){
        if(vn.equals("insurance")){
            return "insurance";
        }if(vn.equals("userInfo")){
            return "userInfo";
        }if(vn.equals("addUserInfo")){
            return "addUserInfo";
        }if(vn.equals("filmInfo")){
            return "filmInfo";
        }

        return "";
    }

}
