<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>管理设备-电力通信的“全科医生”</title>
  <link href="../css/init.css" rel="stylesheet">
  <link href="../css/bootstrap.min.css" rel="stylesheet">
   <!--导航和底部样式-->
  <link href="../css/headerAndFooter.css" rel="stylesheet">
   <!--图标-->
  <link href="../Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
  <!-- jquery ui-->
  <link href="../css/jquery-ui.css" rel="stylesheet">
  <!-- multiselect-->
  <link href="../css/jquery.multiselect.css" rel="stylesheet">
  <!--主要写的css代码-->
  <link href="../css/default.css" rel="stylesheet" type="text/css" />
  <script src="http://webapi.amap.com/maps?v=1.3&key=b79caad469676224a0e32143ce5add02"></script>

  <!-- 地理位置-->
  <script type="text/javascript"
          src="https://webapi.amap.com/maps?v=1.4.2&key=e58bae199679e49544969133bc20896e&plugin=AMap.DistrictSearch"></script>
  <script type="text/javascript" src="https://webapi.amap.com/demos/js/liteToolbar.js"></script>
  <style>
    #map #mapShow{
      width:100%;
      height:530px;
      border:1px solid gray;
      position:relative;
      /*background: rgb(252,249,242);*/
      cursor: url("https://webapi.amap.com/theme/v1.3/openhand.cur"),default;
    }
    #table {width:100%; font-weight:lighter;table-layout:fixed;  font-size: 10px;margin-top: 10px;}
    td{
      white-space:nowrap; text-overflow:ellipsis;overflow: hidden;
    }
    #mid{
      vertical-align: middle;
    }
     #info{
       background: #f5f5f5;
       vertical-align: middle;
     }
    .t40{width:200px;text-align: center;}
    .t30{width:150px;text-align: center;}
    .t20{width:100px;text-align: center;}
    .t10{width:70px;text-align: center;}
    .tr1{background: #f2efef;color:#767676;height:40px;line-height: 30px;}
    .tr2{background: white;color:#767676;height:40px;line-height: 30px;}
    .map{
      margin: 0px;
      height:400px;
      width: 100%;
      border: 1px solid gray;
      position: relative;
      background: rgb(252, 249, 242);
      cursor: url("https://webapi.amap.com/theme/v1.3/openhand.cur"), default;
    }
    .panel{
      background-color: #fff;
      border: solid 1px silver;
      padding: 5px 10px;
      font-size: 14px;
      border-radius: 4px;
    }
    #deviceslist{
      font-size: small;
      /*overflow: auto;*/
    }
    .margin20_0{
      margin: 20px 0;
    }
    .margin10_0{
      margin: 10px 0 5px 0;
    }
    .realtime_table{
      font-size: 14px;
      font-weight:lighter;
      border: 2px solid grey;
    }
    .realtime_img{
      width:110px;
      height:110px;
      margin-left: 14px;
      border-radius: 10px;
    }
    .realtime_title{
      font-size: small;
      width:140px;
      text-align: center;
      margin-top: 4px;
    }
    #realtimedata .intro{
      text-align: center;
    }
    #edit_dataType{
      display: none;
    }
  </style>
