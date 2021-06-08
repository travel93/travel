package com.igeek.travel.dao;

import com.igeek.travel.entity.Category;
import com.igeek.utils.DataSourceUtils;

import java.util.List;

public class CategoryDao extends BasicDao implements IDao<CategoryDao>{
    @Override
    public CategoryDao selectOne(Object... params) throws Exception {
        return null;
    }

    @Override
    public List<CategoryDao> selectAll(Object... params) throws Exception {
        String sql="select * from category";
        this.getBeanList(DataSourceUtils.getConnection(),sql, Category.class);
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
    public int insert(CategoryDao categoryDao) throws Exception {
        return 0;
    }
}
