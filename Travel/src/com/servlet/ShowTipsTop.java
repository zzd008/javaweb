package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.bean.TipsTop;
import com.bean.User;
import com.utils.DButils;
import com.utils.PageDao;

@WebServlet("/ShowTipsTop")
public class ShowTipsTop extends HttpServlet {//显示攻略Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);
		
		int currentPage=1;//当前行
		if(request.getParameter("page")!=null){
			currentPage=Integer.parseInt(request.getParameter("page"));
		}
		PageDao pd=new PageDao();
		ArrayList<TipsTop> list=pd.find(currentPage);
		request.getSession().setAttribute("TipsTopInfo", list);
		request.getSession().setAttribute("TipsTopInfoCount", list.size());
		
		int pages;//总页数
		int count=pd.findCount();//总记录数
		if(count%TipsTop.PAGE_SIZE==0){
			pages=count/TipsTop.PAGE_SIZE;
		}else{
			pages=count/TipsTop.PAGE_SIZE+1;
		}
		StringBuffer sb=new StringBuffer();
		for(int i=1;i<=pages;i++){//构建分页导航条
			if(i==currentPage){//如果是当前页当前页
				sb.append("『"+i+"』");
			}else{
				sb.append("<a style='text-decoration:none' href='tips.jsp?page="+i+"'>"+i+"&nbsp;&nbsp;"+"</a>");
			}
			sb.append("&nbsp;&nbsp;&nbsp;");
		}
		request.getSession().setAttribute("pagebar", sb.toString());
		
		//后台消息提示
		ArrayList<TipsTop> list1=new ArrayList<TipsTop>();
		int messagecount=0;
		ArrayList<TipsTop> list2=new ArrayList<TipsTop>();
		int messagecount2=0;
		ArrayList<TipsTop> list3=new ArrayList<TipsTop>();
		int messagecount3=0;
		ArrayList<TipsTop> list4=new ArrayList<TipsTop>();
		int messagecount4=0;
		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		try {
			c=DButils.getConnection();
			String sql="select t.*,u.photo from tipstop t,user u where t.user=u.username and showflag=0;";//显示管理员未审核过的
			p=c.prepareStatement(sql);
			r=p.executeQuery();
			while(r.next()){
				TipsTop tp=new TipsTop();
				tp.setImage(r.getString(1));
				tp.setCaptain(r.getString(2));
				tp.setContent(r.getString(3));
				tp.setId(r.getInt(6));
				tp.setReadcount(r.getInt(5));
				tp.setUser(r.getString(4));
				tp.setTime(r.getDate(7));
				tp.setPhoto(r.getString(10));
				list1.add(tp);
			}
			
			String sql1="select count(*) from tipstop where showflag=0;";//显示管理员未审核过的数量
			p=c.prepareStatement(sql1);
			r=p.executeQuery();
			while(r.next()){
				messagecount=r.getInt(1);
			}
			
			String sql2="select *from tipstop where showflag=1;";//显示管理员已经审核过的
			p=c.prepareStatement(sql2);
			r=p.executeQuery();
			while(r.next()){
				TipsTop tp=new TipsTop();
				tp.setImage(r.getString(1));
				tp.setCaptain(r.getString(2));
				tp.setContent(r.getString(3));
				tp.setId(r.getInt(6));
				tp.setReadcount(r.getInt(5));
				tp.setUser(r.getString(4));
				tp.setTime(r.getDate(7));
				list2.add(tp);
			}
			
			String sql3="select count(*) from tipstop where showflag=1;";//显示管理员已经审核过的数量
			p=c.prepareStatement(sql3);
			r=p.executeQuery();
			while(r.next()){
				messagecount2=r.getInt(1);
			}
			
			String username="";
			if( request.getSession().getAttribute("userlogin")!=null){//用户发表但未审核过的
				User u=(User) request.getSession().getAttribute("userlogin");//要先登录
				username=u.getUsername();
				String sql4="select *from tipstop where showflag=0 and user=?;";
				p=c.prepareStatement(sql4);
				p.setString(1, username);
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
					list3.add(tp);
				}
				
				String sql41="select count(*) from tipstop where showflag=0 and user=?;";//未审核过的数量
				p=c.prepareStatement(sql41);
				p.setString(1, username);
				r=p.executeQuery();
				while(r.next()){
					messagecount3=r.getInt(1);
				}
				
				String sql5="select *from tipstop where showflag=1 and user=?;";//用户发表已经审核过的
				p=c.prepareStatement(sql5);
				p.setString(1, username);
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
					list4.add(tp);
				}
				
				String sql51="select count(*) from tipstop where showflag=1 and user=?;";//审核过的数量
				p=c.prepareStatement(sql51);
				p.setString(1, username);
				r=p.executeQuery();
				while(r.next()){
					messagecount4=r.getInt(1);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DButils.closeAll(c, p, r);
		}
		request.getSession().setAttribute("message", list1);
		request.getSession().setAttribute("messagecount", messagecount);
		request.getSession().setAttribute("message2", list2);
		request.getSession().setAttribute("messagecount2", messagecount2);
		request.getSession().setAttribute("usertip1", list3);//未审核的
		request.getSession().setAttribute("messagecount3", messagecount3);
		request.getSession().setAttribute("usertip2", list4);//审核的
		request.getSession().setAttribute("messagecount4", messagecount4);
	}
	
}
