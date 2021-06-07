package com.igeek.travel.dao;


import com.igeek.travel.entity.User;
import com.igeek.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-05 14:06
 */
public class UserDao extends BasicDao<User> implements IDao<User>{

    public User selectUser(String uname,String password) throws Exception {
        String sql="SELECT * FROM user where uname =? and password=?";
        User user = this.getBean(DataSourceUtils.getConnection(), sql, User.class,uname,password);
        return user;
    }

    @Override
    public User selectOne(Object... params) throws Exception {
        return null;
    }

    @Override
    public List<User> selectAll(Object... params) {
        return null;
    }

    @Override
    public Object selectValue(Object... params) throws SQLException {
        return null;
    }

    @Override
    public int update(Object... params) throws SQLException {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    //插入用户信息
    @Override
    public int insert(User user) throws SQLException {
        String sql = "insert into user values(null,?,?,?,?,?,?,?,0,0)";
        int i = this.updateInfo(DataSourceUtils.getConnection(), sql,user.getUname(),user.getPassword(),user.getName(),
                user.getBirthday(),user.getSex(),user.getPhone(),user.getEmail());
        return i;
    }
}
