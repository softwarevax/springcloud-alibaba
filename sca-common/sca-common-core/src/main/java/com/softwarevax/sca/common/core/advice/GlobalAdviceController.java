package com.softwarevax.sca.common.core.advice;

import com.softwarevax.sca.common.domain.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@ControllerAdvice(annotations = {RestController.class, Controller.class})
public class GlobalAdviceController {

    Logger logger = LoggerFactory.getLogger(GlobalAdviceController.class);

    @ResponseBody
    @ExceptionHandler(IllegalArgumentException.class)
    public Response<String> exceptionHandler(RuntimeException e, HttpServletResponse response) {
        logger.error(e.getMessage(), e);
        return Response.fail(e.getMessage());
    }
}
