<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 头部条 -->
<div class="container">
    <div class="row">
        <div class="login" style="float: right;height:26px">
        <span id="span_username">欢迎 ${uname} <font color="red">${status}</font>

        </span>
            <a href="#" class="collection">我的收藏</a>
            <a href="user?code=logout">退出</a>
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
                    <li class="active"><a href="#">首页</a></li>
                </ul>
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
                var $li = "<li><a href='#'>"+list[i].cname+"</a></li>";
                $("#categories").append($li);
            }
        }
    })
</script>


<%--<!-- 登录 注册 购物车... -->--%>
<%--<div class="container-fluid">--%>
<%--    <div class="col-md-3" style="padding-top:20px">--%>
<%--        <ol class="list-inline">--%>
<%--            <li><a href="#">登录</a></li>--%>
<%--            <li><a href="#">注册</a></li>--%>
<%--            <li><a href="#">购物车</a></li>--%>
<%--            <li><a href="#">我的收藏</a></li>--%>
<%--        </ol>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- 导航条 -->--%>
<%--<div class="container-fluid">--%>
<%--    <nav class="navbar navbar-inverse">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="navbar-header">--%>
<%--                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">--%>
<%--                    <span class="sr-only">Toggle navigation</span>--%>
<%--                    <span class="icon-bar"></span>--%>
<%--                    <span class="icon-bar"></span>--%>
<%--                    <span class="icon-bar"></span>--%>
<%--                </button>--%>
<%--                <a class="navbar-brand" href="#">首页</a>--%>
<%--            </div>--%>

<%--            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
<%--                <ul class="nav navbar-nav">--%>
<%--                    <li class="active"><a href="#">手机数码<span class="sr-only">(current)</span></a></li>--%>
<%--                    <li><a href="#">电脑办公</a></li>--%>
<%--                    <li><a href="#">电脑办公</a></li>--%>
<%--                    <li><a href="#">电脑办公</a></li>--%>
<%--                </ul>--%>
<%--                <form class="navbar-form navbar-right" role="search">--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="text" class="form-control" placeholder="Search">--%>
<%--                    </div>--%>
<%--                    <button type="submit" class="btn btn-default">Submit</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</div>--%>
