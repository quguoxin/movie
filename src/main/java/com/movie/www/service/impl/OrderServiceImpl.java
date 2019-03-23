package com.movie.www.service.impl;

import com.movie.www.bean.MyOrderBean;
import com.movie.www.entity.Order;
import com.movie.www.mapper.OrderMapper;
import com.movie.www.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Override
    public Boolean addOrder(Order order) {
        int a=orderMapper.addOrder(order);
        if(a==1){
            return true;
        }
        return false;
    }

    @Override
    public List<MyOrderBean> findAllOrderByUid(int uId) {
        return orderMapper.findAllOrderByUid(uId);
    }

    @Override
    public Boolean updateOrderStatus(String orderNo) {
        int a=orderMapper.updateOrderStatus(orderNo);
        if(a==1){
            return true;
        }
        return false;
    }

    @Override
    public Boolean delOrder(String orderNo) {
        int a=orderMapper.delOrder(orderNo);
        if(a==1){
            return true;
        }
        return false;
    }
}
