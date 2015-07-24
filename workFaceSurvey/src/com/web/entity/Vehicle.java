/**   
* @Title: Vehicle.java 
* @Package com.haistand.web.module 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity;

import java.util.Date;

public class Vehicle {
	/** 
	 * @ClassName: Vehicle 
	 * @Description: 车型基本信息对象
	 * @author 陈超
	 * @date 2015年6月29日 下午3:17:45 
	 * 
	 */
	
	private Integer id;
	
	private String vehiclename;
	
	/**
	 * 年款
	 */
	private String makeyear;
	
	private String factoryname;
	
	private Integer factoryid;
	
	/**
	 * 销售状态
	 */
	private String sellstatus;
	
	/**
	 *汽车之家车型ID
	 */
	private String autohomeid;
	
	private String familyname;
	
	
	private Integer familyid;
	
	private String brandname;
	
	private Integer brandid;
	
	private Date createtime;
	
	private Date modifytime;

	private String name;
	
	private String price;
	
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
	 * @return the vehiclename
	 */
	public String getVehiclename() {
		return vehiclename;
	}

	/**
	 * @param vehiclename the vehiclename to set
	 */
	public void setVehiclename(String vehiclename) {
		this.vehiclename = vehiclename;
	}

	/**
	 * @return the makeyear
	 */
	public String getMakeyear() {
		return makeyear;
	}

	/**
	 * @param makeyear the makeyear to set
	 */
	public void setMakeyear(String makeyear) {
		this.makeyear = makeyear;
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
	 * @return the sellstatus
	 */
	public String getSellstatus() {
		return sellstatus;
	}

	/**
	 * @param sellstatus the sellstatus to set
	 */
	public void setSellstatus(String sellstatus) {
		this.sellstatus = sellstatus;
	}

	/**
	 * @return the autohomeid
	 */
	public String getAutohomeid() {
		return autohomeid;
	}

	/**
	 * @param autohomeid the autohomeid to set
	 */
	public void setAutohomeid(String autohomeid) {
		this.autohomeid = autohomeid;
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
	 * @return the familyid
	 */
	public Integer getFamilyid() {
		return familyid;
	}

	/**
	 * @param familyid the familyid to set
	 */
	public void setFamilyid(Integer familyid) {
		this.familyid = familyid;
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

	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
