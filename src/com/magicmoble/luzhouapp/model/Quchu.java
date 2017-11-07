package com.magicmoble.luzhouapp.model;

import java.sql.Timestamp;
import java.util.List;

public class Quchu {
	String id;
	String described;
	int share_count;
	
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

	String quchu_id;
	String title;
	String address;
	String touxiang;
	String phone;
	List<Picture> picture;
	List<ContentModel> content;
	Dianzan_Number dianzan_count;
	int dashang_count;
	int fenlei_Tag;
	String shenhe;
	String releaser_id;
	Timestamp time;
	String dianpu_touxiang;
	String dianpu_name;
	String dianpu_address;
	String renzheng_Tag;
	String biaoqian;
	String dianzhan_count;
	String guanggao_url;
	String yuedu;
	String muban_Tag;
	public String getMuban_Tag() {
		return muban_Tag;
	}

	public void setMuban_Tag(String muban_Tag) {
		this.muban_Tag = muban_Tag;
	}

	public String getYuedu() {
		return yuedu;
	}

	public void setYuedu(String yuedu) {
		this.yuedu = yuedu;
	}

	public String getGuanggao_url() {
		return guanggao_url;
	}

	public void setGuanggao_url(String guanggao_url) {
		this.guanggao_url = guanggao_url;
	}

	public String getDianzhan_count() {
		return dianzhan_count;
	}

	public void setDianzhan_count(String dianzhan_count) {
		this.dianzhan_count = dianzhan_count;
	}

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

	public String getRenzheng_Tag() {
		return renzheng_Tag;
	}

	public void setRenzheng_Tag(String renzheng_Tag) {
		this.renzheng_Tag = renzheng_Tag;
	}

	public String getDianpu_address() {
		return dianpu_address;
	}

	public void setDianpu_address(String dianpu_address) {
		this.dianpu_address = dianpu_address;
	}

	public String getDianpu_name() {
		return dianpu_name;
	}

	public void setDianpu_name(String dianpu_name) {
		this.dianpu_name = dianpu_name;
	}

	public String getDianpu_touxiang() {
		return dianpu_touxiang;
	}

	public void setDianpu_touxiang(String dianpu_touxiang) {
		this.dianpu_touxiang = dianpu_touxiang;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuchu_id() {
		return quchu_id;
	}

	public void setQuchu_id(String quchu_id) {
		this.quchu_id = quchu_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<Picture> getPicture() {
		return picture;
	}

	public void setPicture(List<Picture> picture) {
		this.picture = picture;
	}

	public List<ContentModel> getContent() {
		return content;
	}

	public void setContent(List<ContentModel> content) {
		this.content = content;
	}

	public String getTouxiang() {
		return touxiang;
	}

	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
	}

	public Dianzan_Number getDianzan_count() {
		return dianzan_count;
	}

	public void setDianzan_count(Dianzan_Number dianzan_count) {
		this.dianzan_count = dianzan_count;
	}

	public int getDashang_count() {
		return dashang_count;
	}

	public void setDashang_count(int dashang_count) {
		this.dashang_count = dashang_count;
	}

	public int getFenlei_Tag() {
		return fenlei_Tag;
	}

	public void setFenlei_Tag(int fenlei_Tag) {
		this.fenlei_Tag = fenlei_Tag;
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

	public String getShenhe() {
		return shenhe;
	}

	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}

	@Override
	public String toString() {
		return "Quchu [id=" + id + ", quchu_id=" + quchu_id + ", title=" + title + ", address=" + address
				+ ", touxiang=" + touxiang + ", phone=" + phone + ", picture=" + picture + ", content=" + content
				+ ", dianzan_count=" + dianzan_count + ", dashang_count=" + dashang_count + ", fenlei_Tag=" + fenlei_Tag
				+ ", shenhe=" + shenhe + ", releaser_id=" + releaser_id + ", time=" + time + ", dianpu_touxiang="
				+ dianpu_touxiang + ", dianpu_name=" + dianpu_name + ", dianpu_address=" + dianpu_address
				+ ", renzheng_Tag=" + renzheng_Tag + ", biaoqian=" + biaoqian + ", dianzhan_count=" + dianzhan_count
				+ ", guanggao_url=" + guanggao_url + ", yuedu=" + yuedu + ", shoucang_Tag=" + shoucang_Tag + "]";
	}
	
	
	
}
