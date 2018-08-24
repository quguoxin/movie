package com.movie.www.bean;

<<<<<<< Updated upstream
/**
 * 用于请求响应数据bean
 */
public class MyResponseBody {
    private int code;
    private String msg;
    private Object data;
=======
public class MyResponseBody {
    private int code;
    private String msg;
    private  Object data;

    public MyResponseBody() {
    }

    public MyResponseBody(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    @Override
    public String toString() {
        return "MyResponseBody{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
>>>>>>> Stashed changes

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
