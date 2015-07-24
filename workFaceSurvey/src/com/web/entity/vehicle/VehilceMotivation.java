/**   
* @Title: VehilceMotivation.java 
* @Package vehicle 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity.vehicle;
public class VehilceMotivation {

	/** 
	 * @ClassName: VehilceMotivation 
	 * @Description: 汽车动力
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
		
		SlIGHTREPAIE(1),WHOLEREPAIE(2),NOISE(3),LEAKOIL(4);
		private int value;
		
		MontivationVauleEnum(int value) {
			this.value = value;
		}
		
		public int getValue(){
			return this.value;
		}
		
	}
	
	
	
	/**
	 * 引擎
	 */
	private int engine;
	
	/**
	 *变速箱
	 */
	private int gear;

	/**
	 * @return the engine
	 */
	public int getEngine() {
		return engine;
	}

	/**
	 * @param engine the engine to set
	 */
	public void setEngine(int engine) {
		this.engine = engine;
	}

	/**
	 * @return the gear
	 */
	public int getGear() {
		return gear;
	}

	/**
	 * @param gear the gear to set
	 */
	public void setGear(int gear) {
		this.gear = gear;
	}
	
	
	
}
