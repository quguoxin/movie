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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="<%= basePath %>"/>
    <title>爱看就看-选座</title>
    <meta name="keywords" content="jQuery在线选座,jQuery选座系统" />
    <meta name="description" content="jquery.seat-charts是一款适合电影票、高铁票的在线选座插件。" />
    <link rel="stylesheet" type="text/css" href="../../css/jq22.css" />
    <!--bootstrap-->
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!--bootstrap-table css库-->
    <link href="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <!--HTML5 shim 和 Respond.js是为了让IE8支持HTML5元素和媒体查询功能-->
    <!--警告：通过file://协议（就是这样讲html页面拖拽到浏览器中）访问页面时Respond.js不起作用-->
    <!--[if lt IE 9]-->
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <style type="text/css">
        .front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
        .booking_area {float: right;position: relative;width:200px;height: 450px; }
        .booking_area h3 {margin: 5px 5px 0 0;font-size: 16px;}
        .booking_area p{line-height:26px; font-size:16px; color:#999}
        .booking_area p span{color:#666}
        div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
        div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
        div.seatCharts-row {height: 35px;}
        div.seatCharts-seat.available {background-color: #B9DEA0;}
        div.seatCharts-seat.focused {background-color: #76B474;border: none;}
        div.seatCharts-seat.selected {background-color:#6BBC13 ;}
        div.seatCharts-seat.unavailable {background-color:#EF4D39 ;cursor: not-allowed;}
        div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}
        div.seatCharts-legend {padding-left: 0px;position: absolute;top: 80px;left: 440px;}
        ul.seatCharts-legendList {padding-left: 0px;}
        .seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
        span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
        .checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
        #seats_chose {max-height: 150px;overflow-y: auto;overflow-x:none;width: 200px;}
        #seats_chose li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
    </style>
</head>
<body>
<div>
    <%--导航栏--%>
    <%--<div  style="width: 1349px;height: 80px;clear: both" >
        <div style="width: 700px;float: left;margin-left: 50px">
            <ul class="nav nav-pills nav-justified">
                <li><img style="width: 70px;height: 70px;border-radius: 100%" src="../../imgs/main/20180820202429.png"><font color="red" size="5"><strong>在线影院</strong></font></li>
                <li><a href="view/toView.action?vn=main" target="change" style="color: black"><font size="5"><strong>首 页</strong></font></a></li>
                <li><a href="view/toView.action?vn=movieList" target="change" style="color: black"><font size="5"><strong>电 影</strong></font></a></li>
                <li><a href="view/toView.action?vn=rankingList" target="change" style="color: black"><font size="5"><strong>榜 单</strong></font></a></li>
            </ul>
        </div>
        <div style="width: 300px;float: left;margin-top: 20px;margin-left: 50px">
            <form class="bs-example bs-example-form" role="form">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="input-group">
                            <input style="width: 200px" type="text" placeholder="请输入电影名！" class="form-control">
                            <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
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
                    <a role="menuitem" tabindex="-1" href="#">我的资料</a>
                </li>
                <li role="presentation">
                    <a role="menuitem" tabindex="-1" href="#">我的收藏</a>
                </li>
                <li role="presentation">
                    <a role="menuitem" tabindex="-1" href="#">我的订单</a>
                </li>
            </ul>
        </div>
    </div>--%>

    <%--跳转部分--%>
    <%--<div>--%>
        <div class="container" style="background-color: #F8F8F8">
            <h2 class="title" style="text-align: center;">在线选座</h2>
            <div class="demo clearfix">
                <!---左边座位列表----->
                <div id="legend"></div>
                <div id="seat_area">
                    <div class="front">屏幕</div>
                </div>
                <!---右边选座信息----->
                <div class="booking_area" style="width: 240px;line-height: 10px">
                    <p>电影：<span id="filmName" style="color: black;font-weight: bolder"></span></p>
                    <p>影院：<span id="yingyuan" style="color: black;">第二小组影院(深圳拥抱店)</span></p>
                    <p>影厅：<span id="hallNo" style="color: black;"></span></p>
                    <p>时间：<span id="shijian" style="color: red;"></span></p>
                    <p>票价：<span id="piaojia" style="color: black;"></span></p>
                    <p>座位：</p>
                    <ul id="seats_chose" style="color: red;">
                        <%--座位号--%>
                    </ul>
                    <p>票数：<span id="tickects_num">0</span></p>
                    <p>总价：<b>￥<span id="total_price" style="color: #EF3D37;">0</span></b></p>
                    <input style="background-color: #EF3D37" type="button" id="goumai" class="btn" value="确定购买"/>
                    <%--<div id="legend"></div>--%>
                </div>
            </div>
        </div>
   <%-- </div>--%>
    <%--尾部--%>
    <%--<div style="text-align: center;background-color: #252325;color: #656565">
        <br><br><br>
        商务合作邮箱：v@maoyan.com 客服电话：10105335 违法和不良信息举报电话：4006018900<br>
        投诉举报邮箱：tousujubao@meituan.com 舞弊线索举报邮箱：wubijubao@maoyan.com<br>

        友情链接 : <a style="color: red" href="http://www.meituan.com" data-query="utm_source=wwwmaoyan" target="_blank">美团网</a>
        &nbsp;|&nbsp;<a style="color: red" href="http://i.meituan.com/client" data-query="utm_source=wwwmaoyan" target="_blank">美团下载</a><br>

        ©2016 猫眼电影 maoyan.com 京ICP证160733号 京ICP备16022489号-1 京公网安备 11010102003232号 网络文化经营许可证 电子公告服务规则<br>

        北京猫眼文化传媒有限公司<br><br><br><br><br>
    </div>--%>
</div>


<script src="http://www.jq22.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jquery.seat-charts.min.js"></script>
<script src="../../js/myJsUtil.js"></script>
<!-- 加载Bootstrap的所有JavaScript插件，可根据需要只加载单个插件-->
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<!--bootstrap-table插件-->
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
    var price = 0; //电影票价
    var total = 0;
   /* var fId=0;*/
    $(function() {
        var pId= getQueryString("pId");
        $.getJSON("selectSeat/getSelectSeat.action",{"pId":pId},function (res) {
            if(res.code==200){
                var obj=res.data;
                /*fId=obj.fId;*/
                price=obj.filePrice;
                $("#hallNo").html(obj.hallNo+"号激光厅");
                $("#piaojia").html("¥"+price+"/张");
                $("#filmName").html(obj.fileName);
                $("#shijian").html(obj.playDate+"   "+obj.piayTime);
                var $cart = $('#seats_chose'), //座位区
                    $tickects_num = $('#tickects_num'), //票数
                    $total_price = $('#total_price'); //票价总额
                var sc = $('#seat_area').seatCharts({
                    map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道
                        'cccccccccc',
                        'cccccccccc',
                        '__________',
                        'cccccccc__',
                        'cccccccccc',
                        'cccccccccc',
                        'cccccccccc',
                        'cccccccccc',
                        'cccccccccc',
                        'cc__cc__cc'
                    ],
                    naming: {//设置行列等信息
                        top: false, //不显示顶部横坐标（行）
                        getLabel: function(character, row, column) { //返回座位信息
                            return column;
                        }
                    },
                    legend: {//定义图例
                        node: $('#legend'),
                        items: [
                            ['c', 'available', '可选座'],
                            ['c', 'unavailable', '已售出']
                        ]
                    },
                    click: function() {
                        if (this.status() == 'available') { //若为可选座状态，添加座位
                            $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>')
                                .attr('id', 'cart-item-' + this.settings.id)
                                .data('seatId', this.settings.id)
                                .appendTo($cart);
                            $tickects_num.text(sc.find('selected').length + 1); //统计选票数量
                            $total_price.text(getTotalPrice(sc) + price);//计算票价总金额
                            return 'selected';
                        } else if (this.status() == 'selected') { //若为选中状态
                            $tickects_num.text(sc.find('selected').length - 1);//更新票数量
                            $total_price.text(getTotalPrice(sc) - price);//更新票价总金额
                            $('#cart-item-' + this.settings.id).remove();//删除已预订座位
                            return 'available';
                        } else if (this.status() == 'unavailable') { //若为已售出状态
                            return 'unavailable';
                        } else {
                            return this.style();
                        }
                    }
                });

                //设置已售出的座位
                sc.get(obj.seatNoArray).status('unavailable');
            }
        })


        $("#goumai").click(function () {
            var seatNo=",";
            $("#seats_chose").children().each(function () {
                seatNo+=$(this).text().replace("排","_").replace("座",",");
            })
            var timeStr=Date.parse(new Date);
            var orderDate=(new Date()).getFullYear()+"-"+(new Date()).getMonth()+"-"+(new Date()).getDate()+" "+(new Date()).getHours()+":"+(new Date()).getMinutes()+":"+(new Date()).getSeconds();
            var orderNo=""+parseInt(Math.random()*10)+parseInt(Math.random()*10)+parseInt(Math.random()*10)+parseInt(Math.random()*10)+parseInt(Math.random()*10);
            $.getJSON("selectSeat/addOrder.action",
                {"orderNo":orderNo,
                /*"uId":uId,*/
                "orderPrice":total,
                "pId":pId,
                "seatNo":seatNo,
                "address":"深圳市宝安区宝安大道华丰国际大厦",
                "cinemaName":"第二小组影院(深圳拥抱店)",
                "orderStatus":1,
                "orderDate":orderDate},
                function (res) {
                if(res.code==200){
                    $("#myModal .modal-body").html("<span style='color: green'>"+res.msg+"</sapn>");
                    $("#myModal").modal("show");
                }

            })
        })

    });

    function getTotalPrice(sc) { //计算票价总额
        total = 0;
        sc.find('selected').each(function() {
            total += price;
        });
        return total;
    }
</script>

<%--模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">购票</h4>
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