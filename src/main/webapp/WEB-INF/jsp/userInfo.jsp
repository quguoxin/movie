
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
    <title>default page</title>
    <!--bootstrap-->
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!--bootstrap-table css库-->
    <link href="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <!--HTML5 shim 和 Respond.js是为了让IE8支持HTML5元素和媒体查询功能-->
    <!--警告：通过file://协议（就是这样讲html页面拖拽到浏览器中）访问页面时Respond.js不起作用-->
    <!--[if lt IE 9]-->
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <!--[end if]-->
</head>
<body>
用户管理
<hr>
<form class="form-inline" role="form" id="myform">
    <div class="form-group">
        <label class="sr-only" for="uId">编号</label>
        编号:  <input type="text" class="form-control" id="uId" name="uId" value="0">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="userName">名称</label>
        名称:  <input type="text" class="form-control" id="userName" name="userName" value="请输入姓名">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="phone">电话号码</label>
        电话:  <input type="text" class="form-control" id="phone" name="phone" value="请输入电话号码">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="birthday">生日</label>
        生日:  <input type="text" class="form-control" id="birthday" name="birthday" value="请输入生日日期">
    </div><br>

    <div class="form-group">
        <label class="sr-only" for="password">密码</label>
        密码:  <input type="text" class="form-control" id="password" name="password" value="请输入密码">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="sex">性别</label>
        性别:  <select class="form-control" id="sex" name="sex">
            <option value="0">请选择</option>
            <option value="1">男</option>
            <option value="2">女</option>
        </select>
    </div>
    <br>
    <br>
    <button type="button" class="btn btn-default" id="searchBtn">查询</button>
    <button type="reset" class="btn btn-default" id="resetBtn">重置</button>
</form>
<br>
<button type="button" class="btn btn-default" id="addBtn">增加用户</button>
<button type="button" class="btn btn-default" id="updateBtn">修改用户</button>
<button type="button" class="btn btn-default" id="deleteBtn">删除用户</button>


<br>
<table id="mytable"></table>

<!-- jQuery-->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- 加载Bootstrap的所有JavaScript插件，可根据需要只加载单个插件-->
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!--bootstrap-table插件-->
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script>
    $(function () {

        //初始化参数
        userInfoShow();
        $("#searchBtn").click(function () {
            $("#mytable").bootstrapTable("refresh",{
                uId:($("#uId").val()=="" || $("#uId").val()==null)?0:$("#uId").val(),
                userName: $("#userName").val(),
                phone: $("#phone").val(),
                sex: ($("#sex").val()==""||$("#sex").val()==null)?0:$("#sex").val(),
                birthday: $("#birthday").val(),
                password:$("#password").val()
            })
        });
        //调用封装的方法
        addUser();
        updateUser();
        delUser();
        });


        //增加
        function addUser() {
            $("#addBtn").click(function () {
                //初始化参数
                userInfoShow();
                $.getJSON("user/getAddUser.action",$("#myform").serialize(),function (res) {
                    if(res.code==200){

                        $("#modal-body-info").html(res.msg);
                        $("#myModal").modal('show');
                        $("#mytable").bootstrapTable('refresh')
                    }
                })
            })
        }
        //修改
        function updateUser() {
            $("#updateBtn").click(function () {
                //初始化参数
                userInfoShow();
                $.getJSON("user/getUpdateUser.action",$("#myform").serialize(),function (res) {
                    if(res.code==200){

                        $("#modal-body-info").html(res.msg);
                        $("#myModal").modal('show');
                        $("#mytable").bootstrapTable('refresh')
                    }
                })
            })
}
        //删除
        function delUser() {
            $("#deleteBtn").click(function () {
                //初始化参数
                userInfoShow();
                $.getJSON("user/getDeleteUser.action",$("#myform").serialize(),function (res) {
                    if(res.code==200){
                        $("#modal-body-info").html(res.msg);
                        $("#myModal").modal('show');
                        $("#mytable").bootstrapTable('refresh');
                    }
                })
            })
    }
       //列表展示
        function userInfoShow() {
            var options = {
                url:"user/getPageList.action",//请求后台的路径，获取表格数据的url
                /*cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true*/
                /*striped: true,  //表格显示条纹，默认为false，各行变色*/
                pagination: true, // 在表格底部显示分页组件，默认false
                /*  pageList: [5, 10, 20, 50], // 设置页面可以显示的数据条数*/
                pageSize: 2, // 页面数据条数
                pageNumber: 1, // 首页页码
                sidePagination: 'server', // 设置为服务器端分页

                columns: [
                    /*{
                        checkbox: true, // 显示一个勾选框
                        align: 'center' // 居中显示
                    },*/{
                        field: 'uId', // 返回json数据中的name
                        title: ' 编号',// 表格表头显示文字
                        align: 'center', // 左右居中
                        valign: 'middle' // 上下居中
                    },

                    {
                        field: 'userName', // 返回json数据中的name
                        title: ' 用户名',// 表格表头显示文字
                        align: 'center', // 左右居中
                        valign: 'middle' // 上下居中
                    }, {
                        field: 'phone',
                        title: '电话号码',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'birthday',
                        title: '生日',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'sex',
                        title: '性别',
                        align: 'center',
                        valign: 'middle'
                    },{
                        field: 'password',
                        title: '密码',
                        align: 'center',
                        valign: 'middle'
                    },{
                        title: '操作',
                        align: 'center',
                        valign: 'middle',
                     /*   formatter:function (value,row,index) {
                            var str='<a href="view/toView.action?vn=userInfo&uId='+row.uId+'" >修改</a>&nbsp;|&nbsp;<a href="javascript:void(0)"  onclick="del(\''+ row.uId +'\')">删除</a>';
                            return str;

                        }*/
                    }
                ],
                queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                    return {
                        limit: params.limit, // 每页要显示的数据条数
                        offset: params.offset, // 每页显示数据的开始行号
                        uId:($("#uId").val()=="" || $("#uId").val()==null)?0:$("#uId").val(),// 额外添加的参数
                        userName: $("#userName").val(),
                        phone: $("#phone").val(),
                        sex: ($("#sex").val()==""||$("#sex").val()==null)?0:$("#sex").val(),
                        birthday: $("#birthday").val(),
                        password:$("#password").val()

                    }
                }
            };
            //初始化表格
            $("#mytable").bootstrapTable(options);
        }





</script>
<!-- 模态框（Modal） -->
<div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">用户信息</h4>
            </div>
            <div class="modal-body" id="modal-body-info">

            </div>
            <div class="modal-footer">
                <%-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                 <button type="button" class="btn btn-primary">提交更改</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
