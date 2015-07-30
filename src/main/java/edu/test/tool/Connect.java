package edu.test.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by huan on 2015/7/7 0007.
 */
public class Connect {
    public static Connection con()
    {
        try {
            //  注册数据库驱动程序
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            //获取连接对象
           return  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  null;
    }
}
