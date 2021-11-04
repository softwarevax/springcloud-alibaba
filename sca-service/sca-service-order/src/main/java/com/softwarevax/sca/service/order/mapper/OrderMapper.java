package com.softwarevax.sca.service.order.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.softwarevax.sca.common.entity.Order;
import org.apache.ibatis.annotations.Param;

/**
 * @author twcao
 * @title: OrderMapper
 * @projectName sca-parent
 * @description: 订单mapper
 * @date 2021/6/1720:14
 */
public interface OrderMapper extends BaseMapper<Order> {

    Order queryById(@Param("id") String id);
}
