package com.igeek.travel.controller;

import com.igeek.travel.entity.Product;
import com.igeek.travel.service.CategoryService;
import com.igeek.travel.service.ProductService;
import com.igeek.travel.vo.PageVO;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    private CategoryService categoryService = new CategoryService();

    //展示首页
    public void index(HttpServletRequest request, HttpServletResponse response)throws InvocationTargetException, IllegalAccessException, ServletException, IOException, MessagingException {
        HttpSession session = request.getSession();
        //热门数据
        List<Product> hotProducts = productService.findHotProducts();

        //国内数据
        List<Product> domesticProducts = productService.findDomesticProducts();

        //境外数据
        List<Product> abroadProducts = productService.findAbroadProducts();

        //跳转至页面
        session.setAttribute("hotProducts",hotProducts);
        session.setAttribute("domesticProducts",domesticProducts);
        session.setAttribute("abroadProducts",abroadProducts);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    //通过商品类别和商品名称的分页查询列表
    public void findProducts(HttpServletRequest request, HttpServletResponse response)throws InvocationTargetException, IllegalAccessException, ServletException, IOException, MessagingException {
        String cid = request.getParameter("cid");
        String name = request.getParameter("rname");
        String page = request.getParameter("pageNow");
        //HttpSession session = request.getSession();

        if(cid != null && !cid.equals("")){
            //通过cid查询rname
            String cname = categoryService.findCname(cid);
            if(cname != null){
                request.setAttribute("cname", cname);
            }
        }

        //搜索时的商品名称
        String pname = "";
        if(name == null){
            pname = "";
        }else{
            pname = name;
        }

        //分页的当前页面
        int pageNow = 1;
        if(page == null){
            pageNow = 1;
        }else{
            pageNow = Integer.parseInt(page);
        }

        //查询商品列表
        PageVO<Product> vo = productService.findProducts(cid, pname, pageNow);
        request.setAttribute("vo", vo);

        //请求转发
         request.getRequestDispatcher("collect_route.jsp").forward(request,response);
    }


    public void findProductByRid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String rid = request.getParameter("rid");
        String cname = request.getParameter("cname");
        if(cname!=null &&!cname.equals("")){
            request.setAttribute("cname",cname);
        }
        System.out.println(rid);
        Product product = productService.findProductByRid(rid);
        session.setAttribute("product",product);
        request.getRequestDispatcher("route_detail.jsp").forward(request,response);
    }
}
