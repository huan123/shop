package edu.test.vo;

/**
 * Created by huan on 2015/7/6 0006.
 */
public class User {


    private String userId;
    private String userName;
    private String userPwd;
    private String userSex;
    private int userAge;
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }


    public User()
    {

    }
    public User(String userId,String userName,String userPwd)
    {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
    }

}
