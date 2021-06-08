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
        return null;
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

    @Override
    public List<Product> selectAll(Object... params) throws Exception {
        return null;
    }

    @Override
    public Object selectValue(Object... params) throws Exception {
        return null;
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
