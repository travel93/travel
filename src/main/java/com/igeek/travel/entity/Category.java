package com.igeek.travel.entity;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-08 0:47
 */
public class Category {

    private String cid;
    private String cname;

    public Category() {
    }

    public Category(String cid, String cname) {
        this.cid = cid;
        this.cname = cname;
    }

    /**
     * 获取
     * @return cid
     */
    public String getCid() {
        return cid;
    }

    /**
     * 设置
     * @param cid
     */
    public void setCid(String cid) {
        this.cid = cid;
    }

    /**
     * 获取
     * @return cname
     */
    public String getCname() {
        return cname;
    }

    /**
     * 设置
     * @param cname
     */
    public void setCname(String cname) {
        this.cname = cname;
    }

    public String toString() {
        return "Category{cid = " + cid + ", cname = " + cname + "}";
    }
}