</head>
<body>
  <header>
    <nav class="header navbar navbar-fixed-top">
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
<div class="container-fluid all">
  <div class="sidebar">
    <div class="manageDevices">
      <h3 style="text-align: center;">菜单列表</h3>
      <hr style="background:black;height:1px;"/>
    </div>
    <ul class="nav" role="tablist">
      <li role="presentation" class="active">
        <a href="#mydevices" aria-controls="mydevices" role="tab" data-toggle="tab">我的设备</a>
      </li>
      <li role="presentation">
        <a href="#mapmode" aria-controls="mapmode" role="tab" data-toggle="tab">地图模式</a>
      </li>
      <li role="presentation">
        <a href="#realtimedata" aria-controls="realtimedata" role="tab" data-toggle="tab">实时数据</a>
      </li>
      <li role="presentation">
        <a href="#statisticalanalysis"
           aria-controls="statisticalanalysis" role="tab" data-toggle="tab">统计分析</a>
      </li>
    </ul>
  </div>
  <div id="sideslip">
    <button type="button" class="navbar-toggle show pull-left" data-target="sidebar">
      <span class="glyphicon glyphicon-menu-hamburger"></span>
    </button>
  </div>
  <div class="maincontent row">
    <!--我是主要内容 start-->
    <div class="breadcrumb">
      <div class="tab-content">
        <!-- 我的设备-->
        <div role="tabpanel" class="tab-pane active" id="mydevices">
          <div>
            <!-- 我的设备 添加设备-->
            <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" class="active" style="font-size: 14px;">
                <a href="#deviceslist" aria-controls="deviceslist" role="tab" data-toggle="tab">我的设备</a>
              </li>
              <li role="presentation" style="font-size: 14px;">
                <a href="#adddevices" aria-controls="adddevices" role="tab" data-toggle="tab">添加设备</a>
              </li>
            </ul>
            <!-- content-->
            <div class="tab-content">
              <!-- 设备列表-->
              <div role="tabpanel" class="tab-pane active" id="deviceslist">
                <table id="table" cellpadding="0" cellspacing="0" class="table">
                  <thead>
                    <tr class="thead">
                      <td class="t30">设备ID</td>
                      <td class="t30">名称</td>
                      <td class="t20">创建时间</td>
                      <td class="t20">简介</td>
                      <td class="t40">操作</td>
                    </tr>
                  </thead>
                  <tbody class="showDevicesList"></tbody>
                  <script  type="text/jsrender" id="showDevicesList">
                    {{for equipments}}
                        <tr class="t1">
                          <td class="t30" id="mid">{{:equipmentId}}</td>
                          <td class="t30" id="mid">{{:name}}</td>
                          <td class="t20" id="mid">{{:createTime}}</td>
                          <td class="t30" id="info">{{:info}}</td>
                          <td class="t40">
                               <button class="btn btn-default btn-sm edit-device"  onclick=editDevice('{{:equipmentId}}',this)>编辑</button>
                               <button class="btn btn-default btn-sm show_dataTypes"  onclick=showDataTypes('{{:equipmentId}}',this)>查看传感器</button>
                               <input class="btn btn-default btn-sm" type="button" value="删除" onclick=deleteDevice('{{:equipmentId}}','{{:name}}',this)>
                          </td>
                         </tr>
                    {{/for}}
                  </script>
                </table>
                <!-- 分页-->
                <div class="page">
                  <div id="Pagination_mydevice" class="pagination"><!-- 这里显示分页 --></div>
                </div>
              </div>
              <!-- 添加设备-->
              <div role="tabpanel" class="tab-pane" id="adddevices">
                <div class="adddevice" style="font-size: 14px;padding:20px;font-weight: lighter;">
                  <form id="form1" method="post" >
                    <table width="100%" cellspacing="1" class="data">
                      <tbody>
                      <tr class="tr1">
                        <td>名称</td>
                        <td>
                          <input id="Name" name="name" size="50" type="text" value="" required>
                        </td>
                      </tr>
                      <tr class="tr1">
                        <td>上传图片</td>
                        <td>
                          <!--<input type="file" id="uploadImg" name="imgUrl" value="" onchange="selectImg(this)" required/>-->
                          <!--<img id="showImg" src=""/>-->
                          <!--<button class="frontBtn">上传图片</button>-->
                          <form >
                            <input type="file" class="front" name="image" multiple/>
                          </form>
                        </td>
                      </tr>
                      <tr class="tr2">
                        <td>介绍</td>
                        <td>
                          <textarea name="info" style="resize: none; width: 600px;height:100px;max-width: 600px;max-height: 100px;" required></textarea>
                        </td>
                      </tr>
                      <tr class="tr2">
                        <td>是否公开</td>
                        <td>
                          <input type="radio" name="isPublic" checked value="true" ><label>是</label>
                          <input type="radio" name="isPublic" value="false" ><label>否</label>
                        </td>
                      </tr>
                      <tr class="tr2">
                        <td>地理位置</td>
                        <td>
                          <input id="location_X" name="location_X" type="hidden" value="">
                          <input id="location_Y" name="location_Y" type="hidden" value="">
                          <div class = 'panel'>选择切换省市：<select open id = 'subDistricts'></select></div>
                          <div id="mapDiv" class="map" tabindex="0"></div>
                        </td>
                      </tr>
                      <tr class="tr1">
                        <td colspan="2" align="center" style="padding-top: 30px;">
                          <input type="button"  class="btn btn-default" value="保存" onclick="saveDevice()" >
                          <input type="button"  class="btn btn-default" value="取消" onclick="cancelAddDevice()" >
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </form>

                </div>

              </div>
            </div>
          </div>

        </div>
        <!-- 地图模式-->
        <div role="tabpanel" class="tab-pane" id="mapmode">
          <div id="map">
            <div id="mapShow"></div>
          </div>
        </div>
        <!-- 实时数据-->
        <div role="tabpanel" class="tab-pane" id="realtimedata">
          <!-- 各个设备实时数据-->
          <div id="realtimeDataList">
            <p style="text-align: center;margin:0 auto;">加载中，请稍后</p>
          </div>
        </div>
        <script id="theTmpl" type="text/x-jsrender">
          <ul class="realtime_list">
              {{for data}}
              <li>
                  <div class="margin20_0">
                      <table border="1" class="realtime_table">
                          <tr>
                              <td rowspan="2">
                                  <div class="margin10_0">
                                      <img src="../images/machineRoom-display1.png" alt="..." class="realtime_img" >
                                      <!--<img src={{:imgUrl}} alt="..." class="realtime_img" >-->
                                      <div class="realtime_title">
                                          <a href="dataEquipment.html?id={{:equipmentId}}" target="view_window">{{:name}}</a>
                                      </div>
                                  </div>
                              </td>
                              {{for list}}
                                <td class="t10">{{:name}}</td>
                              {{/for}}
                          </tr>
                          <tr>
                              {{for list}}
                                <td class="t10">{{:data}}<span style="font-size:8px;">  {{:unit}}</span></td>
                              {{/for}}
                          </tr>
                      </table>
                  </div>
              </li>
              {{/for}}
          </ul>
        </script>
        <!-- 统计分析-->
        <div role="tabpanel" class="tab-pane" id="statisticalanalysis">

        </div>
        <!-- 弹出的内容-->
        <div id="edit_device" title="设备设置" style="display: none;">
        </div>
        <script id="edit_device_data" type="text/x-jsrender">
            <div class="editdevice" style="font-size: 14px;padding:20px;font-weight: lighter;">
                  <form id="form_edit" method="post" >
                    <table width="100%" cellspacing="1" class="data">
                      <tbody>
                      <tr class="tr1">
                        <td>名称</td>
                        <td>
                          <input id="Name" name="name" size="50" type="text" value="{{:name}}" required>
                        </td>
                      </tr>
                      <tr class="tr2">
                        <td>介绍</td>
                        <td>
                          <textarea name="info" style="resize: none; width: 600px;height:100px;max-width: 600px;max-height: 100px;" required>{{:info}}</textarea>
                        </td>
                      </tr>
                      <tr class="tr2">
                        <td>是否公开</td>
                        <td>
                            <input type="radio" name="isPublic" {{if isPublic == "true"}} checked="checked" {{/if}} value="true"/><label>是</label>
                            <input type="radio" name="isPublic" {{if isPublic == "false"}} checked="checked" {{/if}} value="false"/><label>否</label>
                        </td>
                      </tr>
                      <tr class="tr2">
                        <td>地理位置</td>
                        <td>
                          <input id="location_X_edit" name="location_X" type="hidden" value="{{:location_X}}">
                          <input id="location_Y_edit" name="location_Y" type="hidden" value="{{:location_Y}}">
                          <div class = 'panel'>选择切换省市：<select open id = 'subDistricts_edit'></select></div>
                          <div id="mapDiv_edit" class="map" tabindex="0"></div>
                        </td>
                      </tr>
                      <tr class="tr1">
                        <td colspan="2" align="center" style="padding-top: 30px;">
                          <input type="button"  class="btn btn-default" value="保存" onclick="updateDevice('{{:equipmentId}}')" >
                        </td>
                      </tr>
                      </tbody>
                    </table>
                  </form>

                </div>
        </script>
        <div id="showDataTypes" title="传感器类型" style="display: none;">
          <div class="showDataTypes" style="font-size: 14px;padding:20px;font-weight: lighter;">
            <div id="getEquipmentId"></div>
            <script type="text/jsrender" id="getEquipmentId_js">
              <button type="button" class="btn btn-info" onclick=addDataTypes('{{:equipmentId}}')>添加</button>
            </script>
            <table width="100%" cellspacing="0" class="data" class="table table-striped">
              <thead>
              <tr class="thead">
                <td class="t30">传感器名称</td>
                <td class="t30">传感器类型</td>
                <td class="t30">传感器单位</td>
                <td class="t40">操作</td>
              </tr>
              </thead>
              <tbody id="showDataTypes_body"></tbody>
            </table>
          </div>
        </div>
        <script id="showDataTypes_Data" type="text/x-jsrender">
                {{for data}}
                  <tr class="t1">
                      <td class="t30" id="mid">
                        <span id="edit_name">{{:name}}</span>
                        <span id="e_name" style="display:none;">
                          <input type="text" name="name" style="width:80px"/>
                          <button class="eNameOk">确定</button>
                          <button class="eNameCancel">取消</button>
                        </span>
                      </td>
                      <td class="t30" id="mid">{{:dataType}}</td>
                      <td class="t30" id="mid">{{:unit}}</td>
                      <td class="t40">
                           <button class="btn btn-default btn-sm edit-device"  onclick=editDataType('{{:equipmentId}}','{{:id}}',this)>编辑</button>
                           <input class="btn btn-default btn-sm" type="button" value="删除" onclick=deleteDataType('{{:equipmentId}}','{{:id}}','{{:name}}',this)>
                      </td>
                   </tr>
                {{/for}}
        </script>
      </div>

    </div>
    <!--我是主要内容 end-->
  </div>
</div>
<a href="#top" id="goTop"><span class="glyphicon glyphicon-chevron-up"></span></a>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <!--平滑滚动到顶部库-->
  <script src="../js/jquery.scrolltopcontrol/scrolltopcontrol.js" type="text/javascript"></script>
  <!--主要写的jquery拓展方法-->
  <script src="../js/jquery.extend.js" type="text/javascript"></script>
  <script src="../js/jquery-ui.min.js"></script>
  <script src="../js/jquery.multiselect.js"></script>
  <!--主要写的js代码-->
  <script src="../js/default.js" type="text/javascript"></script>
  <!--使用json数据动态生成结构 ，，html模板引擎-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jsrender/0.9.90/jsrender.js"></script>
  <!--jqPaginator jquery分页插件-->
  <script src="../js/jqPaginator.js"></script>
  <script src="../common.js"></script>
<script src="../js/userManage.js"></script>
</body>
</html>