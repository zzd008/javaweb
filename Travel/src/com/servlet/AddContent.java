package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.utils.DButils;

@WebServlet("/AddContent")
public class AddContent extends HttpServlet {//�������Servlet
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
		int id=Integer.parseInt(request.getParameter("tipid")); 
		String content=request.getParameter("content");
		if(request.getSession().getAttribute("userlogin")!=null)//�û�Ҫ�ȵ�¼������������
		{
			try {
				c=DButils.getConnection();
				String sql="insert into content values(?,?,?,?);";
				p=c.prepareStatement(sql);
				p.setInt(1, id);
				p.setString(2, content);
				p.setString(3, ((User)request.getSession().getAttribute("userlogin")).getUsername());
				Date date=new Date();//��ʽ��ʱ��
				Timestamp timestamp = new Timestamp(date.getTime());//���ݿ���datetime����
				p.setTimestamp(4, timestamp);
				
				p.executeUpdate();
				
				}catch (SQLException e) {
				e.printStackTrace();
			}finally{
				DButils.closeAll(c, p, r);
			}
			response.sendRedirect("ShowTip");//!!
		}else{//ȥ��½
			request.getSession().setAttribute("turnflag", id);//��½����ת������ҳ��,Ҫ��ס���Ե�id
			response.sendRedirect("login.jsp");
		}
		
	}

}
