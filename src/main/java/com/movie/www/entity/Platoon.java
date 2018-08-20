package com.movie.www.entity;

/**
 * 排片
 */
public class Platoon {
    //`pId``hallNo``fId``playDate``piayTime`
    private int pId;//排片编号
    private int hallNo;//厅号
    private int fId;//电影编号
    private String playDate;//放映日期（年月日）
    private String piayTime;//时间（Y M D h:m:s）

    public Platoon() {
    }

    public Platoon(int pId, int hallNo, int fId, String playDate, String piayTime) {
        this.pId = pId;
        this.hallNo = hallNo;
        this.fId = fId;
        this.playDate = playDate;
        this.piayTime = piayTime;
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

    @Override
    public String toString() {
        return "Platoon{" +
                "pId=" + pId +
                ", hallNo=" + hallNo +
                ", fId=" + fId +
                ", playDate='" + playDate + '\'' +
                ", piayTime='" + piayTime + '\'' +
                '}';
    }
}
