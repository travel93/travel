<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 92828
  Date: 2021/6/6
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>收藏排行榜</title>
    <style>
        html, body, ul, li, ol, dl, dd, dt, p, h1, h2, h3, h4, h5, h6, form, fieldset, legend, img {
            margin: 0;
            padding: 0;
            box-sizing: border-box;

        }

        fieldset, img, input, button {
            border: none;
            padding: 0;
            margin: 0;
            outline-style: none;
        }

        ul, ol {
            list-style: none;
        }

        input {
            padding-top: 0;
            padding-bottom: 0;

        }
        select, input {
            vertical-align: middle;
        }


        select, input, textarea {
            font-size: 12px;
            margin: 0;
        }

        textarea {
            resize: none;
        }
        img{
            display: block;
        }
        table {
            border-collapse: collapse;
        }

        .clearfix:before, .clearfix:after {
            content: "";
            display: table;
            clear: both;
        }

        .clearfix {
            padding-left: 160px;
        }
        a {
            text-decoration: none;
        }

        h1, h2, h3, h4, h5, h6 {
            text-decoration: none;
            font-weight: normal;
            font-size: 100%;
        }

        .login a{
            font-size: 12px;
            color: #a1a1a1;
        }
        .login .collection {
            color: #ff7676;
            margin: 0 16px 0 10px;
        }
        .login_out a {
            color: #000;
            font-size: 12px;
            margin: 0 10px;
        }

        .header_wrap {
            width: 100%;
            overflow: hidden;
        }

        .topbar {
            width: 1200px;
            overflow: hidden;
            margin: 0 auto;
        }

        .logo,
        .search,
        .hottel {
            float: left;
        }

        .logo a {
            display: inline-block;
        }

        .search {
            margin: 15px 140px 0 115px;
        }

        .search_input {
            float: left;
            width: 400px;
            height: 36px;
            border: 2px solid #ffc900;
            padding-left: 10px;
        }

        .search_input:focus {
            outline: none;
        }

        .search-button {
            float: left;
            width: 90px;
            height: 40px;
            background: #ffc900;
            text-align: center;
            line-height: 40px;
            color: #000;
            font-size: 18px;
        }

        ::-webkit-input-placeholder {
            /* WebKit browsers */
            font-size: 12px;
        }

        :-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            font-size: 12px;
        }

        ::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            font-size: 12px;
        }

        :-ms-input-placeholder {
            /* Internet Explorer 10+ */
            font-size: 12px;
        }

        .hot_pic,
        .hot_tel {
            float: left;
        }

        .hot_pic {
            margin-right: 18px;
        }

        .hot_time {
            color: #3d3d3f;
            font-size: 14px;
        }

        .hot_num {
            color: #ffc900;
            font-size: 18px;
        }

        .navitem {
            width: 100%;
            height: 40px;
            background: #ffc900;
        }

        .nav {
            width: 1200px;
            margin: 20px auto 0;
        }

        .nav li {
            float: left;
            margin-left: 30px;
        }

        .nav li a {
            color: #3d3d3f;
            font-size: 14px;
            display: inline-block;
        }

        .nav>li>a:focus, .nav>li>a:hover{
            background: none;
        }

        .nav .nav-active {
            background-color: #ffd800;
        }

        .nav>li>a {
            padding: 10px 15px;
        }

        /*公共页尾*/

        /*页尾*/
        .fl {
            float: left;
        }
        #footer {
            width: 100%;
            background: #3d3d3f;
        }

        .why_select {
            overflow: hidden;
            margin: 0 auto;
            border-bottom: solid 1px #666;
            padding: 10px 85px;
            font-family: '微软雅黑';
        }

        .why_select dl {
            float: left;
            margin-bottom: 0;
        }

        .why_select dd {
            margin: 4px 100px 0 60px;
        }

        .why_select h1 {
            font-size: 16px;
            color: #fff;
            font-weight: bold;
            margin: 0;
        }

        .why_select h1.title {
            line-height: 50px;
            padding-right: 25px;
        }

        .why_select h2 {
            font-size: 12px;
            color: #8d8d8e;
            line-height: 26px;
        }

        .why_select .icon {
            width: 50px;
            height: 50px;
        }

        .company {
            width: 100%;
            height: 38px;
            line-height: 38px;
            background: #ffc900;
            color: #3d3d3f;
            text-align: center;
            font-size: 12px;
        }

        /*分页样式*/
        .pageNum {
            width: 100%;
            padding-left: 290px;
            overflow: hidden;
        }


        .pageNum ul li {
            width: 40px;
            height: 40px;
            float: left;
            border: 1px solid #eee;
            margin-right: 10px;
            text-align: center;
            line-height: 40px;
        }
        .pageNum ul li.curPage {
            background-color: #ffc900;
        }
        .pageNum ul li a {
            width: 100%;
            height: 100%;
            color: #000;
            font-size: 14px;
        }

        .contant {
            width: 100%;
        }
        a{
            color:inherit;
        }


        .contant .shaixuan input {
            padding: 0;
            margin: 0;
            border: 0;
            padding: 0 10px;
            box-sizing: border-box;
        }

        .contant .shaixuan>input:nth-of-type(1) {
            width: 470px;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-left: 20px;
            margin-right: 50px;
        }

        .contant .shaixuan>input:nth-of-type(2),
        .contant .shaixuan>input:nth-of-type(3) {
            width: 72px;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-left: 30px;
            margin-right: 10px;
        }

        .contant .shaixuan>input:nth-of-type(3) {
            margin-left: 10px;
        }

        .contant .shaixuan>button {
            width: 110px;
            height: 30px;
            background-color: #ffc900;
            text-align: center;
            line-height: 30px;
            border-radius: 3px;
            float: right;
            margin-right: 20px;
            margin-top: 10px;
            cursor: pointer;
        }

        .contant .list {
            padding-bottom: 40px;
        }

        .contant .list li:nth-of-type(2n-1) {
            margin-right: 20px;
        }

        .contant .list li {
            width: 590px;
            height: 170px;
            margin-top: 20px;
            float: left;
            border: 1px solid #eee;
            padding: 15px 20px;
            box-sizing: border-box;
        }

        .contant .list li .num {
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            float: left;
            margin-top: 50px;
            margin-right: 20px;
            background-color: #ffc343;
        }

        .contant .list li .one {
            background-color: #ff4444;
        }

        .contant .list li .two {
            background-color: #ff803b;
        }

        .contant .list li img {
            width: 170px;
            height: 140px;
            float: left;
            margin-right: 20px;
        }

        .contant .list li h4 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
        }

        .contant .list li p {
            font-size: 18px;
            color: #ff4848;
            margin-top: 50px;
        }

        .contant .list li p .price {
            float: left;
        }

        .contant .list li p .price span {
            font-size: 26px;
        }

        .contant .list li p .shouchang {
            float: right;
            font-size: 16px;
            color: #000;
            margin-top: 10px;
        }

    </style>
