package com.movie.www.entity;

public class Order {
    private int oid;//id自增
    private String orderNo;//订单编号
    private int uId;
    private int pId;//排片编号
    private String seatNo;//座位号
    private String address;//地址
    private String cinemaName;//影院名
    private int orderStatus;//订单状态：1-已付款，2-完成,3-退款
    private String orderDate;//下单时间
    private double orderPrice;//价格

    public Order() {
    }

    public Order(int oid, String orderNo, int uId, int pId, String seatNo, String address, String cinemaName, int orderStatus, String orderDate, double orderPrice) {
        this.oid = oid;
        this.orderNo = orderNo;
        this.uId = uId;
        this.pId = pId;
        this.seatNo = seatNo;
        this.address = address;
        this.cinemaName = cinemaName;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.orderPrice = orderPrice;
    }


    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }
}
