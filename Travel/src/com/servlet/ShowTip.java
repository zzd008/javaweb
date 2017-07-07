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

import com.bean.Content;
import com.bean.TipsTop;
import com.utils.DButils;
@WebServlet("/ShowTip")
public class ShowTip extends HttpServlet {//显示一条攻略+评论Servlet
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
		TipsTop tp=new TipsTop();
		ArrayList<Content> list=new ArrayList<Content>();
		int id=0;
		if(request.getParameter("tipid")!=null||request.getSession().getAttribute("turntipid")!=null){//存住tipid
			if(request.getParameter("tipid")!=null){
				id=Integer.parseInt(request.getParameter("tipid").toString());
				request.getSession().setAttribute("savetipid", id);
			}else{
				id=Integer.parseInt(request.getSession().getAttribute("turntipid").toString());
				request.getSession().setAttribute("savetipid", id);
				if(	request.getSession().getAttribute("turntipid")!=null){//跳转至评论页后移除
					request.getSession().removeAttribute("turntipid");
				}
				if(	request.getSession().getAttribute("turnflag")!=null){//跳转至评论页后移除
					request.getSession().removeAttribute("turnflag");
				}
			}
			
		}else{
			id=Integer.parseInt(request.getSession().getAttribute("savetipid").toString());
		}
		try {
			c=DButils.getConnection();
			String sql="update tipstop set readcount=IFNULL(readcount,0)+1  where id=?;";//点击一次，将阅读量+1
			p=c.prepareStatement(sql);
			p.setInt(1, id);
			p.executeUpdate();
			String sql1="select *from tipstop where id=?";//根据id查找 显示攻略详情
			p=c.prepareStatement(sql1);
			p.setInt(1, id);
			r=p.executeQuery();
			if(r.next()){
				tp.setImage(r.getString(1));
				tp.setCaptain(r.getString(2));
				tp.setContent(r.getString(3));
				tp.setReadcount(r.getInt(5));
				tp.setUser(r.getString(4));
				tp.setId(r.getInt(6));
				tp.setTime(r.getDate(7));
			}
			//查询评论总数
			int count=0;
			String sql2="select count(*) from content where tipid=?";
			p=c.prepareStatement(sql2);
			p.setInt(1, id);
			r=p.executeQuery();
			if(r.next()){
				count=r.getInt(1);
			}
			//显示评论及用户头像
			String sql3="select c.user,c.content,c.contenttime,u.photo from tipstop t,content c,user u where t.id=c.tipid and c.user=u.username and t.id=? order by c.contenttime asc;";
			p=c.prepareStatement(sql3);
			p.setInt(1, id);
			r=p.executeQuery();
			while(r.next()){
				Content ct=new Content();
				ct.setUser(r.getString(1));
				ct.setContent(r.getString(2));
				String str=r.getTimestamp(3).toString();//时间截取，不显示毫秒值
				String time=str.substring(0,19);
				ct.setContenttime(time);
				ct.setPhoto(r.getString(4));
				ct.setTipid(id);
				ct.setCount(count);
				list.add(ct);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DButils.closeAll(c, p, r);
		}
		request.getSession().setAttribute("Tip", tp);
		request.getSession().setAttribute("Content", list);
		response.sendRedirect("showtip.jsp");
	}

}
