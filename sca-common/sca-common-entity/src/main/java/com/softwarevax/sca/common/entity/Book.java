package com.softwarevax.sca.common.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

/**
 * @author twcao
 * @title: Book
 * @projectName sca-parent
 * @description: 书籍
 * @date 2021/6/1620:37
 */
@Data
@TableName("sca_book")
public class Book {

    /**
     * 书籍id
     */
    @TableId
    private String id;

    /**
     * 书籍名称
     */
    private String bookName;

    /**
     * 书籍作者
     */
    private String author;

    /**
     * 书籍价格
     */
    private Double price;

    /**
     * 折扣
     * */
    private Double discount;

    /**
     * 库存
     */
    private Integer inventory;

    /**
     * 介绍
     */
    private String introduce;
}
