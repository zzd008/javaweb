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

import com.bean.IndexMiddle;
import com.bean.User;
import com.utils.DButils;

@WebServlet("/ShowIndexMiddle")
public class ShowIndexMiddle extends HttpServlet {//显示主页中部1Servlet
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
		ArrayList<IndexMiddle> list=new ArrayList<IndexMiddle>();
		ArrayList<IndexMiddle> list1=new ArrayList<IndexMiddle>();
		try {
			c=DButils.getConnection();
			String sql="select * from indexmiddle where showflag=1;";//用于主页显示
			p = c.prepareStatement(sql);
			r = p.executeQuery();
			while(r.next()){
				IndexMiddle im=new IndexMiddle();
				im.setCaptain(r.getString(1));
				im.setContent1(r.getString(2));
				im.setContent2(r.getString(3));
				im.setImage(r.getString(4));
				im.setShowflag(r.getInt(5));
				im.setId(r.getInt(6));
				list.add(im);
			}
			String sql1="select * from indexmiddle;";//用于后台管理
			p = c.prepareStatement(sql1);
			r = p.executeQuery();
			while(r.next()){
				IndexMiddle im=new IndexMiddle();
				im.setCaptain(r.getString(1));
				im.setContent1(r.getString(2));
				im.setContent2(r.getString(3));
				im.setImage(r.getString(4));
				im.setShowflag(r.getInt(5));
				im.setId(r.getInt(6));
				list1.add(im);
			}
		} catch (SQLException e) {
			System.out.println("数据库为空！");
		}finally{
			DButils.closeAll(c, p, r);
		}
		
		request.getSession().setAttribute("IndexMiddleInfo", list);
		request.getSession().setAttribute("IndexMiddleInfo1", list1);

	}
}
