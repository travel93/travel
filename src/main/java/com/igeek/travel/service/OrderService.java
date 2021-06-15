package com.igeek.travel.service;

import com.igeek.travel.dao.OrdersDao;
import com.igeek.travel.entity.Orders;
import com.igeek.utils.DataSourceUtils;

import java.sql.SQLException;

public class OrderService {
    private OrdersDao dao = new OrdersDao();
    //提交订单
    public boolean submitOrders(Orders orders){
        try {
            //开启事务  不再自动提交事务
            DataSourceUtils.startTransaction();

            //保持事务的一致性
            dao.insertOrders(orders);
            dao.insertOrderItem(orders);

            return true;
        } catch (Exception e) {
            //事务回滚
            try {
                DataSourceUtils.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            //关闭资源
            //提交事务
            try {
                DataSourceUtils.commitAndRelease();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
