<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 攻略详情</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<h2>攻略详情</h2>	
		</div>
	</div>
	
	<!-- 攻略内容 -->
	<div class="single">
		<div class="container">
			<div class="agileits-single-img">
				<h4 align="center"><font size=5 color="#F67E49">${Tip.captain }</font></h4><br>
				<img src=${Tip.image } alt="" />
				<div class="agileinfo-single-icons">
					<ul>
						<li><i class="fa fa-user" aria-hidden="true"></i> <span>作者：${Tip.user }</span></li>
						<li><i class="fa fa-calendar" aria-hidden="true"></i><span>发表时间：${Tip.time }</span></li>
						<li><i class="fa fa-comments-o" aria-hidden="true"></i><span>评论:${Content[0].count }</span></li>
						<li><i class="fa fa-heart" aria-hidden="true"></i><span>浏览量：${Tip.readcount }</span></li>
					</ul>				
				</div>
				<p ><font color="black">${Tip.content }</font></p>
			</div>
			
			<!-- 评论 -->
			<div class="agileits_three_comments">
				<h3>评论列表</h3>
				<c:forEach items="${Content }" var="ct" varStatus="c">
					<div class="agileits_three_comment_grid">
						<div class="agileits_tom">
							<img src="${ct.photo }" alt=" " class="img-responsive">
						</div>
						<div class="agileits_tom_right">
							<div>
								<h4><span class="label label-warning">${c.index+1}楼</span></h4><br>
							</div>
							<div class="hardy">
								<h4>${ct.user}</h4>
								<p>${ct.contenttime}</p>
							</div>
							<div class="reply">
								<a href="#">Reply</a>
							</div>
							<div class="clearfix"> </div>
							<p class="lorem"><font color="black">${ct.content}</font></p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</c:forEach>
			</div>
			<!-- 发表评论 -->
			<div class="w3_leave_comment">
				<h3>发表评论（需登录）</h3>
				<form action="AddContent?tipid=${Tip.id }" method="post">
					<textarea placeholder="发表你的感想" name="content" required=""></textarea>
					<input type="submit" value="评论">
				</form>
			</div>
		</div>
	</div>
	
	<!-- 尾部-->
	<%@ include file="bottom.jsp" %>
	
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
</body>
</html>