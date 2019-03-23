<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/23
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=UTF-8"
         isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%= basePath %>"/>
    <title>个人中心</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body>
<div style="width: 1170px;margin: auto">
    <%--导航栏--%>
    <div style="float: left;width: 200px;height:500px;background-color: #F3F2F3">
        <dl style="text-align: center">
            <dd style="height: 100px;font-size: 30px;line-height: 90px;">个人中心</dd>
            <dd id="myOrder" style="height: 50px;font-size: 25px;line-height: 50px;"><a style="text-decoration: none;color: black" href="view/toView.action?vn=myOrder" target="change2">我的订单</a></dd>
            <dd id="myInfo" style="height: 50px;font-size: 25px;line-height: 40px;"><a style="text-decoration: none;color: black" href="view/toView.action?vn=basicInfo" target="change2">基本资料</a></dd>
        </dl>
    </div>
    <%--变动框--%>
    <div style="float: left;border: 1px #F3F2F3 solid;width: 960px;">
        <iframe name="change2" src="view/toView.action?vn=myOrder" width="100%"  height="1000px" frameborder="0" framespacing="0" scrolling="no"></iframe>
    </div>
</div>


<script src="js/jquery-1.11.1.min.js"></script>
<script>
    $(function () {
        $("#myOrder").click(function () {
            $(this).css("background-color","#EC3931");
            $(this).siblings().css("background-color","#F3F2F3");
        })

        $("#myInfo").click(function () {
            $(this).css("background-color","#EC3931");
            $(this).siblings().css("background-color","#F3F2F3");
        })
    })
</script>
</body>
</html>