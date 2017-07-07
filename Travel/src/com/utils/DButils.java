package com.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.junit.Test;

public class DButils {//数据库连接工具类
	private static String driverurl;
	private static String url;
	private static String dbname;
	private static String dbpassword;
	
	static{
		ResourceBundle res=ResourceBundle.getBundle("Dbinfo");
		driverurl=res.getString("driverurl");
		url=res.getString("url");
		dbname=res.getString("dbname");
		dbpassword=res.getString("dbpassword");
		try {
			Class.forName(driverurl);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	//获取连接
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(url,dbname,dbpassword);
	}
	
	//关闭连接
		public static void closeAll(Connection c,PreparedStatement p,ResultSet r){
			if(r!=null){
				try {
					r.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					r=null;
				}
			}
			if(p!=null){
				try {
					p.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					p=null;
				}
			}
			if(c!=null){
				try {
					c.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					c=null;
				}
			}
		}
	@Test
	public void test1() throws SQLException{
		if(DButils.getConnection()!=null){
			System.out.println("数据库连接成功！");
		}
	}
}
