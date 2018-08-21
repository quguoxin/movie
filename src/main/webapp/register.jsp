<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/20
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=UTF-8"
         isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-clearmin.min.css">
    <%--<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css">--%>
    <link rel="stylesheet" type="text/css" href="assets/css/roboto.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <base href="<%= basePath %>"/>
    <title>注册页面</title>
    <style></style>
</head>
<body class="cm-login">

<div class="text-center" style="padding:90px 0 30px 0;background:#fff;border-bottom:1px solid #ddd">
    <img src="assets/img/logo-big.svg" width="300" height="45">
</div>

<div class="col-sm-6 col-md-4 col-lg-3" style="margin:40px auto; float:none;">
    <form method="post" action="#" id="regForm">
        <div class="col-xs-12">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-fw fa-user"></i></div>
                    <input type="text" name="username" class="form-control" placeholder="用户名">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-fw fa-lock"></i></div>
                    <input type="password" name="password" class="form-control" placeholder="密码">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-fw fa-lock"></i></div>
                    <input type="password" name="repassword" class="form-control" placeholder="确认密码">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-fw fa-lock"></i></div>
                    <input type="text" name="phone" id="phone" class="form-control" placeholder="手机号码">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group" >
                    <button type="button" class="btn btn-block btn-primary"
                            style="width: 300px" id="sendSms">发送短信验证码</button>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-fw fa-lock"></i></div>
                    <input type="number" name="smsNumber" class="form-control" placeholder="请输入短信验证码">
                </div>
            </div>
        </div>
        <div class="col-xs-6" >
        <button id="reg" type="button" class="btn btn-block btn-primary" style="width: 300px">注册</button>
        </div>
    </form>
</div>
</body>
<%--<script src="js/jquery-1.11.1.min.js"></script>--%>
<script src="assets/js/lib/jquery-2.1.3.min.js"></script>
<script>
  $(function () {
      //发送短信
   $("#sendSms").click(function () {
       $.getJSON("user/sendsms.action",{"phone":$("#phone").val()},function (res) {
           if (res.code==200){
               var num=60;
               var timer=window.setInterval(function () {
                   if (num<=0){
                       window.clearInterval(timer);
                       $("#sendSms").html("发送短信验证码");
                       return;
                   }
                   $("#sendSms").html(num--);
               },1000);
           }
       });
   });
   $("#reg").click(function () {
       $.getJSON("",$("#regForm").serialize()  ,function (res) {
        if(res.code==200){
           $("#myModal .modal-body").html("<span style='color: green'>"+res.msg()+"</sapn>");

        }else {
            $("#myModal .modal-body").html("<span style='color: red'>"+res.msg()+"</sapn>");
        }
           $("#myModal").modal("show");
       })
   })
  });
</script>
<%--<div class="modal-fade" id="myModal" TABINDEX="-1" ROLE="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="myModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>--%>
</html>
