package com.igeek.travel.dao;

import com.igeek.travel.entity.Category;
import com.igeek.utils.DataSourceUtils;

import java.util.List;

public class CategoryDao extends BasicDao<Category> implements IDao<Category>{

    @Override
    public Category selectOne(Object... params) throws Exception {
        return null;
    }

    @Override
    public List<Category> selectAll(Object... params) throws Exception {
        String sql="select * from category";
        List<Category> list = this.getBeanList(DataSourceUtils.getConnection(), sql, Category.class);
        return list;
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
    public int insert(Category category) throws Exception {
        return 0;
    }

}
