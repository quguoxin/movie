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
    <title>爱看不看-我的订单</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<div style="width: 920px;margin-left: 20px">
    <h3 style="color: #EC3931">我的订单</h3><hr>
    <div id="orderList">
    </div>
</div>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<!--bootstrap-table插件-->
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script>
    //退款
    function refundMoney(orderNo) {
        $.getJSON("myOrder/updateOrderStatus.action",{"orderNo":orderNo},function (res) {
            if(res.code==200){
                $("#myModal .modal-body").html("<span style='color: green'>"+res.msg+"</sapn>");
                $("#myModal").modal("show");
                show();
            }
        })
    }

    //删除订单
    function delOrder(orderNo) {
        $.getJSON("myOrder/delOrder.action",{"orderNo":orderNo},function (res) {
            if(res.code==200){
                $("#myModal .modal-body").html("<span style='color: green'>"+res.msg+"</sapn>");
                $("#myModal").modal("show");
                show();
            }
        })
    }

    //展示
    function show() {
        $.getJSON("myOrder/getAllOrderByUid.action","",function (res) {
            if(res.code==200){
                var tmp="";
                var list=res.data;
                for(var i=0;i<list.length;i++){
                    var obj=list[i];
                    var seatNo2=obj.seatNo.substring(1,obj.seatNo.length-1);
                    var seatArray=seatNo2.split(",");
                    var seatNo="";
                    for(var j=0;j<seatArray.length;j++){
                        seatNo+=seatArray[j].replace("_","排")+"座，";
                        if(j==seatArray.length-1){
                            seatNo+=seatArray[j].replace("_","排")+"座";
                        }
                    }
                    tmp+='<div style="width: 882px;height: 187px;border: 1px #F6F6F6 solid;margin-top: 40px">';
                    tmp+='<div style="height: 54px;background-color: #F6F6F6;line-height: 60px;font-size: 17px">';
                    tmp+='<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+obj.orderDate+'5&nbsp;&nbsp;&nbsp;</span>';
                    tmp+='<span class="orderNo">订单号:'+obj.orderNo+'</span>';
                    tmp+='<a href="JavaScript:delOrder('+obj.orderNo+');" ><span class="glyphicon glyphicon-trash" style="float: right;margin-right: 20px;line-height: 60px"></span></a></div>';
                    tmp+='<table  style="margin-top: 20px"><tr>';
                    tmp+='<td  width="110px" align="center"><img width="70px" height="95px" src="../../imgs/movie/'+obj.filePoster+'.jpg"></td>';
                    tmp+='<td width="420px"><font><strong>《'+obj.fileName+'》</strong></font><br>';
                    tmp+='<font size="2px" color="#989898">'+obj.cinemaName+'<br>'+obj.hallNo+'号厅&nbsp;'+seatNo+'<br></font>';
                    tmp+='<font size="2px" color="red">'+obj.playDate+' '+obj.piayTime+'</font><br></td>';
                    tmp+='<td width="100px">¥'+obj.orderPrice+'</td>';
                    if(obj.orderStatus==1){
                        tmp+='<td width="150px">已付款</td>';
                        tmp+='<td width="150px" align="center"><button onclick="JavaScript:refundMoney('+obj.orderNo+')" type="button" class="btn btn-warning">退款</button></td>';
                    }else if(obj.orderStatus==2){
                        tmp+='<td width="150px">已完成</td>';
                        tmp+='<td width="150px" align="center"></td>';
                    }else {
                        tmp+='<td width="150px">已退款</td>';
                        tmp+='<td width="150px" align="center"></td>';
                    }
                    tmp+='</tr></table></div>';
                }

                $("#orderList").html(tmp)
            }
        })

    }
    $(function () {
        show()
    })
</script>





<%--模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">订单</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>