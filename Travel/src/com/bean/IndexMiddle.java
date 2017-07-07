package com.bean;

import java.io.Serializable;

public class IndexMiddle implements Serializable{//Ö÷Ò³ÖÐ²¿1Bean
	private String captain;
	private String content1;
	private String image;
	private String content2;
	private int showflag;
	private int id;
	public String getCaptain() {
		return captain;
	}
	public void setCaptain(String captain) {
		this.captain = captain;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public int getShowflag() {
		return showflag;
	}
	public void setShowflag(int showflag) {
		this.showflag = showflag;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
