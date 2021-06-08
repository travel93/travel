package com.igeek.travel.entity;

import java.util.Date;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-08 0:48
 */
public class Product {

    private Integer rid;
    private String rname;
    private Double price;
    private String introduce;
    private Integer is_hot;
    private Date date;
    private Integer count;
    private String rimage;
    private Integer cid;


    public Product() {
    }

    public Product(Integer rid, String rname, Double price, String introduce, Integer is_hot, Date date, Integer count, String rimage, Integer cid) {
        this.rid = rid;
        this.rname = rname;
        this.price = price;
        this.introduce = introduce;
        this.is_hot = is_hot;
        this.date = date;
        this.count = count;
        this.rimage = rimage;
        this.cid = cid;
    }

    /**
     * 获取
     * @return rid
     */
    public Integer getRid() {
        return rid;
    }

    /**
     * 设置
     * @param rid
     */
    public void setRid(Integer rid) {
        this.rid = rid;
    }

    /**
     * 获取
     * @return rname
     */
    public String getRname() {
        return rname;
    }

    /**
     * 设置
     * @param rname
     */
    public void setRname(String rname) {
        this.rname = rname;
    }

    /**
     * 获取
     * @return price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 设置
     * @param price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 获取
     * @return introduce
     */
    public String getIntroduce() {
        return introduce;
    }

    /**
     * 设置
     * @param introduce
     */
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    /**
     * 获取
     * @return is_hot
     */
    public Integer getIs_hot() {
        return is_hot;
    }

    /**
     * 设置
     * @param is_hot
     */
    public void setIs_hot(Integer is_hot) {
        this.is_hot = is_hot;
    }

    /**
     * 获取
     * @return date
     */
    public Date getDate() {
        return date;
    }

    /**
     * 设置
     * @param date
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * 获取
     * @return count
     */
    public Integer getCount() {
        return count;
    }

    /**
     * 设置
     * @param count
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    /**
     * 获取
     * @return rimage
     */
    public String getRimage() {
        return rimage;
    }

    /**
     * 设置
     * @param rimage
     */
    public void setRimage(String rimage) {
        this.rimage = rimage;
    }

    /**
     * 获取
     * @return cid
     */
    public Integer getCid() {
        return cid;
    }

    /**
     * 设置
     * @param cid
     */
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String toString() {
        return "Product{rid = " + rid + ", rname = " + rname + ", price = " + price + ", introduce = " + introduce + ", is_hot = " + is_hot + ", date = " + date + ", count = " + count + ", rimage = " + rimage + ", cid = " + cid + "}";
    }
}
