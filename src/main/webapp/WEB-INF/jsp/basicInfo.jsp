<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/23
  Time: 11:23
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
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-clearmin.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/roboto.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <title>基本信息</title>
    <style type="text/css" rel="stylesheet">
        .btdright{
            height: 50px;
            width: 300px;
        }
        .input{
            height: 30px;
            width: 300px;
            margin-right: 220px;
        }
        .button{
            height: 40px;
            width: 300px;
            font-size: 20px;
            background-color: red;
            color: white;
            border: 0px;
        }
        .img{
            height: 260px;
            width: 260px;
            background-image:url("../../imgs/movie/touxiang.png");
            background-repeat: no-repeat;
            background-size: 260px 260px;
            margin: 0px 30px;
        }
        .divfile{
            width: 260px;
            background-color: silver;
            margin-top: 10px;
            margin: 20px 30px;
        }
        .divinput{
            height: 25px;
            width: 260px;
            background-color: silver;
            margin: 0px 30px;
            border: 0px;
        }
    </style>
</head>
<body style="background-color: white">
<div style="width: 963px;height: 500px;margin: 0px auto;border: 1px silver solid;background-color: white">

<div style="color: red;font-size: 25px;height: 80px;margin-top: 15px;text-indent: 40px">基本信息
    <hr style="width: 95.5%;margin-right: 0px;size: 1px">
</div>

<div id="tableShow">
    <%--图片--%>
    <form id="fileForm" enctype="multipart/form-data" method="post" action="upload/upload.action">
     <div style="width: 360px;height: 500px;float: left">
         <div class="img"><img src="imgs/movie/${fileName1}" width="260px" height="260px"> </div>
         <div class="divfile">
             <input type="file" id="fileUpload" name="file">
         </div>
         <input class="divinput" type="submit"  value="更换头像">
     </div>
    </form>
    <form id="fromSeri" method="post" action="#">
     <div style="width: 600px;height: 500px;float: right">
         <table style="height: auto;width: 600px" align="left">
             <tr>
                 <td>昵称：</td>
                 <td class="btdright"><input class="input" type="text" name="userName" placeholder="2-15个字，支持中英文、数字"></td>
             </tr>
             <tr>
                 <td>性别：</td>
                 <td class="btdright"><input type="radio" name="sex" value="1">男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="2">女</td>
             </tr>
             <tr>
                 <td>生日：</td>
                 <td class="btdright"><input class="input" name="birthday" type="date" ></td>
             </tr>
             <tr>
                 <td></td>
                 <td class="btdright"><button class="button" type="button" id="save">保存</button></td>
             </tr>
         </table>
     </div>
    </form>
</div>

</div>
</body>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/myJsUtil.js"></script>
<!-- 加载Bootstrap的所有JavaScript插件，可根据需要只加载单个插件-->
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<!--bootstrap-table插件-->
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>

<script>
    $(function () {
        /*$.getJSON("user/findUserInfoByUid.action",{"uId":5},function (res) {
           if(res.code==200){
               var list=res.data;
               var tmp='';
               for (var i=0;i<list.length;i++){
                   var obj=list[i];
                   tmp+='<div style="width: 330px;height: 300px;float: left">';
                   tmp+='<div class="img"><img src="imgs/movie/'+obj.portrait+'.png" width="260px" height="260px"></div>';
                   tmp+='<div class="divfile"><input type="button"  value="更换头像"><input type="file" id="fileUpload" name="file"></div></div>';
                   tmp+='<div style="width: 600px;height: 300px;float: right">';
                   tmp+='<table style="height: auto;width: 600px" align="left"><tr>';
                   tmp+='<td>昵称：</td><td class="btdright"><input class="input" type="text" name="userName" placeholder="2-15个字，支持中英文、数字"></td></tr>';
                   tmp+='<tr><td>性别：</td><td class="btdright"><input type="radio" name="sex">男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex">女</td></tr>';
                   tmp+='<tr><td>生日：</td><td class="btdright"><input class="input" name="birthday" type="date" ></td></tr>';
                   tmp+='<tr><td></td><td class="btdright"><button class="button" type="button" id="save">保存</button></td></tr></table></div>';
               }
               $("#tableShow").html(tmp);
           }
        })*/
        $("#save").click(function () {
            $.getJSON("user/updateUserInfoByUid.action",$("#fromSeri").serialize(),function (res) {
                if(res.code==200){
                    $("#myModal .modal-body").html("<span style='color: green'>"+res.msg+"</sapn>");

                }else {
                    $("#myModal .modal-body").html("<span style='color: red'>"+res.msg+"</sapn>");

                }
                $("#myModal").modal("show");

            });
        });
    })
</script>
<div class="modal fade" id="myModal" TABINDEX="-1" ROLE="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>
</html>