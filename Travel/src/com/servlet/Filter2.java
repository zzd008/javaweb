package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.IndexTop;
import com.servlet.ShowIndexTop;
import com.utils.DButils;

@WebFilter(filterName="Filter2",urlPatterns={"/index.jsp"})//访问量统计
public class Filter2 implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;

		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		int visitcount=0;
		try {
			c=DButils.getConnection();
			//获取访问量
			String sql="select * from visit;";
			p=c.prepareStatement(sql);
			r=p.executeQuery();
			if(r.next()){
				visitcount=r.getInt(1);
			}
			visitcount+=1;
			String sql2="update visit set visitcount=visitcount+1; ";
			p=c.prepareStatement(sql2);
			p.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("数据库为空！");
		}finally{
			DButils.closeAll(c, p, r);
		}
		req.getServletContext().setAttribute("visitcount", visitcount);
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
}
