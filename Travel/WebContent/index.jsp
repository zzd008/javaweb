<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>Travels | 分享你的旅程</title>
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
			session.setAttribute("page", 1);
		%>
	</c:if>
	<c:if test="${empty page }">
		<%
			session.setAttribute("page", 1);
		%>
	</c:if>
	
	<!--首页 -->
	<div class="banner">
		 <!-- 头部-->
		 <c:if test="${!empty param.userflag}">
		 	<%
			 	session.removeAttribute("userlogin");//注销后移除用户
			%>
		 </c:if>
		 <c:if test="${empty userlogin}">
			<%@ include file="top.jsp" %>
		</c:if>
		<c:if test="${!empty userlogin}">
			<%@ include file="top1.jsp" %>
		</c:if>
		<!-- 流动图 -->
		<div class="w3layouts-banner-slider">
			<div class="container">
				<div class="slider">
					<div class="callbacks_container">
						<ul class="rslides callbacks callbacks1" id="slider4">
 							<li>
								<div class="agileits-banner-info">
									<h6>我们</h6>
									<h3 >${IndexTopInfo[0].captain }</h3>
									<p>${IndexTopInfo[0].content }</p>
									<div class="w3-button">
										<a href=${IndexTopInfo[0].href }>${IndexTopInfo[0].linkname }</a>
									</div>
								</div>
							</li>
							<li>
								<div class="agileits-banner-info">
									<h6>攻略</h6>
									<h3>${IndexTopInfo[1].captain }</h3>
									<p>${IndexTopInfo[1].content }</p>
									<div class="w3-button">
										<a href=${IndexTopInfo[1].href }>${IndexTopInfo[1].linkname }</a>
									</div>
								</div>
							</li>
							<li>
								<div class="agileits-banner-info">
									<h6>活动</h6>
									<h3>${IndexTopInfo[2].captain }</h3>
									<p>${IndexTopInfo[2].content }</p>
									<div class="w3-button">
										<h2><span class="label label-warning">${IndexTopInfo[2].linkname }</span></h2>
									</div>
								</div>
							</li>				
 					</ul>
					</div>
					<script src="js/responsiveslides.min.js"></script>
					<script>
						$(function () {
						  $("#slider4").responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
						  });
					
						});
					 </script>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 热门旅游地 -->
	<div class="welcome">
		<div class="container">
			<div class="w3l-heading">
				<h2>热门旅游地</h2>
			</div>
			<div class="w3-welcome-grids">
				<div class="col-md-7 w3-welcome-left">
					<h5>${IndexMiddleInfo[0].captain} </h5>
					<p>${IndexMiddleInfo[0].content1}<span>${IndexMiddleInfo[0].content2}</span></p>
					<div class="w3l-button">
						<a href="tips.jsp"}>More</a>	
 					</div>
				</div>
				<div class="col-md-5 w3ls-welcome-img1">
					<img src=${IndexMiddleInfo[0].image} alt="" />
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="w3-welcome-grids w3-welcome-bottom">
				<div class="col-md-5 w3ls-welcome-img1 w3ls-welcome-img2">
					<img src=${IndexMiddleInfo[1].image} alt="" />
				</div>
				<div class="col-md-7 w3-welcome-left">
					<h5>${IndexMiddleInfo[1].captain} </h5>
					<p>${IndexMiddleInfo[1].content1}<span>${IndexMiddleInfo[1].content2}</span></p>
					<div class="w3l-button">
						<a href="tips.jsp"}>More</a>	
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	<!-- Travels推荐-->
	<div class="services">
		<div class="container">
			<div class="w3l-heading">
				<h3>Travels推荐</h3>
			</div>
			<div class="gallery">
			<div class="container">
				<div class="gallery-grids">
						<c:forEach items="${IndexMiddleInfo2 }" varStatus="tp2" var="t">
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
		</div>
	</div>
	
	<!-- 城市旅游热度-->
	<div class="news">
		<div class="container">
			<div class="w3l-heading">
				<h3>城市旅游热度</h3>
			</div>
			<div class="grid_3 grid_5 wow fadeInUp animated" data-wow-delay=".5s">
						<h3 class="hdg">近期排行</h3>
						<div class="tab-content">
							<div class="tab-pane active" id="domprogress">
								<p><code>${IndexMiddleInfo3[0].city}</code> </p>
								<div class="progress">    
									<div class="progress-bar progress-bar-primary" style="width: ${IndexMiddleInfo3[0].percent}%"></div>
								</div>
								<p><code>${IndexMiddleInfo3[1].city}</code> </p>
								<div class="progress">    
									<div class="progress-bar progress-bar-info" style="width: ${IndexMiddleInfo3[1].percent}%"></div>
								</div>
								<p><code>${IndexMiddleInfo3[2].city}</code> </p>
								<div class="progress">
									<div class="progress-bar progress-bar-success" style="width: ${IndexMiddleInfo3[2].percent}%"></div>
								</div>
								<p><code>${IndexMiddleInfo3[3].city}</code> </p>
								<div class="progress">
									<div class="progress-bar progress-bar-warning" style="width: ${IndexMiddleInfo3[3].percent}%"></div>
								</div>
								<p><code>${IndexMiddleInfo3[4].city}</code> </p>
								<div class="progress">
									<div class="progress-bar progress-bar-danger" style="width: ${IndexMiddleInfo3[4].percent}%"></div>
								</div>
								<p><code>${IndexMiddleInfo3[5].city}</code> </p>
								<div class="progress">
									<div class="progress-bar progress-bar-inverse" style="width: ${IndexMiddleInfo3[5].percent}%"></div>
								</div>
							</div>
						</div>
					</div>
			
		</div>
	</div>
	
	<!-- 地图 -->
	<div class="contact">
		<div class="container">
			<div class="w3agile-map">
				<h3>我们在这，你在哪儿？</h3>
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3498.206498356366!2d115.87382231555677!3d28.743250982374274!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x343aba3d513dd8c7%3A0xe943b8ee8a2ecde!2z5rGf6KW_55CG5bel5aSn5a2m!5e0!3m2!1szh-CN!2sin!4v1498718575890" width="1140" height="382" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
		</div>
	</div>
	
	<!-- 尾部-->
	<%@ include file="bottom.jsp" %>
	
	<script src="js/responsiveslides.min.js"></script>
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
