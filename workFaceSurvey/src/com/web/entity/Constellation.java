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
@Table(name = "constellation")
public class Constellation {
	@Id
	@Basic(optional = false)
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "seriesid")
	private int seriesid;

	@Column(name = "star")
	private String star;

	@Column(name = "userfactorid")
	private int userfactorid;

	@Column(name = "createtime")
	private Date createtime;

	@Column(name = "updatetime")
	private Date updatetime;
	
	@Column(name = "star_ename")
    private String starename;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSeriesid(int seriesid) {
		this.seriesid = seriesid;
	}

	public int getSeriesid() {
		return this.seriesid;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getStar() {
		return this.star;
	}

	public void setUserfactorid(int userfactorid) {
		this.userfactorid = userfactorid;
	}

	public int getUserfactorid() {
		return this.userfactorid;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getCreatetime() {
		return this.createtime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Date getUpdatetime() {
		return this.updatetime;
	}

	public String getStarename() {
		return starename;
	}

	public void setStarename(String starename) {
		this.starename = starename;
	}
    
	
}