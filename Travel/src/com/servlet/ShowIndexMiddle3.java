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

import com.bean.IndexMiddle3;
import com.bean.User;
import com.utils.DButils;

@WebServlet("/ShowIndexMiddle3")
public class ShowIndexMiddle3 extends HttpServlet {//显示主页中部3Servlet
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
		ArrayList<IndexMiddle3> list=new ArrayList<IndexMiddle3>();
		try {
			c=DButils.getConnection();
			String sql="select * from indexmiddle3 order by percent desc;";
			p = c.prepareStatement(sql);
			r = p.executeQuery();
			while(r.next()){
				IndexMiddle3 im3=new IndexMiddle3();
				im3.setCity(r.getString(1));
				im3.setPercent(r.getInt(2));
				list.add(im3);
			}
		} catch (SQLException e) {
			System.out.println("数据库为空！");
		}finally{
			DButils.closeAll(c, p, r);
		}
		
		request.getSession().setAttribute("IndexMiddleInfo3", list);

	}
}
