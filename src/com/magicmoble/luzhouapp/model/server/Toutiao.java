package com.magicmoble.luzhouapp.model.server;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.magicmoble.luzhouapp.model.Picture;

public class Toutiao {
	String id;
	String name;
	String fufei_Tag;
	String fenlei_Tag;
	String muban_Tag;
	String laiyuan;
	String dianzan_count;
	String pinglun_count;
	String releaser_id;
	String dashang_count;
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

	String shoucang_Tag;
	public String getDashang_count() {
		return dashang_count;
	}

	public void setDashang_count(String dashang_count) {
		this.dashang_count = dashang_count;
	}

	public String getReleaser_id() {
		return releaser_id;
	}

	public void setReleaser_id(String releaser_id) {
		this.releaser_id = releaser_id;
	}

	public String getPinglun_count() {
		return pinglun_count;
	}

	public void setPinglun_count(String pinglun_count) {
		this.pinglun_count = pinglun_count;
	}

	public String getDianzan_count() {
		return dianzan_count;
	}

	public void setDianzan_count(String dianzan_count) {
		this.dianzan_count = dianzan_count;
	}

	public String getLaiyuan() {
		return laiyuan;
	}

	public void setLaiyuan(String laiyuan) {
		this.laiyuan = laiyuan;
	}

	public String getMuban_Tag() {
		return muban_Tag;
	}

	public void setMuban_Tag(String muban_Tag) {
		this.muban_Tag = muban_Tag;
	}

	public String getFenlei_Tag() {
		return fenlei_Tag;
	}

	public void setFenlei_Tag(String fenlei_Tag) {
		this.fenlei_Tag = fenlei_Tag;
	}

	public String getFufei_Tag() {
		return fufei_Tag;
	}

	public void setFufei_Tag(String fufei_Tag) {
		this.fufei_Tag = fufei_Tag;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	List<Picture> pictures;
	String title;
	List<Picture> picture;
	public List<Picture> getPicture() {
		return picture;
	}

	public void setPicture(List<Picture> picture) {
		this.picture = picture;
	}

	int yuedu_count;
	int share_count;
	int shoucang_count;
	String releaser_touxiang;
	String releaser_name;
	Timestamp time;
	String shenhe;
	double dianzan_hongbao;
	double share_hongbao;
	int days;
	String tuijian_message;
	String tuijian_Tag;
	String content;
	
	Map<String, Object> data = new HashMap<String, Object>();

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTuijian_Tag() {
		return tuijian_Tag;
	}

	public void setTuijian_Tag(String tuijian_Tag) {
		this.tuijian_Tag = tuijian_Tag;
	}

	public String getTuijian_message() {
		return tuijian_message;
	}

	public void setTuijian_message(String tuijian_message) {
		this.tuijian_message = tuijian_message;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getYuedu_count() {
		return yuedu_count;
	}

	public void setYuedu_count(int yuedu_count) {
		this.yuedu_count = yuedu_count;
	}

	public int getShare_count() {
		return share_count;
	}

	public void setShare_count(int share_count) {
		this.share_count = share_count;
	}

	public int getShoucang_count() {
		return shoucang_count;
	}

	public void setShoucang_count(int shoucang_count) {
		this.shoucang_count = shoucang_count;
	}

	public String getReleaser_touxiang() {
		return releaser_touxiang;
	}

	public void setReleaser_touxiang(String releaser_touxiang) {
		this.releaser_touxiang = releaser_touxiang;
	}

	public String getReleaser_name() {
		return releaser_name;
	}

	public void setReleaser_name(String releaser_name) {
		this.releaser_name = releaser_name;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getShenhe() {
		return shenhe;
	}

	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}

	public double getDianzan_hongbao() {
		return dianzan_hongbao;
	}

	public void setDianzan_hongbao(double dianzan_hongbao) {
		this.dianzan_hongbao = dianzan_hongbao;
	}

	public double getShare_hongbao() {
		return share_hongbao;
	}

	public void setShare_hongbao(double share_hongbao) {
		this.share_hongbao = share_hongbao;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	@Override
	public String toString() {
		return "Toutiao [id=" + id + ", name=" + name + ", fufei_Tag=" + fufei_Tag + ", fenlei_Tag=" + fenlei_Tag
				+ ", muban_Tag=" + muban_Tag + ", laiyuan=" + laiyuan + ", dianzan_count=" + dianzan_count
				+ ", pinglun_count=" + pinglun_count + ", releaser_id=" + releaser_id + ", dashang_count="
				+ dashang_count + ", biaoqian=" + biaoqian + ", shoucang_Tag=" + shoucang_Tag + ", pictures=" + pictures
				+ ", title=" + title + ", picture=" + picture + ", yuedu_count=" + yuedu_count + ", share_count="
				+ share_count + ", shoucang_count=" + shoucang_count + ", releaser_touxiang=" + releaser_touxiang
				+ ", releaser_name=" + releaser_name + ", time=" + time + ", shenhe=" + shenhe + ", dianzan_hongbao="
				+ dianzan_hongbao + ", share_hongbao=" + share_hongbao + ", days=" + days + ", tuijian_message="
				+ tuijian_message + ", tuijian_Tag=" + tuijian_Tag + ", content=" + content + ", data=" + data + "]";
	}



}
