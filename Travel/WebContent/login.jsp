<%@page import="com.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<style type="text/css">
#d1{
	background: url(images/1.jpg) no-repeat 0px 0px;
	background-size: cover;
	height:833px;
	padding:100px 0px;
}
#d2{
}
#msform {
    width: 1000px;
    margin:60px auto 100px auto;
    text-align: center;
    position: relative;
}
#msform fieldset {
	height:400px;
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
#t1::-webkit-input-placeholder {/*Chrome设置placeholder里的字体颜色 */
    ${empty logintip ? "" : "color:red; font-size:5pxs;"}
 }
#t1::-moz-placeholder {/*Firefox*/
    ${empty logintip ? "" : "color:red"}
 }
#t1::-ms-input-placeholder {/*IE*/
    ${empty logintip ? "" : "color:red"}
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
	
	<!-- 头部 -->
	<%@ include file="top.jsp" %>
	<div id=d1>
		<form id="msform" action="Dologin" method="post">
			 <fieldset>
			       <h2>登录到Travels</h2><br>
			       <input id="t1" required="" type="text" name="username" ${empty logintip ? "placeholder='用户名'" : "placeholder='用户名或密码错误！！！'"} />
			       <input type="password" required="" name="userpassword" placeholder="密码" /><br>
			       <input class="bt" type="submit" value="登录" /><br><br>
			       <a href="regist.jsp">还没有账号？去注册</a>
			  </fieldset>
		</form>
	</div>
	<!-- 尾部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>
</body>
</html>