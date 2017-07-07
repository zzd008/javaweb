<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travels | 攻略</title>
	<!-- css、js脚本 -->
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
	<script src="js/getxmlreq.js"></script>
</head>

<body>
	<!-- 设置顶部导航栏点击变色 -->
	<c:if test="${!empty page }">
		<%
			session.removeAttribute("page");
			session.setAttribute("page", 2);
		%>
	</c:if>
	<c:if test="${empty page }">
		<%
			session.setAttribute("page", 2);
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
			<h2>热门攻略</h2>	
		</div>
	</div>
	
	<!-- 攻略列表 -->
	<div class="about">
		<!-- about-top -->
		<div class="agileits-about-top">
			<div class="container">
				<div class="agileits-about-top-heading">
					<h3>攻略排行</h3>
				</div>
				<div class="agileinfo-top-grids">
					<c:forEach items="${TipsTopInfo }" varStatus="tp" var="t">
							<div class="col-sm-4 wthree-top-grid" style="height:500px; width:33.33%" >
								<img src=${t.image } alt=""  height="230px" width="350px"/>
								<h4>${t.captain } <c:if test="${tp.index%2==0}">&nbsp;&nbsp;<span class="label label-success">毕业</span></c:if> </h4>
								<p>${t.content }<a href="ShowTip?tipid=${t.id }" style="text-decoration:none"><span class="label label-primary">查看更多</span>&nbsp;&nbsp;</a><span class="label label-info">阅读量：${t.readcount }</span></p><!-- 取消链接下划线 -->
								<br>
							</div>
					</c:forEach>
					<c:if test="${TipsTopInfoCount<6}"><!-- 隐藏框 填充-->
						<c:forEach var="i" begin="${TipsTopInfoCount}" end="5">
							<div class="col-sm-4 wthree-top-grid" style="height:500px; width:33.33%" >
								<div height="230px" width="350px"></div>
								<h4></h4>
								<p><a href=></a></p>
								<br>
							</div>
						</c:forEach>
					</c:if>
					<div align="center"> <!-- 分页导航条 -->
						<ul class="pagination pagination-lg">
							<font size=5> ${pagebar }</font>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="jarallax newsletter">
			<div class="container">
				<div class="w3l-heading newsletter-heading">
					<h3>攻略搜索</h3>
				</div>
			</div>
			<div class="w3-agileits-newsletter">
				<div class="subscribe-grid">
					<form action="SearchTip" method="post">
						<input type="text" placeholder="请输入目的地" name="label" required="">
						<button class="btn1"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
					</form>
				</div>
			</div>
		</div>
		
	<!-- 尾部 -->
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
