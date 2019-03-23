package com.movie.www.service.impl;

import com.movie.www.entity.Order;
import com.movie.www.mapper.OrderInfoMapper;
import com.movie.www.service.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {
    @Autowired
    private OrderInfoMapper orderInfoMapper;
    @Override
    public List<Order> findListByPage(int offset, int limit, Order order) {
        Map<String, Object> map = new HashMap<>();
        map.put( "offset", offset );
        map.put( "limit", limit );
        map.put( "order",order );
        return  orderInfoMapper.findListByPage(map);
    }

    @Override
    public int findCount(Order order) {
        return orderInfoMapper.findCount( order );
    }
}
