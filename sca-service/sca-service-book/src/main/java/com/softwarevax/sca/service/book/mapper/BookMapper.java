package com.softwarevax.sca.service.book.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.softwarevax.sca.common.entity.Book;
import org.apache.ibatis.annotations.Param;

/**
 * @author twcao
 * @title: BookRepository
 * @projectName sca-parent
 * @description: 书籍dao
 * @date 2021/6/1719:13
 */
public interface BookMapper extends BaseMapper<Book> {

    Book queryById(@Param("id") String id);

}
