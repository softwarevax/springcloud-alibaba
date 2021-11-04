package com.softwarevax.sca.service.book.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softwarevax.sca.common.api.book.BookService;
import com.softwarevax.sca.common.domain.Response;
import com.softwarevax.sca.common.entity.Book;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author twcao
 * @title: BookController
 * @projectName sca-parent
 * @description: 书籍controller
 * @date 2021/6/1718:38
 */
@RestController
@RefreshScope
@Api(tags = "书籍")
public class BookController {

    @Resource
    private BookService bookService;

    @GetMapping("/get/{bookId}")
    public Response<Book> get(@PathVariable String bookId) {
        return Response.success(bookService.queryById(bookId));
    }


    @GetMapping("/queryList")
    public Response<PageInfo<Book>> queryList(Book book) {
        PageHelper.startPage(1, 100);
        return Response.success(new PageInfo<>(bookService.queryList(book)));
    }
}
