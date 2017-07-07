package com.manager.servlet;

import java.io.IOException;
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

import com.bean.IndexMiddle;
import com.bean.User;
import com.utils.DButils;

@WebServlet("/ManageTips")
public class ManageTips extends HttpServlet {//¹ÜÀí¹¥ÂÔ
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
		int id=0;
		if(request.getParameter("id")!=null){
			id=Integer.parseInt(request.getParameter("id"));
		}
		if(request.getParameter("type")!=null){
			if(request.getParameter("type").equals("let")){//Í¨¹ýÉóºË
				try {
					c=DButils.getConnection();
					String sql="update tipstop set showflag=1 where id=?;";
					p = c.prepareStatement(sql);
					p.setInt(1, id);
					p.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("ÐÞ¸ÄÊ§°Ü£¡");
				}finally{
					DButils.closeAll(c, p, r);
				}
				response.sendRedirect("/Travel/manager/tipscheck.jsp");
			}
			else if(request.getParameter("type").equals("notlet")){//Í¨¹ýÉóºË
				try {
					c=DButils.getConnection();
					String sql="update tipstop set showflag=0 where id=?;";
					p = c.prepareStatement(sql);
					p.setInt(1, id);
					p.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("ÐÞ¸ÄÊ§°Ü£¡");
				}finally{
					DButils.closeAll(c, p, r);
				}
				response.sendRedirect("/Travel/manager/tipscheck.jsp");
			}
			else if(request.getParameter("type").equals("delete")){//É¾³ý¹¥ÂÔ
				try {
					c=DButils.getConnection();
					String sql="delete from tipstop where id=?;";
					p = c.prepareStatement(sql);
					p.setInt(1, id);
					p.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("É¾³ýÊ§°Ü£¡");
				}finally{
					DButils.closeAll(c, p, r);
				}
				response.sendRedirect("/Travel/manager/tipscheck.jsp");
			}
		}
	}
}
