
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=UTF-8"
         isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%= basePath %>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap-clearmin.min.css">
    <link rel="stylesheet" type="text/css" href="../../assets/css/roboto.css">
    <link rel="stylesheet" type="text/css" href="../../assets/css/material-design.css">
    <link rel="stylesheet" type="text/css" href="../../assets/css/small-n-flat.css">
    <link rel="stylesheet" type="text/css" href="../../assets/css/font-awesome.min.css">
    <title>admin主页</title>
</head>
<body class="cm-no-transition cm-1-navbar">
<div id="cm-menu">
    <nav class="cm-navbar cm-navbar-primary">
        <div class="cm-flex"><div class="cm-logo"></div></div>
        <div class="btn btn-primary md-menu-white" data-toggle="cm-menu"></div>
    </nav>
    <div id="cm-menu-content">
        <div id="cm-menu-items-wrapper">
            <div id="cm-menu-scroller">
                <ul class="cm-menu-items">
                    <li class="active"><a href="view/toView.action?vn=userInfo" target="center_body" class="sf-house">Home</a></li>
                    <li><a href="view/toView.action?vn=userInfo" target="center_body" class="sf-dashboard">用户管理</a></li>
                    <li><a href="view/toView.action?vn=filmInfo" target="center_body" class="sf-brick">影库管理</a></li>
                    <li><a href="view/toView.action?vn=platoon" target="center_body" class="sf-notepad">放映安排</a></li>
                    <li><a href="view/toView.action?vn=orderInfo" target="center_body" class="sf-lock-open">订单详情</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<header id="cm-header">
    <nav class="cm-navbar cm-navbar-primary">
        <div class="btn btn-primary md-menu-white hidden-md hidden-lg" data-toggle="cm-menu"></div>
        <div class="cm-flex"><h1>后台/admin管理</h1></div>
    </nav>
</header>
<div id="global">
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-body">

                <iframe id="center_body" name="center_body" src="view/toView.action?vn=userInfo"
                        height="830px" width="100%" frameborder="0" framespacing="0" scrolling="no"></iframe>
            </div>
        </div>
    </div>
    <footer class="cm-footer"><span class="pull-right">&copy; ACME Inc.</span></footer>
</div>
<script src="../../assets/js/lib/jquery-2.1.3.min.js"></script>
<script src="../../assets/js/jquery.mousewheel.min.js"></script>
<script src="../../assets/js/jquery.cookie.min.js"></script>
<script src="../../assets/js/fastclick.min.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/clearmin.min.js"></script>
</body>
</html>