
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
    <title>爱看不看-首页</title>
    <style>
        .select{
            background-color: #EE4238;
            color: white;
        }
    </style>
    <link href="../../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="../../bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<div style="width: 1349px">
    <%--轮播--%>
    <div style="width: 1349px;height: 430px;" id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
            <li data-target="#myCarousel" data-slide-to="5"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="../../imgs/main/b471dd797afe453ef6edc9ce56d5607d73733.jpg" alt="First slide">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="../../imgs/main/901429f73b43648da65e3f1d7a72ea6e71031.jpg" alt="Second slide">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="../../imgs/main/6605d3518e2bba10f29a6f9ae32b361987015.jpg" alt="Third slide">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="../../imgs/main/ad6685d899f057c397dbf48529c44796189914.jpg" alt="Third slide">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="../../imgs/main/a26f4aaa5e3b4e825459324365b97763184061.jpg" alt="Third slide">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="../../imgs/main/bd5fb493e658d5d51c46dd9f72cc5677168066.jpg" alt="Third slide">
                <div class="carousel-caption"></div>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <%--正在热映--%>
    <div id="zhengzaireying" style=" margin-bottom: 50px;margin-left: 100px;float: left;width: 760px;height: 650px;">
    </div>
    <%--今日票房--%>    
    <div id="jinripiaofang" style="margin-bottom: 50px;margin-left: 100px;float: left;width: 370px;height: 650px">
    </div>
        
    <%--即将上映--%>
    <div id="jijiangshangying" style="margin-bottom: 50px;margin-left: 100px;float: left;width: 760px;height: 650px;">
    </div>
    <%--最受期待--%>
    <div id="zuishouqidai" style="margin-bottom: 50px;margin-left: 100px;float: left;width: 370px;height: 650px">
    </div>

    <%--最新资讯--%>
    <div style="width: 770px;height: 500px;float: left;margin-left: 70px">
            <div style="width: 760px;height: 100px;color: #EE4238;font-size: 30px"><br>最新资讯</div>
            <a href="http://maoyan.com/films/news/46050" target="_blank">
                <div style="float: left;width:230px;height: 210px;margin-left: 10px">
                    <img src="../../imgs/main/11111.jpg" alt="通用的占位符缩略图">
                    <%--<div>--%>
                    <p>陈可辛又拍短片，网坛名将李娜真实演绎，网友：娜姐美出新高度。</p>
                    <%-- </div>--%>
                </div>
            </a>
            <a href="http://maoyan.com/films/news/46049" target="_blank">
                <div style="float: left;width:230px;height: 210px;margin-left: 30px">
                    <img src="../../imgs/main/222222.jpg" alt="通用的占位符缩略图">
                    <%--<div>--%>
                    <p>《喜剧之王》“霞姨”晒珍贵幕后照，星爷搞怪，张柏芝清纯粉嫩。</p>
                    <%-- </div>--%>
                </div>
            </a>
            <a href="http://maoyan.com/films/news/46048" target="_blank">
                <div style="float: left;width:230px;height: 210px;margin-left: 30px">
                    <img src="../../imgs/main/33333.jpg" alt="通用的占位符缩略图">
                    <%--<div>--%>
                    <p>戚薇购物清单曝光，矿泉水只买法国进口的，竟是给女儿冲奶粉。</p>
                    <%-- </div>--%>
                </div>
            </a>
            <a href="http://maoyan.com/films/news/46047" target="_blank">
                <div style="float: left;width:230px;height: 210px;margin-left: 10px">
                    <img src="../../imgs/main/44444.jpg" alt="通用的占位符缩略图">
                    <%--<div>--%>
                    <p>影后巩俐坐镇今年金马奖评审团主席，章子怡周迅杨幂或将角逐影后。</p>
                    <%-- </div>--%>
                </div>
            </a>
            <a href="http://maoyan.com/films/news/46046" target="_blank">
                <div style="float: left;width:230px;height: 210px;margin-left: 30px">
                    <img src="../../imgs/main/55555.jpg" alt="通用的占位符缩略图">
                    <%--<div>--%>
                    <p>卡司公布 | 今日深夜食堂菜单：原来故事里说的都是他们。</p>
                    <%-- </div>--%>
                </div>
            </a>
            <a href="http://maoyan.com/films/news/46045" target="_blank">
                <div style="float: left;width:230px;height: 210px;margin-left: 30px">
                    <img src="../../imgs/main/66666.jpg" alt="通用的占位符缩略图">
                    <%--<div>--%>
                    <p>比伯豪掷3千万买房，面积堪比梵蒂冈，还带私人赛马场。</p>
                    <%-- </div>--%>
                </div>
            </a>
        </div>

    <%--热点资讯--%>
    <div style="/*border: 1px red solid;*/margin-bottom: 50px;margin-left: 100px;float: left;width: 370px;height: 650px">
        <div style="width: 370px;height: 100px;color: #EE4238;font-size: 30px">
            <br>热点资讯
        </div>
        <a href="http://maoyan.com/films/news/45861" target="_blank" class="list-group-item">1&nbsp;&nbsp;&nbsp;&nbsp;《古剑奇谭之流月昭明》曝“古剑问道”版预告</a>
        <a href="http://maoyan.com/films/news/45859" target="_blank" class="list-group-item">2&nbsp;&nbsp;&nbsp;&nbsp;《铁血战士》进军玩具界尽显反差萌，宇宙...</a>
        <a href="http://maoyan.com/films/news/45874" target="_blank" class="list-group-item">3&nbsp;&nbsp;&nbsp;&nbsp;韩寒晒《飞驰人生》剧照，沈腾赤脚与...</a>
        <a href="http://maoyan.com/films/news/45858" target="_blank"  class="list-group-item">4&nbsp;&nbsp;&nbsp;&nbsp;《巨齿鲨》全球票房大破3亿美元，夏季看“鲨”...</a>
        <a href="http://maoyan.com/films/news/45873" target="_blank"  class="list-group-item">5&nbsp;&nbsp;&nbsp;&nbsp;贼喊捉贼？反性侵女星被爆曾性侵未成年男童...</a>
        <a href="http://maoyan.com/films/news/45872" target="_blank"  class="list-group-item">6&nbsp;&nbsp;&nbsp;&nbsp;《延禧攻略》网络点击量破百亿，于正趁热打...</a>
        <a href="http://maoyan.com/films/news/45871" target="_blank"  class="list-group-item">7&nbsp;&nbsp;&nbsp;&nbsp;导演韩延张小北力挺《一出好戏》未抄袭，黄渤...</a>
        <a href="http://maoyan.com/films/news/45934" target="_blank"  class="list-group-item">8&nbsp;&nbsp;&nbsp;&nbsp;印度电影《苏丹》曝同名推广曲MV，那吾克...</a>
        <a href="http://maoyan.com/films/news/45958" target="_blank"  class="list-group-item">9&nbsp;&nbsp;&nbsp;&nbsp;《蚁人2》彩蛋隐藏重要信息，复联4最大反派竟...</a>
        <a href="http://maoyan.com/films/news/45965" target="_blank"  class="list-group-item">10&nbsp;&nbsp;&nbsp;&nbsp;澳门赌王妹妹何婉琪病逝，留下百亿遗产，死讯...</a>
    </div>


