package com.magicmoble.luzhouapp.model.server;
import java.io.Serializable;

public class Dingdan implements Serializable{

	private static final long serialVersionUID = 1L;

	private java.sql.Timestamp now_time;

	private java.sql.Timestamp fahuo_end_time;

	private java.sql.Timestamp pingjia_end_time;

	private int shuliang;

	private int freight;

	private java.lang.String buyer_name;

	private java.lang.String buyer_id;

	private java.sql.Timestamp complain_end_time;

	private java.lang.Double price;

	private java.sql.Timestamp fahuo_time;

	private java.sql.Timestamp complain_time;

	private java.lang.String id;

	private java.lang.String seller_id;

	private java.lang.String transaction_id;

	private java.sql.Timestamp pingjia_time;

	private java.lang.String address;

	private java.lang.Double total_price;

	private java.lang.String tuikuan_message;

	private int guangjie_fenlei_Tag;

	private java.lang.String buyer_phone;

	private java.sql.Timestamp jiedan_time;

	private java.sql.Timestamp express_time;

	private java.sql.Timestamp pay_time;

	private int buyer_zhuangtai;

	private java.lang.String tiaomu_id;

	private java.sql.Timestamp express_end_time;

	private java.sql.Timestamp jiedan_end_time;

	private java.lang.String beizhu;

	private int seller_zhuangtai;

	private java.sql.Timestamp time;

	private java.sql.Timestamp pay_end_time;

	private java.sql.Timestamp see_time;

	public void setNow_time(java.sql.Timestamp now_time){
		this.now_time = now_time;
	}

	public java.sql.Timestamp getNow_time(){
		return this.now_time;
	}

	public void setFahuo_end_time(java.sql.Timestamp fahuo_end_time){
		this.fahuo_end_time = fahuo_end_time;
	}

	public java.sql.Timestamp getFahuo_end_time(){
		return this.fahuo_end_time;
	}

	public void setPingjia_end_time(java.sql.Timestamp pingjia_end_time){
		this.pingjia_end_time = pingjia_end_time;
	}

	public java.sql.Timestamp getPingjia_end_time(){
		return this.pingjia_end_time;
	}

	public void setShuliang(int shuliang){
		this.shuliang = shuliang;
	}

	public int getShuliang(){
		return this.shuliang;
	}

	public void setFreight(int freight){
		this.freight = freight;
	}

	public int getFreight(){
		return this.freight;
	}

	public void setBuyer_name(java.lang.String buyer_name){
		this.buyer_name = buyer_name;
	}

	public java.lang.String getBuyer_name(){
		return this.buyer_name;
	}

	public void setBuyer_id(java.lang.String buyer_id){
		this.buyer_id = buyer_id;
	}

	public java.lang.String getBuyer_id(){
		return this.buyer_id;
	}

	public void setComplain_end_time(java.sql.Timestamp complain_end_time){
		this.complain_end_time = complain_end_time;
	}

	public java.sql.Timestamp getComplain_end_time(){
		return this.complain_end_time;
	}

	public void setPrice(java.lang.Double price){
		this.price = price;
	}

	public java.lang.Double getPrice(){
		return this.price;
	}

	public void setFahuo_time(java.sql.Timestamp fahuo_time){
		this.fahuo_time = fahuo_time;
	}

	public java.sql.Timestamp getFahuo_time(){
		return this.fahuo_time;
	}

	public void setComplain_time(java.sql.Timestamp complain_time){
		this.complain_time = complain_time;
	}

	public java.sql.Timestamp getComplain_time(){
		return this.complain_time;
	}

	public void setId(java.lang.String id){
		this.id = id;
	}

	public java.lang.String getId(){
		return this.id;
	}

	public void setSeller_id(java.lang.String seller_id){
		this.seller_id = seller_id;
	}

	public java.lang.String getSeller_id(){
		return this.seller_id;
	}

