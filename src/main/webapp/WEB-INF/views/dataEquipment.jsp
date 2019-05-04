<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title></title>
  <!-- 公共样式-->
  <link href="../css/init.css" rel="stylesheet">
  <!--jquery-->
  <script src="../js/jquery.min.js"></script>
  <!-- bootstrap-->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <script src="../js/bootstrap.min.js"></script>
  <!-- jquery ui-->
  <link href="../css/jquery-ui.css" rel="stylesheet">
  <!-- multiselect-->
  <link href="../css/jquery.multiselect.css" rel="stylesheet">
  <!-- 图标-->
  <link href="../Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
  <!-- 导航和底部样式-->
  <link href="../css/headerAndFooter.css" rel="stylesheet">
  <!-- 此页面样式-->
  <link href="../css/dataEquipments.css" rel="stylesheet">
</head>
<body>
<!--导航-->
<header>
  <nav class="header">
      <img class="logo" src="../images/homePage-logo.png"/><!--logo-->
      <a class="items" href="homePage.html">首页</a>
      <a class="items" href="equipmentExplore.html">设备探索</a>
      <a class="items" href="hardwaresShow.html">硬件展示</a>
      <a class="items" href="userHelp.html">帮助文档</a>

      <div class="unlogin">
          <a id="registerBtn" href="register.html">注册</a>
          <a id="loginBtn" href="login.html">登录</a>
      </div>

      <div class="logined">
          <a class="developerBtn" href="equipmentList.html">我的设备</a>
          <a class="developerBtn" href="userManage.html">开发者中心</a>
          <a class="icon-bell bell" href="newMessage.html"></a>
          <a class="icon-user user" href="userDocument.html"></a>
      </div>
  </nav>
</header>
<!--主要内容-->
<div class="main">
  <!-- 简介-->
  <div class="intro">
    <div class="panel panel-default">
      <div class="panel-body equipmentInfo"></div>
    </div>
  </div>
  <!--数据导出-->
  <script id="equipmentInfo" type="text/jsrender">

    <div class="media">
          <!-- 左边-->
          <div class="media-left">
            <!--<img class="media-object" src="{{:imgUrl}}" >-->
            <!-- 暂时写是死-->
            <img class="media-object" src="../images/machineRoom-display1.png" >
          </div>
          <!-- 主体-->
          <div class="media-body">
            <!-- 数据导出-->
            <div class="dataExport">
              <button type="button" class="btn btn-default" id="data-export">数据导出</button>
            </div>

            <!-- 主体内容-->
            <div class="body_con">
              <p>名称：{{:name}}</p>
              <!-- {{:equipmentId}}-->
              <P>设备ID：<span id="equipmentId">{{:equipmentId}}</span></P>
              <p>简介： {{:info}}</p>
              <p>创建时间：{{:createTime}}</p>
            </div>
          </div>
        </div>

  </script>
  <!-- 数据展示-->
  <div class="show">
    <span class="glyphicon glyphicon-stop"></span>
    <span>数据展示</span>
    <!--每一个数据的展示-->
    <div class="showEveryEquipmentData"></div>
    <script id="showEveryEquipmentData" type="text/jsrender">
      {{for sensorTypeResps}}
      <div class="data_show">
        <div class="left_con">
          <div class="left_con_title">
             <span>{{:name}}</span>
          </div>
          <div class="left_con_pic">
            <img src="https://cdn.lewei50.com/content/images/defaultsensor.png">
          </div>
          <div class="left_con_con">
            <h3></h3>
            <div style="text-align: center;">{{:equipmentId}}</div>
            <form>
              <input type="hidden" id="{{:~root.equipmentId}}" value="{{:dataType}}"
            </form>
          </div>
        </div>
        <div class="right_con">
          <div class="filter" >
            <ul>
              <li><a href="javascript:drawChart('{{:~root.equipmentId}}','{{:dataType}}',0)">实时</a></li>
              <li><a href="javascript:drawChart('{{:~root.equipmentId}}','{{:dataType}}',1)">最近一天</a></li>
              <li><a href="javascript:drawChart('{{:~root.equipmentId}}','{{:dataType}}',2)">最近一周</a></li>
              <li><a href="javascript:drawChart('{{:~root.equipmentId}}','{{:dataType}}',3)">最近一月</a></li>
            </ul>
          </div>
          <div class="chart_show">
            <div id="{{:~root.equipmentId}}{{:dataType}}" style="width:90%;min-width:400px;height:260px;margin: 0 auto;">
            </div>
          </div>
        </div>
      </div>
      {{/for}}
  </script>
  </div>
  <!-- 弹出的内容-->
  <div id="data_export" title="数据导出">
    <div>
        <div class="type_select">
          <span>类型：</span>
          <select id ="sela" title="数据类型" multiple="multiple" name="export" size="1">
          </select>
          <span class="requiredType" style="display: none;">   *必填字段</span>
        </div>
        <div class="time_select">
          <span>时间：</span>
          <div style="margin-left: -4px; display: inline-block;">
            <label for="from"></label>
            <input type="text" id="from" name="from" >
            <label for="to">~</label>
            <input type="text" id="to" name="to" >
            <span class="requiredTime" style="display: none;">   *必填字段</span>
          </div>
        </div>
        <div class="submit">
          <input  id="submit" type="submit"
                  class="btn btn-default btn-md"
                  style="background: #2A9F96;color: #fff;" value="确定">
          <input id="resetButton" name="resetButton" type="reset" value="重置" class="btn btn-default btn-md">
        </div>

    </div>


  </div>
</div>
<footer class="footer">
  <div class="link">
    <h2>友情链接</h2>
    <a href="http://iot.10086.cn/cn/">中移物联网</a>
    <a href="http://iot.10086.cn/cn/corp/priv-net">物联网专网</a>
    <a href="https://www.oschina.net/">开源中国</a>
    <a href="http://bbs.elecfans.com/">电子发烧友</a>
  </div>
  <div class="app">
    <h2>APP下载</h2>
    <img src="../images/homePage-2DCode.png" style="width: 150px; height: 150px"/>
  </div>
  <div class="contact">
    <h2>联系方式</h2>
    <a href="javascript: return false;">电话：029-88166000</a>
    <a href="javascript: return false;">传真：029-88166000</a>
    <a href="javascript: return false;">QQ：1234567890</a>
    <a href="javascript: return false;">WeChat: xingongshiyanshi</a>
    <a href="javascript: return false;">邮箱：1234567890@qq.com</a>
    <a href="javascript: return false;">地址：陕西省西安市长安区西安邮电大学信工实验室</a>
  </div>
</footer>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/jquery.multiselect.js"></script>
<!--使用json数据动态生成结构 ，，html模板引擎-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jsrender/0.9.90/jsrender.js"></script>
<!-- 折线绘制-->
<script src="../js/highcharts.js"></script>
<!-- 分享-->
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js"></script>
<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<!--本页面js-->
<script src="../common.js"></script>
<script src="../js/dataEquipment.js" charset="utf-8"></script>
</body>
</html>