<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 管理员登录</title>
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
	<style type="text/css">
	#t1::-webkit-input-placeholder {/*Chrome设置placeholder里的字体颜色 */
    	${empty managerlogintip ? "" : "color:red; font-size:5pxs;"}
 	}
	#t1::-moz-placeholder {/*Firefox*/
   	 	${empty managerlogintip ? "" : "color:red"}
 	}
	#t1::-ms-input-placeholder {/*IE*/
   	 	${empty managerlogintip ? "" : "color:red"}
	}	
	</style>
</head>
<body>
<div class="log-w3">
	<div style="margin-left: 50px;margin-top: 50px">
		<div style="width: 100px"><a href="../index.jsp"><font size="6" color="white">Travels</font></a></div>
	</div>
	<div class="w3layouts-main">
		<c:if test="${!empty param.managerflag}">
			 	<%
				 	session.removeAttribute("managerlogin");//注销后移除管理员
				%>
		</c:if>
		<h2>登录到后台</h2>
			<form action="/Travel/DoLogin" method="post">
				<input type="text" class="ggg" name="name" ${empty managerlogintip ? "placeholder='用户名'" : "placeholder='用户名或密码错误！！！'"} required="">
				<input type="password" class="ggg" name="password" placeholder="密码" required="">
					<div class="clearfix"></div>
					<input type="submit" value="Sign In" name="login">
			</form>
			<!-- <p>还没有账户?<a href="regist.jsp">去注册</a></p> -->
			<p><a>管理员账号不支持注册</a></p>
			<%session.removeAttribute("managerlogintip");//移除提示消息 %>
	</div>
</div>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/jquery.scrollTo.js"></script>
</body>
</html>