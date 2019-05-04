<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/register.css">
</head>
<body>
<div class="formContainer">
    <h2 style="color: #2A9F96; text-align: center; font-family: '华文新魏'">电力通信的“全科医生”</h2>
    <form id="registerForm">
        <div class="formGroups">
            <span class="icon-user iconStyle"></span>
            <input class="info" type="text" name="name" id="username"
                   placeholder="请设置一个2-10位的用户名"/>
        </div>
        <label class="errorItems"></label>
        <div class="formGroups">
            <span class="icon-phone iconStyle"></span>
            <input class="info" type="text" name="phone" id="phoneNumber"
                   placeholder="请输入您的手机号码"/>
        </div>
        <label></label>
        <div class="formGroups">
            <span class="icon-envelope iconStyle"></span>
            <input class="info" type="text" name="email" id="email"
                   placeholder="请输入您的有效邮箱"/>
        </div>
        <label></label>
        <div class="formGroups">
            <span class="icon-lock iconStyle"></span>
            <input class="info" type="password" name="password" id="password"
                   placeholder="请设置一个6-15位的密码"/>
        </div>
        <label></label>
        <div class="formGroups">
            <span class="icon-pushpin iconStyle"></span>
            <input class="info" type="password" name="confirmPassword" id="confirmPassword"
                   placeholder="请确认密码"/>
        </div>
        <label></label>
        <input class="confirmButton buttonStyle" style="width:100%;margin: 0 auto;" type="button" value="立即注册"/>
    </form>
</div>
<div id="cloud"></div>

<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script src="/static/common.js"></script>
<script src="/static/js/register.js"></script>
</body>
</html>