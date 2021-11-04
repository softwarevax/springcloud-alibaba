package com.softwarevax.sca.common.api.book;

import com.softwarevax.sca.common.entity.Book;

import java.util.List;

/**
 * @author twcao
 * @title: BookService
 * @projectName sca-parent
 * @description: 书记接口
 * @date 2021/6/1620:35
 */
public interface BookService {

    /**
     * 根据id查询书籍
     * @param bookId
     * @return
     */
    Book queryById(String bookId);

    /**
     * 列表查询
     * @param book
     * @return
     */
    List<Book> queryList(Book book);

    /**
     * 更新book
     * @param book
     * @return
     */
    Book saveOrUpdate(Book book);

    /**
     * 减少库存
     * @param id
     * @param num
     * @return
     */
    boolean reduceInventory(String id, int num);
}
