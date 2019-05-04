<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>个人资料</title>
    <link href="../Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/userDocument.css"/>
    <link rel="stylesheet" href="../css/headerAndFooter.css">
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
   <div class="title">
       <div class="text">个人资料</div>
       <div class="edit">
           <a class="button">编辑</a>
           <a class="button" id="quitAccount" style="width: 120px;">退出当前账号</a></div>
   </div>
   <form id="form">
       <div class="form-row">
           <h3>基本信息</h3>
           <hr style="color: #DDE2E6"/>
       </div>
       <div class="form-row">
           <label>用户名：</label>
           <div class="d">
               <span id="showName"></span>
               <a id="changePassword">&emsp;修改密码</a>
           </div>
       </div>
       <div class="form-row" style="height: 30px">
           <label>联系电话：</label>
           <div class="d">
               <span id="showPhone">无</span>
           </div>
           <input type="hidden" name="phone" id="phone"/>
       </div>
       <label class="error"></label>

       <div class="form-row" style="height: 30px">
           <label>邮箱：</label>
           <div class="d">
               <span id="showEmail">无</span>
           </div>
           <input type="hidden" name="email" id="email"/>
       </div>
       <!--<input type="hidden" name="password" id="password"/>-->
       <label class="error"></label>

       <div id="buttonContainer">
           <span class="submitButton">提交</span>
           <span class="cancelButton">取消</span>
       </div>
   </form>

   <div class="changePassword">
       <form id="changePasswordForm">
           <h2 style="text-align: center">修改密码</h2>
           <div class="row">
               <span class="label">旧密码：</span>
               <input id='oldPW' name="oldPw" type="password" placeholder="请输入原始密码"/>
           </div>
           <div class="row">
               <span class="label">新密码：</span>
               <input type="password" id="newPw" name="newPW" placeholder="请输入新密码"/>
           </div>
           <div class="row">
               <span class="label">新密码：</span>
               <input type="password" id='confirmPw' name='confirmPW' placeholder="请确认新密码"/>
           </div>

           <div class="button">
               <span id="changePasswordSubmit">提交</span>
               <span id="changePasswordCancel">取消</span>
           </div>
       </form>
   </div>
</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.validate.min.js"></script>
<script src="../common.js"></script>
<script src="../js/userDocument.js"></script>
</body>
</html>