package com.igeek.travel.service;


import com.igeek.travel.dao.IDao;
import com.igeek.travel.dao.UserDao;
import com.igeek.travel.entity.User;
import com.igeek.utils.DataSourceUtils;

import java.sql.SQLException;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-05 14:07
 */
public class UserService {

    private IDao<User> dao = new UserDao();

    //注册
    public boolean register(User user){
        try {
            return dao.insert(user)>0?true:false;
        }  catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    //校验名称是否存在
    public boolean validate(String name){
        try {
            //value  代表按照姓名查询的记录数
             Long value = (Long)dao.selectValue(name);
            //若记录数>0，则查到，true，代表不可用
            //若记录数=0，则未查到，false，代表可用
            return value>0?true:false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
