package edu.filter;

import edu.test.service.Userservice;
import edu.test.vo.User;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by huan on 2015/7/22 0022.
 */
public class CookieFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if (session.getAttribute("curUser")==null){
            Cookie[] cookies = request.getCookies();
            if (cookies!=null){
                for (Cookie cookie:cookies){
                    if ("curUser".equals(cookie.getName())){
                        String id = cookie.getValue();

                        Userservice userservice = new Userservice();
                        User user =userservice.getUserById(id);
                        session.setAttribute("curUser",user);
                        break;
                    }
                }

            }
        }
        chain.doFilter(req,resp);

    }

    @Override
    public void destroy() {

    }
}
