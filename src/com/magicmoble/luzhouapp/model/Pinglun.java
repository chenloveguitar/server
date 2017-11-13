package com.magicmoble.luzhouapp.model;

import java.sql.Timestamp;
import java.util.List;

public class Pinglun {
	String pinglun_id;
	String pingluner_id;
	String pingluner_name;
	String pingluner_touxiang;
	String pingluner_qianming;
	String content;
	Timestamp time;
	Dianzan_Number dianzan_count;
	List<Huifu> huifu;
	boolean isdianzan;
	String tiaomu_id;
	int huifu_count;

	private java.lang.String tiaomu_type;

	public void setTiaomu_type(java.lang.String tiaomu_type) {
		this.tiaomu_type = tiaomu_type;
	}

	public java.lang.String getTiaomu_type() {
		return this.tiaomu_type;
	}

	private java.sql.Timestamp now_time;

	private java.lang.String id;

	private java.sql.Timestamp see_time;

	public void setNow_time(java.sql.Timestamp now_time) {
		this.now_time = now_time;
	}

	public java.sql.Timestamp getNow_time() {
		return this.now_time;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getId() {
		return this.id;
	}

	public void setSee_time(java.sql.Timestamp see_time) {
		this.see_time = see_time;
	}

	public java.sql.Timestamp getSee_time() {
		return this.see_time;
	}

	public String getTiaomu_id() {
		return tiaomu_id;
	}

	public void setTiaomu_id(String tiaomu_id) {
		this.tiaomu_id = tiaomu_id;
	}

	public String getPinglun_id() {
		return pinglun_id;
	}

	public void setPinglun_id(String pinglun_id) {
		this.pinglun_id = pinglun_id;
	}

	public String getPingluner_id() {
		return pingluner_id;
	}

	public void setPingluner_id(String pingluner_id) {
		this.pingluner_id = pingluner_id;
	}

	public String getPingluner_name() {
		return pingluner_name;
	}

	public void setPingluner_name(String pingluner_name) {
		this.pingluner_name = pingluner_name;
	}

	public String getPingluner_touxiang() {
		return pingluner_touxiang;
	}

	public void setPingluner_touxiang(String pingluner_touxiang) {
		this.pingluner_touxiang = pingluner_touxiang;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Dianzan_Number getDianzan_count() {
		return dianzan_count;
	}

	public void setDianzan_count(Dianzan_Number dianzan_count) {
		this.dianzan_count = dianzan_count;
	}

	public List<Huifu> getHuifu() {
		return huifu;
	}

	public void setHuifu(List<Huifu> huifu) {
		this.huifu = huifu;
	}

	public String getPingluner_qianming() {
		return pingluner_qianming;
	}

	public void setPingluner_qianming(String pingluner_qianming) {
		this.pingluner_qianming = pingluner_qianming;
	}

	public boolean getIsdianzan() {
		return isdianzan;
	}

	public void setIsdianzan(boolean isdianzan) {
		this.isdianzan = isdianzan;
	}

	public int getHuifu_count() {
		return huifu_count;
	}

	public void setHuifu_count(int huifu_count) {
		this.huifu_count = huifu_count;
	}

}
