package edu.servlet;

import com.sun.org.apache.xpath.internal.SourceTree;
import edu.test.service.Userservice;
import edu.test.vo.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.Writer;

/**
 * Created by huan on 2015/7/8 0008.
 */

public class UserServlet extends HttpServlet {

        public void doGet(HttpServletRequest request,HttpServletResponse response){
        doPost(request,response);
    }

    Userservice service = new Userservice();
    public void doPost(HttpServletRequest request,HttpServletResponse response){

        //设置编码
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;Charset=UTF-8");

        String opt =   request.getParameter("opt");
        if("reg".equals(opt))
        {
            regist(request,response);
        }
        else if ("login".equals(opt))
        {
            login(request,response);

        }
        else if("exist".equals(opt)){

            exist(request,response);
        }
        if ("login2".equals(opt))
        {
            RequestDispatcher dis = request.getRequestDispatcher("/login.jsp");

            try {
                    dis.forward(request,response);
            } catch (ServletException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
    }

    private void exist(HttpServletRequest request, HttpServletResponse response) {

        String name = request.getParameter("name");
        boolean rel = service.isExist(name);
        System.out.println(rel);

           //response.getOutputStream().write(rel ? 1 : 0);
           // response.getWriter().println(rel);
            String r = null;
            if(rel){
                r  = "<font color='red'>对不起，用户名已被使用</font>";

            }else{
                r = "<font color='green'>恭喜你用户名可以使用</font>";
            }
        try {
            response.getWriter().println(r);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public  void regist(HttpServletRequest request,HttpServletResponse response)
    {
        String name = request.getParameter("username");
        String pwd = request.getParameter("userpwd");

        User user = new User();
        user.setUserName(name);
        user.setUserPwd(pwd);

        boolean rel = service.doRegist(user);

        if(rel)
        {
            request.setAttribute("regist", "success");
            RequestDispatcher dis = request.getRequestDispatcher("/regist.jsp");
            try {
                dis.forward(request, response);
            } catch (ServletException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }


        }
        else
        {
            System.out.println("hahha");
        }
    }

    public void login(HttpServletRequest request,HttpServletResponse response) {


        String name  = request.getParameter("username");
        String pwd = request.getParameter("userpwd");
        User user = service.doLogin(name, pwd);
        HttpSession session = request.getSession();
        RequestDispatcher dis;
        if(user!=null)
        {
            session.setAttribute("curUser", user);
            String[] s = request.getParameterValues("status");
            if (s !=null && "1".equals(s[0])){
                Cookie cookie = new Cookie("curUser",user.getUserId());

               //cookie.setMaxAge(60 * 60 * 24 * 7);
                cookie.setMaxAge(20);
                cookie.setPath("/");
                response.addCookie(cookie);
            }



             dis  = request.getRequestDispatcher("/goodsServlet");
            try {
                dis.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

       else {
        request.setAttribute("curUser","error");
        dis  = request.getRequestDispatcher("/login.jsp");
            try {
                dis.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
       /* if(user!=null)
        {
            request.setAttribute("curUser", user);
           dis = request.getRequestDispatcher("/main.jsp");

            try {

            } catch (ServletException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        else {


        }*/
    }
}
