<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 管理员注册</title>
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
    	${empty managerregisttip ? "" : "color:red; font-size:5pxs;"}
 	}
	#t1::-moz-placeholder {/*Firefox*/
   	 	${empty managerregisttip ? "" : "color:red"}
 	}
	#t1::-ms-input-placeholder {/*IE*/
   	 	${empty managerregisttip ? "" : "color:red"}
	}	
	</style>
</head>
<body>
<div class="reg-w3">
<div class="w3layouts-main">
	<!-- 管理员账号不支持注册 -->
	<jsp:forward page="login.jsp"></jsp:forward>
	<h2>注册</h2>
		<form action="/Travel/DoRegist" method="post">
			<input id="t1" type="text" class="ggg" name="name" ${empty managerregisttip ? "placeholder='用户名'" :"placeholder='该用户名已经存在！！！！'"}  required="">
			<input type="email" class="ggg" name="email" placeholder="邮箱" required="">
			<input type="password" class="ggg" name="password" placeholder="密码" required="">
			<input type="password" class="ggg" name="password1" placeholder="再次输入密码" required="">
			<h4><input type="checkbox" checked="checked"/>我同意Travels的条款</h4>
				<div class="clearfix"></div>
				<input type="submit" value="submit" name="register">
		</form>
		<p>已经注册?<a href="login.jsp">去登陆</a></p>
		<%session.removeAttribute("managerregisttip");//移除提示消息 %>
</div>
</div>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/jquery.scrollTo.js"></script>
</body>