<%@page import="com.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travels | 注册成功</title>
<style type="text/css">
#d1{
	background: url(images/1.jpg) no-repeat 0px 0px;
	background-size: cover;
	height:833px;
	padding:100px 0px;
}
.d2{
	margin-left: -100px;
	font-family: 黑体；
}
#msform {
    width: 1000px;
    margin:60px auto 100px auto;
    text-align: center;
    position: relative;
}
#msform fieldset {
	height:450px;
    background: white;
    border: 0 none;
    border-radius: 3px;
    box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
    padding: 20px 30px;

    box-sizing: border-box;
    width: 80%;
    margin: 0 10%;

    position: absolute;
}
#msform input{
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-bottom: 10px;
    width: 100%;
    box-sizing: border-box;
    font-family: montserrat;
    color: #2C3E50;
    font-size: 13px;
}
.bt{
	color: #FFFFFF;
    font-size: 1em;
    text-decoration: none;
    padding: .5em 2em;
    background: #82b62d;
    text-align: center;
    border: solid 2px #82b62d;
}
.bt:hover{
	background-color:#4F816B;
}
}
</style>
</head>
<body>
	<!-- 设置顶部导航栏点击变色  -->
	<c:if test="${!empty page }">
		<%
			session.removeAttribute("page");
		%>
	</c:if>
	
	<!--头部 -->
	<%@ include file="top.jsp" %>
	<div id=d1>
		<form id="msform" action="" method="post">
			 <fieldset>
			       <h2>您已成功注册Travels</h2><br><br>
			       	<div class="d2" style="margin-left: -170px">用户名：${user.username }<br><br></div>
			       	<div class="d2" style="margin-left: -80px">邮&nbsp;箱：${user.useremail}<br><br></div>
			       	<div class="d2" style="margin-left: -185px">密&nbsp;码：${user.userpassword }<br><br><br></div>
			       	<a href="login.jsp" style="margin-left: -125px">三秒后自动登录。。。</a>
			       	<%
			       		response.setHeader("refresh", "3;URL=login.jsp");
			       	%>
			  </fieldset>
		</form>
	</div>
	<!-- 尾部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>
</body>
</html>