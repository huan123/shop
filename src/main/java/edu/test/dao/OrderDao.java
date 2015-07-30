package edu.test.dao;

import edu.test.tool.Connect;
import edu.test.vo.Order;
import edu.test.vo.OrderDetail;

import javax.xml.soap.Detail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by huan on 2015/7/21 0021.
 */
public class OrderDao {
    public boolean saveOrder(Order order){
        //事物
        Connection connection = Connect.con();
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT  INTO orderinfo(order_id,order_user,order_payType) VALUES (?,?,?)");
            preparedStatement.setString(1,order.getOrderId());
            preparedStatement.setString(2, order.getUser().getUserId());
            preparedStatement.setString(3,order.getPayType());
            preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement("INSERT INTO orderdetail(detail_id,detail_goods,detail_price,detail_num,detail_order) VALUES(?,?,?,?,?) ");

            for (OrderDetail Detail:order.getOrderDetails() ){
                preparedStatement.setString(1,Detail.getOrderDetailId());
                preparedStatement.setString(2, Detail.getGoods().getGoodsId());
                preparedStatement.setDouble(3, Detail.getOrderPrice());
                preparedStatement.setInt(4, Detail.getGoods().getBuyNum());
                preparedStatement.setString(5,order.getOrderId());

                preparedStatement.addBatch();//加入sql整体
            }

            preparedStatement.executeBatch();
            connection.commit();
            connection.close();
            return  true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
