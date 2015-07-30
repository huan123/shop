package edu.test.dao;

import edu.test.tool.Connect;
import edu.test.vo.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by huan on 2015/7/11 0011.
 */
public class GoodsDao {

    public List<Goods> queryGoods(int curPage,int pageSize)
    {
        List<Goods> list = new ArrayList<Goods>();
        //�������ݿ�
        Connection conn = Connect.con();
        try {
            //��ȡ������
            PreparedStatement pre = conn.prepareStatement("select * from (select t.*,rownum num from (select * from goods order by goods_id) t) t1 where num between ? and ?");
            pre.setInt(1,(curPage-1)*pageSize+1);
            pre.setInt(2,pageSize*curPage);      //��ȡ�����
            ResultSet rs = pre.executeQuery();
            while (rs.next())
            {
                Goods goods = new Goods();
                goods.setGoodsId(rs.getString("goods_id"));
                goods.setGoodsName(rs.getString("goods_name"));
                goods.setGoodsPrice(rs.getDouble("goods_price"));
                goods.setGoodsNum(rs.getInt("goods_num"));
                goods.setGoodsImg(rs.getString("goods_img"));

                list.add(goods);
            }
            //��������
            return  list;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

   public int queryGoodsNum()
   {
       //���ݿ�����
       Connection conn = Connect.con();
       //����sql���
       try {
           PreparedStatement pre = conn.prepareStatement("SELECT count(*) num FROM goods");

           //ִ��
           ResultSet rs = pre.executeQuery();
           while (rs.next())
           {
               return rs.getInt("num");
           }
       } catch (SQLException e) {
           e.printStackTrace();
       }

    return  0;
   }

    public Goods queryGoodsById(String id) throws SQLException {
        Connection conn = Connect.con();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement("SELECT * FROM  goods WHERE goods_id = ?");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        preparedStatement.setString(1,id);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()){
            Goods goods = new Goods();
            goods.setGoodsId(rs.getString("goods_id"));
            goods.setGoodsName(rs.getString("goods_name"));
            goods.setGoodsPrice(rs.getDouble("goods_price"));
            goods.setGoodsNum(rs.getInt("goods_num"));
            goods.setGoodsImg(rs.getString("goods_img"));
            return  goods;
        }
        return null;
    }

    public List<String> queryNameByKey(String key){

        List<String> list = new ArrayList<String>();
        Connection conn = Connect.con();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement("SELECT * FROM  goods WHERE goods_name like ?");
            preparedStatement.setString(1,"%"+key+"%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){

                list.add(rs.getString("goods_name"));

            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

}
