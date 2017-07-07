<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travels | 注册</title>
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
	height:600px;
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
    ${empty registtip ? "" : "color:red; font-size:5pxs;"}
 }
#t1::-moz-placeholder {/*Firefox*/
    ${empty registtip ? "" : "color:red"}
 }
#t1::-ms-input-placeholder {/*IE*/
    ${empty registtip ? "" : "color:red"}
}
.bt:hover{
	background-color:#4F816B;
}
#t2::-webkit-input-placeholder {/*Chrome设置placeholder里的字体颜色 */
    ${empty registtip1 ? "" : "color:red; font-size:5pxs;"}
 }
#t2::-moz-placeholder {/*Firefox*/
    ${empty registtip1 ? "" : "color:red"}
 }
#t2::-ms-input-placeholder {/*IE*/
    ${empty registtip1 ? "" : "color:red"}
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
		<form id="msform" action="Doregist" method="post" name="fr">
			 <fieldset>
			       <h2>注册Travels</h2><br>
			       	用户名<input id="t1" required="" type="text" name="username" ${empty registtip ? "placeholder='1-10位用户名'" :"placeholder='该用户名已经存在！！！！'"} /><br><br>
			       	邮箱<input type="email" required="" name="useremail" placeholder="qq/163邮箱 " /><br><br>
			       	密码<input id="t2" type="password" required="" name="userpassword" ${empty registtip1 ? "placeholder='1-10位密码 '" :"placeholder='两次输入的密码不一致！！！！'"} /><br><br>
			       	确认密码<input type="password" required="" name="userpassword1" placeholder="再次输入密码" /><br><br>
			       	<input class="bt" type="submit" value="注册" onclick="check()"/>
			  </fieldset>
		</form>
	</div>
	<!--尾部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>
</body>
</html>