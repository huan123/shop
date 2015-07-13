package edu.test.service;

import edu.test.dao.GoodsDao;
import edu.test.vo.Goods;

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

    public int getPageSize(int pageSize)
    {
        int num = goodsDao.queryGoodsNum();

        return num%pageSize==0 ? num/pageSize : num/pageSize+1;
    }
}
