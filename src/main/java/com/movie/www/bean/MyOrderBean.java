package com.movie.www.bean;

public class MyOrderBean {

    private String orderDate;//下单时间
    private String orderNo;//订单编号
    private String seatNo;//座位号
    private String cinemaName;//影院名
    private int orderStatus;//订单状态：1-已付款，2-完成,3-退款
    private double orderPrice;//价格
    private String fileName;//电影名
    private String filePoster;//电影图片地址
    private String playDate;//放映日期（年月日）
    private String piayTime;//时间（Y M D h:m:s）
    private int hallNo;//厅号

    public MyOrderBean() {
    }

    public MyOrderBean(String orderDate, String orderNo, String seatNo, String cinemaName, int orderStatus, double orderPrice, String fileName, String filePoster, String playDate, String piayTime, int hallNo) {
        this.orderDate = orderDate;
        this.orderNo = orderNo;
        this.seatNo = seatNo;
        this.cinemaName = cinemaName;
        this.orderStatus = orderStatus;
        this.orderPrice = orderPrice;
        this.fileName = fileName;
        this.filePoster = filePoster;
        this.playDate = playDate;
        this.piayTime = piayTime;
        this.hallNo = hallNo;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePoster() {
        return filePoster;
    }

    public void setFilePoster(String filePoster) {
        this.filePoster = filePoster;
    }

    public String getPlayDate() {
        return playDate;
    }

    public void setPlayDate(String playDate) {
        this.playDate = playDate;
    }

    public String getPiayTime() {
        return piayTime;
    }

    public void setPiayTime(String piayTime) {
        this.piayTime = piayTime;
    }

    public int getHallNo() {
        return hallNo;
    }

    public void setHallNo(int hallNo) {
        this.hallNo = hallNo;
    }
}
