<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travels | 风景</title>
	<!-- css 、js脚本-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="" />
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
			session.setAttribute("page", 3);
		%>
	</c:if>
	<c:if test="${empty page }">
		<%
			session.setAttribute("page", 3);
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
		<div class="w3ls-heading">
			<h2>热门景点</h2>	
		</div>
	</div>
	
	<!-- 景点 -->
	<div class="gallery">
		<div class="container">
			<div class="gallery-grids">
			<div style="margin-left: -75px"><h3>国内：</h3></div><br><br>
					<c:forEach items="${IndexMiddleInfo2China }" varStatus="tp2" var="t">
							<div class="col-md-4 gallery-grid">
								<div class="grid">
									<div class="services-icon-info">
										<h5>${t.captain }</h5>
										<p>${t.content }</p>
									</div>
									<figure class="effect-apollo">
										<a class="example-image-link" href=${t.image }   data-lightbox="example-set" data-title=${t.imagecontent }>
											<img src=${t.image } alt=""  height="232.97px" width="350px" >
											<figcaption>
											</figcaption>	
										</a>
									</figure>
								</div>
							</div>
					</c:forEach>
					
					<div style="margin-left: -75px;padding-top: 750px"><h3>国际：</h3></div><br><br>
					<c:forEach items="${IndexMiddleInfo2World }" varStatus="tp2" var="t">
							<div class="col-md-4 gallery-grid">
								<div class="grid">
									<div class="services-icon-info">
										<h5>${t.captain }</h5>
										<p>${t.content }</p>
									</div>
									<figure class="effect-apollo">
										<a class="example-image-link" href=${t.image }   data-lightbox="example-set" data-title=${t.imagecontent }>
											<img src=${t.image } alt=""  height="232.97px" width="350px" >
											<figcaption>
											</figcaption>	
										</a>
									</figure>
								</div>
							</div>
					</c:forEach>
					<div class="clearfix"> </div>
					<script src="js/lightbox-plus-jquery.min.js"> </script>
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
</body>	
</html>
</body>
</html>