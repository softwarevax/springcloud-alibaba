package com.softwarevax.sca.service.order.service;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.softwarevax.sca.common.api.book.BookService;
import com.softwarevax.sca.common.api.order.OrderService;
import com.softwarevax.sca.common.entity.Book;
import com.softwarevax.sca.common.entity.Order;
import com.softwarevax.sca.common.util.CommonUtils;
import com.softwarevax.sca.service.order.mapper.OrderMapper;
import io.seata.spring.annotation.GlobalTransactional;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author twcao
 * @title: OrderServiceImpl
 * @projectName sca-parent
 * @description: 订单接口
 * @date 2021/6/1621:02
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Reference(check = false)
    BookService bookService;

    @Override
    public Order queryById(String id) {
        Book book = bookService.queryById(id);
        System.out.println(JSON.toJSONString(book));
        return orderMapper.queryById(id);
    }

    @Override
    public List<Order> queryList(Order order) {
        EntityWrapper<Order> wrapper = new EntityWrapper<>();
        return orderMapper.selectList(wrapper);
    }

    @Override
    @GlobalTransactional(rollbackFor = Exception.class)
    public Order saveOrUpdate(Order order) {
        String id = order.getId();
        EntityWrapper<Order> wrapper = new EntityWrapper<>();
        bookService.reduceInventory(order.getGoodsId(), order.getPurchaseNum());
        if(StringUtils.isNotBlank(id)) {
            wrapper.eq("id", order.getId());
            orderMapper.update(order, wrapper);
        } else {
            order.setId(CommonUtils.getCode32());
            int a = 1 / 0;    // 分布式实务问题，导致库存已扣除，但订单未入库
            orderMapper.insert(order);
        }
        return queryById(order.getId());
    }
}
