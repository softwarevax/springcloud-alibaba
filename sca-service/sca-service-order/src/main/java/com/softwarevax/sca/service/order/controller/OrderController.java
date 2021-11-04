package com.softwarevax.sca.service.order.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softwarevax.sca.service.order.service.OrderServiceImpl;
import com.softwarevax.sca.common.domain.Response;
import com.softwarevax.sca.common.entity.Order;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author twcao
 * @title: HelloController
 * @projectName sca-parent
 * @description: 测试
 * @date 2021/6/1619:06
 */
@Api(tags = "订单")
@RestController
@RequestMapping("/order")
@RefreshScope
public class OrderController {

    @Resource
    private OrderServiceImpl orderService;

    @GetMapping("/{id}")
    public Order get(@PathVariable String id) {
        return orderService.queryById(id);
    }

    @GetMapping("/list")
    public Response<PageInfo<Order>> queryList(Order order) {
        PageHelper.startPage(1, 100);
        return Response.success(new PageInfo<>(orderService.queryList(order)));
    }

    @PostMapping("/")
    public Order save(@RequestBody Order order) {
        return orderService.saveOrUpdate(order);
    }
}
