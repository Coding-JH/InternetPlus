<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>设备巡检终端</title>
    <link rel="stylesheet" href="/static/js/common.js">
    <link rel="stylesheet" href="/static/js/homePage2.css">
    <link rel="stylesheet" href="/static/js/jquery.min.css">

    <link rel="stylesheet" href="/static/css/init.css">
    <link rel="stylesheet" href="/static/Font-Awesome-3.2.1/Font-Awesome-3.2./cs/font-awesome.min.css" />
    <link rel="stylesheet" href="/static/css/homePage.css">
    <link rel="stylesheet" href="/static/css/headerAndFooter.css">
</head>
<body>
<header>
    <nav class="header">
        <img class="logo" src="<%=request.getContextPath()%>/images/homePage-logo.png" />
        <!--logo-->
        <a class="items" href="<%=request.getContextPath()%>/user/next">首页</a>
        <a class="items" href="<%=request.getContextPath()%>/sensor/equipmentExplore">数据分析</a>
        <a class="items" href="<%=request.getContextPath()%>/sensor/hardwaresShow">设备展示</a>
        <a class="items" href="<%=request.getContextPath()%>/user/userHelp">用户手册</a>

        <div class="unlogin">
            <a id="registerBtn" href="<%=request.getContextPath()%>/user/regist">注册</a>
            <a id="loginBtn" href="<%=request.getContextPath()%>/user/login">登录</a>
        </div>

        <div class="logined">
            <a class="developerBtn" href="<%=request.getContextPath()%>/equipmentList" style="right:200px">我的设备</a>
            <a class="developerBtn" href="<%=request.getContextPath()%>/userManage">开发者中心</a>
            <a class="icon-bell bell" href="<%=request.getContextPath()%>/newMessage"></a>
            <a class="icon-user user" href="<%=request.getContextPath()%>/userDocument"></a>
        </div>
    </nav>
</header>

<div class="content">
    <!--轮播图-->
    <!--盛放图片的容器，刚好能显示一张图片-->
    <div class="container">
        <!--图片列表-->
        <ul>
            <li><img src="<%=path%>/images/homePage-slideshow6.jpg" alt="图片6"></li>
            <li><img src="<%=path%>/images/homePage-slideshow1.jpg" alt="图片1"></li>
            <li><img src="<%=path%>/images/homePage-slideshow2.jpg" alt="图片2"></li>
            <li><img src="<%=path%>/images/homePage-slideshow3.jpg" alt="图片3"></li>
            <li><img src="<%=path%>/images/homePage-slideshow4.jpg" alt="图片4"></li>
            <li><img src="<%=path%>/images/homePage-slideshow5.jpg" alt="图片5"></li>
            <li><img src="<%=path%>/images/homePage-slideshow6.jpg" alt="图片6"></li>
            <li><img src="<%=path%>/images/homePage-slideshow1.jpg" alt="图片1"></li>
        </ul>
        <!--左移和右移的按钮-->
        <span class="prev">&lt;</span>
        <span class="next">&gt;</span>
        <!--一个用于盛放底部小圆点的盒子，点击小圆点可显示相应序号的图片-->
        <div class="selectPoint">
            <div class="item active"></div>
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
        </div>
    </div>

    <!--service-->
    <div class="serviceBox">
        <h2 class="serviceTitle">电力通信的“全科医生”为您提供全面完备的服务</h2>
        <div class="textContent">
            <div id="data">
                无缝对接海量实时数据，帮助您对所有数据源进行合并、探索和分析,
                为您提供精美直观的图表，并支持动态交互
            </div>
            <div>
                移动客户端功能齐全，让您可以随时随地查看数据，添加设备，更改信息等
            </div>
            <div>
                所有用户的设备都会在高德地图上进行显示，通过地点探索，可以更快查询到
                相应的设备，更加熟悉设备的布局
            </div>
        </div>
        <div class="servicesContainer">
        <div class="service" id="dataBox">
            <img style= "width: 90%; height: 200px"
                 src="<%=path%>/images/homePage-service1.jpg" class="pic"/>
            <div class="serviceName">数据可视化</div>
        </div>
        <div class="service" id="mobileBox">
            <img style= "width: 90%; height: 200px"
                 src="<%=path%>/images/homePage-service2.jpg" class="pic"/>
            <div class="serviceName">移动客户端</div>
        </div>
        <div class="service" id="locationBox">
            <img style= "width: 90%; height: 200px"
                 src="<%=path%>/images/homePage-service3.jpg" class="pic"/>
            <div class="serviceName">设备定位</div>
        </div>
    </div>
    </div>

    <!--function-->
    <div class="functionBox">
        <h2 class="functionTitle">电力通信的“全科医生”为您提供的产品功能</h2>
        <div class="functionsContainer" style="margin-top: 30px">
            <div class="function" style="width: 256px">
                <img style= "width: 90%; height: 220px"
                     src="<%=path%>/images/homePage-air.jpg" class="pic"/>
                <div class="functionName">大气监测</div>
            </div>
            <div class="function" style="width: 256px">
                <img style= "width: 90%; height: 220px"
                     src="<%=path%>/images/homePage-smog.jpg" class="pic"/>
                <div class="functionName">烟雾监测</div>
            </div>
            <div class="function" style="width: 256px">
                <img style= "width: 90%; height: 220px"
                     src="<%=path%>/images/homePage-temperature.jpg" class="pic"/>
                <div class="functionName">温度监测</div>
            </div>
            <div class="function" style="width: 256px">
                <img style= "width: 90%; height: 220px"
                     src="<%=path%>/images/homePage-wind.jpg" class="pic"/>
                <div class="functionName">风力监测</div>
            </div>
        </div>
    </div>
</div>

<!--底部-->
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
        <img src="/images/homePage-2DCode.png" style="width: 150px; height: 150px"/>
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


</body>
</html>