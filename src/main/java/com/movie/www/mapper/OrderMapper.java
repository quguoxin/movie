package com.movie.www.mapper;

import com.movie.www.bean.MyOrderBean;
import com.movie.www.entity.Order;

import java.util.List;

public interface OrderMapper {
    List<Order> findSeatList(int pId);

    int addOrder(Order order);

    List<MyOrderBean> findAllOrderByUid(int uId);

    int updateOrderStatus(String orderNo);

    int delOrder(String orderNo);
}
