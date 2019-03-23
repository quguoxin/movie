package com.movie.www.controller;

import com.movie.www.bean.MyOrderBean;
import com.movie.www.bean.MyResponseBody;
import com.movie.www.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/myOrder")
public class MyOrderController {

    @Autowired
    private OrderService orderService;

    //展现订单
    @RequestMapping(value = "/getAllOrderByUid")
    @ResponseBody
    public MyResponseBody getAllOrderByUid(HttpSession session){
        int uId=(int)session.getAttribute("uId");
        List<MyOrderBean> list=orderService.findAllOrderByUid(uId);
        MyResponseBody myResponseBody=new MyResponseBody();
        myResponseBody.setCode(200);
        myResponseBody.setMsg("显示订单");
        myResponseBody.setData(list);
        return myResponseBody;
    }

    @RequestMapping("/updateOrderStatus")
    @ResponseBody
    public MyResponseBody updateOrderStatus(String orderNo){
        Boolean isok=orderService.updateOrderStatus(orderNo);
        MyResponseBody myResponseBody=new MyResponseBody();
        if(isok){
            myResponseBody.setCode(200);
            myResponseBody.setMsg("退款成功！");
        }else {
            myResponseBody.setCode(1);
            myResponseBody.setMsg("退款失败！");
        }
        return myResponseBody;
    }

    @RequestMapping("/delOrder")
    @ResponseBody
    public MyResponseBody delOrder(String orderNo){
        Boolean isok=orderService.delOrder(orderNo);
        MyResponseBody myResponseBody=new MyResponseBody();
        if(isok){
            myResponseBody.setCode(200);
            myResponseBody.setMsg("删除订单成功！");
        }else {
            myResponseBody.setCode(1);
            myResponseBody.setMsg("删除订单失败！");
        }
        return myResponseBody;
    }
}
