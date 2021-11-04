package com.softwarevax.sca.common.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author twcao
 * @title: Order
 * @projectName sca-parent
 * @description: 订单
 * @date 2021/6/1720:16
 */
@Data
@TableName("sca_order")
public class Order {

    @TableId
    private String id;

    /**
     * 商品类型，如书籍
     */
    private String goodsType;

    /**
     * 商品id
     */
    private String goodsId;

    /**
     * 购买数量
     */
    private Integer purchaseNum;

    /**
     * 购买人
     */
    private String buyer;

    /**
     * 下单时间
     */
    private Date createTime;
}
