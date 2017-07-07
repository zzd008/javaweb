package com.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.ShowIndexTop;

@WebFilter(filterName="Filter1",urlPatterns={"/*"})//主页过滤
public class Filter1 implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		
		ShowIndexTop showIndexTop=new ShowIndexTop();//访问各个servlet的doPost（）方法
		showIndexTop.doPost(req,res);
		ShowIndexMiddle showIndexMiddle=new ShowIndexMiddle();
		showIndexMiddle.doPost(req, res);
		ShowIndexMiddle2 showIndexMiddle2=new ShowIndexMiddle2();
		showIndexMiddle2.doPost(req, res);
		ShowIndexMiddle3 showIndexMiddle3=new ShowIndexMiddle3();
		showIndexMiddle3.doPost(req, res);
		ShowTipsTop showTipsTop=new ShowTipsTop();
		showTipsTop.doPost(req, res);
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
}
