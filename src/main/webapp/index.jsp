<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 92828
  Date: 2021/5/29
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--  Object user = session.getAttribute("user");--%>
<%--  if(user == null){--%>
<%--    request.setAttribute("msg","当前资源需登录后才能访问");--%>
<%--    request.getRequestDispatcher("login.jsp").forward(request,response);--%>
<%--  }--%>
<%
  Object user = session.getAttribute("user");
  if(user == null){
    request.setAttribute("msg","当前资源需登录后才能访问");
    request.getRequestDispatcher("login.jsp").forward(request,response);
  }
%>
<html>
  <head>
    <title>页面界面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <style>
      #menu li{
        width: 90px;
        /* border: 1px solid black; */
        text-align: center;

      }

      .nav .navbar-nav>li:hover{
        background-color: orange;
      }
    </style>
  </head>
  <body>

<%--  <jsp:include page="/header.jsp"></jsp:include>--%>

  <!-- 头部条 -->
  <div class="container">
    <div class="row">
      <div class="login" style="float: right;margin-top: 10px;">
        <span id="span_username">欢迎 ${uname} <font color="red">${status}</font>

        </span>
        <a href="#" class="collection">我的收藏</a>
        <a href="user?code=logout">退出</a>
      </div>
    </div>
  </div>

  <!-- 搜索框 -->
  <div class="container" style="margin-top: 20px;">
    <div class="row" >
      <div class="input-group col-md-3" style="margin: auto;">
        <input type="text" class="form-control"placeholder="请输入" >
        <span class="input-group-btn">
				   <button class="btn btn-info btn-search">搜索</button>
				</span>
      </div>
    </div>
  </div>

