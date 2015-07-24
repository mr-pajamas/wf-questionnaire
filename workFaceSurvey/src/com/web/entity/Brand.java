/**   
* @Title: Brand.java 
* @Package com.haistand.web.module 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity;

import java.util.Date;


public class Brand {
	/** 
	 * @ClassName: Brand 
	 * @Description: 品牌
	 * @author 陈超
	 * @date 2015年6月26日 下午4:59:01 
	 * 
	 */
	
	/**
	 * 主键
	 */
	private Integer id;
	
	/**
	 * 品牌名称
	 */
	private String brandname;
	/**
	 * 首字母
	 */
	private String letter;
	/**
	 * 创建时间
	 */
	private Date createtime;
	/**
	 * 由letter + brandname 呈现的数据 
	 */
	private String name;
	
	/**
	 * 修改时间
	 */
	private Date modifytime;
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	public String getLetter() {
		return letter;
	}
	public void setLetter(String letter) {
		this.letter = letter;
	}
	public Date getCreatetime() {
		return createtime;
	}
	
	public Date getModifytime() {
		return modifytime;
	}
	public Integer getId() {
		return id;
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

	
	
	
	
}
