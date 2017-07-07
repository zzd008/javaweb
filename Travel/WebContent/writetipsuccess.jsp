<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 写攻略</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="" />

	<!-- css 、js脚本-->
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet"> 
	<link rel="stylesheet" href="css/lightbox.css">
	<!-- font -->
	<link href="http://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
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

	<!-- 首页 -->
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
			<h2>分享你的攻略</h2>	
		</div>
	</div>
	
	<!-- 提示信息 -->
	<div class="contact">
		<div class="container">
			<div class="agile-contact-form" align="center" style="margin-right: -500px;padding-left: 200px">
				<div class="col-md-6 contact-form-right">
					<div class="contact-form-top">
						<font size=5 color="#F37739">${WriteTipInfo}</font>
					</div>
					<br><br>
					<div class="contact-form-top">
						<a href="writetip.jsp" style="text-decoration:none; " ><font size=4 color="#82B62D">继续写攻略</font></a>
					</div>
					<div class="agileinfo-contact-form-grid">
					
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	<!-- 尾部-->
	<%@ include file="bottom.jsp" %>
</body>
</html>