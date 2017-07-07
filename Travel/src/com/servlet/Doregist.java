package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.utils.DButils;
@WebServlet("/Doregist")
public class Doregist extends HttpServlet {//注册Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);

		String username=request.getParameter("username");
		String useremail=request.getParameter("useremail");
		String userpassword=request.getParameter("userpassword");
		String userpassword1=request.getParameter("userpassword1");
		if(!userpassword.equals(userpassword1)){//两次输入的密码不一致
			request.setAttribute("registtip1", "两次输入的密码不一致！");
			request.getRequestDispatcher("regist.jsp").forward(request, response);
		}else{
				Connection c=null;
				PreparedStatement p=null;
				ResultSet r=null;
				int flag=0;
				User u=new User();
				try {
					int flag1=0;
					c=DButils.getConnection();
					String sql="select count(*) from user where username=?;";//username不设置主键，判断不让其重复
					p=c.prepareStatement(sql);
					p.setString(1, username);
					r=p.executeQuery();
					if(r.next()){
						flag1=r.getInt(1);
					}
					if(flag1==0){
						String sql1="insert into user values(?,?,?,null,?,?);";
						p=c.prepareStatement(sql1);
						p.setString(1, username);
						p.setString(2, userpassword);
						p.setString(3, useremail);
						Date date=new Date();//格式化时间
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String time=sdf.format(date);
						Date contentTime=null;
						try {
							contentTime = sdf.parse(time);
						} catch (ParseException e) {
							e.printStackTrace();
						}
						p.setDate(4, new java.sql.Date(contentTime.getTime()));
						p.setString(5, "userphoto/1.jpg");//用户默认头像
						flag= p.executeUpdate();
						u.setUsername(username);
						u.setUseremail(useremail);
						u.setUserpassword(userpassword);
					}
				} catch (SQLException e) {
					System.out.println("用户名已经存在！");
				}finally{
					DButils.closeAll(c, p, null);
				}
			
			if(flag!=0){
				request.setAttribute("user", u);
				request.getRequestDispatcher("registsuccess.jsp").forward(request, response);
			}else{
				request.setAttribute("registtip", "该用户名已经存在！");
				request.getRequestDispatcher("regist.jsp").forward(request, response);
			}
		}
	}
}
