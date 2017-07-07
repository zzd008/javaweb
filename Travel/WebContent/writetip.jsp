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
	<link href="http://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/getxmlreq.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
	</script> 
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
			session.setAttribute("page", 2);
		%>
	</c:if>
	<c:if test="${empty page }">
		<%
			session.setAttribute("page", 2);
		%>
	</c:if>
		
	<!-- 进入这个页面要先登录 -->
	<c:if test="${empty userlogin}">
		<jsp:forward page="login.jsp"></jsp:forward>
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
	
	<div class="contact">
		<div class="container">
			<div class="agile-contact-form" align="center" style="margin-right: -500px;padding-left: 200px">
				<div class="col-md-6 contact-form-right">
					<div class="contact-form-top">
						<h3>write an article</h3>
					</div>
					<div class="agileinfo-contact-form-grid">
						<form action="AddTip" method="post" enctype="multipart/form-data">
							<input type="text" name="tipcaptain" placeholder="标题" required="" style="background-color: #FAF4D8;color:black">
							<input type="text" name="label" placeholder="攻略所在城市" required="" style="background-color: #FAF4D8;color:black">
							 <div class="form-group" style="margin-left: -420px">
							 	  <div style="margin-left: -205px"><font color="#503B42">上传图片</font></div><br>
	                              <input type="file" id="exampleInputFile" required="" name="image"><br>
	                         </div>
							<textarea name="tipcontent" placeholder="正文" required="" style="height: 400px;background-color: #FAF4D8;color:black"></textarea>
							<button class="btn1">发表</button>
						</form>
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