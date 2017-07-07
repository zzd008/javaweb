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

import com.bean.IndexMiddle2;
import com.bean.User;
import com.utils.DButils;

@WebServlet("/ShowIndexMiddle2")
public class ShowIndexMiddle2 extends HttpServlet {//显示主页中部2Servlet
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
		ArrayList<IndexMiddle2> list=new ArrayList<IndexMiddle2>();//主页
		ArrayList<IndexMiddle2> list1=new ArrayList<IndexMiddle2>();//国内景点
		ArrayList<IndexMiddle2> list2=new ArrayList<IndexMiddle2>();//国际景点
		try {
			c=DButils.getConnection();
			String sql="select * from indexmiddle2  limit 3,6;";//显示3条国内、3条国外景点
			p = c.prepareStatement(sql);
			r = p.executeQuery();
			while(r.next()){
				IndexMiddle2 im2=new IndexMiddle2();
				im2.setCaptain(r.getString(1));
				im2.setContent(r.getString(2));
				im2.setImage(r.getString(3));
				im2.setImagecontent(r.getString(4));
				im2.setId(r.getInt(5));
				im2.setFlag(r.getInt(6));
				list.add(im2);
			}
			String sql1="select * from indexmiddle2 where flag=1 limit 0,9;";//显示9条国内景点
			p = c.prepareStatement(sql1);
			r = p.executeQuery();
			while(r.next()){
				IndexMiddle2 im2=new IndexMiddle2();
				im2.setCaptain(r.getString(1));
				im2.setContent(r.getString(2));
				im2.setImage(r.getString(3));
				im2.setImagecontent(r.getString(4));
				im2.setId(r.getInt(5));
				im2.setFlag(r.getInt(6));
				list1.add(im2);
			}
			String sql2="select * from indexmiddle2 where flag=2 limit 0,9;";//显示9条国际景点
			p = c.prepareStatement(sql2);
			r = p.executeQuery();
			while(r.next()){
				IndexMiddle2 im2=new IndexMiddle2();
				im2.setCaptain(r.getString(1));
				im2.setContent(r.getString(2));
				im2.setImage(r.getString(3));
				im2.setImagecontent(r.getString(4));
				im2.setId(r.getInt(5));
				im2.setFlag(r.getInt(6));
				list2.add(im2);
			}
			
		} catch (SQLException e) {
			System.out.println("数据库为空！");
		}finally{
			DButils.closeAll(c, p, r);
		}
		
		request.getSession().setAttribute("IndexMiddleInfo2", list);
		request.getSession().setAttribute("IndexMiddleInfo2China", list1);
		request.getSession().setAttribute("IndexMiddleInfo2World", list2);
	}
}

