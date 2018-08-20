package com.movie.www.entity;

/**
 * 电影实体类
 */
public class Film {
    //fileActorList``filePrice`
    private int fId;//电影编号
    private String fileName;//电影名
    private String fileTypeList;//电影类型集合用逗号隔开（1喜剧、2恐怖、3动作、4剧情、5科幻、6其他）
    private int fileTime;//电影时长（min）
    private double scores;//评分
    private String releaseDate;//上映日期
    private String fileSynopsis;//电影简介
    private String filePoster;//电影图片地址
    private int fileArea;//地区（1国产、2欧美、3其他）
    private String fileActorList;//演员，用逗号隔开（写几个主演就好）
    private double filePrice;//影片价格

    public Film() {
    }

    public Film(int fId, String fileName, String fileTypeList, int fileTime, double scores, String releaseDate, String fileSynopsis, String filePoster, int fileArea, String fileActorList, double filePrice) {
        this.fId = fId;
        this.fileName = fileName;
        this.fileTypeList = fileTypeList;
        this.fileTime = fileTime;
        this.scores = scores;
        this.releaseDate = releaseDate;
        this.fileSynopsis = fileSynopsis;
        this.filePoster = filePoster;
        this.fileArea = fileArea;
        this.fileActorList = fileActorList;
        this.filePrice = filePrice;
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

    public String getFileTypeList() {
        return fileTypeList;
    }

    public void setFileTypeList(String fileTypeList) {
        this.fileTypeList = fileTypeList;
    }

    public int getFileTime() {
        return fileTime;
    }

    public void setFileTime(int fileTime) {
        this.fileTime = fileTime;
    }

    public double getScores() {
        return scores;
    }

    public void setScores(double scores) {
        this.scores = scores;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getFileSynopsis() {
        return fileSynopsis;
    }

    public void setFileSynopsis(String fileSynopsis) {
        this.fileSynopsis = fileSynopsis;
    }

    public String getFilePoster() {
        return filePoster;
    }

    public void setFilePoster(String filePoster) {
        this.filePoster = filePoster;
    }

    public int getFileArea() {
        return fileArea;
    }

    public void setFileArea(int fileArea) {
        this.fileArea = fileArea;
    }

    public String getFileActorList() {
        return fileActorList;
    }

    public void setFileActorList(String fileActorList) {
        this.fileActorList = fileActorList;
    }

    public double getFilePrice() {
        return filePrice;
    }

    public void setFilePrice(double filePrice) {
        this.filePrice = filePrice;
    }

    @Override
    public String toString() {
        return "Film{" +
                "fId=" + fId +
                ", fileName='" + fileName + '\'' +
                ", fileTypeList='" + fileTypeList + '\'' +
                ", fileTime=" + fileTime +
                ", scores=" + scores +
                ", releaseDate='" + releaseDate + '\'' +
                ", fileSynopsis='" + fileSynopsis + '\'' +
                ", filePoster='" + filePoster + '\'' +
                ", fileArea=" + fileArea +
                ", fileActorList='" + fileActorList + '\'' +
                ", filePrice=" + filePrice +
                '}';
    }
}
