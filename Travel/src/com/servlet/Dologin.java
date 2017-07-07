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
@WebServlet("/Dologin")
public class Dologin extends HttpServlet {//��¼Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);

		String username=request.getParameter("username");
		String userpassword=request.getParameter("userpassword");
		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		int flag=0;
		User u=new User();
		try {
			c=DButils.getConnection();
			String sql="select *from user where username=? and userpassword=?;";
			p=c.prepareStatement(sql);
			p.setString(1, username);
			p.setString(2, userpassword);
			r= p.executeQuery();
			if(r.next()){
				flag=1;//�û�����
				u.setUsername(username);
				u.setUserpassword(userpassword);
				u.setId(r.getInt(4));
				u.setRegisttime(r.getDate(5));
				u.setPhoto(r.getString(6));
			}
		} catch (SQLException e) {
			System.out.println("���û������ڣ�");
		}finally{
			DButils.closeAll(c, p, r);
		}
	
	if(flag!=0){
		HttpSession session = request.getSession();
		session.setAttribute("userlogin", u);//���û����󷽷�Ŷsession��
		if(request.getSession().getAttribute("turnflag")==null){
			request.getRequestDispatcher("index.jsp").forward(request, response);//���ڵ�·������Travel
		}else{//��ת������ҳ��
			int id=Integer.parseInt(request.getSession().getAttribute("turnflag").toString());//��ȡid
			request.getSession().setAttribute("turntipid", id);
			response.sendRedirect("ShowTip");
		}
	}else{
		request.setAttribute("logintip", "�û������������");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
		
	}

}
