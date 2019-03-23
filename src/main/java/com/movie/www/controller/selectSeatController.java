package com.movie.www.controller;

import com.movie.www.bean.MyResponseBody;
import com.movie.www.bean.SelectSeatBean;
import com.movie.www.entity.Order;
import com.movie.www.service.OrderService;
import com.movie.www.service.PlatoonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/selectSeat")
public class selectSeatController {

    @Autowired
    private PlatoonService platoonService;

    //展现选座查询
    @RequestMapping(value = "/getSelectSeat")
    @ResponseBody
    public MyResponseBody getSelectSeat(int pId){
        SelectSeatBean selectSeatBean=platoonService.findSelectSeatBean(pId);
        MyResponseBody myResponseBody=new MyResponseBody();
        myResponseBody.setCode(200);
        myResponseBody.setMsg("显示已经被选的座位");
        myResponseBody.setData(selectSeatBean);
        return myResponseBody;

    }


    @Autowired
    private OrderService orderService;
    //添加订单
    @RequestMapping(value = "/addOrder")
    @ResponseBody
    public MyResponseBody addOrder(Order order, HttpSession session){
        order.setuId((int)(session.getAttribute("uId")));
        Boolean isok=orderService.addOrder(order);
        if(isok){
            MyResponseBody myResponseBody=new MyResponseBody();
            myResponseBody.setCode(200);
            myResponseBody.setMsg("购票成功,请在有效时间内观影，祝您观影愉快！");
            return myResponseBody;
        }
        return null;
    }
}
