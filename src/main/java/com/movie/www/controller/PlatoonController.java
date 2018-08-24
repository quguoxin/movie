package com.movie.www.controller;

import com.movie.www.bean.BootPageBean;
import com.movie.www.bean.PlatoonBean;
import com.movie.www.service.PlatoonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/platoon")
public class PlatoonController {
    @Autowired
    private PlatoonService platoonService;
    @RequestMapping(value = "/findPlatoon")
    @ResponseBody
    public BootPageBean<PlatoonBean> findPlatoonByParams(int fId){
        List<PlatoonBean> list=platoonService.findPlatoonByParams(fId);
        BootPageBean bootPageBean=new BootPageBean();
        bootPageBean.setRows(list);
        return bootPageBean;
    }

}