<!-- 引入header.jsp -->
<%--<jsp:include page="/header.jsp"></jsp:include>--%>

  <!-- 导航栏 -->
  <div class="container" style="margin-top: 10px;">
    <div class="row">
      <nav class="navbar navbar-default navbar-static-top">
        <div class="collapse navbar-collapse" id="menu">
          <!-- 菜单栏 -->
          <ul class="nav navbar-nav" id="categories">
            <li class="active"><a href="#">首页</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>

  <!-- 图片轮播 -->
  <div class="container">
    <div class="row">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- 三个点 -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- 轮播的图片 -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="resources/images/banner_1.jpg" alt="...">

          </div>
          <div class="item">
            <img src="resources/images/banner_2.jpg" alt="...">
          </div>
          <div class="item">
            <img src="resources/images/banner_3.jpg" alt="...">
          </div>
        </div>

        <!-- 左右控制 -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
  </div>

  <!-- 功能选区 -->
  <div class="container">
    <div class="row">
      <ol class="breadcrumb" style="margin-top: 10px;background-color: white;margin-bottom: -5px;">
        <li style="position: absolute;"><img src="resources/images/icon_5.jpg"></li>
        <li style="font-size: 20px;padding-left: 20px;"><a href="#">热门景点</a></li>
        <li style="font-size: 20px;">人气热销</li>
      </ol>
      <hr style="background-color: orange;height:1px; border:none;margin-top: 10px;margin-bottom: 10px;"/>
    </div>
  </div>

  <!-- 热门景点 -->
  <div class="container">
    <div class="row">

      <c:forEach items="${hotProducts}" var="product">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <img src="${product.rimage}" style="width: 270px;" />
          <p style="margin-top: 5px;text-align: center;">
            <span>${product.rname}</span>
          </p>
          <p style="text-align: center;color: darkgrey;">
            网付价<em style="color: red;font-size: 20px;">￥</em><strong style="color: red;font-size: 20px;">${product.price}</strong><em>起</em>
          </p>
        </div>
      </c:forEach>


    </div>
  </div>

  <!-- 国内游 -->
  <div class="container" id="guonei">
    <div class="row" >
      <!-- 图片部分 -->
      <div class="col-lg-10" style="width: 50px;">
        <img src="resources/images/icon_6.jpg">
      </div>
      <!-- 文字部分 -->
      <div class="col-lg-2" style="">
        <span style="font-size: 20px;">国内游</span>
      </div>
    </div>

    <hr style="background-color: orange;height:1px; border:none;margin-top: 3px;margin-bottom: 0;" />

    <!-- 商品图片 -->
    <div class="row" style="margin-top: 5px;">
      <!-- 左大图 -->
      <div class="col-lg-2 col-md-3 hidden-sm col-xs-12" style="padding-left: 15px;" >
        <img src="resources/images/guonei_1.jpg" height="565px" width="350px"/>
      </div>

      <!-- 右小图 -->
      <div class="col-lg-10 col-md-9 col-sm-12">
        <!-- 右上 -->
        <div class="row" style="text-align: center;padding-left: 170px;">
          <c:forEach items="${domesticProducts}" var="product">
            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-4" style="width: 250px;height: 280px; border: 1px solid lightgrey;margin-left: 12px;padding-left: 0;" >
              <a href="#" style="text-decoration: none;color: black;">
                <img src="${product.rimage}" width="250px" height="170px" />
                <p style="margin-top: 5px;text-align: center;width: 250px;">
                  <span>${product.introduce}</span>
                </p>
                <p style="color: darkgrey;">
                  网付价<em style="color: red;font-size: 20px;">￥</em><strong style="color: red;font-size: 20px;">${product.price}</strong><em>起</em>
                </p>
              </a>
            </div>
          </c:forEach>


        </div>
      </div>
    </div>
  </div>

  <!-- 境外游 -->
  <div class="container" style="margin-top: 10px;" id="guowai">
    <div class="row" >
      <!-- 图片部分 -->
      <div class="col-lg-10" style="width: 50px;">
        <img src="resources/images/icon_7.jpg">
      </div>
      <!-- 文字部分 -->
      <div class="col-lg-2" style="">
        <span style="font-size: 20px;">境外游</span>
      </div>
    </div>

    <hr style="background-color: orange;height:1px; border:none;margin-top: 3px;margin-bottom: 0;" />

    <!-- 商品图片 -->
    <div class="row" style="margin-top: 5px;">
      <!-- 左大图 -->
      <div class="col-lg-2 col-md-3 hidden-sm col-xs-12" style="padding-left: 15px;" >
        <img src="resources/images/jiangwai_1.jpg" height="565px" width="350px"/>
      </div>

      <!-- 右小图 -->
      <div class="col-lg-10 col-md-9 col-sm-12">
        <!-- 右上 -->
        <div class="row" style="text-align: center;padding-left: 170px;">
         <c:forEach items="${abroadProducts}" var="product">
           <div class="col-lg-2 col-md-3 col-sm-4 col-xs-4" style="width: 250px;height: 280px; border: 1px solid lightgrey;margin-left: 12px;padding-left: 0;" >
             <a href="#" style="text-decoration: none;color: black;">
               <img src="${product.rimage}" width="250px" height="170px" />
               <p style="margin-top: 5px;text-align: center;width: 250px;">
                 <span>${product.introduce}</span>
               </p>
               <p style="color: darkgrey;">
                 网付价<em style="color: red;font-size: 20px;">￥</em><strong style="color: red;font-size: 20px;">${product.price}</strong><em>起</em>
               </p>
             </a>
           </div>
         </c:forEach>
        </div>
      </div>
    </div>
  </div>

  <!-- 服务保障 -->
  <div class="container" style="margin-top: 10px;">
    <div class="row">
      <img src="resources/images/footer.jpg" width="100%" />
    </div>
  </div>

  <!-- foot -->
  <div class="container">
    <div class="row" style="text-align: center;">
      <div class="list-inline">
        <p>
          <a href="#">关于我们</a>
          <a href="#">联系我们</a>
          <a href="#">招贤纳士</a>
          <a href="#">法律声明</a>
          <a href="#">友情链接</a>
          <a href="#">支付方式</a>
          <a href="#">服务声明</a>
          <a href="#">广告声明</a>
        </p>
        <p>
          Copyright © 2021-2021 旅游系统 版权所有
        </p>
      </div>
    </div>
  </div>
  </body>
  <script src="resources/js/jquery-1.11.0.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script>
    console.log(111);
    $.ajax({
      type:"get",
      url:"${pageContext.request.contextPath}/category?method=findAllCategories",
      dataType:"json",
      success:function (list) {
        console.log(list);
        for(var i in list){
          var $li = "<li><a href='#'>"+list[i].cname+"</a></li>";
          $("#categories").append($li);
        }
      }
    })
  </script>
</html>
