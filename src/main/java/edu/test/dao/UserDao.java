package edu.test.dao;

import edu.test.service.Userservice;
import edu.test.tool.Connect;
import edu.test.view.View;
import edu.test.vo.User;

import javax.swing.text.html.ListView;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by huan on 2015/7/6 0006.
 */
public class UserDao {

    User user=new User();
    Connect connect  = new Connect();
    public boolean saveUser(User user)
    {

        //连接数据库
       try {

           Class.forName("oracle.jdbc.driver.OracleDriver");

           Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");

            PreparedStatement preparedStatement = conn.prepareStatement("insert into userinfo1(userId,userName,userPwd) values(?,?,?)");

            preparedStatement.setString(1,user.getUserId());
            preparedStatement.setString(2,user.getUserName());
            preparedStatement.setString(3,user.getUserPwd());

            int rows = preparedStatement.executeUpdate();

            if (rows>0)
            {

                return true;
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public User queryUserById(String id){

        Connection conn = connect.con();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM userinfo1 WHERE userId=?");
            preparedStatement.setString(1,id);

            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next())
            {
                user.setUserId(rs.getString("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserPwd(rs.getString("userPwd"));
                return  user;

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User loginByNameAndPwd(String name,String pwd)
    {

        Connection conn = connect.con();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM userinfo1 WHERE userName=? and userPwd=?");
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,pwd);

            ResultSet rs = preparedStatement.executeQuery();
           if (rs.next())
            {
                user.setUserId(rs.getString("userId"));
                user.setUserName(rs.getString("userName"));
                return  user;

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<User> getAllUser()
    {
         List<User> list = new ArrayList<User>();
        Connection conn = connect.con();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT userName,userPwd  FROM userinfo1");
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setUserPwd(rs.getString("userPwd"));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    public List<User> getAllUserFenye()
    {
        List<User> list = new ArrayList<User>();
        Connection conn = connect.con();
        try {
            PreparedStatement ps = conn.prepareStatement("select * from (select userName,userPwd,ROWNUM rn from userinfo1 where rownum <= ?)  where rn >= ?");


            int a = (View.page+1)*5;
            int b = View.page*5;
           // System.out.println(a+""+b);
            String n= String.valueOf(a);
            String m =b+"";
            ps.setString(1,n);
            ps.setString(2,m);


            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setUserPwd(rs.getString("userPwd"));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<User> queryUser(int curPage,int pageSize)
    {
        List<User> users = new ArrayList<User>();
        Connection conn = Connect.con();
        try {
            PreparedStatement ps  = conn.prepareStatement("SELECT  * from (SELECT  t.*,rownum num from (SELECT * FROM userinfo1 ORDER BY userId) t) t1 WHERE num BETWEEN ? and ?");
            ps.setInt(1,(curPage-1)*pageSize+1);
            ps.setInt(2,curPage*pageSize);

            ResultSet rs = ps.executeQuery();

            while (rs.next())
            {
                User user1 = new User();
                user1.setUserId(rs.getString("userId"));
                user1.setUserName(rs.getString("userName"));
                user1.setUserPwd(rs.getString("userPwd"));
                users.add(user1);
            }
            return  users;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  null;
    }

    public  int  getUserNum()
    {
        List<User> users = new ArrayList<User>();
        Connection conn = Connect.con();
        try {
            PreparedStatement ps  = conn.prepareStatement("SELECT  COUNT(*) from  userinfo1 ");
            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
    public boolean queryNameByName(String name) {

        Connection conn = Connect.con();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement("SELECT * FROM  userinfo1 WHERE userName = ?");
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
