package com.softwarevax.sca.common.core.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Aspect
@Component
@Order
public class ResultAspect {

    @Pointcut("execution(* *..*Controller.*(..))")
    public void pointcut(){}

    /**
     * 能执行到此处，说明程序没有任何异常，如果有异常，会通过全局异常处理，直接返回结果，而不会执行到此处
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around("pointcut()")
    public Object doAfterReturning(ProceedingJoinPoint pjp) throws Throwable {
        return pjp.proceed();
    }
}
