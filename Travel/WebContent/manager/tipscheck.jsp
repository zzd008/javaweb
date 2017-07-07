<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 攻略审核</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<div class="table-agile-info">
		 	<div class="panel panel-default">
		    <div class="panel-heading">
		     	${messagecount}条攻略待审核
		    </div>
		    <div>
		      <table class="table" ui-jq="footable" ui-options='{
		        "paging": {
		          "enabled": true
		        },
		        "filtering": {
		          "enabled": true
		        },
		        "sorting": {
		          "enabled": true
		        }}'>
		        <thead>
		          <tr>
		            <th data-breakpoints="xs">ID</th>
		            <th>标&nbsp;题</th>
		            <th>作&nbsp;者</th>
		            <th>发&nbsp;表&nbsp;时&nbsp;间</th>
		            <th data-breakpoints="xs">内&nbsp;容</th>
		            <th data-breakpoints="xs sm md" data-title="DOB">管&nbsp;理</th>
		          </tr>
		        </thead>
		        <tbody>
		        	<c:forEach items="${message }" var="m" varStatus="ms">
			          <tr data-expanded="true">
			            <td>${ms.index+1 }</td>
			            <td>${m.captain }</td>
			            <td>${m.user }</td>
			            <td>${m.time }</td>
			            <td>${m.content }</td>
			            <td width="150px">
              			  	 	<a href="/Travel/ManageTips?id=${m.id }&type=let"><span class="label label-success">通过审核</span></a>
              			  	 <br><br>
              			   <a href="/Travel/ManageTips?id=${m.id }&type=delete"><span class="label label-danger">删除</span></a>
           			    </td>
			          </tr>
		          </c:forEach>
		        </tbody>
		      </table>
	    </div>
	  </div>
</div>
<!-- 已审核的攻略 -->
<div class="table-agile-info">
		 	<div class="panel panel-default">
		    <div class="panel-heading">
		     	${messagecount2}条攻略已审核
		    </div>
		    <div>
		      <table class="table" ui-jq="footable" ui-options='{
		        "paging": {
		          "enabled": true
		        },
		        "filtering": {
		          "enabled": true
		        },
		        "sorting": {
		          "enabled": true
		        }}'>
		        <thead>
		          <tr>
		            <th data-breakpoints="xs">ID</th>
		            <th>标&nbsp;题</th>
		            <th>作&nbsp;者</th>
		            <th>发&nbsp;表&nbsp;时&nbsp;间</th>
		            <th data-breakpoints="xs">内&nbsp;容</th>
		            <th data-breakpoints="xs">查看</th>
		            <th data-breakpoints="xs sm md" data-title="DOB">管&nbsp;理</th>
		          </tr>
		        </thead>
		        <tbody>
		        	<c:forEach items="${message2 }" var="m" varStatus="ms"><!-- message2显示全部内容，TipsTopInfo只显示前155个 -->
			          <tr data-expanded="true">
			            <td>${ms.index+1 }</td>
			            <td>${m.captain }</td>
			            <td>${m.user }</td>
			            <td>${m.time }</td>
			            <td>${m.content }</td>
			            <td><a href="../ShowTip?tipid=${m.id }" style="text-decoration:none"><span class="label label-warning">预览</span></td>
			            <td width="150px">
              			  	 	<a href="/Travel/ManageTips?id=${m.id }&type=notlet"><span class="label label-primary">取消审核</span></a>
              			  	 <br><br>
              			   <a href="/Travel/ManageTips?id=${m.id }&type=delete"><span class="label label-danger">删除</span></a>
           			    </td>
			          </tr>
		          </c:forEach>
		        </tbody>
		      </table>
	    </div>
	  </div>
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