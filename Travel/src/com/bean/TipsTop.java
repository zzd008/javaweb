package com.bean;

import java.io.Serializable;
import java.sql.Date;

public class TipsTop implements Serializable{//π•¬‘Bean
	private String image;
	private String captain;
	private String content;
	private String user;
	private int readcount;
	private int id;
	private Date time;
	private int showflag;
	private String label;
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public static final int PAGE_SIZE=6;//√ø“≥œ‘ æ6Ãı
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCaptain() {
		return captain;
	}
	public void setCaptain(String captain) {
		this.captain = captain;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getShowflag() {
		return showflag;
	}
	public void setShowflag(int showflag) {
		this.showflag = showflag;
	}
	public static int getPageSize() {
		return PAGE_SIZE;
	}
	
	
}
