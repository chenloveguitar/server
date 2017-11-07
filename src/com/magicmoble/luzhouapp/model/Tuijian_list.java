package com.magicmoble.luzhouapp.model;
import java.io.Serializable;

public class Tuijian_list implements Serializable{

	private static final long serialVersionUID = 1L;

	private java.sql.Timestamp now_time;

	private java.sql.Timestamp start_time;

	private java.lang.String tiaomu_id;

	private java.sql.Timestamp end_time;

	private java.lang.String id;

	private java.lang.String tuijian_user;

	public void setNow_time(java.sql.Timestamp now_time){
		this.now_time = now_time;
	}

	public java.sql.Timestamp getNow_time(){
		return this.now_time;
	}

	public void setStart_time(java.sql.Timestamp start_time){
		this.start_time = start_time;
	}

	public java.sql.Timestamp getStart_time(){
		return this.start_time;
	}

	public void setTiaomu_id(java.lang.String tiaomu_id){
		this.tiaomu_id = tiaomu_id;
	}

	public java.lang.String getTiaomu_id(){
		return this.tiaomu_id;
	}

	public void setEnd_time(java.sql.Timestamp end_time){
		this.end_time = end_time;
	}

	public java.sql.Timestamp getEnd_time(){
		return this.end_time;
	}

	public void setId(java.lang.String id){
		this.id = id;
	}

	public java.lang.String getId(){
		return this.id;
	}

	public void setTuijian_user(java.lang.String tuijian_user){
		this.tuijian_user = tuijian_user;
	}

	public java.lang.String getTuijian_user(){
		return this.tuijian_user;
	}

}
