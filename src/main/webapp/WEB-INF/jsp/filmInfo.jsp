
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
影库管理
<hr>
<form class="form-inline" role="form" id="myform">
    <div class="form-group">
        <label class="sr-only" for="fId">电影编号</label>
        电影编号:  <input type="text" class="form-control" id="fId" name="fId" value="0">
    </div>
    <div class="form-group">
        <label class="sr-only" for="fileName">电影名称</label>
        电影名称:  <input type="text" class="form-control" id="fileName" name="fileName" value="请输入电影名称">
    </div>
    <div class="form-group">
        <label class="sr-only" for="fileTime">电影时长</label>
        电影时长:  <input type="text" class="form-control" id="fileTime" name="fileTime" value="0">
    </div>
    <div class="form-group">
        <label class="sr-only" for="scores">电影评分</label>
        电影评分:  <input type="text" class="form-control" id="scores" name="scores" value="0">
    </div><br>

    <div class="form-group">
        <label class="sr-only" for="releaseDate">上映日期</label>
        上映日期:  <input type="text" class="form-control" id="releaseDate" name="releaseDate" value="请输入上映日期">
    </div>
    <div class="form-group">
        <label class="sr-only" for="fileSynopsis">电影简介</label>
        电影简介:  <input type="text" class="form-control" id="fileSynopsis" name="fileSynopsis" value="请输入电影简介">
    </div>
    <div class="form-group">
        <label class="sr-only" for="filePoster">海报地址</label>
        海报地址:  <input type="text" class="form-control" id="filePoster" name="filePoster" value="请输入海报地址">
    </div>
    <div class="form-group">
        <label class="sr-only" for="fileArea">制作地区</label>
        制作地区:  <input type="text" class="form-control" id="fileArea" name="fileArea" value="0">
    </div><br>
    <div class="form-group">
        <label class="sr-only" for="fileActorList">演员</label>
        参演演员:  <input type="text" class="form-control" id="fileActorList" name="fileActorList" value="请输入演员">
    </div>
    <div class="form-group">
        <label class="sr-only" for="filePrice">价格</label>
        电影票价:  <input type="text" class="form-control" id="filePrice" name="filePrice" value="0">
    </div>
    <div class="form-group">
        <label class="sr-only" for="fileTypeList">电影类型</label>
        电影类型:  <select class="form-control" id="fileTypeList" name="fileTypeList">
            <option value="0">请选择电影类型</option>
            <option value="1">喜剧</option>
            <option value="2">恐怖</option>
            <option value="3">动作</option>
            <option value="4">剧情</option>
            <option value="5">科幻</option>
            <option value="6">其他</option>
        </select>
    </div>
    <br>
    <br>
    <button type="button" class="btn btn-default" id="searchBtn">查询</button>
    <button type="reset" class="btn btn-default" id="resetBtn">重置</button>
