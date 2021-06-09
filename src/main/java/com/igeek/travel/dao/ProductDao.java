package com.igeek.travel.dao;

import com.igeek.travel.entity.Product;
import com.igeek.utils.DataSourceUtils;

import java.util.List;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-08 0:53
 */
public class ProductDao extends BasicDao<Product> implements IDao<Product> {
    @Override
    public Product selectOne(Object... params) throws Exception {
        String sql="select rid,rimage,price,cid,introduce,count from product where rid = ?";
        Product product = this.getBean(DataSourceUtils.getConnection(), sql, Product.class, params);
        return product;
    }

    //查看热门景点
    public List<Product> selectAllHot(Object... params) throws Exception {
        String sql = "select rid,rname,rimage,price,cid from product where is_hot=1 limit 0,8";
        List<Product> list = this.getBeanList(DataSourceUtils.getConnection(), sql, Product.class);
        return list;
    }

    //查看国内游景点
    public List<Product> selectAllDomestic(Object... params) throws Exception {
        String sql = "select rid,rname,price,introduce,rimage,cid from product where cid = 1 limit 0,6";
        List<Product> list = this.getBeanList(DataSourceUtils.getConnection(), sql, Product.class);
        return list;
    }

    //查看境外游景点
    public List<Product> selectAllAbroad(Object... params) throws Exception {
        String sql = "select rid,rname,price,introduce,rimage,cid from product where cid = 2 limit 0,6";
        List<Product> list = this.getBeanList(DataSourceUtils.getConnection(), sql, Product.class);
        return list;
    }

    //查询商品列表
    @Override
    public List<Product> selectAll(Object... params) throws Exception {
        Object cid = params[0];
        String sql = "";
        if(cid == null || cid.equals("")){
            sql = "select rid,rname,price,introduce,rimage,count,cid from product where rname like concat('%',?,'%') limit ?,6";
            List<Product> list = this.getBeanList(DataSourceUtils.getConnection(), sql, Product.class, params[1],params[2]);
            return list;
        }else{
            sql = "select rid,rname,price,introduce,rimage,count,cid from product where cid = ? and rname like concat('%',?,'%') limit ?,6";
            List<Product> list = this.getBeanList(DataSourceUtils.getConnection(), sql, Product.class, params);
            return list;
        }

    }

    //查询商品总记录数
    @Override
    public Long selectValue(Object... params) throws Exception {
        Object cid = params[0];
        String sql = "";
        if(cid == null || cid.equals("")) {
            sql = "select count(*) from product where rname like concat('%',?,'%')";
            Long value = (Long) this.getSingleValue(DataSourceUtils.getConnection(), sql, params[1]);
            return value;
        }else{
            sql = "select count(*) from product where cid = ? and rname like concat('%',?,'%')";
            Long value = (Long) this.getSingleValue(DataSourceUtils.getConnection(), sql, params);
            return value;
        }
    }

    @Override
    public int update(Object... params) throws Exception {
        return 0;
    }

    @Override
    public int delete(String id) throws Exception {
        return 0;
    }

    @Override
    public int insert(Product product) throws Exception {
        return 0;
    }
}
