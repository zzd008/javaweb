<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<!-- css 、js脚本-->
	<title>Travels | 关于</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet"> 
	<link href="http://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
	</script> 
</head>
<body>
	<!-- 设置顶部导航栏点击变色 -->
	<c:if test="${!empty page }">
		<%
			session.removeAttribute("page");
			session.setAttribute("page", 4);
		%>
	</c:if>
	<c:if test="${empty page }">
		<%
			session.setAttribute("page", 4);
		%>
	</c:if>
		
	<!-- 头部 -->
	<div class="banner about-banner">
	<c:if test="${empty userlogin}">
			<%@ include file="top.jsp" %>
		</c:if>
		<c:if test="${!empty userlogin}">
			<%@ include file="top1.jsp" %>
		</c:if>
	<div class="clearfix"> </div>
		<div class="clearfix"> </div>
		<div class="w3ls-heading">
			<h2>网站介绍</h2>	
		</div>
	</div>
	
	<!-- 介绍1 -->
	<div class="about">
		<!-- about-top -->
		<div class="agileits-about-top">
			<div class="container">
				<div class="agileits-about-top-heading">
					<h3>Travels</h3>
				</div>
				<div class="agileinfo-top-grids">
					<div class="col-sm-4 wthree-top-grid" style="margin-left: 380px">
						<center>
						<h4>回忆这东西，容易消逝。</h4>
							<p>Recall this thing is easy to forget</p>
						<h4>&nbsp;&nbsp;要与友分享，才会历久弥新。</h4>
							<p>Only to share with friends,it can be timeless</p>
						</center><br><br>
						<div style="width: 100%;margin-left: 420px;margin-bottom: -30px"><h4>一一致力于热爱旅行并乐于分享的你。</h4></div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		
		<!-- 介绍2 -->
		<div class="jarallax w3-agileits-choose">
			<div class="container">
				<div class="agileits-about-top-heading agileits-w3layouts-choose-heading">
					<h3>为什么加入Travels?</h3>
				</div>
				<div class="agile-choose-grids">
					<div class="col-sm-4 agile-choose-grid">
						<div class="choose-icon">
							<i class="fa fa-user" aria-hidden="true"></i>
						</div>
						<div class="choose-info">
							<br>
							<h4>超多的攻略分享</h4>
						</div>
					</div>
					<div class="col-sm-4 agile-choose-grid">
						<div class="choose-icon">
							<i class="fa fa-cogs" aria-hidden="true"></i>
						</div>
						<div class="choose-info">
							<br>
							<h4>超赞的旅游推荐</h4>
						</div>
					</div>
					<div class="col-sm-4 agile-choose-grid">
						<div class="choose-icon">
							<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
						</div>
						<div class="choose-info">
							<br>
							<h4>超好的用户口碑</h4>
						</div>
					</div>
				</div>	
			</div>
		</div>

	<!-- 团队 -->
		<div class="team">
			<div class="container">
				<div class="agileits-about-top-heading">
					<h3>我们的团队</h3>
				</div>
				<div class="team-grids">
						<div class="col-sm-4 team-grid">
							<div class="ih-item circle effect10 bottom_to_top">
								<div class="img"><img src="ourteam/1.jpg" alt="img"></div>
								<div class="info">
									<h3>周致达</h3>
									<div class="team-icons">
										<ul>
											<li><i style="color:white">旅行者 1号</i></li>
										</ul>
									</div>
								</div>
							</div>
							<div align="center" style="display:none"><font color="#337AB7" size="5" face="黑体">one</font></div>
						</div>
						<div class="col-sm-4 team-grid">
							<div class="ih-item circle effect10 bottom_to_top">
								<div class="img"><img src="ourteam/2.jpg" alt="img"></div>
								<div class="info">
									<h3>喻钰坤</h3>
									<div class="team-icons">
										<ul>
											<li><i style="color:white">旅行者 2号</i></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 team-grid">
							<div class="ih-item circle effect10 bottom_to_top">
								<div class="img"><img src="ourteam/3.jpg" alt="img"></div>
								<div class="info">
									<h3>郑明峰</h3>
									<div class="team-icons">
										<ul>
											<li><i style="color:white">旅行者 3号</i></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 team-grid">
							<div align="center"><br></div>
							<div class="ih-item circle effect10 bottom_to_top">
								<div class="img"><img src="ourteam/4.jpg" alt="img"></div>
								<div class="info">
									<h3>周龙喜</h3>
									<div class="team-icons">
										<ul>
											<li><i style="color:white">旅行者 4号</i></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 team-grid">
							<div align="center"><br></div>
							<div class="ih-item circle effect10 bottom_to_top">
								<div class="img"><img src="ourteam/5.jpg" alt="img"></div>
								<div class="info">
									<h3>张涛</h3>
									<div class="team-icons">
										<ul>
											<li><i style="color:white">旅行者 5号</i></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 team-grid">
							<div align="center"><br></div>
							<div class="ih-item circle effect10 bottom_to_top">
								<div class="img"><img src="ourteam/6.jpg" alt="img"></div>
								<div class="info">
									<h3>韩志文</h3>
									<div class="team-icons">
										<ul>
											<li><i style="color:white">旅行者 6号</i></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		
	<!-- 尾部-->
	<%@ include file="bottom.jsp" %>
	
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<script src="js/jarallax.js"></script>
	<script type="text/javascript">
			$('.jarallax').jarallax({
				speed: 0.5,
				imgWidth: 1366,
				imgHeight: 768
			})
	</script>
</body>	
</html>