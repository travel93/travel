package com.igeek.travel.service;

import com.igeek.travel.dao.ProductDao;
import com.igeek.travel.entity.Product;
import com.igeek.travel.vo.PageVO;
import com.igeek.utils.DataSourceUtils;

import javax.print.attribute.standard.PrinterName;
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

    //根据商品类别和商品名称模糊查询 分页查询
    public PageVO<Product> findProducts(String cid,String rname,Integer pageNow){
        try {
            //查询总记录数
            int myCounts = dao.selectValue(cid,rname).intValue();

            //计算总页数
            int myPages = (int)(myCounts%6==0?myCounts/6:Math.ceil(myCounts/6.0));

            //计算每页起始值
            int begin = (pageNow-1)*6;

            //查询记录列表
            List<Product> list = dao.selectAll(cid,rname,begin);

            //封装PageVO对象
            PageVO<Product> vo = new PageVO<Product>(pageNow,myCounts,myPages,cid,rname,list);
            return vo;
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
