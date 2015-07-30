package edu.test.service;

import edu.test.dao.GoodsDao;
import edu.test.dao.OrderDao;
import edu.test.vo.Order;

/**
 * Created by huan on 2015/7/21 0021.
 */
public class OrderService {

    public boolean addOrder(Order order){
        OrderDao orderDao = new OrderDao();
        return orderDao.saveOrder(order);
    }
}
