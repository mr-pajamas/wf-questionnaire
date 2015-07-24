/**   
* @Title: Factory.java 
* @Package com.haistand.web.module 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity;

import java.util.Date;

public class Factory {
	/** 
	 * @ClassName: Factory 
	 * @Description: 厂商对象
	 * @author 陈超
	 * @date 2015年6月29日 上午10:22:14 
	 * 
	 */
	
	private Integer id;
	
	private String factoryname;
	
	private String brandname;
	
	private Integer brandid;
	
	private Date createtime;
	
	private Date modifytime;

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
	 * @return the modifytime
	 */
	public Date getModifytime() {
		return modifytime;
	}
	
	
}
