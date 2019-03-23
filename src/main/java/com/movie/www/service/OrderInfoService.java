package com.movie.www.service;

import com.movie.www.entity.Order;

import java.util.List;

public interface OrderInfoService {
    List<Order> findListByPage(int offset, int limit, Order order);

    int findCount(Order order);
}
