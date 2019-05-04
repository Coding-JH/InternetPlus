<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>移动客户端</title>
  <link rel="stylesheet" href="../css/init.css">
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="../css/headerAndFooter.css">
  <style>
    .content{
      display: flex;
      justify-content: flex-start;
    }
    .left{
      width:50%;
    }
    .right{
      width: 50%;
    }
    .show{
      padding:0 50px;
    }
    .show p{
      font-size: 14px;
      display: flex;
      justify-content: flex-start;
    }
    .show p img{
        width:50%;
        height:500px;
        padding: 10px 20px;
    }
    .showRight{
      height:661px;
      padding:80px 150px;
    }
    .showRight img{
        width:330px;
        height:330px;
    }
    .footer{
      margin-top: -30px;
    }
  </style>
</head>
<body>
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
<div class="content">
  <div class="left">
    <div class="jumbotron">
      <div class="show">
        <h3>APP下载</h3>
        <p>通过APP，您可以查看实时数据，历史走势折线图等信息，同时，乐意修改个人信息，对设备进行添加、删除操作。也可以设置服务器IP，实现不同局域网内数据联通。</p>
        <p>收到相关的预警，预测通知，对及时获取设备的最新状态</p>
        <p>
          <img src="../images/app1.png"/>
          <img src="../images/app2.png">
        </p>
      </div>
    </div>
  </div>
  <div class="right">
    <div class="jumbotron">
      <div class="showRight">
        <div style="margin: 30px 90px;">
          <button class="btn btn-default">Android下载</button>
        </div>
        <div>
          <img src="../images/homePage-2DCode.png">
        </div>
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
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../common.js"></script>
<script>
  $(function() {
//    userId = '4657c0733c5048a79e7555574a1dc564';
    var userId = getCookie("userId");
    if (userId) {
      $('.logined').css('display', 'inline-block');
      $('.unlogin').css('display', 'none');
    } else {
      $('.unlogin').css('display', 'inline-block');
      $('.logined').css('display', 'none');
    }
  })
</script>
</body>
</html>