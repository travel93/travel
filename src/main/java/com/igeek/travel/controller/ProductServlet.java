package com.igeek.travel.controller;

import com.igeek.travel.entity.Product;
import com.igeek.travel.service.ProductService;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-08 1:15
 */
@WebServlet(name = "ProductServlet",urlPatterns = "/product")
public class ProductServlet extends BasicServlet{

    private ProductService productService = new ProductService();

    //展示首页
    public void index(HttpServletRequest request, HttpServletResponse response)throws InvocationTargetException, IllegalAccessException, ServletException, IOException, MessagingException {
        //热门数据
        List<Product> hotProducts = productService.findHotProducts();

        //最新数据
        List<Product> newProducts = productService.findNewProducts();

        //跳转至页面
        request.setAttribute("hotProducts",hotProducts);
        request.setAttribute("newProducts",newProducts);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

}
