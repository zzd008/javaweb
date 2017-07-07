<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Travels | 国内地图</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<link href="css/style-responsive.css" rel="stylesheet"/>
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/font.css" type="text/css"/>
	<link href="css/font-awesome.css" rel="stylesheet"> 
	<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
<section id="container">
<!--头部-->
<%@ include file="top.jsp" %>

<!--左侧栏-->
<%@ include file="aside.jsp" %>

<!--主页面-->
<section id="main-content">
	<section class="wrapper">
		<div class="w3-agile-google_map">
			<div class="col-md-6 w3-agile-map-left">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3498.206498356366!2d115.87382231555677!3d28.743250982374274!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x343aba3d513dd8c7%3A0xe943b8ee8a2ecde!2z5rGf6KW_55CG5bel5aSn5a2m!5e0!3m2!1szh-CN!2sin!4v1499249657299" width="507" height="456" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
			<div class="col-md-6 w3-agile-map-right">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4327.208432052635!2d115.87382231555677!3d28.743250982374274!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x343aba3d513dd8c7%3A0xe943b8ee8a2ecde!2z5rGf6KW_55CG5bel5aSn5a2m!5e1!3m2!1szh-CN!2sin!4v1499249841672" width="507" height="456" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
			<div class="col-md-6 w3-agile-map-left" style="margin-top: 10px">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d27807511.842527315!2d89.60618676626406!3d31.703008526493473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31508e64e5c642c1%3A0x951daa7c349f366f!2z5Lit5Zu9!5e0!3m2!1szh-CN!2sin!4v1499249968969" width="507" height="456" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
			<div class="col-md-6 w3-agile-map-right" style="margin-top: 10px">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224018.8027615965!2d115.76430498922174!3d28.680856947300537!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x343ab856f20dafb1%3A0xf180919945bad83e!2z5Lit5Zu95rGf6KW_55yB5Y2X5piM5biC!5e0!3m2!1szh-CN!2sin!4v1499250082982" width="507" height="456" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
			<div class="clearfix"></div>
		</div>
</section>
<!-- 尾部 -->
	<div style="margin-top: 50px">
		<%@ include file="bottom.jsp" %>
	</div>
</section>
</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/jquery.scrollTo.js"></script>
</body>
</html>