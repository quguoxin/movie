package com.movie.www.controller;

import com.movie.www.bean.BootPageBean;
import com.movie.www.bean.MyResponseBody;
import com.movie.www.entity.Platoon;
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
   //增加
    @RequestMapping("/add")
    @ResponseBody
    public MyResponseBody addPlatoon(Platoon platoon) {
        int num = platoonService.addPlatoon(platoon);
        MyResponseBody myResponseBody = new MyResponseBody();
        if (num > 0) {
            myResponseBody.setCode(200);
            myResponseBody.setMsg("添加成功");
        } else {
            myResponseBody.setCode(999);
            myResponseBody.setMsg("添加失败");
        }
        return myResponseBody;
    }
  //更新
    @RequestMapping("/updatePlatoon")
    @ResponseBody
    public MyResponseBody updatePlatoon(Platoon platoon){
     int num= platoonService.updatePlatoon(platoon);
    /* platoon.getfId();
     platoon.getHallNo();
     platoon.getpId();
     platoon.getPlayDate();
     platoon.getPiayTime();*/
     MyResponseBody myResponseBody=new MyResponseBody();
        if (num > 0) {
            myResponseBody.setCode(200);
            myResponseBody.setMsg("更新成功");
        } else {
            myResponseBody.setCode(999);
            myResponseBody.setMsg("更新失败");
        }
        return myResponseBody;
    }
    //删除
    @RequestMapping("/delPlatoon")
    @ResponseBody
    public MyResponseBody delPlatoon(Platoon platoon){
        int num= platoonService.delPlatoon(platoon);
        MyResponseBody myResponseBody=new MyResponseBody();
        if (num > 0) {
            myResponseBody.setCode(200);
            myResponseBody.setMsg("删除成功");
        } else {
            myResponseBody.setCode(999);
            myResponseBody.setMsg("删除失败");
        }
        return myResponseBody;
    }
    @RequestMapping("/getPageList")
    @ResponseBody
    public BootPageBean<Platoon> getAllByPage(int offset, int limit, Platoon platoon) {
        System.out.println(platoon);
        //调用业务逻辑
        List<Platoon> list = platoonService.findListByPage(offset, limit, platoon);
        System.out.println(list);
        int total = platoonService.findCount(platoon);
        System.out.println(total);
        BootPageBean bootPageBean = new BootPageBean();
        bootPageBean.setTotal(total);
        bootPageBean.setRows(list);
        return bootPageBean;
    }
}