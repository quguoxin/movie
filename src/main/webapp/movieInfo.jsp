<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/22
  Time: 9:25
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
    <title>电影详情</title>
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
    <style rel="stylesheet" type="text/css">
        .img{
            height:330px ;
            width:245px;
            position: absolute;
            left:105px;
            top: 70px;
        }
        .div{
            height:300px ;
            width:500px;
            position: absolute;
            left:370px;
            top: 70px;
            color: white;
        }
        .div div{
            height: 42px;
            font-size: 18px;
        }
        a:hover{
            text-decoration: none;
        }
        .a1{
            width:250px;
            height: 40px;
            background-color: #DF2D2D;
            color: white;
            border: 0px;
            font-size: 25px;
            text-decoration: none;
        }
        /*.span{
            width:250px;
            height: 40px;
            background-color: #DF2D2D;
            color: white;
            border: 0px;
            font-size: 25px;
        }*/
    </style>
</head>
<body>
<div>
    <div id="Onefilm">
   <%-- <div style="background-color: #3F3158;width: 1350px;height: 380px">
        <img class="img" src="imgs/movie/18.jpg">
        <div class="div">
            <div style="font-size: 30px">我不是药神</div>
            <div>喜剧,剧情</div>
            <div>国产/117分钟</div>
            <div>2018-7-05大陆上映</div>
            <div>演员列表：徐峥,周一围,王传军</div>
            <div >用户评分：<span style="font-size: 25px;color: yellow">9.2分</span></div>
            <a class="a1" href="#tiao">购票选座</a>
        </div>
    </div>
    <div style="width: 740px;float: left;margin-top: 50px;margin-left: 50px" >
            <h4>剧情简介</h4>
            <p style="font-size: 16px">一位不速之客的意外到访，打破了神油店老板程勇（徐峥 饰）的平凡人生，他从一个交不起房租的男性保健品商贩，一跃成为印度仿制药“格列宁”的独家代理商。收获巨额利润的他，生活剧烈变化，被病患们冠以“药神”的称号。但是，一场关于救赎的拉锯战也在波涛暗涌中慢慢展开......</p>
        </div>--%>
    </div>

    <div style="margin-top: 50px;margin-left: 50px">
        <div style="width: 740px;float: left">
            <div  style="width: 740px;height:auto;margin-top: 50px">
            <h4><a id="tiao">近期排片：</a></h4>
                <table id="mytable"></table>
            </div>
        </div>
        <div style="width: 440px;float: right;height: auto;margin-right: 50px;position: absolute;right: 0px;top: 430px">
            <h4>相关电影</h4>
            <div id="allMovies"></div>
        </div>
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
<script src="js/myJsUtil.js"></script>
<script>
    var fileTypeList="";
    var fileArea=0;
    var releaseDate="";
    var scores=0;
    var pageNo=1;
    var pageSize=6;
    var fId=getQueryString("fId");
  $(function () {
      getFilmInfo(fId);
      getMovies(fileTypeList,fileArea,releaseDate,scores);
      loadTable();
      function getFilmInfo(fId) {
          $.getJSON("film/findOneFilm.action",{"fId":fId},function (res) {
              if(res.code==200){
                  var list=res.data;
                  var tmp="";
                  for(var i=0;i<list.length;i++){
                      var obj=list[i];
                      tmp+='<div style="background-color: #3F3158;width: 1350px;height: 380px">';
                      tmp+='<img class="img" src="imgs/movie/'+obj.filePoster+'.jpg">';
                      tmp+='<div class="div">';
                      tmp+='<div style="font-size: 30px">'+obj.fileName+'</div>';
                      var types=obj.fileTypeList.replace("1","喜剧").replace("2","恐怖").replace("3","动作").replace("4","剧情").replace("5","科幻").replace("6","其他");
                      types=types.substring(1,types.length-1);
                      tmp+='<div>'+types+'</div>';
                      if(obj.fileArea==1){
                          var area="国产"
                      }else if(obj.fileArea==2){
                          area="欧美"
                      }else {
                          area="其他"
                      }
                      tmp+='<div>'+area+'/'+obj.fileTime+'分钟</div> ';
                      tmp+='<div>'+obj.releaseDate+'上映</div>';
                      var actor=obj.fileActorList.substring(1,obj.fileActorList.length-1);
                      tmp+='<div>演员列表：'+actor+'</div>';
                      if (obj.scores==0){
                          var score="暂无评";
                      }else{
                          score=obj.scores;
                      }
                      tmp+='<div >用户评分：<span style="font-size: 25px;color: yellow">'+score+'分</span></div>';
                      tmp+='<a class="a1" href="movieInfo.jsp?fId='+fId+'#tiao">购票选座</a></div></div>';
                      tmp+='<div style="width: 740px;float: left;margin-top: 50px;margin-left: 50px" >';
                      tmp+='<h4>剧情简介</h4><p style="font-size: 16px">'+obj.fileSynopsis+'</p></div>';
                  }
                  $("#Onefilm").html(tmp);//绑定事件写在页面形成后面，如果是方法可以写在其他地方
              }
          });
      }

      function getMovies(fileTypeList,fileArea,releaseDate,scores) {
          $.getJSON("film/findAll.action",{"pageNo":pageNo,"pageSize":pageSize,"fileTypeList":fileTypeList,"fileArea":fileArea,"releaseDate":releaseDate,"scores":scores},function (res) {
              if(res.code==200){
                  var list=res.data.data;
                  var tmp="";
                  for(var i=0;i<list.length;i++){
                      var obj=list[i];
                      tmp+='<dl style="width: 140px;height: 160px;margin-top: 10px;float: left">';
                      tmp+='<dt style="text-align: center"><a class="a" href="movieInfo.jsp?fId='+obj.fId+'"><img style="height: 145px;width: 105px" src="imgs/movie/'+obj.filePoster+'.jpg" /></a></dt>';
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
      function loadTable() {
          var options = {
              url:"platoon/findPlatoon.action?fId="+fId,//请求后台的路径，获取表格数据的url
              cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
              striped: true,  //表格显示条纹，默认为false，各行变色
              //pagination: true, // 在表格底部显示分页组件，默认false
              //pageList: [5, 10, 20, 50], // 设置页面可以显示的数据条数
              //pageSize: 2, // 页面数据条数
              //pageNumber: 1, // 首页页码
              sidePagination: 'server', // 设置为服务器端分页
              columns: [
                  {
                      field: 'pId', // 返回json数据中的name
                      title: '排片编号', // 表格表头显示文字
                      align: 'center', // 左右居中
                      valign: 'middle' // 上下居中
                  }, {
                      field: 'playDate',
                      title: '放映日期',
                      align: 'center',
                      valign: 'middle'
                  },
                  {
                      field: 'piayTime',
                      title: '放映时间',
                      align: 'center',
                      valign: 'middle'
                  },
                  {
                      field: 'hallNo',
                      title: '放映厅',
                      align: 'center',
                      valign: 'middle'
                  },
                  {
                      field: 'filePrice',
                      title: '售价（元）',
                      align: 'center',
                      valign: 'middle'
                  },{
                      title: '选座',
                      align: 'center',
                      valign: 'middle',
                      formatter:function (value,row,index) {
                          var str='<a id="aaa" href="view/toView?vn=selectSeat&pId='+row.pId+'">选座</a>';
                          return str;

                      }
                  }
              ]
          };

          //初始化表格
          $("#mytable").bootstrapTable(options);
      }
  })
</script>
</html>