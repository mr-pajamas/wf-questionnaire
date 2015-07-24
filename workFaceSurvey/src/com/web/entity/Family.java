/**   
* @Title: Family.java 
* @Package com.haistand.web.module 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity;

import java.util.Date;


public class Family {
	/** 
	 * @ClassName: Family 
	 * @Description: 车系
	 * @author 陈超
	 * @date 2015年6月29日 下午2:25:51 
	 * 
	 */
	
	private Integer id;
	
	private String familyname;
	
	private String factoryname;
	
	private String brandname;
	
	private Integer factoryid;
	
	private Integer brandid;
	
	private Date createtime;
	
	private Date modifytime;
	
	private String vehicleurl;
	
	private String name;
	
	private String imgpath;

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the familyname
	 */
	public String getFamilyname() {
		return familyname;
	}

	/**
	 * @param familyname the familyname to set
	 */
	public void setFamilyname(String familyname) {
		this.familyname = familyname;
	}

	/**
	 * @return the factoryname
	 */
	public String getFactoryname() {
		return factoryname;
	}

	/**
	 * @param factoryname the factoryname to set
	 */
	public void setFactoryname(String factoryname) {
		this.factoryname = factoryname;
	}

	/**
	 * @return the brandname
	 */
	public String getBrandname() {
		return brandname;
	}

	/**
	 * @param brandname the brandname to set
	 */
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	/**
	 * @return the factoryid
	 */
	public Integer getFactoryid() {
		return factoryid;
	}

	/**
	 * @param factoryid the factoryid to set
	 */
	public void setFactoryid(Integer factoryid) {
		this.factoryid = factoryid;
	}

	/**
	 * @return the brandid
	 */
	public Integer getBrandid() {
		return brandid;
	}

	/**
	 * @param brandid the brandid to set
	 */
	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	/**
	 * @return the createtime
	 */
	public Date getCreatetime() {
		return createtime;
	}

	/**
	 * @param createtime the createtime to set
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	/**
	 * @return the modifytime
	 */
	public Date getModifytime() {
		return modifytime;
	}

	/**
	 * @param modifytime the modifytime to set
	 */
	public void setModifytime(Date modifytime) {
		this.modifytime = modifytime;
	}

	/**
	 * @return the vehicleurl
	 */
	public String getVehicleurl() {
		return vehicleurl;
	}

	/**
	 * @param vehicleurl the vehicleurl to set
	 */
	public void setVehicleurl(String vehicleurl) {
		this.vehicleurl = vehicleurl;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
	
	
}
