package com.web.entity;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mouth_content")
public class MouthContent {
	@Id
	@Basic(optional = false)
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "md5_id")
	private String md5_id;

	@Column(name = "series")
	private String series;

	@Column(name = "seriesid")
	private int seriesid;

	@Column(name = "user_name")
	private String user_name;

	@Column(name = "ext_vehicle_type")
	private String ext_vehicle_type;

	@Column(name = "ext_purchase_place")
	private String ext_purchase_place;

	@Column(name = "ext_purchase_date")
	private Date ext_purchase_date;

	@Column(name = "ext_nake_price")
	private String ext_nake_price;

	@Column(name = "ext_fuel")
	private String ext_fuel;

	@Column(name = "ext_purpose")
	private String ext_purpose;

	@Column(name = "view_count")
	private String view_count;

	@Column(name = "reply_count")
	private String reply_count;

	@Column(name = "mouth_support_count")
	private String mouth_support_count;

	@Column(name = "data_time")
	private Date data_time;

	@Column(name = "datecreated")
	private Date datecreated;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setMd5_id(String md5_id) {
		this.md5_id = md5_id;
	}

	public String getMd5_id() {
		return this.md5_id;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getSeries() {
		return this.series;
	}

	public void setSeriesid(int seriesid) {
		this.seriesid = seriesid;
	}

	public int getSeriesid() {
		return this.seriesid;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_name() {
		return this.user_name;
	}

	public void setExt_vehicle_type(String ext_vehicle_type) {
		this.ext_vehicle_type = ext_vehicle_type;
	}

	public String getExt_vehicle_type() {
		return this.ext_vehicle_type;
	}

	public void setExt_purchase_place(String ext_purchase_place) {
		this.ext_purchase_place = ext_purchase_place;
	}

	public String getExt_purchase_place() {
		return this.ext_purchase_place;
	}

	public void setExt_purchase_date(Date ext_purchase_date) {
		this.ext_purchase_date = ext_purchase_date;
	}

	public Date getExt_purchase_date() {
		return this.ext_purchase_date;
	}

	public void setExt_nake_price(String ext_nake_price) {
		this.ext_nake_price = ext_nake_price;
	}

	public String getExt_nake_price() {
		return this.ext_nake_price;
	}

	public void setExt_fuel(String ext_fuel) {
		this.ext_fuel = ext_fuel;
	}

	public String getExt_fuel() {
		return this.ext_fuel;
	}

	public void setExt_purpose(String ext_purpose) {
		this.ext_purpose = ext_purpose;
	}

	public String getExt_purpose() {
		return this.ext_purpose;
	}

	public void setView_count(String view_count) {
		this.view_count = view_count;
	}

	public String getView_count() {
		return this.view_count;
	}

	public void setReply_count(String reply_count) {
		this.reply_count = reply_count;
	}

	public String getReply_count() {
		return this.reply_count;
	}

	public void setMouth_support_count(String mouth_support_count) {
		this.mouth_support_count = mouth_support_count;
	}

	public String getMouth_support_count() {
		return this.mouth_support_count;
	}

	public void setData_time(Date data_time) {
		this.data_time = data_time;
	}

	public Date getData_time() {
		return this.data_time;
	}

	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}

	public Date getDatecreated() {
		return this.datecreated;
	}

}