package com.movie.www.interceptor;

import com.movie.www.util.DateUtil;
import org.springframework.core.NamedThreadLocal;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Component
public class PerformanceMonitoringInterceptor implements HandlerInterceptor {

    /**我们的拦截器是单例，因此不管用户请求多少次只能有一个变量，线程不安全，下面就是解决此问题的办法
     *线程绑定变量，提供线程局部变量，一个线程一个ThreadLocal，多线程同事访问时，A线程的ThreadLocal是看不到其他线程的ThreadLocal的
     */
    private NamedThreadLocal<Long> namedThreadLocal=new NamedThreadLocal<Long>("performance-monitoring");
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //预处理
        System.out.println("开始时间："+ DateUtil.format(new Date()));
        System.out.println(this.getClass().getName()+"-preHandler()");
        long startTime = System.currentTimeMillis();
        namedThreadLocal.set(startTime);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println(this.getClass().getName()+"-postHandler()");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println(this.getClass().getName()+"-afterCompletion()");
        long endTime = System.currentTimeMillis();
        long startTime = namedThreadLocal.get();
        System.out.println("结束时间："+DateUtil.format(new Date()));
        long useTime = endTime-startTime;
        System.out.println("用时："+useTime);
    }


}
