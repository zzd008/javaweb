package com.manager.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bean.IndexMiddle;
import com.bean.User;
import com.utils.DButils;

@WebServlet("/AddIndexMiddle")
public class AddIndexMiddle extends HttpServlet {//添加热门旅游地
	//上传时的临时空间的大小
	private static final int MERORY_THRESHOLD = 1024*1024*3;//3MB
	//文件上传时的大小
	private static final int MAX_FILE_SIZE = 1024*1024*40;//40MB
	//上传请求的大小
	private static final int MAX_REQUEST_SIZE = 1024*1024*50;//50MB	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;cahrset=utf-8");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);
		
		String captain="";
		String content1="";
		String content2="";
		String showflag="";
		String imagename="";
		
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("message", "你这个不是上传文件的操作");
		}else{
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(MERORY_THRESHOLD);
				factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setFileSizeMax(MAX_FILE_SIZE);
				upload.setSizeMax(MAX_REQUEST_SIZE);
				upload.setHeaderEncoding("UTF-8");
				String uploadPath = "E:\\Java\\Eclipse\\工作区间\\Travel\\WebContent\\indeximages\\";
				File uploadDir = new File(uploadPath);
				if(!uploadDir.exists()){
					uploadDir.mkdir();
			}
			try {
				List<FileItem> formItems = upload.parseRequest(request);
				if(formItems != null && formItems.size() > 0){
					for(FileItem item : formItems){
						if(!item.isFormField()){
							String fileName = new File(item.getName()).getName();//文件名
							String[] str = fileName.split("\\.");
							imagename=str[0]+(int)(Math.random()*100)+"."+str[1];//避免路径重复
							String filePath = uploadPath +imagename;//完整路径名
							File storeFile = new File(filePath);
							item.write(storeFile);
							request.setAttribute("message","文件上传成功！");
						}else{
							if(item.getFieldName().equals("captain")){//name匹配
								captain=item.getString("UTF-8");
							}
							else if(item.getFieldName().equals("content1")){
								content1=item.getString("UTF-8");
							}else if(item.getFieldName().equals("content2")){
								content2=item.getString("UTF-8");
							}else if(item.getFieldName().equals("showflag")){
								showflag=item.getString("UTF-8");
							}
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		//表单项
		Connection c=null;
		PreparedStatement p=null;
		ResultSet r=null;
		try {
			c=DButils.getConnection();
			int showflag1=0;//是否显示在主页
			if(showflag!=""){
				showflag1=1;
			}
			String sql="insert into indexmiddle values(?,?,?,?,?,null);";
			p = c.prepareStatement(sql);
			p.setString(1, captain);
			p.setString(2, content1);
			p.setString(3, content2);
			p.setString(4, "indeximages/"+imagename);
			p.setInt(5, showflag1);
			p.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("插入失败！");
		}finally{
			DButils.closeAll(c, p, r);
		}
		response.sendRedirect("/Travel/manager/indexmiddle.jsp");
	}
}
