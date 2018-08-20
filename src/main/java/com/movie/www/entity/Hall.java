package com.movie.www.entity;

/**
 * 影厅
 */
public class Hall {
    private int hId;
    private String hallName;
    private int seatNumber;

    public Hall() {
    }

    public Hall(int hId, String hallName, int seatNumber) {
        this.hId = hId;
        this.hallName = hallName;
        this.seatNumber = seatNumber;
    }

    public int gethId() {
        return hId;
    }

    public void sethId(int hId) {
        this.hId = hId;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    @Override
    public String toString() {
        return "Hall{" +
                "hId=" + hId +
                ", hallName='" + hallName + '\'' +
                ", seatNumber=" + seatNumber +
                '}';
    }
}
