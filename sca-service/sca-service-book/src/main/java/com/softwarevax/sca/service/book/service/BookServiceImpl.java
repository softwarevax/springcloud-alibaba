package com.softwarevax.sca.service.book.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.softwarevax.sca.common.api.book.BookService;
import com.softwarevax.sca.common.entity.Book;
import com.softwarevax.sca.common.util.CommonUtils;
import com.softwarevax.sca.service.book.mapper.BookMapper;
import io.seata.spring.annotation.GlobalTransactional;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.List;

/**
 * @author twcao
 * @title: BookServiceImpl
 * @projectName sca-parent
 * @description: 书籍接口实现类
 * @date 2021/6/1620:57
 */
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    public Book queryById(String bookId) {
        return bookMapper.queryById(bookId);
    }

    @Override
    public List<Book> queryList(Book book) {
        EntityWrapper<Book> wrapper = new EntityWrapper<>();
        return bookMapper.selectList(wrapper);
    }

    @Override
    public Book saveOrUpdate(Book book) {
        String id = book.getId();
        EntityWrapper<Book> wrapper = new EntityWrapper<>();
        if(StringUtils.isNotBlank(id)) {
            wrapper.eq("id", book.getId());
            bookMapper.update(book, wrapper);
        } else {
            book.setId(CommonUtils.getCode32());
            bookMapper.insert(book);
        }
        return queryById(book.getId());
    }

    @Override
    //@GlobalTransactional(rollbackFor = Exception.class)
    public boolean reduceInventory(String id, int num) {
        Book book = queryById(id);
        Assert.isTrue(book.getInventory() >= num, "库存不足");
        book.setInventory(book.getInventory() - num);
        saveOrUpdate(book);
        return true;
    }
}
