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
public class AddTip extends HttpServlet {//д����Servlet
	
		//�ϴ�ʱ����ʱ�ռ�Ĵ�С
		private static final int MERORY_THRESHOLD = 1024*1024*3;//3MB
		//�ļ��ϴ�ʱ�Ĵ�С
		private static final int MAX_FILE_SIZE = 1024*1024*40;//40MB
		//�ϴ�����Ĵ�С
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
		
		//��ȡ������
		String captain="";
		String content="";
		String label="";
		String imagename="";
		
		//�ж��Ƿ����ϴ��ļ��Ĳ���
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("message", "����������ϴ��ļ��Ĳ���");
		}else{
			//�����ϴ�����
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//�����ڴ��ٽ�ֵ-��������󽫲�����ʱ�ļ����洢����ʱĿ¼��
			factory.setSizeThreshold(MERORY_THRESHOLD);
			//������ʱ�洢�ļ���Ŀ¼
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			//��������ļ��ϴ�ֵ
			upload.setFileSizeMax(MAX_FILE_SIZE);
			//�����������ֵ(���������ݺ��ļ�)
			upload.setSizeMax(MAX_REQUEST_SIZE);
			
			upload.setHeaderEncoding("UTF-8");
			
			//������ʱ·�����洢�ϴ����ļ�
			String uploadPath = "E:\\Java\\Eclipse\\��������\\Travel\\WebContent\\tipsimages\\";
			
			File uploadDir = new File(uploadPath);
			//���Ŀ¼�������򴴽�
			if(!uploadDir.exists()){
				uploadDir.mkdir();
			}
			
			try {
				List<FileItem> formItems = upload.parseRequest(request);
				if(formItems != null && formItems.size() > 0){
					for(FileItem item : formItems){
						if(!item.isFormField()){
							String fileName = new File(item.getName()).getName();//�ļ���
							String[] str = fileName.split("\\.");
							imagename=str[0]+(int)(Math.random()*100)+"."+str[1];//����·���ظ�
							String filePath = uploadPath +imagename;//����·����
							File storeFile = new File(filePath);
							item.write(storeFile);
							request.setAttribute("message","�ļ��ϴ��ɹ���");
						}else{
							if(item.getFieldName().equals("tipcaptain")){//nameƥ��
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
		
		//������ϴ���Ϣ
		Connection c=null;
		PreparedStatement p=null;
		int flag=0;
		String user="";
		if(request.getSession().getAttribute("userlogin")!=null){
			User u=(User) request.getSession().getAttribute("userlogin");
			user=u.getUsername();
		}else{
			//���û��ȵ�¼
		}
		try {
			c=DButils.getConnection();
			String sql="insert into tipstop values(?,?,?,?,0,null,?,0,?);";
			p = c.prepareStatement(sql);
			p.setString(1, "tipsimages/"+imagename);
			p.setString(2, captain);
			p.setString(3, content);
			if(user==""){
				user="����";
			}
			p.setString(4, user);
			Date date=new Date();//��ʽ��ʱ��
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
			request.getSession().setAttribute("WriteTipInfo", "���Ĺ����ѷ���������Ա���ͨ��������ʾ����л��ķ���");
			response.sendRedirect("writetipsuccess.jsp");
		}else{
			
		}
		
		
		/*//ͼƬ����        //Ҳ��Ҫˢ����Ŀ���ļ��С�����������
		String imagename=request.getParameter("image");
		String[] str = imagename.split("\\.");
		String imagename1=str[0]+(int)(Math.random()*100)+"."+str[1];//����·���ظ�
		//ͼƬ·��
		String imagePath="C:\\Users\\zzd\\Desktop\\"+imagename;//������ݱ���ѡ��ͼƬ����ȡ·��������
		//�洢·��
		String savePath="E:\\Java\\Eclipse\\��������\\Travel\\WebContent\\tipsimages\\"+imagename1;
		
		FileInputStream fis=new FileInputStream(imagePath);
		FileOutputStream fos=new FileOutputStream(savePath);
		byte[] bt=new byte[1024];
		int length=0;
		while((length=fis.read(bt))!=-1){
			fos.write(bt, 0, length);
		}
		fos.close();
		fis.close();
		
		//������ϴ���Ϣ
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
			//���û��ȵ�¼
		}
		try {
			c=DButils.getConnection();
			String sql="insert into tipstop values(?,?,?,?,0,null,?,0,?);";
			p = c.prepareStatement(sql);
			p.setString(1, "tipsimages/"+imagename);
			p.setString(2, captain);
			p.setString(3, content);
			p.setString(4, user);
			Date date=new Date();//��ʽ��ʱ��
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
			request.getSession().setAttribute("WriteTipInfo", "���Ĺ����ѷ���������Ա���ͨ��������ʾ����л��ķ���");
			response.sendRedirect("writetipsuccess.jsp");
		}else{
			
		}*/

	}
}
