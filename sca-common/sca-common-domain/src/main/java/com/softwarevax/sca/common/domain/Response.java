package com.softwarevax.sca.common.domain;

import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
public class Response<T> {

    private int code;

    private T data;

    private String message;

    public static <T> Response ok(int code, T data, String message) {
        Response resp = new Response();
        resp.code = code;
        resp.data = data;
        resp.message = message;
        return resp;
    }

    public static <T> Response success(T data, String message) {
        return ok(HttpStatus.OK.value(), data, message);
    }

    public static <T> Response success(T data) {
        return ok(HttpStatus.OK.value(), data, "操作成功");
    }

    public static <T> Response success() {
        return success((T) null);
    }

    public static <T> Response success(String message) {
        return success((T) null, message);
    }

    public static <T> Response fail(int code, T data, String message) {
        return ok(code, data, message);
    }

    public static <T> Response fail(T data, String message) {
        return ok(HttpStatus.INTERNAL_SERVER_ERROR.value(), data, message);
    }

    public static <T> Response fail(T data) {
        return fail(data, "操作失败");
    }

    public static <T> Response fail() {
        return fail((T) null);
    }

    public static <T> Response fail(String message) {
        return fail((T) null, message);
    }
}
