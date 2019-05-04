<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>数据可视化</title>
    <link rel="stylesheet" href="../css/init.css">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/headerAndFooter.css">
    <style>
        .content{
            margin: 50px 100px;
        }
        #containerId{
            padding-top: 30px;
            width:100%;
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
    <span class="glyphicon glyphicon-stop"></span>
    <span>数据展示</span>
    <div id="containerId"></div>
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
<!-- 折线绘制-->
<script src="../js/highcharts.js"></script>
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

        //绘制一个折线图
        $.getJSON("http://ot31wbk51.bkt.clouddn.com/wendu.txt",function(data){
            console.log(1)
            console.log(data);

            chart = new Highcharts.Chart({
                chart: {
                    renderTo: "containerId",

                    animation: false,
                    zoomType: 'x'
                },
                legend: {
                    enabled: false
                },
                title: {
                    text: ''
                },
                xAxis: {
                    type: 'datetime'
                },
                yAxis: {
                    title: {
                        text: "℃"
                    },

                    minorGridLineWidth: 0,
                    gridLineWidth: 1,
                    alternateGridColor: null
                },
                tooltip: {
                    formatter: function() {
                        return '' +
                                Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br><b>Value:' + getValue(this.y) + "℃" + '</b>';
                    }
                },
                plotOptions: {
                    spline: {
                        lineWidth: 2,
                        states: {
                            hover: {
                                lineWidth: 3
                            }
                        },
                        marker: {
                            enabled: false,
                            states: {
                                hover: {
                                    enabled: true,
                                    symbol: 'circle',
                                    radius: 3,
                                    lineWidth: 1
                                }
                            }
                        }

                    },
                    line: {
                        lineWidth: 1,
                        states: {
                            hover: {
                                lineWidth: 1
                            }
                        },
                        marker: {
                            enabled: false,
                            states: {
                                hover: {
                                    enabled: true,
                                    symbol: 'circle',
                                    radius: 3,
                                    lineWidth: 1
                                }
                            }
                        }

                    }
                },
                series: [{
                    data: data

                }],
                credits: {
                    enabled: false     //去掉highcharts网站url
                },
                exporting:{
                    enabled:false //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示
                },
                legend: {
                    enabled: false
                },
                navigation: {
                    menuItemStyle: {
                        fontSize: '10px'
                    }
                }
            });
        })
        function getValue(y){
            return y;
            if(y==1)
                return "关闭";
            else
                return y;
        }

    })
</script>
</body>
</html>