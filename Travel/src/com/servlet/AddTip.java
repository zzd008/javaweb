package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.bean.IndexTop;
import com.bean.User;
import com.utils.DButils;

@WebServlet("/AddTip")
public class AddTip extends HttpServlet {//写攻略Servlet
	
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
		
		//获取表单数据
		String captain="";
		String content="";
		String label="";
		String imagename="";
		
		//判断是否是上传文件的操作
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("message", "你这个不是上传文件的操作");
		}else{
			//配置上传参数
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//设置内存临界值-如果超过后将产生临时文件并存储到临时目录中
			factory.setSizeThreshold(MERORY_THRESHOLD);
			//设置临时存储文件的目录
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			//设置最大文件上传值
			upload.setFileSizeMax(MAX_FILE_SIZE);
			//设置最大请求值(包含表单数据和文件)
			upload.setSizeMax(MAX_REQUEST_SIZE);
			
			upload.setHeaderEncoding("UTF-8");
			
			//构造临时路径来存储上传的文件
			String uploadPath = "E:\\Java\\Eclipse\\工作区间\\Travel\\WebContent\\tipsimages\\";
			
			File uploadDir = new File(uploadPath);
			//如果目录不存在则创建
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
							if(item.getFieldName().equals("tipcaptain")){//name匹配
								captain=item.getString("UTF-8");
							}
							else if(item.getFieldName().equals("label")){
								label=item.getString("UTF-8");
							}else if(item.getFieldName().equals("tipcontent")){
								content=item.getString("UTF-8");
							}
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		//处理非上传信息
		Connection c=null;
		PreparedStatement p=null;
		int flag=0;
		String user="";
		if(request.getSession().getAttribute("userlogin")!=null){
			User u=(User) request.getSession().getAttribute("userlogin");
			user=u.getUsername();
		}else{
			//让用户先登录
		}
		try {
			c=DButils.getConnection();
			String sql="insert into tipstop values(?,?,?,?,0,null,?,0,?);";
			p = c.prepareStatement(sql);
			p.setString(1, "tipsimages/"+imagename);
			p.setString(2, captain);
			p.setString(3, content);
			if(user==""){
				user="匿名";
			}
			p.setString(4, user);
			Date date=new Date();//格式化时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=sdf.format(date);
			Date contentTime=null;
			try {
				contentTime = sdf.parse(time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			p.setDate(5, new java.sql.Date(contentTime.getTime()));
			p.setString(6, label);
			flag = p.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DButils.closeAll(c, p, null);
		}
		
		if(flag!=0){
			request.getSession().setAttribute("WriteTipInfo", "您的攻略已发表，待管理员审核通过即可显示，感谢你的分享！");
			response.sendRedirect("writetipsuccess.jsp");
		}else{
			
		}
		
		
		/*//图片名称        //也需要刷新项目下文件夹。。。。。。
		String imagename=request.getParameter("image");
		String[] str = imagename.split("\\.");
		String imagename1=str[0]+(int)(Math.random()*100)+"."+str[1];//避免路径重复
		//图片路径
		String imagePath="C:\\Users\\zzd\\Desktop\\"+imagename;//不会根据表单里选的图片来获取路径。。。
		//存储路径
		String savePath="E:\\Java\\Eclipse\\工作区间\\Travel\\WebContent\\tipsimages\\"+imagename1;
		
		FileInputStream fis=new FileInputStream(imagePath);
		FileOutputStream fos=new FileOutputStream(savePath);
		byte[] bt=new byte[1024];
		int length=0;
		while((length=fis.read(bt))!=-1){
			fos.write(bt, 0, length);
		}
		fos.close();
		fis.close();
		
		//处理非上传信息
		Connection c=null;
		PreparedStatement p=null;
		int flag=0;
		String captain=request.getParameter("tipcaptain");
		String content=request.getParameter("tipcontent");
		String label=request.getParameter("label");
		String user="";
		if(request.getSession().getAttribute("userlogin")!=null){
			User u=(User) request.getSession().getAttribute("userlogin");
			user=u.getUsername();
		}else{
			//让用户先登录
		}
		try {
			c=DButils.getConnection();
			String sql="insert into tipstop values(?,?,?,?,0,null,?,0,?);";
			p = c.prepareStatement(sql);
			p.setString(1, "tipsimages/"+imagename);
			p.setString(2, captain);
			p.setString(3, content);
			p.setString(4, user);
			Date date=new Date();//格式化时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=sdf.format(date);
			Date contentTime=null;
			try {
				contentTime = sdf.parse(time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			p.setDate(5, new java.sql.Date(contentTime.getTime()));
			p.setString(6, label);
			flag = p.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DButils.closeAll(c, p, null);
		}
		
		if(flag!=0){
			request.getSession().setAttribute("WriteTipInfo", "您的攻略已发表，待管理员审核通过即可显示，感谢你的分享！");
			response.sendRedirect("writetipsuccess.jsp");
		}else{
			
		}*/

	}
}