</form>
<br>
<button type="button" class="btn btn-default" id="addBtn">添加影片</button>
<button type="button" class="btn btn-default" id="updateBtn">修改影片</button>
<button type="button" class="btn btn-default" id="deleteBtn">删除影片</button>


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
        filmShow();
        $("#searchBtn").click(function () {
            $("#mytable").bootstrapTable("refresh",{
                fId:($("#fId").val()=="" || $("#fId").val()==null)?0:$("#fId").val(),// 额外添加的参数
                fileName: $("#fileName").val(),
                fileTypeList: $("#fileTypeList").val(),
                fileTime: ($("#fileTime").val()==""||$("#fileTime").val()==null)?0:$("#fileTime").val(),
                scores: ($("#scores").val()==""||$("#scores").val()==null)?0:$("#scores").val(),
                releaseDate:$("#releaseDate").val(),
                fileSynopsis:$("#fileSynopsis").val(),
                filePoster:$("#filePoster").val(),
                fileArea: ($("#fileArea").val()==""||$("#fileArea").val()==null)?0:$("#fileArea").val(),
                fileActorList:$("#fileActorList").val(),
                filePrice: ($("#filePrice").val()==""||$("#filePrice").val()==null)?0:$("#filePrice").val()

            })
        });
        //调用增删改
        addFilm();
        updateFilm();
        deleteFilm();
    });

        function filmShow() {
            var options = {
                url:"film/getAllPage.action",//请求后台的路径，获取表格数据的url
                /*cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true*/
                /*striped: true,  //表格显示条纹，默认为false，各行变色*/
                pagination: true, // 在表格底部显示分页组件，默认false
                /*pageList: [5, 10, 20, 50], // 设置页面可以显示的数据条数*/
                pageSize:1, // 页面数据条数
                pageNumber: 1, // 首页页码
                sidePagination: 'server', // 设置为服务器端分页

                columns: [
                    /*{
                        checkbox: true, // 显示一个勾选框
                        align: 'center' // 居中显示
                    },*/{
                        field: 'fId', // 返回json数据中的name
                        title: '电影编号',// 表格表头显示文字
                        align: 'center', // 左右居中
                        valign: 'middle' // 上下居中
                    },

                    {
                        field: 'fileName', // 返回json数据中的name
                        title: ' 电影名称',// 表格表头显示文字
                        align: 'center', // 左右居中
                        valign: 'middle' // 上下居中
                    }, {
                        field: 'fileTypeList',
                        title: '电影类型',
                        align: 'center',
                        valign: 'middle'
                    },
                    {
                        field: 'fileTime',
                        title: '电影时长',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'scores',
                        title: '电影评分',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'releaseDate',
                        title: '上映日期',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'fileSynopsis',
                        title: '电影简介',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'filePoster',
                        title: '电影图片',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'fileArea',
                        title: '地区',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'fileActorList',
                        title: '影员',
                        align: 'center',
                        valign: 'middle'
                    }, {
                        field: 'filePrice',
                        title: '影片价格',
                        align: 'center',
                        valign: 'middle'
                    }
                ],
                queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                    return {
                        limit: params.limit, // 每页要显示的数据条数
                        offset: params.offset, // 每页显示数据的开始行号

                        fId:($("#fId").val()=="" || $("#fId").val()==null)?0:$("#fId").val(),// 额外添加的参数
                        fileName: $("#fileName").val(),
                        fileTypeList: $("#fileTypeList").val(),
                        fileTime: ($("#fileTime").val()==""||$("#fileTime").val()==null)?0:$("#fileTime").val(),
                        scores: ($("#scores").val()==""||$("#scores").val()==null)?0:$("#scores").val(),
                        releaseDate:$("#releaseDate").val(),
                        fileSynopsis:$("#fileSynopsis").val(),
                        filePoster:$("#filePoster").val(),
                        fileArea: ($("#fileArea").val()==""||$("#fileArea").val()==null)?0:$("#fileArea").val(),
                        fileActorList:$("#fileActorList").val(),
                        filePrice: ($("#filePrice").val()==""||$("#filePrice").val()==null)?0:$("#filePrice").val()

                    }
                }

            };
            //初始化表格
            $("#mytable").bootstrapTable(options);
        }
        //增加
    function addFilm() {

        $("#addBtn").click(function () {
            //初始化参数
            filmShow();
            $.getJSON("film/getAddFilm.action",$("#myform").serialize(),function (res) {
                if(res.code==200){
                 $("#modal-body-info").html(res.msg);
                 $("#myModal").modal('show');
                 $("#mytable").bootstrapTable('refresh')
                }
            })
        })
    }
        //修改
    function updateFilm() {

        $("#updateBtn").click(function () {
            //初始化参数
            filmShow();
            $.getJSON("film/getUpdateFilm.action",$("#myform").serialize(),function (res) {
                if(res.code==200){
                    $("#modal-body-info").html(res.msg);
                    $("#myModal").modal('show');
                    $("#mytable").bootstrapTable('refresh')
                }
            })
        })
    }
        //删除
function deleteFilm() {
    //初始化参数
    filmShow();
    $("#deleteBtn").click(function () {
        $.getJSON("film/getDeleteFilm.action",$("#myform").serialize(),function (res) {
            if(res.code==200){
                $("#modal-body-info").html(res.msg);
                $("#myModal").modal('show');
                $("#mytable").bootstrapTable('refresh')
            }
        })
    })
}


</script>
<!-- 模态框（Modal） -->
<div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">电影信息</h4>
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
