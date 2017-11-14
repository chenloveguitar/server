package com.magicmoble.luzhouapp.model;
import java.io.Serializable;

public class Renzheng implements Serializable{

	private static final long serialVersionUID = 1L;

	private java.sql.Timestamp now_time;

	private java.lang.String my_id;

	private java.lang.String name;

	private java.lang.String id;

	private java.lang.String leixing_Tag;

	private java.lang.String message;

	private java.lang.String picture;

	private java.lang.String renzheng_Tag;

	private java.sql.Timestamp see_time;

	public void setNow_time(java.sql.Timestamp now_time){
		this.now_time = now_time;
	}

	public java.sql.Timestamp getNow_time(){
		return this.now_time;
	}

	public void setMy_id(java.lang.String my_id){
		this.my_id = my_id;
	}

	public java.lang.String getMy_id(){
		return this.my_id;
	}

	public void setName(java.lang.String name){
		this.name = name;
	}

	public java.lang.String getName(){
		return this.name;
	}

	public void setId(java.lang.String id){
		this.id = id;
	}

	public java.lang.String getId(){
		return this.id;
	}

	public void setLeixing_Tag(java.lang.String leixing_Tag){
		this.leixing_Tag = leixing_Tag;
	}

	public java.lang.String getLeixing_Tag(){
		return this.leixing_Tag;
	}

	public void setMessage(java.lang.String message){
		this.message = message;
	}

	public java.lang.String getMessage(){
		return this.message;
	}

	public void setPicture(java.lang.String picture){
		this.picture = picture;
	}

	public java.lang.String getPicture(){
		return this.picture;
	}

	public void setRenzheng_Tag(java.lang.String renzheng_Tag){
		this.renzheng_Tag = renzheng_Tag;
	}

	public java.lang.String getRenzheng_Tag(){
		return this.renzheng_Tag;
	}

	public void setSee_time(java.sql.Timestamp see_time){
		this.see_time = see_time;
	}

	public java.sql.Timestamp getSee_time(){
		return this.see_time;
	}

}
