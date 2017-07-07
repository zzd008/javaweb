package com.servlet;

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
import com.utils.DButils;
@WebServlet("/ShowMyInfo")
public class ShowMyInfo extends HttpServlet {//个人Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);

		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		User u=new User();
		String username="";
		if( request.getSession().getAttribute("userlogin")!=null){
			User u1=(User) request.getSession().getAttribute("userlogin");
			username=u1.getUsername();
		}else{
			//去登陆
		}
		try {
			c=DButils.getConnection();//查询出个人信息
			String sql="select *from user where username=?;";
			p=c.prepareStatement(sql);
			p.setString(1, username);
			r= p.executeQuery();
			if(r.next()){
				u.setUsername(r.getString(1));
				u.setUserpassword(r.getString(2));
				u.setId(r.getInt(4));
				u.setRegisttime(r.getDate(5));
				u.setPhoto(r.getString(6));
			}
		} catch (SQLException e) {
			System.out.println("该用户不存在！");
		}finally{
			DButils.closeAll(c, p, r);
		}
		request.getSession().setAttribute("MyInfo", u);
	}

}
