package com.igeek.travel.service;

import com.igeek.travel.dao.ProductDao;
import com.igeek.travel.entity.Product;
import com.igeek.utils.DataSourceUtils;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-08 1:01
 */
public class ProductService {

    private ProductDao dao = new ProductDao();
    //查询热门的8个景点的数据
    public List<Product> findHotProducts(){
        try {
            return dao.selectAllHot();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    //查询国内游的6个景点的数据
    public List<Product> findDomesticProducts(){
        try {
            return dao.selectAllDomestic();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    //查询境外游的6个景点的数据
    public List<Product> findAbroadProducts(){
        try {
          return dao.selectAllAbroad();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
