
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
    <title>订单详情</title>
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
订单详情
<hr>
<form class="form-inline" role="form" id="myform">
    <div class="form-group">
        <label class="sr-only" for="oid">编号</label>
        编号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="text" class="form-control" id="oid" name="oid" placeholder="请输入编号">
    </div>
    <div class="form-group">
        <label class="sr-only" for="orderNo">订单编号</label>
        订单编号:  <input type="text" class="form-control" id="orderNo" name="orderNo" placeholder="请输入订单编号">
    </div>
    <div class="form-group">
        <label class="sr-only" for="uId">用户编号</label>
        用户编号:  <input type="text" class="form-control" id="uId" name="uId" placeholder="请输入用户编号">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="pId">排片编号</label>
        排片编号:  <input type="text" class="form-control" id="pId" name="pId" placeholder="请输入排片编号">
    </div>

    <div class="form-group">
        <label class="sr-only" for="seatNo">座位号</label>
        座位号:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="seatNo" name="seatNo" placeholder="请输入密码">
    </div>
    <div class="form-group">
        <label class="sr-only" for="address">地址</label>
        地址:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="address" name="address" placeholder="请输入地址">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="cinemaName">影院名称</label>
        影院名称:  <input type="text" class="form-control" id="cinemaName" name="cinemaName" placeholder="请输入影院名称">
    </div>
    <div class="form-group">
        <label class="sr-only" for="orderDate">下单时间</label>
        下单时间:  <input type="text" class="form-control" id="orderDate" name="orderDate" placeholder="请输入下单时间">
    </div>
    <div class="form-group">
        <label class="sr-only" for="orderPrice">总价</label>
        总价:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="form-control" id="orderPrice" name="orderPrice" placeholder="请输入总价">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="orderStatus">订单状态</label>
        订单状态:  <select class="form-control" id="orderStatus" name="orderStatus">
        <option value="">请选择</option>
        <option value="1">已付款</option>
        <option value="2">完成</option>
        <option value="3">退款</option>
    </select>
    </div><br>

    <br>
    <br>
    <button type="button" class="btn btn-default" id="searchBtn">查询</button>
    <button type="reset" class="btn btn-default" id="resetBtn">重置</button>
</form>
<br>
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
        orderInfoShow();
        $("#searchBtn").click(function () {
            $("#mytable").bootstrapTable("refresh",{
                oid:($("#oid").val()=="" || $("#oid").val()==null)?0:$("#oid").val(),// 额外添加的参数
                orderNo: $("#orderNo").val(),
                uId:($("#uId").val()=="" || $("#uId").val()==null)?0:$("#uId").val(),
                pId:($("#pId").val()=="" || $("#pId").val()==null)?0:$("#pId").val(),
                seatNo: $("#seatNo").val(),
                address: $("#address").val(),
                cinemaName: $("#cinemaName").val(),
                orderStatus: ($("#orderStatus").val()==""||$("#orderStatus").val()==null)?0:$("#orderStatus").val(),
                orderDate: $("#orderDate").val(),
                orderPrice:($("#orderPrice").val()=="" || $("#orderPrice").val()==null)?0:$("#orderPrice").val()
            })
        });
    });
        //列表展示
        function orderInfoShow() {
            var options = {
                url:"order/getPageList.action",//请求后台的路径，获取表格数据的url
                /*cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true*/
                /*striped: true,  //表格显示条纹，默认为false，各行变色*/
                pagination: true, // 在表格底部显示分页组件，默认false
                /*  pageList: [5, 10, 20, 50], // 设置页面可以显示的数据条数*/
                pageSize: 2, // 页面数据条数
                pageNumber: 1, // 首页页码
                sidePagination: 'server', // 设置为服务器端分页

                columns: [
                    {
                        field: 'oid', // 返回json数据中的name
                        title: ' 编号',// 表格表头显示文字
                        align: 'center', // 左右居中
                        valign: 'middle' // 上下居中
                    },

                    {
                        field: 'orderNo', // 返回json数据中的name
                        title: ' 订单编号',// 表格表头显示文字
                        align: 'center', // 左右居中
                        valign: 'middle' // 上下居中
                    }, {
                        field: 'uId',
                        title: '用户编号',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'pId',
                        title: '排片编号',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'seatNo',
                        title: '座位号',
                        align: 'center',
                        valign: 'middle'
                    },{
                        field: 'address',
                        title: '地址',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'cinemaName',
                        title: '影院名',
                        align: 'center',
                        valign: 'middle'
                    },{
                        field: 'orderStatus',
                        title: '订单状态',
                        align: 'center',
                        valign: 'middle'
                    },{
                        field: 'orderDate',
                        title: '下单时间',
                        align: 'center',
                        valign: 'middle'
                    },{
                        field: 'orderPrice',
                        title: '总价',
                        align: 'center',
                        valign: 'middle'
                    }

                ],
                queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                    return {
                        limit: params.limit, // 每页要显示的数据条数
                        offset: params.offset, // 每页显示数据的开始行号
                        oid:($("#oid").val()=="" || $("#oid").val()==null)?0:$("#oid").val(),// 额外添加的参数
                        orderNo: $("#orderNo").val(),
                        uId:($("#uId").val()=="" || $("#uId").val()==null)?0:$("#uId").val(),
                        pId:($("#pId").val()=="" || $("#pId").val()==null)?0:$("#pId").val(),
                        seatNo: $("#seatNo").val(),
                        address: $("#address").val(),
                        cinemaName: $("#cinemaName").val(),
                        orderStatus: ($("#orderStatus").val()==""||$("#orderStatus").val()==null)?0:$("#orderStatus").val(),
                        orderDate: $("#orderDate").val(),
                        orderPrice:($("#orderPrice").val()=="" || $("#orderPrice").val()==null)?0:$("#orderPrice").val()

                    }
                }
            };
            //初始化表格
            $("#mytable").bootstrapTable(options);
        }


</script>

</body>
</html>
