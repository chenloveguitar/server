package com.magicmoble.luzhouapp.model.server;
import java.io.Serializable;

public class Pay_list implements Serializable{

	private static final long serialVersionUID = 1L;

	private java.lang.String transaction_id;

	private java.lang.String yonghu_id;

	private java.lang.String pay_type;

	private java.lang.String id;

	private java.lang.String message;

	public void setTransaction_id(java.lang.String transaction_id){
		this.transaction_id = transaction_id;
	}

	public java.lang.String getTransaction_id(){
		return this.transaction_id;
	}

	public void setYonghu_id(java.lang.String yonghu_id){
		this.yonghu_id = yonghu_id;
	}

	public java.lang.String getYonghu_id(){
		return this.yonghu_id;
	}

	public void setPay_type(java.lang.String pay_type){
		this.pay_type = pay_type;
	}

	public java.lang.String getPay_type(){
		return this.pay_type;
	}

	public void setId(java.lang.String id){
		this.id = id;
	}

	public java.lang.String getId(){
		return this.id;
	}

	public void setMessage(java.lang.String message){
		this.message = message;
	}

	public java.lang.String getMessage(){
		return this.message;
	}

}
