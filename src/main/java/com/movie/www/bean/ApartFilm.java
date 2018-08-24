package com.movie.www.bean;

public class ApartFilm {
    private String filePoster;
    private String fileName;
    private String fileActorList;
    private String releaseDate;
    private double scores;
    private double filePrice;

    public String getFilePoster() {
        return filePoster;
    }

    public void setFilePoster(String filePoster) {
        this.filePoster = filePoster;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileActorList() {
        return fileActorList;
    }

    public void setFileActorList(String fileActorList) {
        this.fileActorList = fileActorList;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public double getScores() {
        return scores;
    }

    public void setScores(double scores) {
        this.scores = scores;
    }

    public double getFilePrice() {
        return filePrice;
    }

    public void setFilePrice(double filePrice) {
        this.filePrice = filePrice;
    }

    public ApartFilm(String filePoster, String fileName, String fileActorList,
                     String releaseDate, double scores, double filePrice) {
        this.filePoster = filePoster;
        this.fileName = fileName;
        this.fileActorList = fileActorList;
        this.releaseDate = releaseDate;
        this.scores = scores;
        this.filePrice = filePrice;
    }

    public ApartFilm() {
    }

    @Override
    public String toString() {
        return "ApartFilm{" +
                "filePoster='" + filePoster + '\'' +
                ", fileName='" + fileName + '\'' +
                ", fileActorList='" + fileActorList + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", scores=" + scores +
                ", filePrice=" + filePrice +
                '}';
    }
}
