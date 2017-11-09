package com.magicmoble.luzhouapp.model;

import java.sql.Timestamp;
import java.util.List;

public class Faxian {
	String faxian_id;
	String muban_Tag;
	String described;
	int share_count;
	String publish_date;
	
	public String getPublish_date() {
		return publish_date;
	}

	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}
	public int getShare_count() {
		return share_count;
	}

	public void setShare_count(int share_count) {
		this.share_count = share_count;
	}

	public String getDescribed() {
		return described;
	}

	public void setDescribed(String described) {
		this.described = described;
	}

	public String getMuban_Tag() {
		return muban_Tag;
	}

	public void setMuban_Tag(String muban_Tag) {
		this.muban_Tag = muban_Tag;
	}

	String id;
	String fufei_Tag;
	String pinglun_count;
	String yuedu_count;
	String dashang_count;
	String shoucang_Tag;
	String biaoqian;
	public String getBiaoqian() {
		return biaoqian;
	}

	public void setBiaoqian(String biaoqian) {
		this.biaoqian = biaoqian;
	}

	public String getShoucang_Tag() {
		return shoucang_Tag;
	}

	public void setShoucang_Tag(String shoucang_Tag) {
		this.shoucang_Tag = shoucang_Tag;
	}

	public String getDashang_count() {
		return dashang_count;
	}

	public void setDashang_count(String dashang_count) {
		this.dashang_count = dashang_count;
	}

	public String getYuedu_count() {
		return yuedu_count;
	}

	public void setYuedu_count(String yuedu_count) {
		this.yuedu_count = yuedu_count;
	}

	public String getPinglun_count() {
		return pinglun_count;
	}

	public void setPinglun_count(String pinglun_count) {
		this.pinglun_count = pinglun_count;
	}

	String dianzan_count;
	public String getDianzan_count() {
		return dianzan_count;
	}

	public void setDianzan_count(String dianzan_count) {
		this.dianzan_count = dianzan_count;
	}

	public String getFufei_Tag() {
		return fufei_Tag;
	}

	public void setFufei_Tag(String fufei_Tag) {
		this.fufei_Tag = fufei_Tag;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	List<Picture> picture;
	String title;
	String name;
	List<ContentModel> content;
	int fenlei_Tag;
	String shenhe;
	String releaser_id;
	Timestamp time;

	
	public String getFaxian_id() {
		return faxian_id;
	}

	public void setFaxian_id(String faxian_id) {
		this.faxian_id = faxian_id;
	}

	public List<Picture> getPicture() {
		return picture;
	}

	public void setPicture(List<Picture> picture) {
		this.picture = picture;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ContentModel> getContent() {
		return content;
	}

	public void setContent(List<ContentModel> content) {
		this.content = content;
	}

	public int getFenlei_Tag() {
		return fenlei_Tag;
	}

	public void setFenlei_Tag(int fenlei_Tag) {
		this.fenlei_Tag = fenlei_Tag;
	}

	public String getShenhe() {
		return shenhe;
	}

	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}

	public String getReleaser_id() {
		return releaser_id;
	}

	public void setReleaser_id(String releaser_id) {
		this.releaser_id = releaser_id;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Faxian [faxian_id=" + faxian_id + ", picture=" + picture + ", title=" + title + ", name=" + name
				+ ", content=" + content + ", fenlei_Tag=" + fenlei_Tag + ", shenhe=" + shenhe + ", releaser_id="
				+ releaser_id + ", time=" + time + "]";
	}

}
