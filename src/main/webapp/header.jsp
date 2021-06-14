<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 头部条 -->
<div class="container">
    <div class="row">
        <div class="login" style="float: right;height:26px">
        <span id="span_username">欢迎 ${uname} <font color="red">${status}</font>

        </span>
            <a href="#" class="collection">我的收藏</a>
            <a href="user?method=loginout">退出</a>
        </div>
    </div>
</div>

<!-- 导航栏 -->
<div class="container" style="margin-top: 10px;">
    <div class="row">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="collapse navbar-collapse" id="menu">
                <!-- 菜单栏 -->
                <ul class="nav navbar-nav" id="categories">
                    <li class="active"><a href="${pageContext.request.contextPath}/product?method=index">首页</a></li>
                </ul>
                <form class="navbar-form navbar-right" role="search" method="post" action="${pageContext.request.contextPath}/product?method=findProducts&cid=${vo.query1}">
                    <div class="form-group">
                        <c:if test="${vo ne null}">
                            <input type="text" class="form-control" placeholder="Search" id="rname"  name="rname" value="${vo.query2}">
                        </c:if>
                        <c:if test="${vo eq null}">
                            <input type="text" class="form-control" placeholder="Search" id="rname"  name="rname" value="${rname}">
                        </c:if>
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </nav>
    </div>
</div>

<script src="resources/js/jquery-1.11.0.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script>
    // console.log(111);
    $.ajax({
        type:"get",
        url:"${pageContext.request.contextPath}/category?method=findAllCategories",
        dataType:"json",
        success:function (list) {
            console.log(list);
            for(var i in list){
                var $li = "<li><a href='${pageContext.request.contextPath}/product?method=findProducts&cid="+list[i].cid+"'>"+list[i].cname+"</a></li>";
                $("#categories").append($li);
            }
        }
    })
</script>
