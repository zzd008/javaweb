<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>	

<header class="header fixed-top clearfix">
<!--logo -->
<div class="brand">
    <a href="../../" class="logo">
        Travels
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>

<!-- 提示消息 -->
<div class="nav notify-row" id="top_menu">
    <ul class="nav top-menu">
        <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-envelope-o"></i>
                <c:if test="${messagecount!=0}">
                	<span class="badge bg-important">${messagecount}</span>
                </c:if>
            </a>
            <ul class="dropdown-menu extended inbox">
            	 <c:if test="${messagecount!=0}">
	                <li>
	                    <p class="red">你有${messagecount }条攻略待审核</p>
	                </li>
                </c:if>
                <c:if test="${messagecount==0}">
	                <li>
	                    <p class="red">没有新攻略待审核</p>
	                </li>
                </c:if>
                <c:forEach items="${message }" var="m">
	                <li>
	                    <a href="../tipscheck.jsp">
	                        <span class="photo"><img alt="avatar" src="../../${m.photo }"></span>
	                                <span class="subject">
	                                <span class="from">${m.user }</span>
	                                <span class="time">${m.time }</span>
	                                </span>
	                                <span class="message">
	                                    ${m.captain }
	                                </span>
	                    </a>
	                </li>
                </c:forEach>
                <li>
                    <a href="../tipscheck.jsp">查看详细信息</a>
                </li>
            </ul>
        </li>
    </ul>
</div>
<!-- 提示消息结束 -->

<!-- 搜索和头像 -->
<div class="top-nav clearfix">
    <ul class="nav pull-right top-menu">
        <li>
            <input type="text" class="form-control search" placeholder=" 搜索">
        </li>
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="../../ourteam/1.jpg">
                <span class="username">${managerlogin.name }</span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="../notachieve.jsp"><i class=" fa fa-suitcase"></i>个人信息</a></li>
                <li><a href="../notachieve.jsp"><i class="fa fa-cog"></i> 设置</a></li>
                <li><a href="../login.jsp??managerflag=1"><i class="fa fa-key"></i>退出</a></li>
            </ul>
        </li>
    </ul>
</div>
<!-- 搜索和头像 结束-->

</header>