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
            //  ע�����ݿ���������
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            //��ȡ���Ӷ���
           return  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  null;
    }
}
