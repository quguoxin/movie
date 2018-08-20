package com.movie.www.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect//定义切面
@Component//让spring扫描组件
public class GreetingAroundAdvice {
    //通过表达式方式设定增强切入点位置，通常是设定业务层com.qgx.www.service
    //第二个*代表：所有类，第三个*代表所有方法，（..）代表任意参数
    @Around("execution(* com.qgx.www.service.impl.*.getUserInfo(..))")
    public Object around(ProceedingJoinPoint jp){
        Object result=null;
        System.out.println("-----我在前置处理-------");
        try {
            result = jp.proceed();//执行处理业务
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        System.out.println("-----我在后置处理-------");
        return result;
    }
}
