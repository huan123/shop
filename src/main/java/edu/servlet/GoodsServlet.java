package edu.servlet;

import edu.test.service.GoodsService;
import edu.test.vo.Goods;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by huan on 2015/7/11 0011.
 */
public class GoodsServlet extends HttpServlet{

    GoodsService goodsService = new GoodsService();
    public void doGet(HttpServletRequest request,HttpServletResponse response)
    {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request ,HttpServletResponse response)
    {
        //…Ë÷√±‡¬Î
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");


        String opt = request.getParameter("opt");
        if ("detail".equals(opt)){

            showDetail(request, response);

        }else if ("key".equals(opt)){
                
            key(request,response);
        }
        else {
            showPage(request, response);
        }

    }

    private void key(HttpServletRequest request, HttpServletResponse response) {

        String key = request.getParameter("keyval");
        List<String> list = goodsService.getNameByKey(key);
        StringBuffer sb = new StringBuffer();
        int index = 0;
        for (String s : list){
            sb.append("<span class='cl'>").append(s).append("</span><br>");
        }
        try {
            response.getWriter().write(sb.toString());
            response.getWriter().flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void showDetail(HttpServletRequest request ,HttpServletResponse response){
       String id = request.getParameter("id");

        GoodsService goodsService1 = new GoodsService();
        Goods goods = goodsService1.getGoodsById(id);

        request.setAttribute("curGoods",goods);
        try {
            request.getRequestDispatcher("/detail.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public void showPage(HttpServletRequest request ,HttpServletResponse response){
        int curPage = request.getParameter("curPage")==null ? 1 : Integer.parseInt(request.getParameter("curPage"));
        int pageSize = request.getParameter("pageSize") == null ? 4 :Integer.parseInt(request.getParameter("pageSize"));

        List<Goods> list = goodsService.doQueryGoods(curPage,pageSize);
        request.setAttribute("list",list);
        request.setAttribute("curPage",curPage);
        request.setAttribute("maxPage",goodsService.getPageSize(pageSize));

        RequestDispatcher dis = request.getRequestDispatcher("/main.jsp");
        try {
            dis.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
