package com.magicmoble.luzhouapp.entity;
import java.io.Serializable;

public class Shuoshuo implements Serializable{

	private static final long serialVersionUID = 1L;

	private java.sql.Timestamp now_time;

	private int tuijian_Tag;

	private int dianzan_count;

	private java.lang.Integer yuedu;

	private java.lang.String releaser_id;

	private java.lang.String picture;

	private java.lang.String content;

	private java.lang.Integer share_count;

	private int muban_Tag;

	private int guanzhu_Tag;

	private java.lang.String id;

	private java.sql.Timestamp time;

	private java.sql.Timestamp see_time;

	public void setNow_time(java.sql.Timestamp now_time){
		this.now_time = now_time;
	}

	public java.sql.Timestamp getNow_time(){
		return this.now_time;
	}

	public void setTuijian_Tag(int tuijian_Tag){
		this.tuijian_Tag = tuijian_Tag;
	}

	public int getTuijian_Tag(){
		return this.tuijian_Tag;
	}

	public void setDianzan_count(int dianzan_count){
		this.dianzan_count = dianzan_count;
	}

	public int getDianzan_count(){
		return this.dianzan_count;
	}

	public void setYuedu(java.lang.Integer yuedu){
		this.yuedu = yuedu;
	}

	public java.lang.Integer getYuedu(){
		return this.yuedu;
	}

	public void setReleaser_id(java.lang.String releaser_id){
		this.releaser_id = releaser_id;
	}

	public java.lang.String getReleaser_id(){
		return this.releaser_id;
	}

	public void setPicture(java.lang.String picture){
		this.picture = picture;
	}

	public java.lang.String getPicture(){
		return this.picture;
	}

	public void setContent(java.lang.String content){
		this.content = content;
	}

	public java.lang.String getContent(){
		return this.content;
	}

	public void setShare_count(java.lang.Integer share_count){
		this.share_count = share_count;
	}

	public java.lang.Integer getShare_count(){
		return this.share_count;
	}

	public void setMuban_Tag(int muban_Tag){
		this.muban_Tag = muban_Tag;
	}

	public int getMuban_Tag(){
		return this.muban_Tag;
	}

	public void setGuanzhu_Tag(int guanzhu_Tag){
		this.guanzhu_Tag = guanzhu_Tag;
	}

	public int getGuanzhu_Tag(){
		return this.guanzhu_Tag;
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

	public void setSee_time(java.sql.Timestamp see_time){
		this.see_time = see_time;
	}

	public java.sql.Timestamp getSee_time(){
		return this.see_time;
	}

}
