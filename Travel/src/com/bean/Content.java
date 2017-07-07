package com.bean;

import java.io.Serializable;
import java.util.Date;

public class Content implements Serializable{//攻略评论Bean
	private int tipid;
	private String content;
	private String user;
	private String contenttime;//设置成String 避免显示时间的毫秒值
	private int count;
	private String photo;
	public int getTipid() {
		return tipid;
	}
	public void setTipid(int tipid) {
		this.tipid = tipid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContenttime() {
		return contenttime;
	}
	public void setContenttime(String contenttime) {
		this.contenttime = contenttime;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
