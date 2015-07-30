package edu.servlet;

import edu.test.dao.GoodsDao;
import edu.test.service.GoodsService;
import edu.test.vo.Goods;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by huan on 2015/7/15 0015.
 */
public class CarServlet extends HttpServlet {

    GoodsService service = new GoodsService();
    public void doPost(HttpServletRequest request,HttpServletResponse response){
        doGet(request,response);
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response){

        String str = request.getParameter("opt");
        if ("del".equals(str)){

            delCar(request,response);

        }
        else {
            addCar(request,response);
        }
    }

    public void delCar(HttpServletRequest request,HttpServletResponse response){

        HttpSession session = request.getSession();//获取Session对象
        List<Goods> list = (List<Goods>)request.getSession().getAttribute("shopCar");//获取购物车
        String id = request.getParameter("id");
        for (Goods goods:list){
            if (goods.getGoodsId().equals(id)){
                list.remove(goods);
                break;
            }
        }
        try {

            request.getRequestDispatcher("/car.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public void addCar(HttpServletRequest request,HttpServletResponse response){

        String id =  request.getParameter("id");
        int  buyNum = Integer.parseInt(request.getParameter("buyNum"));
        GoodsService goodsService = new GoodsService();
        Goods goods = goodsService.getGoodsById(id);
        goods.setBuyNum(buyNum);

        Object object = request.getSession().getAttribute("shopCar");
        List<Goods> list = null;
        if (object==null){
            list = new ArrayList<Goods>();
            list.add(goods);
        }
        else {

            list = (List<Goods>)object;
            boolean flag = false;
            for(Goods g: list){
                if (g.getGoodsId().equals(id)){
                    flag = true;
                    g.setBuyNum(g.getBuyNum()+buyNum);
                }
            }
            if (!flag){
                list.add(goods);
            }
        }
        request.getSession().setAttribute("shopCar",list);
        request.setAttribute("putCar","ok");
        try {
            request.getRequestDispatcher("/goodsServlet?opt=detail&id="+id).forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }




}
}
