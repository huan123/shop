package edu.servlet;

import edu.test.service.GoodsService;
import edu.test.service.OrderService;
import edu.test.tool.Tool;
import edu.test.vo.Goods;
import edu.test.vo.Order;
import edu.test.vo.OrderDetail;
import edu.test.vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.soap.Detail;
import java.io.IOException;
import java.security.Provider;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by huan on 2015/7/17 0017.
 */
public  class OrderServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response){

        String opt = request.getParameter("opt");
        if ("create".equals(opt)){
            createOrder(request,response);
        }else {
            viewOrder(request,response);
        }

    }

    public void doPost(HttpServletRequest request,HttpServletResponse response){

            doGet(request,response);
    }

    public void createOrder(HttpServletRequest request,HttpServletResponse response){

        Object object = request.getSession().getAttribute("curUser");

        if(object==null){
                try {
                    request.getRequestDispatcher("/login.jsp").forward(request,response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
        String[] ids = request.getParameterValues("ids");
        Order order = new Order();
        order.setOrderId(Tool.getId(12));
        String payType = request.getParameter("payType");
        order.setPayType(payType);
        User user= (User) request.getSession().getAttribute("curUser");
        order.setUser(user);


        List<OrderDetail> details = new ArrayList<OrderDetail>();
        GoodsService service = new GoodsService();
        for (String id:ids){
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrderDetailId(Tool.getId(12));

            Goods goods = service.getGoodsById(id);
            goods.setBuyNum(Integer.parseInt(request.getParameter("num" + id)));
           // System.out.println(request.getParameter("num" + id));
            orderDetail.setOrder(order);
            orderDetail.setGoods(goods);
            details.add(orderDetail);
        }
        order.setOrderDetails(details);

        OrderService orderService = new OrderService();
        if (orderService.addOrder(order)){
            try {
                request.getRequestDispatcher("/login/pay.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
                request.setAttribute("order","fail");
                String s="";
                for(String id : ids){
                    s += "selgoods="+id+"&";
                }
            try {
                request.getRequestDispatcher("/login/orderServlet?"+s).forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    public void viewOrder(HttpServletRequest request,HttpServletResponse response){
        String[] selgoodses = request.getParameterValues("selgoods");
      //  System.out.println(selgoodses.toString());
        HttpSession session = request.getSession();
        List<Goods> cargoods = (List<Goods>)session.getAttribute("shopCar");
        List<Goods> list = new ArrayList<Goods>();
        int index = 0;
        Goods goods = null;
        for (String str:selgoodses){
          //  System.out.println(str);
            index = str.indexOf("|");
            String id = str.substring(0,index);
            for (Goods cg:cargoods){
                if (cg.getGoodsId().equals(id)){
                    goods = cg;
                    break;
                }
            }
            int buyNum = Integer.parseInt(str.substring(index+1));
            request.setAttribute("buyNum",buyNum);
        //    System.out.println(buyNum);
            if (goods.getGoodsNum()<buyNum){
                request.setAttribute("numisless",id);
                try {
                    request.getRequestDispatcher("/car.jsp").forward(request,response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else {
                list.add(goods);
            }
        }
        request.setAttribute("list",list);
        try {
            request.getRequestDispatcher("/login/order.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
