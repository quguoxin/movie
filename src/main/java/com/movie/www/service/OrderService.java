package com.movie.www.service;

import com.movie.www.bean.MyOrderBean;
import com.movie.www.entity.Order;

import java.util.List;

public interface OrderService {
    Boolean addOrder(Order order);

    List<MyOrderBean> findAllOrderByUid(int uId);

    Boolean updateOrderStatus(String orderNo);

    Boolean delOrder(String orderNo);
}
