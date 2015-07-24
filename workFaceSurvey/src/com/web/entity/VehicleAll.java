package com.web.entity;

import com.web.entity.vehicle.VehilceInside;
import com.web.entity.vehicle.VehilceOutside;

public class VehicleAll {

	private VehilceOutside os;
	private VehilceInside is;
	
	public VehilceOutside getOs() {
		return os;
	}
	public void setOs(VehilceOutside os) {
		this.os = os;
	}
	public VehilceInside getIs() {
		return is;
	}
	public void setIs(VehilceInside is) {
		this.is = is;
	}
	
	/**
	 * 是否会一般良好
	 * @return
	 */
	public boolean isGoodLevel() {
		if((os.cal(1)+os.cal(2)+is.cal(1) + is.cal(2)) < 3){
			return true;
		} 
		return false;
	}
	
	/**
	 * 是否会一般车况
	 * @return
	 */
	public boolean isNormalLevel() {
		int tmp = (os.cal(1)+os.cal(2)+is.cal(1) + is.cal(2));
		if(tmp >= 3){
			return true;
		} 
		return false;
	}
	
	/**
	 * 是否会较差车况
	 * @return
	 */
	public boolean isWorngLevel() {
		int tmp = os.cal(3);
		if(  0 < tmp && tmp < 3){
			return true;
		} 
		return false;
	}
	
	
	/**
	 * 是否会较差车况
	 * @return
	 */
	public boolean isWorstLevel() {
		if((os.cal(3)) >= 3){
			return true;
		} 
		return false;
	}
	
	
}
