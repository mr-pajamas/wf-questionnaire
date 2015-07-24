/**   
 * @Title: VehilceOutside.java 
 * @Package vehicle 
 * @Description:上海海略管理信息咨询有限公司 Haistand Consulting Company 版权所有
 */
package com.web.entity.vehicle;

public class VehilceOutside {

	/**
	 * @ClassName: VehilceOutside
	 * @Description: 汽车外观
	 * @author 陈超
	 * @date 2015年7月16日 上午10:38:02
	 * 
	 */

	/**
	 * 
	 * @ClassName: WheelVauleEnum
	 * @Description: 轮子相关数据
	 * @author 陈超
	 * @date 2015年7月16日 上午11:06:02
	 * 
	 */
	enum WheelVauleEnum {

		HUBBROKE(1), WHEELCHANGE(2);
		private int value;

		WheelVauleEnum(int value) {
			this.value = value;
		}

		public int getValue() {
			return this.value;
		}

	}

	/**
	 * 
	 * @ClassName: EquipmentValueEnum
	 * @Description: 设备值
	 * @author 陈超
	 * @date 2015年7月16日 上午11:06:49
	 * 
	 */
	enum EquipmentValueEnum {

		SLIGHT(1), NORMAL(2), SERIOUS(3);

		private int value;

		EquipmentValueEnum(int value) {
			this.value = value;
		}

		private int getValue() {
			return this.value;
		}

	}

	/**
	 * 左前轮
	 */
	private int forntLeftwheel;

	/**
	 *右前轮
	 */
	private int forntRightwheel;

	/**
	 *左后轮
	 */
	private int rearLeftwheel;
	/**
	 *右后轮
	 */
	private int rearRightwheel;

	/**
	 * 左前翼子板
	 */
	private int forntLeftfender;
	/**
	 * 右前翼子板
	 */
	private int forntRightfender;
	/**
	 * 左后翼子板
	 */
	private int rearLeftfender;
	/**
	 * 右后翼子板
	 */
	private int rearRightfender;

	/**
	 * 左前门
	 */
	private int forntLeftdoor;
	/**
	 * 右前门
	 */
	private int forntRightdoor;
	/**
	 * 左后门
	 */
	private int rearLeftdoor;
	/**
	 * 右后门
	 */
	private int rearRightdoor;

	/**
	 * 前保险杠
	 */
	private int forntBumper;
	/**
	 * 后保险杠
	 */
	private int rearBumper;

	/**
	 * 行李箱盖
	 */
	private int baggageHood;

	/**
	 * 引擎盖
	 */
	private int engineHood;

	/**
	 * @return the forntLeftwheel
	 */
	public int getForntLeftwheel() {
		return forntLeftwheel;
	}

	/**
	 * @param forntLeftwheel
	 *            the forntLeftwheel to set
	 */
	public void setForntLeftwheel(int forntLeftwheel) {
		this.forntLeftwheel = forntLeftwheel;
	}

	/**
	 * @return the forntRightwheel
	 */
	public int getForntRightwheel() {
		return forntRightwheel;
	}

	/**
	 * @param forntRightwheel
	 *            the forntRightwheel to set
	 */
	public void setForntRightwheel(int forntRightwheel) {
		this.forntRightwheel = forntRightwheel;
	}

	/**
	 * @return the rearLeftwheel
	 */
	public int getRearLeftwheel() {
		return rearLeftwheel;
	}

	/**
	 * @param rearLeftwheel
	 *            the rearLeftwheel to set
	 */
	public void setRearLeftwheel(int rearLeftwheel) {
		this.rearLeftwheel = rearLeftwheel;
	}

	/**
	 * @return the rearRightwheel
	 */
	public int getRearRightwheel() {
		return rearRightwheel;
	}

	/**
	 * @param rearRightwheel
	 *            the rearRightwheel to set
	 */
	public void setRearRightwheel(int rearRightwheel) {
		this.rearRightwheel = rearRightwheel;
	}

	/**
	 * @return the forntLeftfender
	 */
	public int getForntLeftfender() {
		return forntLeftfender;
	}

	/**
	 * @param forntLeftfender
	 *            the forntLeftfender to set
	 */
	public void setForntLeftfender(int forntLeftfender) {
		this.forntLeftfender = forntLeftfender;
	}

	/**
	 * @return the forntRightfender
	 */
	public int getForntRightfender() {
		return forntRightfender;
	}

