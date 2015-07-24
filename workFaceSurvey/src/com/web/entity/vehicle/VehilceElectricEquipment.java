/**   
* @Title: VehilceElectricEquipment.java 
* @Package vehicle 
* @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
*/
package com.web.entity.vehicle;


public class VehilceElectricEquipment {

	/** 
	 * @ClassName: VehilceElectricEquipment 
	 * @Description: 汽车电子设备
	 * @author 陈超
	 * @date 2015年7月16日 上午10:38:02 
	 * 
	 */
	
	/**
	 * 
	* @ClassName: ElectricEquipmentVauleEnum 
	* @Description: 电子设备
	* @author 陈超
	* @date 2015年7月16日 上午11:06:02 
	*
	 */
	enum ElectricEquipmentVauleEnum{
		/**
		 * 仪表盘有问题 1
		 * 空调有问题      2
		 * 车窗（含天窗）控制有问题     3
		 * 倒车雷达或影像有问题          4
		 * 座椅调整有问题          5
		 * 音响或音频部件有问题          6
		 * 
		 */
		PALNE(1),AIRCONDITION(2),WINDOWSCONTROL(3),RADAR(4),CHAIRADJUSTMENT(5),MUSIICEQUIP(6);
		private Integer value;
		
		ElectricEquipmentVauleEnum(Integer value) {
			this.value = value;
		}
		
		public Integer getValue(){
			return this.value;
		}
		
	}
	
	
	
	/**
	 * 电子设备
	 */
	private Integer eleticequip;



	public Integer getEleticequip() {
		return eleticequip;
	}



	public void setEleticequip(Integer eleticequip) {
		this.eleticequip = eleticequip;
	}



	
	
	
}
