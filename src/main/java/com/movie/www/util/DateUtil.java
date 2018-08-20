package com.movie.www.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2018/5/17.
 */
public class DateUtil {
    //2018-05-18 09:07:00
    public static String format1 = "yyyy-MM-dd hh:mm:ss";
    public static String format2 = "yyyy/MM/dd hh:mm:ss";
    public static String format3 = "yyyy年MM月dd日 hh小时mm分ss秒";
    public static String format4 = "yyyyMMddhhmmss";
    public static String format5 = "yyyy-MM-dd hh:mm:ss:SSS";

    /**
     * 将指定时间格式化为指定格式字符串
     * @param date
     * @return
     */
    public static String format(Date date){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format5);
        return simpleDateFormat.format(date);
    }

    /**
     * 将日期字符串转为日期Date
     * @param date
     * @return
     */
    public Date format(String date){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format1);
        try {
            return simpleDateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;

    }


    /**
     * 按照毫秒计算时间差
     * @param start
     * @param now
     * @return
     */
    public static int timeInterval1(Date start, Date now){
        long distanceTime = now.getTime()-start.getTime();
        int res = (int)(distanceTime/(24*3600*1000));
        return res;
    }

    /**
     * 按照时钟类的系统方法计算时间差
     * @param start
     * @param now
     * @return
     */
    public static int timeInterval(Date start, Date now) {
        Calendar calendar1 = Calendar.getInstance(); //当前日期
        int nowDay = calendar1.get(Calendar.DAY_OF_YEAR);//获得当前日期在整年中的第几天
        //System.out.println(nowDay);//31,28,30,31,17=137

        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(start);//设置指定日期
        int startDay = calendar2.get(Calendar.DAY_OF_YEAR);

        int day = nowDay - startDay;
        return day;
    }


    public static void main(String[] args) {
        DateUtil dateUtil = new DateUtil();
        System.out.println(dateUtil.format(new Date()));
        System.out.println(new Date());
    }
}
