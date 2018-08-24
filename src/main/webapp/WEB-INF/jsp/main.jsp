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
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width-device-width,initial-scale=1">
    <title>爱看不看-主页</title>
    <!--bootstrap-->
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!--bootstrap-table css库-->
    <link href="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <!--HTML5 shim 和 Respond.js是为了让IE8支持HTML5元素和媒体查询功能-->
    <!--警告：通过file://协议（就是这样讲html页面拖拽到浏览器中）访问页面时Respond.js不起作用-->
    <!--[if lt IE 9]-->
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<div>
    <%--导航栏--%>
    <div  style="width: 1349px;height: 80px;clear: both" >
        <div style="width: 700px;float: left;margin-left: 50px">
            <ul class="nav nav-pills nav-justified">
                <li><img style="width: 70px;height: 70px;border-radius: 100%" src="../../imgs/main/20180820202429.png"><font color="red" size="5"><strong>在线影院</strong></font></li>
                <li><a href="view/toView.action?vn=homePage" target="change" style="color: black"><font size="5"><strong>首 页</strong></font></a></li>
                <li><a href="view/toView.action?vn=allMovies" target="change" style="color: black"><font size="5"><strong>电 影</strong></font></a></li>
                <li><a href="view/toView.action?vn=hotplay" target="change" style="color: black"><font size="5"><strong>榜 单</strong></font></a></li>
            </ul>
        </div>
        <div style="width: 300px;float: left;margin-top: 20px;margin-left: 50px">
            <form class="bs-example bs-example-form" role="form">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="input-group">
                            <input id="findFilm" style="width: 200px" type="text" placeholder="请输入电影名！" class="form-control">
                            <span class="input-group-btn">
                        <button id="gogogo" class="btn btn-default" type="button">Go!</button>
                    </span>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div style="width: 100px;float: left;" class="dropdown">
            <button style="background-color: white" type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                <img style="width: 70px;height: 70px;border-radius: 100%" src="imgs/main/22222222222222222222222222.png">
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                <li role="presentation">
                    <a role="menuitem" tabindex="-1" href="view/toView.action?vn=personalCenter" target="change">我的订单</a>
                </li>
                <li role="presentation">
                    <a role="menuitem" tabindex="-1" href="view/toView.action?vn=personalCenter" target="change">基本信息</a>
                </li>
                <li role="presentation">
                    <a role="menuitem" tabindex="-1" href="login_user.jsp">退出登录</a>
                </li>
            </ul>
        </div>
    </div>

    <%--跳转部分--%>
    <div>
        <iframe name="change" src="view/toView.action?vn=homePage" width="100%" height="2000px" frameborder="0" framespacing="0" scrolling="no"></iframe>
    </div>
    <%--尾部--%>
    <div style="text-align: center;background-color: #252325;color: #656565">
        <br><br><br>
        商务合作邮箱：v@maoyan.com 客服电话：10105335 违法和不良信息举报电话：4006018900<br>
        投诉举报邮箱：tousujubao@meituan.com 舞弊线索举报邮箱：wubijubao@maoyan.com<br>

        友情链接 : <a style="color: red" href="http://www.meituan.com" data-query="utm_source=wwwmaoyan" target="_blank">美团网</a>
        &nbsp;|&nbsp;<a style="color: red" href="http://i.meituan.com/client" data-query="utm_source=wwwmaoyan" target="_blank">美团下载</a><br>

        ©2016 猫眼电影 maoyan.com 京ICP证160733号 京ICP备16022489号-1 京公网安备 11010102003232号 网络文化经营许可证 电子公告服务规则<br>

        北京猫眼文化传媒有限公司<br><br><br><br><br>
    </div>
</div>
<!-- jQuery(Bootstrap的所有JavaScript插件都依赖jQuery，所以必须放在前面)-->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- 加载Bootstrap的所有JavaScript插件，可根据需要只加载单个插件-->
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<!--bootstrap-table插件-->
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>

<script>
    /*$(function () {
        $("#gogogo").click(function () {
            var fileName= $("#findFilm").val();
            $.getJSON("",{"fileName":fileName},function (res) {

            })
        })
    })*/
</script>
</body>
</html>