package com.movie.www.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class  JedisUtil {

    private static JedisUtil jedisUtil=null;
    private static JedisPool jedisPool=null;//缓存连接池

    //构造方法
    public JedisUtil() {
    }

    //设置懒汉单例
    public static JedisUtil getInstance(){
        if(jedisUtil==null){
            synchronized (JedisUtil.class){
                if(jedisUtil==null){
                    jedisUtil=new JedisUtil();
                }
            }
        }
        return jedisUtil;
    }

    //设置缓存连接池
    static {
        jedisPool=new JedisPool("127.0.0.1",6379);
    }

    //NX：仅当键不存在时才设置它，当键存在则不做设置，适用于添加数据
    //XX：当键不存在时不设置它，当键存在则设置（覆盖），适用于修改数据
    //EX：过期时间单位--秒
    //PX：过期时间单位--毫秒


    /**
     *增加
     * @param key 键
     * @param value 值
     * @param times 生命周期(s),为-1时则不设置（永久保存）
     * @return
     */
    public String add(String key,String value,long times){
        //获取连接对象
        Jedis jedis = jedisPool.getResource();
        //选择库，默认为下标为0的库
        jedis.select(1);
        //添加
        String result="";
        if(times==-1){
            result=jedis.set(key,value,"NX");
        }else {
            result=jedis.set(key,value,"NX","EX",times);
        }
        //释放资源
        jedis.close();
        return result;
    }

    /**
     * 修改
     * @param key 键
     * @param value 值
     * @param times 生命周期(s),为-1时则不设置（永久保存）
     * @return
     */
    public String update(String key,String value,long times){
        //获取连接对象
        Jedis jedis = jedisPool.getResource();
        //选择库，默认为下标为0的库
        jedis.select(1);
        //修改
        String result="";
        if(times==-1){
            result=jedis.set(key,value,"XX");
        }else {
            result=jedis.set(key,value,"XX","EX",times);
        }
        //释放资源
        jedis.close();
        return result;
    }

    /**
     * 删除
     * @param key 键
     * @return 返回Boolearn
     */
    public Boolean delete(String key){
        //获取连接对象
        Jedis jedis = jedisPool.getResource();
        //选择库，默认为下标为0的库
        jedis.select(1);
        //删除
        long res = jedis.del(key);
        //释放资源
        jedis.close();
        if(res>0){
            return true;
        }
        return false;
    }

    /**
     * 查询
     * @param key 键
     * @return 返回查询结果
     */
    public String getByKey(String key){
        //获取连接对象
        Jedis jedis = jedisPool.getResource();
        //选择库，默认为下标为0的库
        jedis.select(1);
        //查询
        String result = jedis.get(key);
        //释放资源
        jedis.close();
        return result;
    }



}
