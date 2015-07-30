package edu.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by huan on 2015/7/22 0022.
 */
public class LoginFilter implements Filter{


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request =(HttpServletRequest)req;
        if(request.getSession().getAttribute("curUser")!=null){
            chain.doFilter(req,resp);
        }
        else {
            request.getRequestDispatcher("/nologin.jsp").forward(req,resp);
        }

    }

    @Override
    public void destroy() {

    }
}
