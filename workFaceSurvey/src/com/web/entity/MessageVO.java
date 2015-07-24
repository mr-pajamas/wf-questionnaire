/**   
* @Title: MessageVO.java 
* @Package com.haistand.web.vo 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity;

import java.util.List;

public class MessageVO<T> {
	/** 
	 * @ClassName: MessageVO 
	 * @Description: JSON信息VO
	 * @author 陈超
	 * @date 2015年7月13日 上午10:24:25 
	 * 
	 */
	
	private String code;
	
	private String message;
	
	private List<T> result;

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return the result
	 */
	public List<T> getResult() {
		return result;
	}

	/**
	 * @param result the result to set
	 */
	public void setResult(List<T> result) {
		this.result = result;
	}
	
	
	
}
