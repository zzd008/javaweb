<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	<!-- css、js脚本 -->
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet"> 
	<link href="http://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
	
		<div class="header">
			<div class="container">
				<div class="header-left">
					<div class="w3layouts-logo">
						<h1>
							<a href="index.jsp">Travels</a>
						</h1>
					</div>
				</div>
				<div class="header-right">
				<div class="w3-header-top">
						<ul>
							<li><i class="fa fa-phone5" aria-hidden="true"></i></li>
							<li><i class="fa fa-envelope5" aria-hidden="true"></i></li>
						</ul>
					</p>
					</div>
					<div class="w3-header-bottom">
						<div class="top-nav">
							<nav class="navbar navbar-default">
									<div class="navbar-header">
										<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
											<span class="sr-only">Toggle navigation</span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
											<span class="icon-bar"></span>
										</button>
									</div>
								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="padding-right: 60px">
									<ul class="nav navbar-nav">
										<li><a ${page==1 ? "class='active'" : ""} href="index.jsp" onclick="">主页</a></li>
										<li><a ${page==2 ? "class='active'" : ""} href="tips.jsp">攻略</a></li>
										<li><a ${page==3 ? "class='active'" : ""} href="views.jsp">景点</a></li>
										<li><a ${page==4 ? "class='active'" : ""} href="about.jsp">About</a></li>
										<li>&nbsp;</li>
										<li>&nbsp;</li>
										<li>&nbsp;</li>
									</ul>	
									<div class="clearfix"> </div>
								</div>	
							</nav>		
						</div>
						<div class="agileinfo-social-grids">
							<ul>
								<c:if test="${empty userlogin}">
									<li><a href="login.jsp"><i class="fa fa-twitter">登录</i></a></li>
									<li><a href="regist.jsp"><i class="fa fa-rss">注册</i></a></li>
									<li><a href="manager/login.jsp"><i class="fa fa-vk">后台</i></a></li>
								</c:if>
								<c:if test="${!empty userlogin}"><!-- 注销后返回首页 -->
									<li><a href="myinfo.jsp"><i class="fa fa-twitter">${userlogin.username }</i></a></li>
									<li><a href="writetip.jsp"><i class="fa fa-rss">写攻略</i></a></li>
									<li><a href="index.jsp?userflag=0"><i class="fa fa-rss">退出</i></a></li>
						</c:if>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
		</div>
	</div>
