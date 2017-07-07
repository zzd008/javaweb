<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Travels | 热门旅游地管理</title>
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
		     	已添加的热门旅游地
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
		            <th>标题</th>
		            <th>导语</th>
		            <th data-breakpoints="xs">内容<a href="../index.jsp"><span class="label label-warning" style="margin-left: 360px">查看效果</span></a></th>
		            <th data-breakpoints="xs sm md" data-title="DOB">管理<font size="1" >(鉴于美观，主页只显示两条信息)</font></th>
		          </tr>
		        </thead>
		        <tbody>
		        	<c:forEach items="${IndexMiddleInfo1 }" var="i" varStatus="im">
			          <tr data-expanded="true">
			            <td>${im.index+1 }</td>
			            <td>${i.captain }</td>
			            <td>${i.content1 }</td>
			            <td>${i.content2 }</td>
			            <td width="150px">
			            	<c:if test="${i.showflag==1 }">
			            		<a href="/Travel/ManageIndexMiddle?id=${i.id }&type=cancel"><span class="label label-info">取消主页显示</span></a>
              			  	 </c:if>
              			  	 <c:if test="${i.showflag!=1 }">
              			  	 	<a href="/Travel/ManageIndexMiddle?id=${i.id }&type=show"><span class="label label-success">显示在主页</span></a>
              			  	 </c:if>
              			  	 <br><br>
              			   <a href="/Travel/ManageIndexMiddle?id=${i.id }&type=delete"><span class="label label-danger">删除</span></a>
           			    </td>
			          </tr>
		          </c:forEach>
		        </tbody>
		      </table>
	    </div>
	  </div>
</div>

<!-- 添加热门旅游地 -->
			<div class="col-lg-12" style="margin-top: 20px;margin-left: -17px;width: 1664px">
                    <section class="panel" >
                        <header class="panel-heading">
                           	  <font size="5">添加热门旅游地</font>
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form" action="/Travel/AddIndexMiddle" method="post" enctype="multipart/form-data">
	                                <div class="form-group">
	                                    <label for="exampleInputPassword1">标题</label>
	                                    <input type="text" class="form-control" required="" id="exampleInputPassword1" name="captain"><br>
	                                </div>
	                                <div class="form-group">
	                                    <label for="exampleInputPassword1">导语</label>
	                                    <input type="text" class="form-control" required="" id="exampleInputPassword1" name="content1"><br>
	                                </div>
	                                 <div class="form-group">
	                                    <label for="exampleInputPassword1">内容</label>
	                                    <textarea rows="10" cols="30" class="form-control" required="" id="exampleInputPassword1" name="content2"></textarea><br>
	                                </div>
	                                <div class="form-group">
	                                    <label for="exampleInputFile">添加图片</label>
	                                    <input type="file" id="exampleInputFile" required="" name="image">
	                                </div>
	                                <div class="checkbox">
	                                    <label>
	                                        <input type="checkbox" name="showflag"> 同时显示在主页
	                                    </label>
	                                </div><br>
	                                <button type="submit" class="btn btn-info">添加</button><br><br><br>
                           		 </form>
                            </div>

                        </div>
                    </section>

            </div>

</section>

<!-- 尾部 -->
	<div style="margin-top: -20px">
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