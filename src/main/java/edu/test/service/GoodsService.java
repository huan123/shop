package edu.test.service;

import edu.test.dao.GoodsDao;
import edu.test.vo.Goods;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by huan on 2015/7/11 0011.
 */
public class GoodsService {

    GoodsDao goodsDao = new GoodsDao();
    public List<Goods> doQueryGoods(int curPage,int pageSize)
    {
        return goodsDao.queryGoods(curPage,pageSize);
    }

    public List<String> getNameByKey(String key){
        return  goodsDao.queryNameByKey(key);
    }

    public int getPageSize(int pageSize)
    {
        int num = goodsDao.queryGoodsNum();

        return num%pageSize==0 ? num/pageSize : num/pageSize+1;
    }

    public Goods getGoodsById(String id) {
        try {
            return goodsDao.queryGoodsById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
