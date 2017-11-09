package com.magicmoble.luzhouapp.model;

import java.sql.Timestamp;
import java.util.List;

public class Fuwu {
	String id;
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

	String shenhe;
	String releaser_id;
	Timestamp time;
	String dianzan_count;
	public String getDianzan_count() {
		return dianzan_count;
	}

	public void setDianzan_count(String dianzan_count) {
		this.dianzan_count = dianzan_count;
	}

	String guangjie_fenlei_Tag;
	String yuedu;
	String dianpu_id;
	String biaoqian;
	String shoucang_Tag;
	String guanggao_url;
	public String getGuanggao_url() {
		return guanggao_url;
	}

	public void setGuanggao_url(String guanggao_url) {
		this.guanggao_url = guanggao_url;
	}

	public String getShoucang_Tag() {
		return shoucang_Tag;
	}

	public void setShoucang_Tag(String shoucang_Tag) {
		this.shoucang_Tag = shoucang_Tag;
	}

	public String getBiaoqian() {
		return biaoqian;
	}

	public void setBiaoqian(String biaoqian) {
		this.biaoqian = biaoqian;
	}

	public String getDianpu_id() {
		return dianpu_id;
	}

	public void setDianpu_id(String dianpu_id) {
		this.dianpu_id = dianpu_id;
	}

	public String getYuedu() {
		return yuedu;
	}

	public void setYuedu(String yuedu) {
		this.yuedu = yuedu;
	}

	public String getGuangjie_fenlei_Tag() {
		return guangjie_fenlei_Tag;
	}

	public void setGuangjie_fenlei_Tag(String guangjie_fenlei_Tag) {
		this.guangjie_fenlei_Tag = guangjie_fenlei_Tag;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getReleaser_id() {
		return releaser_id;
	}

	public void setReleaser_id(String releaser_id) {
		this.releaser_id = releaser_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getShenhe() {
		return shenhe;
	}

	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}

	String fuwu_id;
	String title;
	String price;
	String unit;
	String phone;
	List<Picture> picture;
	List<ContentModel> content;
	int tuijian_Tag;

	public String getFuwu_id() {
		return fuwu_id;
	}

	public void setFuwu_id(String fuwu_id) {
		this.fuwu_id = fuwu_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public List<Picture> getPicture() {
		return picture;
	}

	public void setPicture(List<Picture> picture) {
		this.picture = picture;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<ContentModel> getContent() {
		return content;
	}

	public void setContent(List<ContentModel> content) {
		this.content = content;
	}

	public int getTuijian_Tag() {
		return tuijian_Tag;
	}

	public void setTuijian_Tag(int tuijian_Tag) {
		this.tuijian_Tag = tuijian_Tag;
	}

	@Override
	public String toString() {
		return "Fuwu [id=" + id + ", shenhe=" + shenhe + ", releaser_id=" + releaser_id + ", time=" + time
				+ ", guangjie_fenlei_Tag=" + guangjie_fenlei_Tag + ", yuedu=" + yuedu + ", dianpu_id=" + dianpu_id
				+ ", biaoqian=" + biaoqian + ", shoucang_Tag=" + shoucang_Tag + ", guanggao_url=" + guanggao_url
				+ ", fuwu_id=" + fuwu_id + ", title=" + title + ", price=" + price + ", unit=" + unit + ", phone="
				+ phone + ", picture=" + picture + ", content=" + content + ", tuijian_Tag=" + tuijian_Tag + "]";
	}
	
	

}
