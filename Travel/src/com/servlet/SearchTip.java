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

import com.bean.TipsTop;
import com.utils.DButils;

@WebServlet("/SearchTip")
public class SearchTip extends HttpServlet {//搜索攻略Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);
		
		String label=request.getParameter("label");
		ArrayList<TipsTop> list=new ArrayList<TipsTop>();
		int count=0;
		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		try {
			c=DButils.getConnection();
			String sql="select *from tipstop where showflag=1 and label=? order by ifnull(readcount,0) desc ;";//只显示出管理员审核过的
			p=c.prepareStatement(sql);
			p.setString(1, label);
			r=p.executeQuery();
			while(r.next()){
				TipsTop tp=new TipsTop();
				String str=r.getString(3);//截取前150个文字
				if(str.length()>150){
					str=str.substring(0, 147);
					str+="...";
				}else{
					if(str.length()>=147){
						str=str.substring(0, 147);
						str+="...";
					}
					else {
						str+="...";
				}
			}
				tp.setImage(r.getString(1));
				tp.setCaptain(r.getString(2));
				tp.setContent(str);
				tp.setId(r.getInt(6));
				tp.setReadcount(r.getInt(5));
				tp.setUser(r.getString(4));
				tp.setTime(r.getDate(7));
				tp.setLabel(r.getString(9));
				list.add(tp);
			}
			
			String sql1="select count(*) from tipstop where showflag=1 and label=?;";//查询结果有几条
			p=c.prepareStatement(sql1);
			p.setString(1, label);
			r=p.executeQuery();
			if(r.next()){
				count=r.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DButils.closeAll(c, p, r);
		}
		request.getSession().setAttribute("SearchTipCount", count);
		request.getSession().setAttribute("SearchTipInfo", list);
		response.sendRedirect("searchtip.jsp");
	}

}