	public void setTransaction_id(java.lang.String transaction_id){
		this.transaction_id = transaction_id;
	}

	public java.lang.String getTransaction_id(){
		return this.transaction_id;
	}

	public void setPingjia_time(java.sql.Timestamp pingjia_time){
		this.pingjia_time = pingjia_time;
	}

	public java.sql.Timestamp getPingjia_time(){
		return this.pingjia_time;
	}

	public void setAddress(java.lang.String address){
		this.address = address;
	}

	public java.lang.String getAddress(){
		return this.address;
	}

	public void setTotal_price(java.lang.Double total_price){
		this.total_price = total_price;
	}

	public java.lang.Double getTotal_price(){
		return this.total_price;
	}

	public void setTuikuan_message(java.lang.String tuikuan_message){
		this.tuikuan_message = tuikuan_message;
	}

	public java.lang.String getTuikuan_message(){
		return this.tuikuan_message;
	}

	public void setGuangjie_fenlei_Tag(int guangjie_fenlei_Tag){
		this.guangjie_fenlei_Tag = guangjie_fenlei_Tag;
	}

	public int getGuangjie_fenlei_Tag(){
		return this.guangjie_fenlei_Tag;
	}

	public void setBuyer_phone(java.lang.String buyer_phone){
		this.buyer_phone = buyer_phone;
	}

	public java.lang.String getBuyer_phone(){
		return this.buyer_phone;
	}

	public void setJiedan_time(java.sql.Timestamp jiedan_time){
		this.jiedan_time = jiedan_time;
	}

	public java.sql.Timestamp getJiedan_time(){
		return this.jiedan_time;
	}

	public void setExpress_time(java.sql.Timestamp express_time){
		this.express_time = express_time;
	}

	public java.sql.Timestamp getExpress_time(){
		return this.express_time;
	}

	public void setPay_time(java.sql.Timestamp pay_time){
		this.pay_time = pay_time;
	}

	public java.sql.Timestamp getPay_time(){
		return this.pay_time;
	}

	public void setBuyer_zhuangtai(int buyer_zhuangtai){
		this.buyer_zhuangtai = buyer_zhuangtai;
	}

	public int getBuyer_zhuangtai(){
		return this.buyer_zhuangtai;
	}

	public void setTiaomu_id(java.lang.String tiaomu_id){
		this.tiaomu_id = tiaomu_id;
	}

	public java.lang.String getTiaomu_id(){
		return this.tiaomu_id;
	}

	public void setExpress_end_time(java.sql.Timestamp express_end_time){
		this.express_end_time = express_end_time;
	}

	public java.sql.Timestamp getExpress_end_time(){
		return this.express_end_time;
	}

	public void setJiedan_end_time(java.sql.Timestamp jiedan_end_time){
		this.jiedan_end_time = jiedan_end_time;
	}

	public java.sql.Timestamp getJiedan_end_time(){
		return this.jiedan_end_time;
	}

	public void setBeizhu(java.lang.String beizhu){
		this.beizhu = beizhu;
	}

	public java.lang.String getBeizhu(){
		return this.beizhu;
	}

	public void setSeller_zhuangtai(int seller_zhuangtai){
		this.seller_zhuangtai = seller_zhuangtai;
	}

	public int getSeller_zhuangtai(){
		return this.seller_zhuangtai;
	}

	public void setTime(java.sql.Timestamp time){
		this.time = time;
	}

	public java.sql.Timestamp getTime(){
		return this.time;
	}

	public void setPay_end_time(java.sql.Timestamp pay_end_time){
		this.pay_end_time = pay_end_time;
	}

	public java.sql.Timestamp getPay_end_time(){
		return this.pay_end_time;
	}

	public void setSee_time(java.sql.Timestamp see_time){
		this.see_time = see_time;
	}

	public java.sql.Timestamp getSee_time(){
		return this.see_time;
	}

}
