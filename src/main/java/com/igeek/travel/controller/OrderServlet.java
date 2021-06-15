package com.igeek.travel.controller;

import com.igeek.travel.entity.*;
import com.igeek.travel.service.OrderService;
import com.igeek.utils.CommonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "OrderServlet",urlPatterns = "/orders")
public class OrderServlet extends BasicServlet {
    private OrderService orderService = new OrderService();
    //提交订单
    public void submitOrders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        //获取会话中的登陆者信息
        User user = (User)session.getAttribute("user");
        System.out.println(user);
        //获取会话中购物车信息
        Favorite favorite = (Favorite)session.getAttribute("favorite");
        System.out.println(favorite);
        //创建订单对象
        Orders orders = new Orders();
        //设置订单编号
        orders.setOid(CommonUtils.getUUID().replaceAll("-",""));
        //设置下单时间
        orders.setOrdertime(new Date());
        //设置下单状态  0未支付
        orders.setState(0);
        //设置该订单的下单者信息
        orders.setUser(user);
        //设置订单总金额
        orders.setTotal(favorite.getTotal());
        System.out.println(favorite.getTotal());
        Map<String, FavoriteItem> favoritemap = favorite.getMap();
        Set<Map.Entry<String, FavoriteItem>> entries = favoritemap.entrySet();
        //将购物车明细entry.getValue()   -->   订单明细
        for (Map.Entry<String, FavoriteItem> entry : entries) {
            //创建订单明细对象
            OrderItem orderItem = new OrderItem();
            //设置订单明细的编号  insert语句
            //设置购买商品
            orderItem.setProduct(entry.getValue().getProduct());
            //设置小计
            orderItem.setSubtotal(entry.getValue().getSubTotal());
            //设置所属订单
            orderItem.setOrders(orders);

            //将当前订单明细添加至订单中
            orders.getList().add(orderItem);
        }

        //提交订单
        boolean flag = orderService.submitOrders(orders);
        if(flag){
            //会话域中存储orders订单信息
            session.setAttribute("orders",orders);
            //响应重定向至order_info.jsp
            response.sendRedirect("order.jsp");
        }else{
            request.setAttribute("msg","订单提交失败");
            request.getRequestDispatcher("favorite.jsp").forward(request,response);
        }

    }
    //确认订单
}
