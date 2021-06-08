package com.igeek.travel.service;

import com.igeek.travel.dao.CategoryDao;
import com.igeek.travel.entity.Category;
import com.igeek.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-08 21:05
 */
public class CategoryService {

    private CategoryDao dao = new CategoryDao();

    //查询所有的商品类别
    public List<Category> findAllCategories(){
        try {
            return dao.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

}
