
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
    <title>电影</title>
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
    <style type="text/css" rel="stylesheet">
        .mtr{
            border-bottom: 1px silver solid;
        }
        .mtdleft{
            float: left;
            width: 65px;
            height: 50px;
            text-align: center;
            line-height: 50px;
        }
        .mtdright{
            float: left;
            text-align: center;
            line-height: 50px;
        }
      div a{
            margin-left: 30px;
        }
        a:link{
            color: #777777;
            text-decoration: none;
        }

        a:hover{
            color: red;
            text-decoration: none;
        }
      .a{
          margin: 0px 0px;
          text-decoration: none;
      }
        .minput{
            margin-left: 125px;
            height: 30px;
            line-height: 50px;
        }
        .red{
            background-color: red;
            color: white;
            border-radius: 10%;
        }
        .redFont{
            color: red;
        }

    </style>
</head>
<body>
<%--<div style="width: 1350px;height: 60px;background-color: #47464A">
    <div id="hotPlay" style="float: left;margin: 15px 500px;color: silver;font-size: 25px">正在热映</div>
    <div style="float: left;margin: 15px -400px;color: silver;font-size: 25px">即将上映</div>
</div>--%>
<div>
<table style="text-align: center;height: auto;width: 1125px;border: 1px silver solid;margin: 0px auto">
    <tr class="mtr">
        <td class="mtdleft">类型:</td>
        <td class="mtdright" ><div class="mType"><a id="allType" >全部</a><a id="keHuan">科幻</a><a id="xiJu">喜剧</a> <a id="aiQing">爱情</a><a id="kongBu">恐怖</a><a id="dongZuo">动作</a><a id="qiTa">其他</a></div></td>
    </tr>
    <tr class="mtr">
        <td class="mtdleft">区域:</td>
        <td class="mtdright"><div class="mArea"><a id="allArea">全部</a><a id="daLU">国产</a> <a id="ouMei">欧美</a><a id="qiTa1">其他</a></div></td>
    </tr>
    <tr class="mtr">
        <td class="mtdleft">年代:</td>
        <td class="mtdright"><div class="mData"><a id="allData">全部</a><a id="2018">2018年</a> <a id="2017">2017年</a> <a id="2016">2016年</a></div></td>
    </tr>
</table>
<div class="minput"><a id="mScores">按评分排序</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="shijian">按时间排序</a></div>
<div id="allMovies" style="float: left;width: 1140px;height: auto;margin: 0px 88px" >
</div>

<div style="float: left;margin: 30px 600px">
    <input type="button" id="prvBtn" value="上一页" class="down"/>
    <input type="button" id="cur_page" class="pageNum1" value="1" style="background-color: white">
    <input type="button" id="nextBtn" value="下一页" class="up"/>
</div>
</div>
</body>
<!-- jQuery(Bootstrap的所有JavaScript插件都依赖jQuery，所以必须放在前面)-->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- 加载Bootstrap的所有JavaScript插件，可根据需要只加载单个插件-->
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<!--bootstrap-table插件-->
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table.js"></script>
<script src="bootstrap-3.3.7-dist/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<script>
    var fileTypeList="";
    var fileArea=0;
    var releaseDate="";
    var scores=0;

    var pageNo=1;
    var pageSize=12;
    var totalPage=0;
    $(function () {
        getMovies(fileTypeList,fileArea,releaseDate,scores);
        //热播
        $("#hotPlay").click(function () {
            $(this).addClass("redFont").siblings().removeClass("redFont");
        });
        //类型
       $("#allType").click(function () {
           $(this).addClass("red").siblings().removeClass("red");
           fileTypeList="";
           pageNo=1;
           getMovies(fileTypeList,fileArea,releaseDate,scores);
       });
        $("#xiJu").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileTypeList=",1,";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#kongBu").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileTypeList=",2,";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#dongZuo").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileTypeList=",3,";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#aiQing").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileTypeList=",4,";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#keHuan").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileTypeList=",5,";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#qiTa").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileTypeList=",6,";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });

        //地区
        $("#allArea").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileArea=0;
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#daLU").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileArea=1;
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });

        $("#ouMei").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileArea=2;
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });

        $("#qiTa1").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            fileArea=3;
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });

        //年代

        $("#allData").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            releaseDate="";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#2018").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            releaseDate="2018";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#2017").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            releaseDate="2017";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });
        $("#2016").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            releaseDate="2016";
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });

        //评分
       $("#mScores").click(function () {
           $(this).addClass("red").siblings().removeClass("red");
           scores=1.0;
           pageNo=1;
           getMovies(fileTypeList,fileArea,releaseDate,scores);
       });
        $("#shijian").click(function () {
            $(this).addClass("red").siblings().removeClass("red");
            scores=2.0;
            pageNo=1;
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });


        $("#prvBtn").click(function () {
            pageNo--;
            if(pageNo<=1){
                pageNo=1;
            }
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });

        //点击下一页
        $("#nextBtn").click(function () {
            pageNo++;
            if(pageNo>=totalPage){
                pageNo=totalPage;
            }
            getMovies(fileTypeList,fileArea,releaseDate,scores);
        });

        function getMovies(fileTypeList,fileArea,releaseDate,scores) {
            $.getJSON("film/findAll.action",{"pageNo":pageNo,"pageSize":pageSize,"fileTypeList":fileTypeList,"fileArea":fileArea,"releaseDate":releaseDate,"scores":scores},function (res) {
                if(res.code==200){
                    totalPage=res.data.totalPage;
                    $("#totalPage").html("共"+totalPage+"页");
                    //为当前页赋值
                    pageNo=res.data.pageNo;
                    $("#cur_page").val(pageNo);
                    var list=res.data.data;
                    var tmp="";
                    for(var i=0;i<list.length;i++){
                        var obj=list[i];
                        tmp+='<dl style="width: 160px;height: 220px;margin-top: 20px;float: left;margin-left: 30px">';
                        tmp+='<dt><a class="a" href="movieInfo.jsp?fId='+obj.fId+'"><img src="imgs/movie/'+obj.filePoster+'.jpg" /></a></dt>';
                        tmp+='<dd style="text-align: center"><a class="a" href="movieInfo.jsp?fId='+obj.fId+'">'+obj.fileName+'</a></dd>';
                        if (obj.scores==0){
                            var score="暂无评";
                        }else{
                            score=obj.scores;
                        }
                        tmp+='<dd style="text-align: center;color: orange">'+score+'分</dd> </dl>';
                    }
                    $("#allMovies").html(tmp);//绑定事件写在页面形成后面，如果是方法可以写在其他地方
                }
            })
        }
    });
</script>
</html>