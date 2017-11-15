package com.magicmoble.luzhouapp.model.server;
import java.io.Serializable;

public class Advertisement implements Serializable{

	private static final long serialVersionUID = 1L;

	private java.lang.String url;
	private java.lang.String guanggao_id;

	private int muban_Tag;

	private int guangjie_fenlei_Tag;

	private int shangjia_Tag;

	private java.lang.String id;

	private java.sql.Timestamp time;

	private java.lang.String picture;

	private int fenlei_Tag;

	public java.lang.String getUrl() {
		return url;
	}

	public void setUrl(java.lang.String url) {
		this.url = url;
	}

	public void setGuanggao_id(java.lang.String guanggao_id){
		this.guanggao_id = guanggao_id;
	}

	public java.lang.String getGuanggao_id(){
		return this.guanggao_id;
	}

	public void setMuban_Tag(int muban_Tag){
		this.muban_Tag = muban_Tag;
	}

	public int getMuban_Tag(){
		return this.muban_Tag;
	}

	public void setGuangjie_fenlei_Tag(int guangjie_fenlei_Tag){
		this.guangjie_fenlei_Tag = guangjie_fenlei_Tag;
	}

	public int getGuangjie_fenlei_Tag(){
		return this.guangjie_fenlei_Tag;
	}

	public void setShangjia_Tag(int shangjia_Tag){
		this.shangjia_Tag = shangjia_Tag;
	}

	public int getShangjia_Tag(){
		return this.shangjia_Tag;
	}

	public void setId(java.lang.String id){
		this.id = id;
	}

	public java.lang.String getId(){
		return this.id;
	}

	public void setTime(java.sql.Timestamp time){
		this.time = time;
	}

	public java.sql.Timestamp getTime(){
		return this.time;
	}

	public void setPicture(java.lang.String picture){
		this.picture = picture;
	}

	public java.lang.String getPicture(){
		return this.picture;
	}

	public void setFenlei_Tag(int fenlei_Tag){
		this.fenlei_Tag = fenlei_Tag;
	}

	public int getFenlei_Tag(){
		return this.fenlei_Tag;
	}

}
