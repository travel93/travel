package com.igeek.travel.dao;

import com.igeek.travel.entity.OrderItem;
import com.igeek.travel.entity.Orders;
import com.igeek.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class OrdersDao extends BasicDao<Orders>{
    //插入订单Orders信息
    public int insertOrders(Orders orders) throws SQLException {
        String sql = "insert into orders values(?,?,?,?,?,?,?)";
        int i = this.updateInfo(DataSourceUtils.getConnection(),sql,
                orders.getOid(),orders.getOrdertime(),
                orders.getTotal() , orders.getState(),
                 orders.getName() , orders.getPhone(),
                orders.getUser().getUid());
        return i;
    }

    //插入订单明细OrderItem信息
    public void insertOrderItem(Orders orders) throws SQLException {
        String sql = "insert into orderitem values(UUID_SHORT(),?,?,?,?)";
        List<OrderItem> list = orders.getList();
        for (OrderItem orderItem : list) {
            this.updateInfo(DataSourceUtils.getConnection(),sql,
                    orderItem.getCount(), orderItem.getSubtotal(),
                    orderItem.getProduct().getRid(),
                    orderItem.getOrders().getOid());
        }
    }
}
