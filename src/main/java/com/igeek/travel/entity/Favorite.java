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


    public Favorite() {
    }

    public Favorite(Map<String, FavoriteItem> map) {
        this.map = map;
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
}