</head>
<body>

<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>

<!--引入头部-->
<div class="contant">

    <div class="list clearfix">
        <ul>
            <c:forEach items="${vo.list}" var="product">
                <li>
                    <span class="num one">1</span>
                    <a href="#"><img src="${product.rimage}" alt=""></a>
                    <h4><a href="route_detail.jsp">${product.introduce}</a></h4>
                    <p>
                        <b class="price">&yen;<span>${product.price}</span>起</b>
                        <span class="shouchang">已收藏${product.count}次</span>
                    </p>
                </li>
            </c:forEach>
        </ul>
    </div>

   <%-- &lt;%&ndash;指定的商品类别中，未查询到商品信息&ndash;%&gt;
    <c:if test="${vo.list.size() eq 0}">
        <div style="width: 380px;margin: 0 auto;margin-top: 10px;margin-bottom: 10px;">
            <img src="resources/images/cart-empty.png" />
        </div>
    </c:if>--%>

    <%--分页--%>
    <c:if test="${vo.list.size() ne 0}">
        <div class="pageNum">
            <ul>
                <%--不允许点击上一页的情况，已经在第一页--%>
                <c:if test="${vo.pageNow eq 1}">
                    <li class="disabled" style="width: 75px;"><a href="#">上一页</a></li>
                </c:if>

                        <%--允许点击上一页的情况--%>
                    <c:if test="${vo.pageNow ne 1}">
                        <li style="width: 75px;"><a href="${pageContext.request.contextPath}/product?method=findProducts&cid=${vo.query1}&rname=${vo.query2}&pageNow=${vo.pageNow-1}">上一页</a></li>
                    </c:if>

                    <%--循环展示页码--%>
                    <c:forEach begin="1" end="${vo.myPages}" var="page">

                        <c:if test="${page eq vo.pageNow}">
                            <li class="active" style="width: 75px;"><a href="JavaScript:void(0)">${page}</a></li>
                        </c:if>

                        <c:if test="${page ne vo.pageNow}">
                            <li style="width: 75px;"><a href="${pageContext.request.contextPath}/product?method=findProducts&cid=${vo.query1}&rname=${vo.query2}&pageNow=${page}">${page}</a></li>
                        </c:if>

                    </c:forEach>

                        <%--允许点击下一页的情况--%>
                    <c:if test="${vo.pageNow ne vo.myPages}">
                        <li style="width: 75px;"><a href="${pageContext.request.contextPath}/product?method=findProducts&cid=${vo.query1}&rname=${vo.query2}&pageNow=${vo.pageNow+1}">下一页</a></li>
                    </c:if>
                 <%--不允许点击下一页的情况，已经在最后一页--%>
                 <c:if test="${vo.pageNow eq vo.myPages}">
                      <li class="disabled" style="width: 75px;"><a href="#">下一页</a></li>
                 </c:if>
            </ul>
        </div>
    </c:if>


</div>


   <%-- <div class="pageNum">
        <ul>
            <li class="threeword"><a href="#">上一页</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li><a href="#">7</a></li>
            <li><a href="#">8</a></li>
            <li><a href="#">9</a></li>
            <li><a href="#">10</a></li>
            <li class="threeword"><a href="javascript:;">下一页</a></li>
        </ul>
    </div>
</div>--%>
<!--导入底部-->
<div id="footer"></div>
</body>
<script src="resources/js/jquery-1.11.0.min.js"></script>
</html>
