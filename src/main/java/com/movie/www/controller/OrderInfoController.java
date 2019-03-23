package com.movie.www.controller;

import com.movie.www.bean.BootPageBean;
import com.movie.www.entity.Order;
import com.movie.www.service.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderInfoController {
    @Autowired
    private OrderInfoService orderInfoService;

    @RequestMapping("/getPageList")
    @ResponseBody
    public BootPageBean<Order> getAllByPage(int offset, int limit, Order order) {

        //调用业务逻辑
        List<Order> list = orderInfoService.findListByPage( offset, limit, order );
        int total = orderInfoService.findCount( order );
        BootPageBean bootPageBean = new BootPageBean();
        bootPageBean.setTotal( total );
        bootPageBean.setRows( list );
        return bootPageBean;
    }

}