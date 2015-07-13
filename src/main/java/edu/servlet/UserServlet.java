package edu.servlet;

import com.sun.org.apache.xpath.internal.SourceTree;
import edu.test.service.Userservice;
import edu.test.vo.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        //…Ë÷√±‡¬Î
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
        if ("login".equals(opt))
        {
            login(request,response);

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
