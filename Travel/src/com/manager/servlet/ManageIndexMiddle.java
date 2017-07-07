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

@WebServlet("/ManageIndexMiddle")
public class ManageIndexMiddle extends HttpServlet {//管理热门旅游地
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
			if(request.getParameter("type").equals("cancel")){//取消主页显示
				try {
					c=DButils.getConnection();
					String sql="update indexmiddle set showflag=0 where id=?;";
					p = c.prepareStatement(sql);
					p.setInt(1, id);
					p.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("修改失败！");
				}finally{
					DButils.closeAll(c, p, r);
				}
				response.sendRedirect("/Travel/manager/indexmiddle.jsp");
			}
			else if(request.getParameter("type").equals("show")){//主页显示
				try {
					c=DButils.getConnection();
					String sql="update indexmiddle set showflag=1 where id=?;";
					p = c.prepareStatement(sql);
					p.setInt(1, id);
					p.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("修改失败！");
				}finally{
					DButils.closeAll(c, p, r);
				}
				response.sendRedirect("/Travel/manager/indexmiddle.jsp");
			}
			else if(request.getParameter("type").equals("delete")){//删除
				try {
					c=DButils.getConnection();
					String sql="delete from indexmiddle where id=?;";
					p = c.prepareStatement(sql);
					p.setInt(1, id);
					p.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("删除失败！");
				}finally{
					DButils.closeAll(c, p, r);
				}
				response.sendRedirect("/Travel/manager/indexmiddle.jsp");
			}
		}
	}
}
