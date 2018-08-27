<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/5
  Time: 15:03
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
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后！-->
    <title>default page</title>

    <!--bootstrap-->
    <link href="assets/css/bootstrap-clearmin.min.css" rel="stylesheet">
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

<form role="form" method="post" id="platoonForm"><a href="/"></a>
    <div class="form-group" >
        <label for="pId">排片编号</label>
        <input type="text" class="form-control" id="pId" name="pId" placeholder="请输入排片编号" >
    </div>
    <div class="form-group">
        <label for="hallNo">影厅厅号</label>
        <input type="text" class="form-control" id="hallNo" name="hallNo" <%--placeholder="请输入厅号"--%> value="0">
    </div>
    <div class="form-group">
        <label for="fId" >电影编号</label>
        <input type="text" class="form-control" id="fId" name="fId" <%--placeholder="请输入电影编号" --%>value="0">
    </div>
    <div class="form-group">
        <label for="playDate">放映日期</label>
        <input type="text" class="form-control" id="playDate" name="playDate" <%--placeholder="请输入放映日期"--%> value="请输入放映日期">
    </div>
    <div class="form-group">
        <label for="piayTime">放映时间</label>
        <input type="text" class="form-control" id="piayTime" name="piayTime" <%--placeholder="请输入放映时间"--%> value="请输入放映时间">
    </div>
    <button type="button" class="btn btn-default" id="searchBtn">影片查询</button>
    <button type="button" class="btn btn-default" id="addBtn">影片上线</button>
    <button type="button" class="btn btn-default" id="delBtn">影片下线</button><span >(请输入需要下线的影片编号)</span>
    <button type="button" class="btn btn-default" id="updateBtn">影片更新</button>
<table id="platoonTable"></table>

<!-- jQuery(Bootstrap的所有JavaScript插件都依赖jQuery，所以必须放在前面)-->
<script src="assets/js/lib/jquery-2.1.3.min.js"></script>
<!-- 加载Bootstrap的所有JavaScript插件，可根据需要只加载单个插件-->
<script src="assets/js/bootstrap.min.js"></script>
<script src=""></script>
<!--bootstrap-table插件-->
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script>
    $(function () {
        //loadTable();
        searchAllPla();
        addPla();
        updatePlatoon();
        delPla();
        /*$("#addBtn").click(function () {
            $.getJSON("platoon/add.action",$("#platoonForm").serialize(),function (res) {
                if(res.code=200){
                    $("#myModal .modal-body").html("<span style='color: green'>"+res.msg);
                }else{
                    $("#myModal .modal-body").html("<span style='color: red'>"+res.msg);
                }
                $("#myModal").modal('show');
            })
        })*/
    });
    //加载表格
    function loadTable() {
        //初始化参数
        var options = {
            url:"platoon/getPageList.action",//请求后台的路径，获取表格数据的url
            cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
            striped: true,  //表格显示条纹，默认为false，各行变色
            pagination: true, // 在表格底部显示分页组件，默认false
            pageList: [5, 10, 20, 50], // 设置页面可以显示的数据条数
            pageSize: 2, // 页面数据条数
            pageNumber: 1, // 首页页码
            sidePagination: 'server', // 设置为服务器端分页

            columns: [
                       /* {
                   checkbox: true, // 显示一个勾选框
                     align: 'center' // 居中显示
                },*/
                {
                    field: 'pId', // 返回json数据中的name
                    title: '排片编号', // 表格表头显示文字
                    align: 'center', // 左右居中
                    valign: 'middle' // 上下居中
                }, {
                    field: 'hallNo',
                    title: '影厅厅号',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'fId',
                    title: '电影编号',
                    align: 'center',
                    valign: 'middle'
                }, {
                    field: 'playDate',
                    title: '放映日期',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'piayTime',
                    title: '放映时间',
                    align: 'center',
                    valign: 'middle'
                }
                ],
            /*formatter:function (value,row,index) {
                var str='<a id="opteration" href="voteshow.action?choiceid='+row.id+'">进行投票</a>&nbsp;&nbsp;<a href="votetongji.jsp?cid='+row.id+'">查看详情</a>';
                return str;

            }*/


            queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                return {
                    limit: params.limit, // 每页要显示的数据条数
                    offset: params.offset, // 每页显示数据的开始行号
                    //sort: params.sort, // 要排序的字段
                    //sortOrder: params.order, // 排序规则
                    pId: ($("#pId").val()==""||$("#pId").val()==null)?0:$("#pId").val(),// 额外添加的参数
                    hallNo:($("#pId").val()==""||$("#pId").val()==null)?0:$("#hallNo").val(),
                    fId:($("#pId").val()==""||$("#pId").val()==null)?0:$("#fId").val(),
                    playDate:$("#playDate").val(),
                    piayTime:$("#piayTime").val()
                }
            }
        };
        //初始化表格
        $("#platoonTable").bootstrapTable(options);
    }
    //添加
    function addPla() {
        loadTable();
        $("#addBtn").click(function () {
            $.getJSON("platoon/add.action",$("#platoonForm").serialize(),function (res) {
                if(res.code=200){
                    $("#myModal .modal-body").html("<span style='color: green'>"+res.msg);
                }else{
                    $("#myModal .modal-body").html("<span style='color: red'>"+res.msg);
                }
                $("#myModal").modal('show');
            })
        })
    }
    function searchAllPla() {
        loadTable();
        $("#searchBtn").click(function () {
            $("#platoonTable").bootstrapTable("refresh",{
                pId: ($("#pId").val()==""||$("#pId").val()==null)?0:$("#pId").val(),// 额外添加的参数
                hallNo:($("#pId").val()==""||$("#pId").val()==null)?0:$("#hallNo").val(),
                fId:($("#pId").val()==""||$("#pId").val()==null)?0:$("#fId").val(),
                playDate:$("#playDate").val(),
                piayTime:$("#piayTime").val()

            });
        });
    }
    //更新

    function updatePlatoon() {
        loadTable();
        $("#updateBtn").click(function () {
            $.getJSON("platoon/updatePlatoon.action",$("#platoonForm").serialize(),function (res) {
                if(res.code=200){
                    $("#myModal .modal-body").html("<span style='color: green'>"+res.msg);
                }else{
                    $("#myModal .modal-body").html("<span style='color: red'>"+res.msg);
                }
                $("#myModal").modal('show');
            })
        })

    }
    //删除
    function delPla() {
        loadTable();
        $("#delBtn").click(function () {
            $.getJSON("platoon/delPlatoon.action",$("#platoonForm").serialize(),function (res) {
                if(res.code=200){
                    $("#myModal .modal-body").html("<span style='color: green'>"+res.msg);
                }else{
                    $("#myModal .modal-body").html("<span style='color: red'>"+res.msg);
                }
                $("#myModal").modal('show');
            })
        })
    }

</script>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">
                <%--在这里添加一些文本--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary">提交更改</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>