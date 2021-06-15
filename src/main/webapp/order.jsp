<%--
  Created by IntelliJ IDEA.
  User: 92828
  Date: 2021/6/15
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>结算界面</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" />
    <script src="resources/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="resources/css/style.css" type="text/css" />
    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
    </style>
</head>

<body>
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div style="margin: 0 auto; margin-top: 10px; width: 950px;">
            <strong>订单详情</strong>
            <table class="table table-bordered">
                <tbody>
                <tr class="warning">
                    <th colspan="5">订单编号:${orders.oid}</th>
                </tr>
                <tr class="warning">
                    <th>图片</th>
                    <th>地点</th>
                    <th>价格</th>
                    <th>实际支付</th>
                </tr>
                <c:forEach items="${sessionScope.orders.list}" var="item">
                    <tr class="active">
                        <td width="60" width="40%"><input type="hidden" name="id" value="${item.itemid}">
                            <img src="${item.product.rimage}" width="70" height="60"></td>
                        <td width="30%"><a target="_blank">${item.product.rname}</a></td>
                        <td width="20%">￥${item.product.price}</td>
                        <td width="15%"><span class="subtotal">￥${item.subtotal}</span></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div style="text-align: right; margin-right: 120px;">
            商品金额: <strong style="color: #ff6600;">￥${sessionScope.orders.total}</strong>
        </div>

    </div>

    <div>
        <hr />
        <form class="form-horizontal" id="orderForm" style="margin-top: 5px; margin-left: -5px;" action="/orders?method=confirmOrders">
            <div class="form-group">
                <label for="name" class="col-sm-1 control-label">姓名</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="name" name="name"
                           placeholder="请输用户真实姓名" value="${sessionScope.user.name}">
                </div>
            </div>
            <div class="form-group">
                <label for="telephone" class="col-sm-1 control-label">电话</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="telephone" name="phone"
                           placeholder="请输入联系方式" value="${sessionScope.user.phone}">
                </div>
            </div>


            <hr />

            <div style="margin-top: 5px; margin-left: 30px;">
                <strong>选择银行：</strong>
                <p>
                    <br />
                    <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"
                           checked="checked" />工商银行 <img src="resources/images/icbc.bmp"
                                                         align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行
                    <img src="resources/images/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行
                    <img src="resources/images/abc.bmp" align="middle" />
                    <br />
                    <br />
                    <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行
                    <img src="resources/images/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
                    <img src="resources/images/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行
                    <img src="resources/images/ccb.bmp" align="middle" />
                    <br />
                    <br />
                    <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行
                    <img src="resources/images/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
                    <img src="resources/images/cmb.bmp" align="middle" />
                    <input type="radio" name="pd_FrpId" value="alipay" />支付宝
                    <img src="resources/images/cmb.bmp" align="middle" />
                </p>
                <hr />
                <p style="text-align: right; margin-right: 100px;">
                    <a href="javascript:document.getElementById('orderForm').submit();">
                        <img src="" width="204" height="51"
                             border="0" alter="确认订单"/>
                    </a>

                </p>
                <hr />
            </div>
        </form>
    </div>

</div>
</body>
</html>
