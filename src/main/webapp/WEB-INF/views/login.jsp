<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/register.css">
    <link rel="stylesheet" href="/static/js/jquery.min.js">
    <link rel="stylesheet" href="/static/js/common.js">
    <link rel="stylesheet" href="/static/js/jquery.validate.min.js">
</head>
<body>
<div class="formContainer">
    <h2 style="color: #2A9F96; text-align: center; font-family: '华文新魏'">电力通信的“全科医生”</h2>
    <form id="loginForm" method="post">
        <span class="loginTitle">账号登录</span>
        <a class="toRegister" href="<%=request.getContextPath()%>/user/regist">立即注册</a>
        <div class="formGroups">
            <span class="icon-user iconStyle"></span>
            <input class="info" type="text" name="name" id="name"
                   placeholder="请输入用户名"/>
        </div>
        <label></label>
        <div class="formGroups">
            <span class="icon-lock iconStyle"></span>
            <input class="info" type="password" name="password" id="password"
                   placeholder="请输入密码"/>
        </div>
        <label></label>
        <input class="confirmButton buttonStyle" type="button" value="登录"/>
        <input class="cancel buttonStyle" type="button" value="忘记密码" />
    </form>
</div>
<div id="cloud"></div>


<script>
    $(function () {
        var $validator = $("#loginForm").validate({
            rules: {
                name: {
                    required: true
                },
                password: {
                    required: true
                }
            },

            messages: {
                name: {
                    required: "请输入用户名"
                },
                password: {
                    required: "请输入密码"
                }
            },
            errorPlacement: function (error, element) {
                //error是错误提示元素span对象  element是触发错误的input对象
                //当通过验证时 error是一个内容为空的span元素
                error.appendTo(element.parent().next());
            }
        });

        $(".confirmButton").click(function () {
            if($validator.form()) {
                var dataInfo = $("#loginForm").serializeArray();

                var values={};
                $.each(dataInfo,function(i,val){
                    values[val.name] = val.value;
                });
//                removeCookie('userName');m
                console.log(values);
                $.post("/user/login", values, function (json) {
                    if(json.type === "COMMON_SUC") {
                        //cookie存储用户名，密码，用户ID
                        setCookie('userName',json.data.name,30);
                        setCookie('userPass',json.data.password,30);
                        setCookie('userId',json.data.id,30);
                        window.open("homePage.html",'_self');
                    }else if(json.type === "USER_NAME_EXIT"){
                        alert("用户名已存在");
                    }else if(json.type === "USER_LOGIN_ERROR"){
                        alert("用户名或密码错误");
                    }
                }, "json").fail(function(json){
                    alert("登录失败，请稍后再试");
                });
            } else {
                alert("信息填写不完整，再补充一下吧！");
            }
        });
    });
    //封装成函数
    //设置cookie
    function setCookie(name,value,iday){
        var oDate = new Date();
        oDate.setDate(oDate.getDate()+iday);
        document.cookie = name+'='+value+';expires='+oDate;
    }

    //读取cookie
    function getCookie(name){
        var arr = document.cookie.split('; ');
        for(var i=0;i<arr.length;i++){
            var arr2 = arr[i].split('=');
            if(arr2[0]==name){
                return arr2[1];
            }
        }
        return '';
    }
    //删除cookie
    function removeCookie(name){
        setCookie(name,"1",-1);
    }
</script>
</body>
</html>