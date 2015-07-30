package edu.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by huan on 2015/7/23 0023.
 */
public class EncodingFilter implements Filter {
    String encoding = "UTF-8";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        req.setCharacterEncoding(encoding);
        resp.setContentType("text/html;charset="+encoding);
        chain.doFilter(req,resp);
    }

    @Override
    public void destroy() {

    }
}
