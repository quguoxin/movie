package com.movie.www.bean;

import com.movie.www.entity.Platoon;

import java.util.List;

public class SelectSeatBean {
    private int pId;
    private int hallNo;
    private int fId;
    private String fileName;
    private String playDate;//放映日期（年月日）
    private String piayTime;//时间（Y M D h:m:s）
    private double filePrice;//票价
    private String[] seatNoArray;


    public SelectSeatBean() {
    }

    public SelectSeatBean(int pId, int hallNo, int fId, String fileName, String playDate, String piayTime, double filePrice, String[] seatNoArray) {
        this.pId = pId;
        this.hallNo = hallNo;
        this.fId = fId;
        this.fileName = fileName;
        this.playDate = playDate;
        this.piayTime = piayTime;
        this.filePrice = filePrice;
        this.seatNoArray = seatNoArray;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getHallNo() {
        return hallNo;
    }

    public void setHallNo(int hallNo) {
        this.hallNo = hallNo;
    }

    public int getfId() {
        return fId;
    }

    public void setfId(int fId) {
        this.fId = fId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
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

    public double getFilePrice() {
        return filePrice;
    }

    public void setFilePrice(double filePrice) {
        this.filePrice = filePrice;
    }

    public String[] getSeatNoArray() {
        return seatNoArray;
    }

    public void setSeatNoArray(String[] seatNoArray) {
        this.seatNoArray = seatNoArray;
    }
}
