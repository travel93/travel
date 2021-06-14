package com.igeek.travel.controller;

import com.igeek.travel.entity.Favorite;
import com.igeek.travel.entity.FavoriteItem;
import com.igeek.travel.entity.Product;
import com.igeek.travel.service.ProductService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Map;

/**
 * @author: luowei
 * @date: 2021/6/14 21:17
 */
@WebServlet(name = "FavoriteServlet",urlPatterns = {"/favorite"})
public class FavoriteServlet extends BasicServlet {

    private ProductService productService = new ProductService();

    //加入收藏
    public void addFavorite(HttpServletRequest request, HttpServletResponse response) throws IOException{
        //1.获得请求参数
        //获得商品编号
        String rid = request.getParameter("rid");
        Product product = productService.findProductByRid(rid);

        double subTotal = product.getPrice(); //1299


        //3.从会话中获取购物车信息
        HttpSession session = request.getSession();
        Favorite favorite = (Favorite) session.getAttribute("favorite");

        //实际支付
        Object status = session.getAttribute("status");
        if ("1".equals(status)){
            subTotal = subTotal*0.7;

        }else {
            subTotal=subTotal*0.9;
        }
        System.out.println(subTotal);

        //若是第一次加入购物车
        if(favorite == null){
            favorite = new Favorite();
        }

        //4.获取会话中购物车的明细FavoriteItem信息
        Map<String, FavoriteItem> map = favorite.getMap();  //

        //5.购物车明细
        FavoriteItem favoriteItem=new FavoriteItem(product,subTotal);

       //6.购物车
        map.put(rid,favoriteItem);
        favorite.setMap(map);
        //7.会话作用域中添加favorite信息
        session.setAttribute("favorite",favorite);
        //8.响应重定向至favorite.jsp
        response.sendRedirect("favorite.jsp");

    }

    //删除购物项
    public void delFavorite(HttpServletRequest request,HttpServletResponse response) throws IOException{
        //1.获取请求参数中商品编号
        String rid = request.getParameter("rid");

        //2.从会话中获取购物车Favorite的信息
        HttpSession session = request.getSession();
        Favorite favorite = (Favorite) session.getAttribute("favorite");

        //3.获取Favorite中的Map<String,FavoriteItem>信息
        Map<String, FavoriteItem> favoriteMap = favorite.getMap();


        //5.移除当前商品的购物项
        favoriteMap.remove(rid);

        //6.将操作完成的Favorite信息，放回至会话中
        favorite.setMap(favoriteMap);
        session.setAttribute("favorite",favorite);

        //7.响应重定向至favorite.jsp
        response.sendRedirect("favorite.jsp");
    }


    //清空购物车
    public void clearFavorite(HttpServletRequest request , HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("favorite");
        response.sendRedirect("favorite.jsp");
    }
}
