package com.igeek.travel.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Orders {
    private String oid;
    private Date ordertime;
    private double total;
    private int state;
    private String name;
    private String phone;


    private User user;

    private List<OrderItem> list=new ArrayList<>();

    public Orders() {
    }

    public Orders(String oid, Date ordertime, double total, int state, String name, String phone, User user, List<OrderItem> list) {
        this.oid = oid;
        this.ordertime = ordertime;
        this.total = total;
        this.state = state;
        this.name = name;
        this.phone = phone;
        this.user = user;
        this.list = list;
    }

    /**
     * 获取
     * @return oid
     */
    public String getOid() {
        return oid;
    }

    /**
     * 设置
     * @param oid
     */
    public void setOid(String oid) {
        this.oid = oid;
    }

    /**
     * 获取
     * @return ordertime
     */
    public Date getOrdertime() {
        return ordertime;
    }

    /**
     * 设置
     * @param ordertime
     */
    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    /**
     * 获取
     * @return total
     */
    public double getTotal() {
        return total;
    }

    /**
     * 设置
     * @param total
     */
    public void setTotal(double total) {
        this.total = total;
    }

    /**
     * 获取
     * @return state
     */
    public int getState() {
        return state;
    }

    /**
     * 设置
     * @param state
     */
    public void setState(int state) {
        this.state = state;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取
     * @return user
     */
    public User getUser() {
        return user;
    }

    /**
     * 设置
     * @param user
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * 获取
     * @return list
     */
    public List<OrderItem> getList() {
        return list;
    }

    /**
     * 设置
     * @param list
     */
    public void setList(List<OrderItem> list) {
        this.list = list;
    }

    public String toString() {
        return "Orders{oid = " + oid + ", ordertime = " + ordertime + ", total = " + total + ", state = " + state + ", name = " + name + ", phone = " + phone + ", user = " + user + ", list = " + list + "}";
    }
}
