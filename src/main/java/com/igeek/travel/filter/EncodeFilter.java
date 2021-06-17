package com.igeek.travel.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @Description: 编码集过滤器
 * @author: ClownL12
 * @create: 2021-06-05 13:48
 */
@WebFilter(filterName = "f1",urlPatterns = "/*",initParams = @WebInitParam(name="encode",value="utf-8"))
public class EncodeFilter implements Filter {

    private String encode;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest request = (HttpServletRequest)req;
//        if(request.getRequestURI().contains("css") || request.getRequestURI().contains("js")
//         || request.getRequestURI().contains("products") || request.getRequestURI().contains("fonts")
//         || request.getRequestURI().contains("image") || request.getRequestURI().contains("images")
//         || request.getRequestURI().contains("img")){
//            chain.doFilter(request,resp);
//        }else{
            req.setCharacterEncoding(encode);
            resp.setContentType("text/html;charset="+encode);
            chain.doFilter(req,resp);
//        }
    }

    public void init(FilterConfig config) throws ServletException {
        encode = config.getInitParameter("encode");
    }

}
