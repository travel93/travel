package com.igeek.travel.controller;

import com.igeek.travel.dao.IDao;
import com.igeek.travel.dao.UserDao;
import com.igeek.travel.entity.User;
import com.igeek.travel.service.UserService;
import com.igeek.utils.CommonUtils;
import com.igeek.utils.MD5Utils;
import com.igeek.utils.MailUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * @Description:
 * @author: ClownL12
 * @create: 2021-06-05 14:24
 */
@WebServlet(name = "UserServlet",urlPatterns = "/user")
public class UserServlet extends BasicServlet {
    private UserDao dao =new UserDao();
    private UserService userService = new UserService();

    //注册
    public void register(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, ServletException, IOException, MessagingException {
        //获取JSP页面中的form表单中请求参数
        Map<String, String[]> map = request.getParameterMap();

        //工具类 BeanUtils
        User user = new User();
        //自定义一个转换器 String -> Date
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class Clazz, Object o) {
                if(o instanceof String){
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        Date date = sdf.parse(o.toString());
                        return date;
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                return null;
            }
        }, Date.class);

        /*
        * BeanUtils.populate(Object,Map) 将Map集合中的键值对的值 填充至Object对象中
        * 第一个参数Object obj:目标对象填充的值
        * 第二个参数Map map:封装了请求参数数据的集合
        */
        BeanUtils.populate(user,map);

        System.out.println(user);

        boolean flag = userService.register(user);
        if(flag){

            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            //注册失败
            request.getRequestDispatcher("travel.jsp").forward(request,response);
        }
    }

//
//    //校验昵称是否存在
//    public void validate(HttpServletRequest request, HttpServletResponse response)throws InvocationTargetException, IllegalAccessException, ServletException, IOException{
//        //获取姓名
//        String name = request.getParameter("username");
//        //校验
//        boolean flag = userService.validate(name);
//        //响应数据 json对象{"key":value}
//        //Gson gson = new Gson();
//        String str = "{\"flag\":"+flag+"}";
//        PrintWriter out = response.getWriter();
//        out.write(str);
//        out.flush();
//        out.close();
//        //String str = "{\"flag\":"+flag+"}";
//        //gson.toJson(flag);
//        //将json数据 响应至客户端
//        //response.getWriter().write(gson.toString());
//    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        //System.out.println("登录！！！！！！！！！");
        String uname= request.getParameter("uname");
        String password= request.getParameter("password");
       /* System.out.println(uname);
        System.out.println(password);*/
        User user = dao.selectUser(uname, password);
        if(user!=null){
            response.sendRedirect("index.jsp");
            session.setAttribute("uname",user.getUname());
            session.setAttribute("password",user.getPassword());
            session.setAttribute("status",user.getStatus());
        }else {
            request.setAttribute("msg","用户名或密码错误！");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }

}
