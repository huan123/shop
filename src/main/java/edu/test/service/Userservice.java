package edu.test.service;

import edu.test.dao.UserDao;
import edu.test.vo.User;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by huan on 2015/7/6 0006.
 */
public class Userservice {


    UserDao userDao = new UserDao();

    public boolean doRegist(User user)
    {
        user.setUserId(getId());
        return  userDao.saveUser(user);

    }

    public String getId()
    {
        //获取日期
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSS");
        return  sdf.format(date);

    }

    public User doLogin(String name,String pwd) {

        return userDao.loginByNameAndPwd(name,pwd);

    }
    public List<User> doGetAllUser()
    {
        return  userDao.getAllUserFenye();
    }

    public List<User> getUsers(int curPage,int pageSize)
    {
        return userDao.queryUser(curPage,pageSize);
    }

    public int  getMaxPage(int pageSize)
    {
        int num = userDao.getUserNum();
        return num % pageSize==0 ? num/pageSize : num/pageSize+1;
    }
}
