package com.bean;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable{//用户登录、注册信息Bean
	private String username;
	private String userpassword;
	private String useremail;
	private int id;
	private Date registtime;
	private String photo;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getRegisttime() {
		return registtime;
	}
	public void setRegisttime(Date registtime) {
		this.registtime = registtime;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", userpassword=" + userpassword + ", useremail=" + useremail + ", id="
				+ id + ", registtime=" + registtime + ", photo=" + photo + "]";
	}
	
	
}
