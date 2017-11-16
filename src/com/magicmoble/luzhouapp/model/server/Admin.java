package com.magicmoble.luzhouapp.model.server;

public class Admin {
	@Override
	public String toString() {
		return "Admin [admin_leixing=" + admin_leixing + ", password=" + password + ", phone=" + phone + ", name="
				+ name + ", admin_Tag=" + admin_Tag + ", id=" + id + ", picture=" + picture + ", register_time="
				+ register_time + ", admin_user=" + admin_user + "]";
	}

	private java.lang.Integer admin_leixing;

	private java.lang.String password;

	private java.lang.String phone;

	private java.lang.String name;

	private java.lang.Integer admin_Tag;

	private java.lang.String id;

	private java.lang.String picture;

	private java.sql.Timestamp register_time;

	private java.lang.String admin_user;

	public void setAdmin_leixing(java.lang.Integer admin_leixing){
		this.admin_leixing = admin_leixing;
	}

	public java.lang.Integer getAdmin_leixing(){
		return this.admin_leixing;
	}

	public void setPassword(java.lang.String password){
		this.password = password;
	}

	public java.lang.String getPassword(){
		return this.password;
	}

	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}

	public java.lang.String getPhone(){
		return this.phone;
	}

	public void setName(java.lang.String name){
		this.name = name;
	}

	public java.lang.String getName(){
		return this.name;
	}

	public void setAdmin_Tag(java.lang.Integer admin_Tag){
		this.admin_Tag = admin_Tag;
	}

	public java.lang.Integer getAdmin_Tag(){
		return this.admin_Tag;
	}

	public void setId(java.lang.String id){
		this.id = id;
	}

	public java.lang.String getId(){
		return this.id;
	}

	public void setPicture(java.lang.String picture){
		this.picture = picture;
	}

	public java.lang.String getPicture(){
		return this.picture;
	}

	public void setRegister_time(java.sql.Timestamp register_time){
		this.register_time = register_time;
	}

	public java.sql.Timestamp getRegister_time(){
		return this.register_time;
	}

	public void setAdmin_user(java.lang.String admin_user){
		this.admin_user = admin_user;
	}

	public java.lang.String getAdmin_user(){
		return this.admin_user;
	}
}
