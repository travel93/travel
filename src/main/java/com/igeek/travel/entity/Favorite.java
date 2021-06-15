package com.igeek.travel.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: luowei
 * @date: 2021/6/14 20:57
 */

public class Favorite {

    //一对多  购物车明细   Map<商品的rid , 购物车项>
    private Map<String,FavoriteItem> map = new HashMap<>();

        //商品总金额
        private double total;
    public Favorite() {
    }

    public Favorite(Map<String, FavoriteItem> map) {
        this.map = map;
    }

    public Favorite(Map<String, FavoriteItem> map, double total) {
        this.map = map;
        this.total = total;
    }

    /**
     * 获取
     * @return map
     */
    public Map<String, FavoriteItem> getMap() {
        return map;
    }

    /**
     * 设置
     * @param map
     */
    public void setMap(Map<String, FavoriteItem> map) {
        this.map = map;
    }

    public String toString() {
        return "Favorite{map = " + map + "}";
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
}