</div>
<script src="../../js/jquery-1.11.1.min.js"></script>
<script src="../../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="../../bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="../../bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script>
    $(function () {

       $.getJSON("homePage/getIngFilm.action","",function (res) {
           if(res.code==200){
               var list= res.data;
               var tmp='<div style="width: 760px;height: 100px;color: #EE4238;font-size: 30px"><br>正在热映</div>';
               var tmp2='<div style="width: 370px;height: 100px;color: #EE4238;font-size: 30px">\n' +
                   '            <br>评分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n' +
                   '            <a href="view/toView.action?vn=hotplay"><font size="3">查看完整榜单</font></a>\n' +
                   '        </div>';
               //处理集合信息，为页面加载订单
               for(var i=0;i<8;i++){
                   var obj=list[i];
                   tmp+='<div style="float: left;margin-left: 20px;margin-bottom: 20px;border: 1px #EEEEEE solid;width:160px;height: 260px;background-image: url(\'../../imgs/movie/'+obj.filePoster+'.jpg\');background-repeat: no-repeat;color: white">';
                   tmp+='<div style="height: 25px;margin-top: 195px;font-size:17px">'+obj.fileName+'</div>';
                   tmp+='<a href="view/toView.action?vn=movieInfo&fId='+obj.fId+'"><div class="change_goupiao" style="height: 40px;color: black;text-align: center;line-height: 35px">购 票</div></a>';
                   tmp+='</div>';
                   tmp2+='<a href="view/toView.action?vn=movieInfo&fId='+obj.fId+'" class="list-group-item" style="font-size: 18px">'+(i+1)+'&nbsp;&nbsp;'+obj.fileName+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="display: inline-block;float: right;color: #EE4238">'+obj.scores+'</span></a>';
               }
               tmp2+='<img style="margin-top: 50px" src="../../imgs/main/1111111111111111111111111111111.png">';
               $("#zhengzaireying").html(tmp);
               $("#jinripiaofang").html(tmp2);
               $(".change_goupiao").bind({
                   mouseover:function(){
                       $(this).addClass("select");
                   },
                   mouseout:function(){
                       $(this).removeClass("select");
                   }
               })
           }
       })

        $.getJSON("homePage/getNewFilm.action","",function (res) {
            if(res.code==200){
                var list= res.data;
                var tmp3='<div style="width: 760px;height: 100px;color: #2F98F1;font-size: 30px"><br>即将上映</div>';
                var tmp4='<div style="width: 370px;height: 100px;color: #FEB313;font-size: 30px">\n' +
                    '                <br>最受期待&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n' +
                    '                <a href="view/toView.action?vn=hotplay"><font size="3">查看完整榜单</font></a>\n' +
                    '            </div>';
                //处理集合信息，为页面加载订单
                for(var i=0;i<8;i++){
                    var obj=list[i];
                    tmp3+='<div style="float: left;margin-left: 20px;margin-bottom: 20px;border: 1px #EEEEEE solid;width:160px;height: 260px;background-image: url(\'../../imgs/movie/'+obj.filePoster+'.jpg\');background-repeat: no-repeat;color: white">';
                    tmp3+='<div style="height: 25px;margin-top: 195px;font-size:17px">'+obj.fileName+'</div>';
                    tmp3+='<a href="view/toView.action?vn=movieInfo&fId='+obj.fId+'"><div class="change_goupiao" style="height: 40px;color: black;text-align: center;line-height: 35px">查看详情</div></a>';
                    tmp3+='</div>';
                    tmp4+='<a href="view/toView.action?vn=movieInfo&fId='+obj.fId+'" class="list-group-item" style="font-size: 18px">'+(i+1)+'&nbsp;&nbsp;'+obj.fileName+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="display: inline-block;float: right;color: #FEB313">'+obj.filePrice+'</span></a>';
                }
                tmp4+='<img style="margin-top: 50px" src="../../imgs/main/1111111111111111111111111111111.png">';
                $("#jijiangshangying").html(tmp3);
                $("#zuishouqidai").html(tmp4);
                $(".change_goupiao").bind({
                    mouseover:function(){
                        $(this).addClass("select");
                    },
                    mouseout:function(){
                        $(this).removeClass("select");
                    }
                })
            }
        })
    })
</script>
</body>
</html>