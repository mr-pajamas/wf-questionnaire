/**   
* @Title: VehilceChassis.java 
* @Package vehicle 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity.vehicle;


public class VehilceChassis {

	/** 
	 * @ClassName: VehilceChassis 
	 * @Description: 汽车底盘
	 * @author 陈超
	 * @date 2015年7月16日 上午10:38:02 
	 * 
	 */
	
	/**
	 * 
	* @ClassName: MontivationVauleEnum 
	* @Description: 动力相关数据
	* @author 陈超
	* @date 2015年7月16日 上午11:06:02 
	*
	 */
	enum MontivationVauleEnum{
		/**
		 * 行驶中有异响 1
		 * 行驶中有跑偏 2
		 * 刹车有问题     3
		 * 挂档困难          4
		 * 换挡冲击          5
		 * 底盘有撞击     6
		 * 减震有异响      7
		 * 
		 */
		RUNNINGNOISE(1),OFFTRACKING(2),BRAKE(3),HARDGEAR(4),GEARIMPACT(5),CHASSISIMPACT(6),DAMPINGNOISE(7);
		private Integer value;
		
		MontivationVauleEnum(int value) {
			this.value = value;
		}
		
		public int getValue(){
			return this.value;
		}
		
	}
	
	
	
	/**
	 * 底盘或动力
	 */
	private String chassis;


	private String eleticequip;
	

	public String getChassis() {
		return chassis;
	}



	public void setChassis(String chassis) {
		this.chassis = chassis;
	}



	public String getEleticequip() {
		return eleticequip;
	}



	public void setEleticequip(String eleticequip) {
		this.eleticequip = eleticequip;
	}



	
	
}