	/**
	 * @param forntRightfender
	 *            the forntRightfender to set
	 */
	public void setForntRightfender(int forntRightfender) {
		this.forntRightfender = forntRightfender;
	}

	/**
	 * @return the rearLeftfender
	 */
	public int getRearLeftfender() {
		return rearLeftfender;
	}

	/**
	 * @param rearLeftfender
	 *            the rearLeftfender to set
	 */
	public void setRearLeftfender(int rearLeftfender) {
		this.rearLeftfender = rearLeftfender;
	}

	/**
	 * @return the rearRightfender
	 */
	public int getRearRightfender() {
		return rearRightfender;
	}

	/**
	 * @param rearRightfender
	 *            the rearRightfender to set
	 */
	public void setRearRightfender(int rearRightfender) {
		this.rearRightfender = rearRightfender;
	}

	/**
	 * @return the forntLeftdoor
	 */
	public int getForntLeftdoor() {
		return forntLeftdoor;
	}

	/**
	 * @param forntLeftdoor
	 *            the forntLeftdoor to set
	 */
	public void setForntLeftdoor(int forntLeftdoor) {
		this.forntLeftdoor = forntLeftdoor;
	}

	/**
	 * @return the forntRightdoor
	 */
	public int getForntRightdoor() {
		return forntRightdoor;
	}

	/**
	 * @param forntRightdoor
	 *            the forntRightdoor to set
	 */
	public void setForntRightdoor(int forntRightdoor) {
		this.forntRightdoor = forntRightdoor;
	}

	/**
	 * @return the rearLeftdoor
	 */
	public int getRearLeftdoor() {
		return rearLeftdoor;
	}

	/**
	 * @param rearLeftdoor
	 *            the rearLeftdoor to set
	 */
	public void setRearLeftdoor(int rearLeftdoor) {
		this.rearLeftdoor = rearLeftdoor;
	}

	/**
	 * @return the rearRightdoor
	 */
	public int getRearRightdoor() {
		return rearRightdoor;
	}

	/**
	 * @param rearRightdoor
	 *            the rearRightdoor to set
	 */
	public void setRearRightdoor(int rearRightdoor) {
		this.rearRightdoor = rearRightdoor;
	}

	/**
	 * @return the forntBumper
	 */
	public int getForntBumper() {
		return forntBumper;
	}

	/**
	 * @param forntBumper
	 *            the forntBumper to set
	 */
	public void setForntBumper(int forntBumper) {
		this.forntBumper = forntBumper;
	}

	/**
	 * @return the rearBumper
	 */
	public int getRearBumper() {
		return rearBumper;
	}

	/**
	 * @param rearBumper
	 *            the rearBumper to set
	 */
	public void setRearBumper(int rearBumper) {
		this.rearBumper = rearBumper;
	}

	/**
	 * @return the baggageHood
	 */
	public int getBaggageHood() {
		return baggageHood;
	}

	/**
	 * @param baggageHood
	 *            the baggageHood to set
	 */
	public void setBaggageHood(int baggageHood) {
		this.baggageHood = baggageHood;
	}

	/**
	 * @return the engineHood
	 */
	public int getEngineHood() {
		return engineHood;
	}

	/**
	 * @param engineHood
	 *            the engineHood to set
	 */
	public void setEngineHood(int engineHood) {
		this.engineHood = engineHood;
	}

	
	
	public int cal(int value) {
		int count = 0;
		if (forntLeftwheel == value) {
			count++;
		}

		if (forntRightwheel == value) {
			count++;
		}

		if (rearLeftwheel == value) {
			count++;
		}
		if (rearRightwheel == value) {
			count++;
		}
		if (forntLeftfender == value) {
			count++;
		}
		if (forntRightfender == value) {
			count++;
		}
		if (rearLeftfender == value) {
			count++;
		}
		if (rearRightfender == value) {
			count++;
		}
		if (forntLeftdoor == value) {
			count++;
		}
		if (forntRightdoor == value) {
			count++;
		}
		if (rearLeftdoor == value) {
			count++;
		}
		if (rearRightdoor == value) {
			count++;
		}
		if (forntBumper == value) {
			count++;
		}
		if (rearBumper == value) {
			count++;
		}
		if (baggageHood == value) {
			count++;
		}
		if (engineHood == value) {
			count++;
		}
		return count;
	}
}
