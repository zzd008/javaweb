package com.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.TipsTop;

public class PageDao {//分页查询工具类
	
	public ArrayList<TipsTop> find(int page){//根据页码查询对应的数据
		ArrayList<TipsTop> list=new ArrayList<TipsTop>();
		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		try {
			c=DButils.getConnection();
			String sql="select *from tipstop where showflag=1 order by ifnull(readcount,0) desc limit ?,?;";//只显示出管理员审核过的
			p=c.prepareStatement(sql);
			p.setInt(1, (page-1)*TipsTop.PAGE_SIZE);//从哪里查 下标从0开始
			p.setInt(2, TipsTop.PAGE_SIZE);//查几行
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
				list.add(tp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DButils.closeAll(c, p, r);
		}
		return list;
	}
	
	public int findCount(){//查询出表中共有多少数据
		int count=0;
		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		try {
			c=DButils.getConnection();
			String sql="select count(*) from tipstop where showflag=1;";
			p=c.prepareStatement(sql);
			r=p.executeQuery();
			if(r.next()){
				count=r.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DButils.closeAll(c, p, r);
		}
		return count;
	}
}
