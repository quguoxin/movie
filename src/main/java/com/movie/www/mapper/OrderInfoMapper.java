package com.movie.www.mapper;

import com.movie.www.entity.Order;

import java.util.List;
import java.util.Map;

public interface OrderInfoMapper {
    List<Order> findListByPage(Map<String, Object> map);

    int findCount(Order order);
}
