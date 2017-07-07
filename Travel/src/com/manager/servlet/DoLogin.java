package com.manager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.manager.bean.Manager;
import com.utils.DButils;
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {//后台登录Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);

		String name=request.getParameter("name");
		String password=request.getParameter("password");
		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		int flag=0;
		Manager m=new Manager();
		try {
			c=DButils.getConnection();
			String sql="select *from manager where name=? and password=?;";
			p=c.prepareStatement(sql);
			p.setString(1, name);
			p.setString(2, password);
			r= p.executeQuery();
			if(r.next()){
				flag=1;//用户存在
			}
			m.setName(name);
			m.setPassword(password);
		} catch (SQLException e) {
			System.out.println("该用户不存在！");
		}finally{
			DButils.closeAll(c, p, r);
		}
	
	if(flag!=0){
		HttpSession session = request.getSession();
		session.setAttribute("managerlogin", m);
		response.sendRedirect("/Travel/manager/index.jsp");
	}else{
		request.getSession().setAttribute("managerlogintip", "用户名或密码错误！");
		response.sendRedirect("/Travel/manager/login.jsp");
	}
		
	}

}
