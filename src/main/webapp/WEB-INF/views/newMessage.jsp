<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- 公共样式-->
    <link href="../css/init.css" rel="stylesheet">
    <!--jquery-->
    <script src="../js/jquery.min.js"></script>
    <!-- bootstrap-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/bootstrap.min.js"></script>
    <link href="../Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/headerAndFooter.css">
    <title>消息中心</title>
    <link rel="stylesheet" href="../css/newMessage.css">
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

<div class="showMessage">
    <div class="content">
        <span class="glyphicon glyphicon-stop"></span>
        <span>消息提醒</span>
        <div class="showMessageData">
            <p style="text-align: center;margin:0 auto;">加载中，请稍后</p>
        </div>
    </div>
</div>
<script type="text/jsrender" id="showMessage">
    {{for}}
        <div class="news">
            您的设备  <a href="dataEquipment.html?id={{:equipmentId}}" target="view_window">{{:equipmentName}}</a>  {{:name}}数据为 {{:data}}{{:unit}}，处于<span style="color:red;">警戒状态</span>，请及时处理！
        <span class="news_time">{{:time}}</span>
        </div>
    {{/for}}
</script>
<script src="../js/jquery.min.js"></script>
<script src="../common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jsrender/0.9.90/jsrender.js"></script>
<script>
   $(function(){
       var userId = getCookie("userId");
       if(userId){
           $('.logined').css('display','inline-block');
           $('.unlogin').css('display','none');
       }else{
           $('.unlogin').css('display','inline-block');
           $('.logined').css('display','none');
       }
       var params = {};
       params.userId = userId;
       function showNews(){
           $.post(ip+'/equipment/findEData',params,function(json){
               if(json.type === "COMMON_SUC"){
                   var res = json.data;
                   var message = [];
                   $.each(res,function(index,obj){
                       var it = [];
                       $.each(obj.list,function(index,obj2){
                           switch (obj2.dataType){
                               case 'ele':
                                   if(obj2.data>=1){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'vol':
                                   if(obj2.data>=3.3){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'tem':
                                   if(obj2.data>=30){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'lev':
                                   if(obj2.data>=1){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'hum':
                                   if(obj2.data>=10){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'in_vol':
                                   if(obj2.data>=3.4){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'out_ele':
                                   if(obj2.data>=1){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'out_vol':
                                   if(obj2.data>=20){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                               case 'in_ele':
                                   if(obj2.data>=1){
                                       it.push({name:obj2.name,data:obj2.data,unit:obj2.unit,equipmentName:obj.name,equipmentId:obj.equipmentId,time:obj2.time});
                                   }
                                   break;
                           }
                       });
                       message.push(it);
                   });
                   var messageData = [];
                   for(var i=1;i<message.length;i++){
                       messageData = message[0].concat(message[i]);
                   }
                   var template1 = $.templates("#showMessage");
                   var htmlOutput1 = template1.render(message);
                   $(".showMessageData").html(htmlOutput1);
               }else if(json.type === "Equipment_REQ_ERROR"){
                   alert("设备请求参数错误！")
               }else if(json.type === "Equipment_FIND_ERROR"){
                   alert("设备信息查询失败！")
               }
           });
       }
       showNews();
       setInterval(showNews,1000);
   })
</script>
</body>
</html>