package com.magicmoble.luzhouapp.model;

import java.sql.Timestamp;
import java.util.List;

public class Commodity {
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

	String dingdan_number;
	String dianzan_count;
	public String getDianzan_count() {
		return dianzan_count;
	}

	public void setDianzan_count(String dianzan_count) {
		this.dianzan_count = dianzan_count;
	}

	String Guangjie_fenlei_Tag;
	int Yuedu;
	String Dianpu_id;
	String Biaoqian;
	String Shoucang_Tag;
	String Guanggao_url;
	public String getGuanggao_url() {
		return Guanggao_url;
	}

	public void setGuanggao_url(String guanggao_url) {
		Guanggao_url = guanggao_url;
	}

	public String getShoucang_Tag() {
		return Shoucang_Tag;
	}

	public void setShoucang_Tag(String shoucang_Tag) {
		Shoucang_Tag = shoucang_Tag;
	}

	public String getBiaoqian() {
		return Biaoqian;
	}

	public void setBiaoqian(String biaoqian) {
		Biaoqian = biaoqian;
	}

	public String getDianpu_id() {
		return Dianpu_id;
	}

	public void setDianpu_id(String dianpu_id) {
		Dianpu_id = dianpu_id;
	}

	public int getYuedu() {
		return Yuedu;
	}

	public void setYuedu(int yuedu) {
		Yuedu = yuedu;
	}

	public String getGuangjie_fenlei_Tag() {
		return Guangjie_fenlei_Tag;
	}

	public void setGuangjie_fenlei_Tag(String Guangjie_fenlei_Tag) {
		this.Guangjie_fenlei_Tag = Guangjie_fenlei_Tag;
	}

	public String getDingdan_number() {
		return dingdan_number;
	}

	public void setDingdan_number(String dingdan_number) {
		this.dingdan_number = dingdan_number;
	}

	String commodity_id;
	String title;
	String price;
	String unit;
	String shuliang;
	String freight;
	String phone;
	List<Picture> picture;
	List<ContentModel> content;
	String seller_id;
	String buyer_id;
	String releaser_id;
	String seller_name;
	String buyer_name;
	String releaser_name;
	String shenhe;
	Timestamp time;
	int tuijian_Tag;

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCommodity_id() {
		return commodity_id;
	}

	public void setCommodity_id(String commodity_id) {
		this.commodity_id = commodity_id;
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getShuliang() {
		return shuliang;
	}

	public void setShuliang(String shuliang) {
		this.shuliang = shuliang;
	}

	public String getFreight() {
		return freight;
	}

	public void setFreight(String freight) {
		this.freight = freight;
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

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getReleaser_id() {
		return releaser_id;
	}

	public void setReleaser_id(String releaser_id) {
		this.releaser_id = releaser_id;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getReleaser_name() {
		return releaser_name;
	}

	public void setReleaser_name(String releaser_name) {
		this.releaser_name = releaser_name;
	}

	public String getShenhe() {
		return shenhe;
	}

	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public int getTuijian_Tag() {
		return tuijian_Tag;
	}

	public void setTuijian_Tag(int tuijian_Tag) {
		this.tuijian_Tag = tuijian_Tag;
	}

	@Override
	public String toString() {
		return "Commodity [commodity_id=" + commodity_id + ", title=" + title + ", price=" + price + ", unit=" + unit
				+ ", shuliang=" + shuliang + ", freight=" + freight + ", phone=" + phone + ", picture=" + picture
				+ ", content=" + content + ", seller_id=" + seller_id + ", buyer_id=" + buyer_id + ", releaser_id="
				+ releaser_id + ", seller_name=" + seller_name + ", buyer_name=" + buyer_name + ", releaser_name="
				+ releaser_name + ", shenhe=" + shenhe + ", time=" + time + ", tuijian_Tag=" + tuijian_Tag + "]";
	}
	
	

}
