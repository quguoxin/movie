<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/22
  Time: 9:52
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
    <title> 电影排行榜</title>
</head>
<style>
    .first{
        color: white;
        font-size: 30px;
        text-decoration-line: none;
        float: left;
        line-height: 60px;
        margin-left: 180px;
        padding: 0px;
    }
    #hidden{
       /* border: 1px red solid;*/
        width: 1355px;
        height: 60px;
        background-color:black ;
    }
    #biggerhouse{
        /*border:1px red solid;*/
        width: 1355px;
        height: 150px;
    }
    #biggerhouse .updateshow{
        margin-top: 60px;
        align-items: center;
        width: 150px;
        height: 20px;
      /*  border: 1px yellow solid;*/
        margin-left: 600px;

    }
    #biggerhouse  .ruleshow{
        line-height: 50px;
        margin-left: 150px;
    }
    .datailshow{
        float: left;
        margin-left: 20px;
        margin-top: 80px ;
        font-style: italic;
        border: red 2px solid;
        background-color: yellow;
        width: 50px;
        height: 50px;
        font-size: 35px;
        text-align: center;
    }
    #biggertail{
       margin-left: 60px;
        margin-top: -60px;
        /*border: 1px red solid;*/
        width: 1290px;
        height: 220px;
    }
    #middletail{
        border-bottom: 2px silver solid;
        height: 220px;
        width: 800px;
        margin-left: 250px;
    }
    #filmdetail{
        margin-top:30px ;
        float: left;
    }
    #filmscore{
        float: left;
       /* border: 1px red solid;*/
        margin-top: 50px;
        margin-left: 300px;
        font-size: 60px;
        font-style: italic;
        color: yellow;
    }
    #filmprice{
        float: left;
        /* border: 1px red solid;*/
        margin-top: 80px;
        margin-left: 300px;
        font-size: 20px;
        font-style: italic;
        color: green;
    }
    .add{
        color: red;
    }

</style>
<body>
<div style="width: 1349px">
<div id="hidden">
    <a id="hotplay"  class="first" style="margin-left: 400px" >热映口碑榜</a>
    <a id="willplay"  class="first" > 最受期待榜</a>
     <%--<div id="hotplay"><a id="a1" href="#" class="first" style="" >热映口碑榜</a></div>
     <div id="willplay"><a id="a2" href="#" class="first"> 最受期待榜</a></div>--%>
</div>
<div id="biggerhouse">
    <div class="updateshow">2018-8-24<span style="color: blue ">已更新</span></div>
    <div class="ruleshow">榜单规则：将昨日国内热映的影片，按照评分从高到低排列取前10名，每天上午10点更新。相关数据来源于“猫眼专业版”及“猫眼电影库”</div>
</div>
<div id="filmcontainer" style="width: 1350px;height: auto"></div>
<%--<div id="biggertail">
        <div class="datailshow" >1</div>
        <div style="float: left; margin-left: 20px"><a href="#"><img src="imgs/movie/18.jpg"></a></div>
        <div id="middletail">
            <div id="filmdetail">
                <ul style="list-style: none">
                    <li><a href="#" style="text-decoration-line: none ;font-size: 30px;color: black">我不是神药</a></li>
                    <li style="font-size: 20px;margin-top: 10px">主演:徐峥,周一围,王传君</li>
                    <li style="margin-top: 5px;color:grey">上映时间:2018-8-22</li>
                </ul>
             </div>
            <div id="filmscore">9.6</div>
         </div>
</div>--%>
</div>
</body>
<script src="../../js/jquery-1.11.1.min.js"></script>
<script>
    $(function () {
       var url="film/getHotPlay.action";
       getDetail(url);

       $("#hotplay").click(function () {
            url="film/getHotPlay.action";
            $(this).addClass("add").siblings().removeClass("add");
             getDetail(url);
       })


       $("#willplay").click(function () {
                url="film/getWillPlay.action";
                $(this).addClass("add").siblings().removeClass("add");
                getDetail(url);
       })
    })


    function getDetail(url) {
        $.getJSON(url,"",function (res) {
            if(res.code=200){
                var list=res.data;
                var tmp="";
                for (var i=0;i<list.length;i++){
                    var obj=list[i];
                    var keyv=obj.scores;
                    var actor=obj.fileActorList;
                    var actors=actor.replace(","," ");
                    tmp+='<div id="biggertail" style="clear: both"><div class="datailshow" >'+(i+1)+'</div>';
                    tmp+=' <div style="float: left; margin-left: 20px"><a href="view/toView.action?vn=movieInfo&fId='+obj.fId+'"><img src="imgs/movie/'+obj.filePoster+'.jpg"></a></div>';
                    tmp+='<div id="middletail "><div id="filmdetail" style="height: 220px;width:450px ;" >';
                    tmp+='<ul style="list-style: none">';
                    tmp+='<li><a href="view/toView.action?vn=movieInfo&fId='+obj.fId+'" style="text-decoration-line: none ;font-size: 30px;color: black">'+obj.fileName+'</a></li>';
                    tmp+=' <li style="font-size: 20px;margin-top: 10px">主演:'+actors+'</li>';
                    tmp+='<li style="margin-top: 5px;color:grey">上映时间:'+obj.releaseDate+'</li>';
                    tmp+='</ul></div>';
                    if(keyv>0.0){
                        tmp+=' <div style="float: left; width: 60px;height: 220px" id="filmscore">'+keyv+'</div></div></div>';
                        $("#filmcontainer").html(tmp);
                    }else {
                        tmp+=' <div style="float: left; width: 200px;height: 220px" id="filmprice">总想看:'+obj.filePrice+'人</div></div></div>';
                        $("#filmcontainer").html(tmp);
                    }

                }
            }

        })
    }
</script>
</html>