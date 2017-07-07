package com.servlet;

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

import com.bean.IndexTop;
import com.bean.User;
import com.utils.DButils;

@WebServlet("/ShowIndexTop")
public class ShowIndexTop extends HttpServlet {//显示主页头部Servlet+显示用户数
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");//告诉浏览器不缓存
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);

		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		ArrayList<IndexTop> list=new ArrayList<IndexTop>();
		int usercount=0;
		try {
			c=DButils.getConnection();
			String sql="select * from indextop;";
			p = c.prepareStatement(sql);
			r = p.executeQuery();
			while(r.next()){
				IndexTop it=new IndexTop();
				it.setCaptain(r.getString(1));
				it.setContent(r.getString(2));
				it.setLinkname(r.getString(3));
				it.setHref(r.getString(4));
				it.setId(r.getInt(5));
				list.add(it);
			}
			//获取用户数
			String sql1="select count(*) from user;";
			p=c.prepareStatement(sql1);
			r=p.executeQuery();
			if(r.next()){
				usercount=r.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("数据库为空！");
		}finally{
			DButils.closeAll(c, p, r);
		}
		
		request.getSession().setAttribute("IndexTopInfo", list);
		request.getSession().setAttribute("usercount", usercount);
		
	}
}
