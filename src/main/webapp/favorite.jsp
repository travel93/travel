<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 92828
  Date: 2021/6/6
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>收藏界面</title>
    <!-- 声明文档的编码集 -->
    <meta charset="utf-8">
    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入Bootstrap核心样式文件 -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- 引入header.jsp --><jsp:include page="/header.jsp"></jsp:include>
<c:if test="${empty favorite.map}">
    <div style="width:380px;margin:auto;">
        <img src="images/cart-empty.png" />
    </div>
</c:if>

<c:if test="${!empty favorite.map}">
    <!-- 我的收藏 -->
    <div class="container" style="margin-top: -3px;">
        <div class="row">
            <!-- 图片部分 -->
            <div class="col-lg-10" style="width: 50px;">
                <img src="resources/images/icon_5.jpg">
            </div>
            <!-- 文字部分 -->
            <div class="col-lg-2" style="">
                <span style="font-size: 20px;">我的收藏</span>
            </div>
        </div>
        <hr style="background-color: orange;height:1px; border:none;margin-top: 3px;margin-bottom: 0;" />
    </div>

    <!-- 展示栏 -->
<div class="container" style="margin-top: 10px;">
    <div class="row">
    <c:forEach items="${favorite.map}" var="entry">
        <div class="col-md-3" style="border: 1px solid lightgray;padding: 0;width: 270px;margin-left: 17px;">
            <input type="hidden" name="id" value="${entry.key}">
            <img src="${entry.value.product.rimage}" style="width: 270px;height: 151px" />
            <p style="margin-top: 5px;text-align: center;">
                <span>${entry.value.product.rname}</span>
            </p>
            <p style="color: darkgrey;">
                网付价<em style="color: red;font-size: 15px;">￥</em><strong style="color: red;font-size: 12px;">${entry.value.product.price}</strong>起
                &nbsp;&nbsp;实际支付<em style="color: red;font-size: 12px;">￥</em><strong style="color: red;font-size: 15px;">${entry.value.subTotal}</strong><br>
                <a href="${pageContext.request.contextPath}/favorite?method=delFavorite&rid=${entry.value.product.rid}" style="padding-left: 230px">删除</a>
            </p>
        </div>
    </c:forEach>
    </div>
</div>

    <div class="container" style="padding-left: 1007px; margin-top: 5px">
        <div class="row">
            <a href="${pageContext.request.contextPath}/favorite?method=clearFavorite" id="clear" class="clear">清空购物车</a>
            <a href="#" class="btn btn-danger">
                提交订单
            </a>
        </div>
    </div>
</c:if>


</body>

<!-- 先引入jQuery核心js文件 -->
<script src="resources/js/jquery-1.11.0.min.js"></script>
<!-- 引入BootStrap核心js文件 -->
<script src="resources/js/bootstrap.min.js"></script>
</html>
