package com.manager.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.manager.bean.Manager;
import com.utils.DButils;
@WebServlet("/DoRegist")
public class DoRegist extends HttpServlet {//管理员注册Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Connection c=null;
		PreparedStatement p=null;
		int flag=0;
		Manager m=new Manager();
		try {
			c=DButils.getConnection();
			String sql="insert into manager values(?,?,?);";
			p=c.prepareStatement(sql);
			p.setString(1, name);
			p.setString(2, email);
			p.setString(3, password);
			flag= p.executeUpdate();
			m.setName(name);
			m.setEmail(email);
			m.setPassword(password);
		} catch (SQLException e) {
			System.out.println("用户名已经存在！");
		}finally{
			DButils.closeAll(c, p, null);
		}
	
	if(flag!=0){
		request.getSession().setAttribute("managerreg", m);
		response.sendRedirect("/Travel/manager/registsuccess.jsp");
	}else{
		request.getSession().setAttribute("managerregisttip", "该用户名已经存在！");
		response.sendRedirect("/Travel/manager/regist.jsp");
	}
		
	}
}
