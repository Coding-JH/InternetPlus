<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

	<head>
		<meta charset="UTF-8">
		<title>增删查改</title>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="../js/highcharts.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/vue.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			/*导航栏*/
			
			html,
			body {
				height: 100%;
			}
			
			body {
				/*overflow: hidden;*/
			}
			
			* {
				padding: 0;
				margin: 0;
			}
			
			.mainpage {
				height: 100%;
			}
			
			.header {
				position: fixed;
				width: 100%;
				height: 70px;
				line-height: 70px;
				background: #2A9F96;
				opacity: 1;
				padding: 0;
				z-index: 1;
				min-width: 1200px;
			}
			/*logo*/
			
			.header .logo {
				display: inline-block;
				margin-left: 40px;
				margin-right: 30px;
				padding: 0;
				width: 81px;
				height: 100%;
				vertical-align: top;
			}
			
			.header .items {
				display: inline-block;
				font-size: 16px;
				height: 100%;
				box-sizing: border-box;
				margin: 0 20px;
				cursor: pointer;
				color: white;
				text-decoration: none;
				vertical-align: top;
			}
			
			.header .items:hover {
				color: yellow;
			}
			/*未登录*/
			
			.header .unlogin {
				margin-left: 50%;
				display: none;
			}
			/*登录和注册按钮*/
			
			.header .unlogin a {
				display: inline-flex;
				display: -webkit-inline-flex;
				width: 50px;
				height: 25px;
				border-radius: 25px;
				background-color: #FCFCFD;
				color: #2A9F90;
				justify-content: center;
				align-items: center;
				text-decoration: none;
				font-size: 16px;
				cursor: pointer;
				font-weight: bold;
				margin-right: 15px;
			}
			
			.header .unlogin a:hover {
				background-color: lightgrey;
			}
			/*已登录*/
			
			.header .logined {
				display: inline-block;
				margin-left: 47%;
			}
			
			.logined a {
				text-decoration: none;
				cursor: pointer;
				color: #FCFCFD;
			}
			/*开发者中心按钮*/
			
			.logined .developerBtn {
				display: inline-flex;
				display: -webkit-inline-flex;
				width: 100px;
				height: 30px;
				justify-content: center;
				align-items: center;
				font-size: 16px;
				border-radius: 25px;
				border: solid 2px #FCFCFD;
				right: 50px;
				top: 20px;
				position: absolute;
			}
			
			.logined .developerBtn:hover {
				background-color: lightgrey;
			}
			/*消息提示按钮*/
			
			.logined .bell {
				font-size: 20px;
				margin-right: 20px;
			}
			
			.logined .bell:hover {
				color: yellow;
			}
			/*个人中心*/
			
			.logined .user {
				font-size: 25px;
			}
			
			.logined .user:hover {
				color: yellow;
			}
			/*底部*/
			
			.footer {
				min-width: 1200px;
				margin-top: 100px;
				background-color: #2A9F90;
				color: #FCFCFD;
				width: 100%;
				display: flex;
				display: -webkit-flex;
				box-sizing: border-box;
				justify-content: space-around;
			}
			
			.footer h2 {
				margin-top: 60px;
				margin-bottom: 10px;
				font-size: 20px;
			}
			
			.footer a {
				font-size: 16px;
				display: block;
				text-decoration: none;
				color: lightgrey;
				margin-top: 15px;
			}
			
			.footer a:hover {
				color: #FCFCFD;
			}
			
			.nav_left {
				position: fixed;
				float: left;
				width: 15%;
				padding-bottom: 9999px;
				background-color: rgba(42, 159, 150, 0.8);
			}
			
			.oneLevel {
				display: inline-block;
				width: 160px;
				line-height: 32px;
				cursor: pointer;
				;
				text-align: center;
			}
			
			.oneLevel>span {
				margin-left: 10px;
			}
			
			.oneLevelList {
				display: none;
			}
			
			ul li {
				list-style-type: none;
				line-height: 60px;
			}
			
			.selected {
				background-color: rgb(42, 155, 159);
			}
			
			ul li a {
				color: #fff;
				text-decoration: none;
			}
			
			.oneLevelList ul li {
				position: absolute;
				padding-left: 30px;
				line-height: 30px;
			}
			
			.nav_right {
				position: relative;
				float: left;
				width: 85%;
				height: 100%;
				left: 15%;
				background-color: rgb(245, 246, 247);
			}
			
			.nav_right .middle_shebeigailan .table_shebei {
				position: relative;
				top: 70px;
				left: 8%;
				height: 160px;
				background-color: #fff;
				overflow: hidden;
			}
			
			.middle_shebeigailan .table_shebei .td_data {
				display: inline-block;
				width: 24%;
				height: 100%;
				padding-top: 20px;
				border-right: solid 1px gainsboro;
				text-align: center;
			}
			
			.middle_shebeigailan .table_shebei .td_data:last-child {
				border: none;
			}
			
			.data {
				padding-top: 60px;
			}
			
			.main_chart {
				position: relative;
				top: 100px;
				left: 8%;
				width: 85%;
				height: 360px;
				background-color: #fff;
				background-color: rgb(245, 246, 247);
				border: 1px solid black;
			}
			
			.barChart,
			.sectorChart {
				display: inline-block;
				width: 45%;
				background-color: white;
				height: 80%;
				margin: 1.5% 1.5% 1.5% 2.5%;
			}
		</style>
	</head>

	<body>
		<div class="mainpage">
			<!--我是开发者中心的增删查改-->
			<nav class="header">
				<img class="logo" src="../images/homePage-logo.png" />
				<!--logo-->
				<a class="items" href="homePage.html">首页</a>
				<a class="items" href="equipmentExplore.html">产品开发</a>
				<a class="items" href="userHelp.html">设备管理</a>
				<a class="items" href="userHelp.html">费用中心</a>

				<div class="unlogin">
					<a id="registerBtn" href="register.html">注册</a>
					<a id="loginBtn" href="login.html">登录</a>
				</div>

				<div class="logined">
					<a class="developerBtn" href="equipmentList.html" style="right:200px">我的设备</a>
					<a class="developerBtn" href="userManage.html">开发者中心</a>
					<a class="icon-bell bell" href="newMessage.html"></a>
					<a class="icon-user user" href="userDocument.html"></a>
				</div>
			</nav>
			<!--</header>-->
			<div class="nav_left">
				<ul id="menuDiv" class="bMenuList">
					<li class="bMenuTitle selected">
						<span class="oneLevel"><a href="#">设别概览</a></span>
					</li>
					<li class="bMenuTitle"><span class="oneLevel"><a href="#">设别列表</a></span>
					</li>
					<li class="bMenuTitle"><span class="oneLevel"><a href="#">机卡管理</a></span>
						<ul class="oneLevelList" id="sub3">
							<li style="font-size: 14px;padding-left: 60px;line-height: 30px;">
								<a href="#">机卡列表</a>
							</li>
							<li style="font-size: 14px;padding-left: 60px;line-height: 30px;">
								<a href="#">EC绑定</a>
							</li>
						</ul>
					</li>
					<li class="bMenuTitle"><span class="oneLevel"><a href="#">位置能力</a></span>
					</li>
				</ul>
			</div>
			<div class="nav_right">
				<div class="middle_shebeigailan" id="shebei">
					<p>设备概览</p>
					<div class="table_shebei" style="width: 85%;">
						<div class="td_data">
							<p>设备总数（台)</p>
							<p class="data">{{message1}}次</p>
						</div>
						<div class="td_data">
							<p>今天API调用（次）</p>
							<p class="data">{{message2}}次</p>

						</div>
						<div class="td_data">
							<p>今天推送调用（次）</p>
							<p class="data">{{message3}}次</p>
						</div>
						<div class="td_data">
							<p>今天下发命令（次）</p>
							<p class="data">{{message4}}次</p>
						</div>
					</div>
				</div>
				<div class="main_chart">
					<div class="sectorChart ">
						
					</div>
					<div class="barChart container1 dfg">
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$('.bMenuTitle').on('click', function() {
					$('.bMenuTitle').removeClass("selected");
					$(this).children('ul').slideDown();
					$(this).siblings().children('ul').slideUp();
					$(this).addClass("selected");
				})

			});
			var devies = new Vue({
				el: "#shebei",
				data: {
					message1: Math.floor(Math.random() * 1000),
					message2: Math.floor(Math.random() * 1000),
					message3: Math.floor(Math.random() * 1000),
					message4: Math.floor(Math.random() * 1000)
				}
			})
			//数据展示——曲线统计图
			var datas = [],
				names = ["temperature", "活跃", "speed", "direction", "rainfall", "isRain", "mq135", "mq2", "humidity", "pressure", "altitude", "voltage", "pitch", "roll", "yaw"];
			var cname = ['温度传感器(℃)', '设备数', '风速传感器(m/s)',
				'风向传感器', '风向传感器', '是否下雨传感器', '有害气体传感器(Nm3/h)',
				'烟雾传感器(Nm3/h)', '湿度传感器(%RH)', '大气压强传感器(Pa)', '海拔高度传感器(m)'
			]
			$(".dfg").ready(function() {
				var chart = {
					type: 'spline',
					animation: Highcharts.svg, // don't animate in IE < IE 10.
					marginRight: 10,
					marginTop: 60,
					events: {
						load: function() {
							// set up the updating of the chart each second
							var series = this.series[0];
							//console.log(series);
							setInterval(function() {
								$.ajax({
									//url: "http://47.100.6.42/electric/get_data.php",
									type: 'post',
									dataType: "json",
									async: false,
									cache: false,
									success: function(res) {
										console.log(res);
										for(var k = 0; k < res.length; i++) {
											var nn = res[k].split("");
											var len = res[k].split("").length;
											for(var j = 0; j < len; j++) {
												if(res[k].split("")[j] == ':') {
													var dd = nn.slice(j + 1, len).join('');
													datas.push(dd);
													break;
												}
											}
										}
										var x = (new Date()).getTime();
										var y = Number(datas[0]);
										series.addPoint([x, y], true, true);
									}
								});
							}, 1000);
						}
					}
				};
				var xAxis = {
					title: {
						text: '时间'
					},
					type: 'datetime',
					tickPixelInterval: 150 //横轴的间距
				};
				var yAxis = {
					title: {
						text: '活跃设备数/台'
					},
					plotLines: [{
						value: 0,
						width: 3,
						color: '#808080' //横轴的线颜色
					}]
				};
				//标注
				var tooltip = {
					formatter: function() {
						//console.log(this.x);
						return '<b>' + this.series.name + '</b><br/>' +
							Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
							Highcharts.numberFormat(this.y, 2);
					}
				};
				//以平滑的曲线展现
				var plotOptions = {
					area: {
						pointStart: 1940,
						marker: {
							enabled: false,
							symbol: 'circle',
							radius: 2,
							states: {
								hover: {
									enabled: true
								}
							}
						}
					}
				};
				var legend = {
					enabled: false
				};
				var credits = {
					enabled: false
				};
				var exporting = {
					enabled: false
				};

				for(var i = 0; i < 2; i++) {
					var title = {
						//text: 'Live random data'
						text: names[i] + cname[i]
					};
					var series1 = [{
						name: 'Random data',
						data: (function() {
							// generate an array of random data
							var data = [],
								time = (new Date()).getTime(),
								i;
							for(j = -6; j <= 0; j += 1) { //代表有多少个点
								data.push({
									x: time + j * 1000,
									y: (Math.random() * (1.1 - 1) + 1) * 20
								});
							}
							return data;
						}())
					}];
					var series2 = [{
						name: 'Random data',
						data: (function() {
							// generate an array of random data
							var data = [],
								time = (new Date()).getTime(),
								i;
							for(j = -6; j <= 0; j += 1) { //代表有多少个点
								data.push({
									x: time + j * 1000,
									y: (Math.random() * (1.09 - 1) + 1) * 400
								});
							}
							return data;
						}())
					}];
					var json = {};
					json.chart = chart;
					json.title = title;
					json.tooltip = tooltip;
					json.xAxis = xAxis;
					json.yAxis = yAxis;
					json.legend = legend;
					json.exporting = exporting;
					json.series = (i == 0) ? series1 : series2;
					json.plotOptions = plotOptions;
					json.credits = credits;
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
					$('.container' + i).highcharts(json);
				}

			});
		</script>

	</body>

</html>