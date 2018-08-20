package com.movie.www.entity;

/**
 * 用户
 */
public class UserInfo {
    /* `uId``userName``phone``birthday``sex``password`*/
    private int uId;
    private String userName;
    private String phone;
    private String birthday;
    private int sex; //男：1   女：2
    private String password;

    public UserInfo() {
    }

    public UserInfo(int uId, String userName, String phone, String birthday, int sex, String password) {
        this.uId = uId;
        this.userName = userName;
        this.phone = phone;
        this.birthday = birthday;
        this.sex = sex;
        this.password = password;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "uId=" + uId +
                ", userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", birthday='" + birthday + '\'' +
                ", sex=" + sex +
                ", password='" + password + '\'' +
                '}';
    }
}
