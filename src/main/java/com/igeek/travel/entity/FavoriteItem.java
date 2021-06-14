package com.igeek.travel.entity;

/**
 * @author: luowei
 * @date: 2021/6/14 20:57
 */

public class FavoriteItem {

    //一对一关联路线信息
    private Product product;

    //实际支付
    private double subTotal;


    public FavoriteItem() {
    }

    public FavoriteItem(Product product, double subTotal) {
        this.product = product;
        this.subTotal = subTotal;
    }

    /**
     * 获取
     * @return product
     */
    public Product getProduct() {
        return product;
    }

    /**
     * 设置
     * @param product
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * 获取
     * @return subTotal
     */
    public double getSubTotal() {
        return subTotal;
    }

    /**
     * 设置
     * @param subTotal
     */
    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public String toString() {
        return "FavoriteItem{product = " + product + ", subTotal = " + subTotal + "}";
    }
}