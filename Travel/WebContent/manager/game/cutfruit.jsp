<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 玩游戏</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="A simple HTML5 Template">
	<meta name="author" content="dron">
	<meta name="viewport" content="width=device-width, height=device-height, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="stylesheet" href="images/index.css">
	<!-- css、js样式 -->
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link rel="stylesheet" href="../css/bootstrap.min.css" >
	<link href="../css/style.css" rel='stylesheet' type='text/css' />
	<link href="../css/style-responsive.css" rel="stylesheet"/>
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="../css/font.css" type="text/css"/>
	<link href="../css/font-awesome.css" rel="stylesheet"> 
	<link rel="stylesheet" href="../css/morris.css" type="text/css"/>
	<!-- calendar -->
	<link rel="stylesheet" href="../css/monthly.css">
	<!-- //calendar -->
	<script src="../js/jquery2.0.3.min.js"></script>
	<script src="../js/raphael-min.js"></script>
	<script src="../js/morris.js"></script>
</head>
<body>
	<section id="container">
		<!--头部-->
		<%@ include file="../top1.jsp" %>		
		<!--左侧栏-->
			  <aside>
			    <div id="sidebar" class="nav-collapse">
			        <!-- 侧面导航栏-->
			        <div class="leftside-navigation">
			            <ul class="sidebar-menu" id="nav-accordion">
			                <li>
			                    <a class="active" href="../index.jsp">
			                        <i class="fa fa-dashboard"></i>
			                        <span>网站概览</span>
			                    </a>
			                </li>
			                <li class="sub-menu">
			                    <a href="javascript:;">
			                        <i class="fa fa-book"></i>
			                        <span>主页</span>
			                    </a>
			                    <ul class="sub">
									<li><a href="../notachieve.jsp">滑动图</a></li>
			                        <li><a href="../indexmiddle.jsp">热门旅游地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check text-success text-active"></i></a></li>
			                        <li><a href="../notachieve.jsp">Travels推荐</a></li>
			                        <li><a href="../notachieve.jsp">城市旅游热度</a></li>
			                    </ul>
			                </li>
			                <li class="sub-menu">
			                    <a href="javascript:;">
			                        <i class="fa fa-th"></i>
			                        <span>攻略</span>
			                    </a>
			                    <ul class="sub">
									<li><a href="../tipscheck.jsp">攻略管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check text-success text-active"></i></a></li>
			                    </ul>
			                </li>
			
			                <li class="sub-menu">
			                    <a href="javascript:;">
			                        <i class="fa fa-th"></i>
			                        <span>景点</span>
			                    </a>
			                    <ul class="sub">
			                        <li><a href="../notachieve.jsp">管理国内景点</a></li>
			                        <li><a href="../notachieve.jsp">管理国内景点</a></li>
			                    </ul>
			                </li>
			                <li class="sub-menu">
			                    <a href="javascript:;">
			                        <i class=" fa fa-bar-chart-o"></i>
			                        <span>地图</span>
			                    </a>
			                    <ul class="sub">
			                        <li><a href="../map.jsp">国内地图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check text-success text-active"></i></a></li>
			                        <li><a href="../worldmap.jsp">世界地图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check text-success text-active"></i></a></li>
			                    </ul>
			                </li>
			                <li class="sub-menu">
			                    <a href="javascript:;">
			                        <i class="fa fa-tasks"></i>
			                        <span>玩游戏</span>
			                    </a>
			                    <ul class="sub">
			                        <li><a href="../game/cutfruit.jsp">切水果&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check text-success text-active"></i></a></li>
			                    </ul>
			                </li>
			                <li class="sub-menu">
			                    <a href="javascript:;">
			                        <i class="fa fa-envelope"></i>
			                        <span>空 </span>
			                    </a>
			                    <ul class="sub">
			                        <li><a href="#">空</a></li>
			                        <li><a href="#">空</a></li>
			                        <li><a href="#">空</a></li>
			                    </ul>
			                </li>
			                <li>
			                    <a href="../login.jsp?managerflag=1">
			                        <i class="fa fa-user"></i>
			                        <span>注销</span>
			                    </a>
			                </li>
			            </ul>            
			         </div>
			    </div>
			</aside>
		<!--主页面-->
		<section id="main-content">
			<section class="wrapper">
				<div id="extra"></div>
					<em> -- Fruit Ninja -- </em>
					<em> The game is developed by the Baidu JS team, </em>
					<em> we provide the source in git: https://github.com/ChineseDron/fruit-ninja </em>
					<em> follow me on weibo http://weibo.com/baidujs </em>
					<em> or learn more, to see http://tangram.baidu.com </em>
					<canvas id="view" width="640" height="480"></canvas>
					
					<div id="desc">
					<div style="text-align:center;clear:both;">
					<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
					<script src="/follow.js" type="text/javascript"></script>
					</div>
						<div>水果忍者</div>
						<div id="browser"></div>
					</div>
			</section>
	
		<!-- 尾部 -->
			<div class="footer" style="margin-top: 775px">
				<div class="wthree-copyright" align="center">
					<p>Copyright &copy; 2017.Teams 6518 All rights reserved.</p>
				</div>
			</div>
		</section>
		<!--主页面结束-->
	</section>
	
	
	<script src="scripts/all.js"></script>
	
	<script src="../js/bootstrap.js"></script>
	<script src="../js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../js/scripts.js"></script>
	<script src="../js/jquery.slimscroll.js"></script>
	<script src="../js/jquery.nicescroll.js"></script>
	<script src="../js/jquery.scrollTo.js"></script>
	<script>
		$(document).ready(function() {
		   jQuery('.small-graph-box').hover(function() {
			  jQuery(this).find('.box-button').fadeIn('fast');
		   }, function() {
			  jQuery(this).find('.box-button').fadeOut('fast');
		   });
		   jQuery('.small-graph-box .box-close').click(function() {
			  jQuery(this).closest('.small-graph-box').fadeOut(200);
			  return false;
		   });
		   
		    function gd(year, day, month) {
				return new Date(year, month - 1, day).getTime();
			}
			
			graphArea2 = Morris.Area({
				element: 'hero-area',
				padding: 10,
	        behaveLikeLine: true,
	        gridEnabled: false,
	        gridLineColor: '#dddddd',
	        axes: true,
	        resize: true,
	        smooth:true,
	        pointSize: 0,
	        lineWidth: 0,
	        fillOpacity:0.85,
				data: [
					{period: '2015 Q1', iphone: 2668, ipad: null, itouch: 2649},
					{period: '2015 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
					{period: '2015 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
					{period: '2015 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
					{period: '2016 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
					{period: '2016 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
					{period: '2016 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
					{period: '2016 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
					{period: '2017 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
				
				],
				lineColors:['#eb6f6f','#926383','#eb6f6f'],
				xkey: 'period',
	            redraw: true,
	            ykeys: ['iphone', 'ipad', 'itouch'],
	            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
				pointSize: 2,
				hideHover: 'auto',
				resize: true
			});
			
		   
		});
		</script>
		<script type="text/javascript" src="../js/monthly.js"></script>
		<script type="text/javascript">
			$(window).load( function() {
	
				$('#mycalendar').monthly({
					mode: 'event',
					
				});
	
				$('#mycalendar2').monthly({
					mode: 'picker',
					target: '#mytarget',
					setWidth: '250px',
					startHidden: true,
					showTrigger: '#mytarget',
					stylePast: true,
					disablePast: true
				});
	
			switch(window.location.protocol) {
			case 'http:':
			case 'https:':
			break;
			case 'file:':
			alert('Just a heads-up, events will not work when run locally.');
			}
	
			});
		</script>
</body>
</html>