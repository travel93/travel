package com.igeek.travel.controller;

import com.google.gson.Gson;
import com.igeek.travel.entity.Category;
import com.igeek.travel.service.CategoryService;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-08 21:03
 */
@WebServlet(name = "CategoryServlet",urlPatterns = "/category")
public class CategoryServlet extends BasicServlet {

    private CategoryService categoryService = new CategoryService();

    //查询商品分类的列表
    public void findAllCategories(HttpServletRequest request, HttpServletResponse response)throws InvocationTargetException, IllegalAccessException, ServletException, IOException, MessagingException {
        List<Category> categories = categoryService.findAllCategories();

        //json数据
        Gson gson = new Gson();
        String json = gson.toJson(categories);

        //将json数据响应到客户端
        response.getWriter().write(json);
    }
}
