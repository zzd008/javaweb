<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 个人主页</title>
	<!-- css、js脚本 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- 进入这个页面要先登录 -->
<c:if test="${empty userlogin}">
	<jsp:forward page=""></jsp:forward>
</c:if>

<!-- 设置顶部导航栏点击变色  -->
	<c:if test="${!empty page }">
		<%
			session.removeAttribute("page");
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
			<h2>个人主页</h2>	
		</div>
	</div><br><br>
<!-- 个人信息 -->
	<div class="ih-item circle effect10 bottom_to_top" style="margin-left: 800px">
		<div class="img"><img src=${MyInfo.photo } alt="隐身了"></div>
			<div class="info">
				<h3>${MyInfo.username }</h3>
				<div class="team-icons">
					<ul>				
						<li><i style="color:white">欢&nbsp;迎&nbsp;&nbsp;!</i></li>
					</ul>												
				</div>
			</div>
	</div>	
	
	<div class="agileinfo-contact-form-grid" style="margin-left: 850px;">
		<form action="AddUserPhoto" method="post" enctype="multipart/form-data">
			<div class="form-group" >
	                  <input type="file" id="exampleInputFile" required="" name="image">
	         	</div>
					<button class="btn1">修改头像</button>
		</form>					
	</div>

	<div style="margin-left: 850px;margin-top: 80px;">
		<font size="5">ID:&nbsp;<span class="label label-warning">${MyInfo.username }</span></font>
	</div>
	<div style="margin-left: 800px;margin-top: 20px">
		<font size="5">您在<span class="label label-success">${MyInfo.registtime }</span>加入Travels</font>
	</div>
	<div style="margin-left: 800px;margin-top: 20px;margin-bottom: 50px"">
		<font size="5">您是Travels的第<span class="label label-info">${MyInfo.id }</span>位会员</font>
	</div>
	
	<div style="margin-left: 20px">
		<div class="container">
		<h3 style="margin-left: -50px">成功发表的攻略&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="writetip.jsp"><span class="label label-warning">去写攻略</span></a></h3>
				<div class="agileinfo-top-grids" style="margin-top: -10px" >
					<c:forEach items="${usertip2 }" varStatus="tp" var="t">
							<div class="col-sm-4 wthree-top-grid" style="height:500px; width:33.33%;margin-top: 60px" >
								<img src=${t.image } alt=""  height="230px" width="350px"/>
								<h4>${t.captain } <span class="label label-success">${t.label }</span></h4>
								<p>${t.content }<a href="ShowTip?tipid=${t.id }" style="text-decoration:none"><span class="label label-primary">查看更多</span>&nbsp;&nbsp;</a><span class="label label-info">阅读量：${t.readcount }</span></p><!-- 取消链接下划线 -->
								<br>
							</div>
					</c:forEach>
					<c:if test="${messagecount4}!=0">
						<c:if test="${messagecount4<6}"><!-- 隐藏框 填充-->
							<c:forEach var="i" begin="${messagecount4}" end="5">
								<div class="col-sm-4 wthree-top-grid" style="height:500px; width:33.33%;margin-top: 80px" >
									<div height="230px" width="350px"></div>
									<h4></h4>
									<p><a href=></a></p>
									<br>
								</div>
							</c:forEach>
						</c:if>
					</c:if>
					<div class="clearfix"> </div>
				</div>
		</div>
	</div>
	
		<c:if test="${messagecount4>3}">
			<div style="margin-left: 20px;margin-top: 40px">
		</c:if>
		<c:if test="${messagecount4<=3}">
			<div style="margin-left: 20px;margin-top:40px">
		</c:if>
		<div class="container">
		<h3 style="margin-left: -50px">待审核的攻略</h3>
				<div class="agileinfo-top-grids" style="margin-top: -50px">
					<c:forEach items="${usertip1 }" varStatus="tp" var="t">
							<div class="col-sm-4 wthree-top-grid" style="height:500px; width:33.33%;margin-top: 100px" >
								<img src=${t.image } alt=""  height="230px" width="350px"/>
								<h4>${t.captain } <span class="label label-success">${t.label }</span></h4>
								<p>${t.content }<span class="label label-default">审核后才可以查看</span>&nbsp;&nbsp;<span class="label label-info">阅读量：${t.readcount }</span></p><!-- 取消链接下划线 -->
								<br>
							</div>
					</c:forEach>
					<c:if test="${messagecount3}!=0">
						<c:if test="${messagecount3<3}"><!-- 隐藏框 填充-->
							<c:forEach var="i" begin="${messagecount3}" end="2">
								<div class="col-sm-4 wthree-top-grid" style="height:500px; width:33.33%;margin-top: 100px" >
									<div height="230px" width="350px"></div>
									<h4></h4>
									<p><a href=></a></p>
									<br>
								</div>
							</c:forEach>
						</c:if>
					</c:if>
					<div class="clearfix"> </div>
				</div>
		</div>
	</div>
<!-- 尾部 -->
	<div style="margin-top: 150px">
  		<%@ include file="bottom.jsp" %>
  	</div>

</body>
</html>