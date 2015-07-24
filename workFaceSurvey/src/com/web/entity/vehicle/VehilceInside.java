/**   
* @Title: VehilceInside.java 
* @Package vehicle 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity.vehicle;
public class VehilceInside {

	/** 
	 * @ClassName: VehilceInside 
	 * @Description: 汽车内饰
	 * @author 陈超
	 * @date 2015年7月16日 上午10:38:02 
	 * 
	 */
	
	/**
	 * 
	* @ClassName: InsideVauleEnum 
	* @Description: 内饰相关数据
	* @author 陈超
	* @date 2015年7月16日 上午11:06:02 
	*
	 */
	enum InsideVauleEnum{
		
		ABRASION(1),BROKDOWN(2);
		private Integer value;
		
		InsideVauleEnum(int value) {
			this.value = value;
		}
		
		public int getValue(){
			return this.value;
		}
		
	}
	
	
	
	/**
	 * 左前座椅
	 */
	private int forntLeftchair;
	
	/**
	 *右前座椅
	 */
	private int forntRightchair;
	
	/**
	 *后排座椅
	 */
	private int rearchairs;
	/**
	 *操控台
	 */
	private int console;
	/**
	 * @return the forntLeftchair
	 */
	public int getForntLeftchair() {
		return forntLeftchair;
	}
	/**
	 * @param forntLeftchair the forntLeftchair to set
	 */
	public void setForntLeftchair(int forntLeftchair) {
		this.forntLeftchair = forntLeftchair;
	}
	/**
	 * @return the forntRightchair
	 */
	public int getForntRightchair() {
		return forntRightchair;
	}
	/**
	 * @param forntRightchair the forntRightchair to set
	 */
	public void setForntRightchair(int forntRightchair) {
		this.forntRightchair = forntRightchair;
	}
	/**
	 * @return the rearchairs
	 */
	public int getRearchairs() {
		return rearchairs;
	}
	/**
	 * @param rearchairs the rearchairs to set
	 */
	public void setRearchairs(int rearchairs) {
		this.rearchairs = rearchairs;
	}
	/**
	 * @return the console
	 */
	public int getConsole() {
		return console;
	}
	/**
	 * @param console the console to set
	 */
	public void setConsole(int console) {
		this.console = console;
	}

	public int cal(int value) {
		int count = 0;
		if (forntLeftchair == value) {
			count++;
		}

		if (forntRightchair == value) {
			count++;
		}

		if (rearchairs == value) {
			count++;
		}
		
		if (console == value) {
			count++;
		}
		
		return count;
	}
	
}
