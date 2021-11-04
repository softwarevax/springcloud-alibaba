package com.softwarevax.sca.common.api.order;

import com.softwarevax.sca.common.entity.Order;

import java.util.List;

/**
 * @author twcao
 * @title: OrderService
 * @projectName sca-parent
 * @description: TODO
 * @date 2021/6/1621:08
 */
public interface OrderService {

    Order queryById(String id);

    List<Order> queryList(Order order);

    Order saveOrUpdate(Order order);
}
