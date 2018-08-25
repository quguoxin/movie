package com.movie.www.bean;

public class PlatoonBean {
   private int pId;
   private String playDate;
   private String piayTime;
   private int hallNo;
   private double filePrice;

    public PlatoonBean() {
    }

    public PlatoonBean(int pId, String playDate, String piayTime, int hallNo, double filePrice) {
        this.pId = pId;
        this.playDate = playDate;
        this.piayTime = piayTime;
        this.hallNo = hallNo;
        this.filePrice = filePrice;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
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

    public double getFilePrice() {
        return filePrice;
    }

    public void setFilePrice(double filePrice) {
        this.filePrice = filePrice;
    }

}
