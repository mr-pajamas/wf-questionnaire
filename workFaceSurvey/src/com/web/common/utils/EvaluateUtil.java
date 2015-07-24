package com.web.common.utils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.web.entity.VehicleAll;
import com.web.entity.vehicle.VehicleJSON;

/**
 * 
 * @author lenovo
 *
 */
public class EvaluateUtil {

		
	private static Integer ALMOSTNEW = 3;
	
	private static  Integer NOTGOOD = 4;
	
	
	/**
	 * 
	 * @param area1_price
	 * @param retail_price
	 * @param facotryPrice
	 * @param level
	 * @return
	 */
	public static Double[] CaculateVauleRange(Double area1_price,Double retail_price,Double facotryPrice,Integer level){
		List<Double[]> rangeList = new ArrayList<Double[]>();
		Double priceNormalrangeLow = area1_price * 1.02;
		Double priceNormalrangeHeigh = retail_price* 0.98;
		Double normaldiff = priceNormalrangeHeigh - priceNormalrangeLow;
		
		Double[] normalRange = new Double[2];
		Double[] goodeRange = new Double[2];
		Double[] newRange = new Double[2];
		Double[] wrongRange = new Double[2];
		Double[] wrostRange = new Double[2];
		
		normalRange[0] = priceNormalrangeLow;
		normalRange[1] = priceNormalrangeHeigh;

		Double goodPriceHeigh = (priceNormalrangeHeigh + normaldiff/ALMOSTNEW);
		goodeRange[0] = priceNormalrangeHeigh;
		goodeRange[1] = goodPriceHeigh;
		
		newRange[0] = goodPriceHeigh;
		newRange[1] = facotryPrice;
		
		Double worngPriceLow =  (priceNormalrangeLow - normaldiff / NOTGOOD);
		wrongRange[0] = worngPriceLow;
		wrongRange[1] = priceNormalrangeLow;
		
		wrostRange[0] = facotryPrice * 0.4;
		wrostRange[1] = worngPriceLow;
		
		rangeList.add(wrostRange);
		rangeList.add(wrongRange);
		rangeList.add(normalRange);
		rangeList.add(goodeRange);
		rangeList.add(newRange);
		

		return rangeList.get(level);
		
	}
	
	public static  Integer getLevel(VehicleJSON json ){
		
		VehicleAll all = new VehicleAll();
		all.setOs(json.getWg());
		all.setIs(json.getNs());
		
		if(json.getDl().getEngine() == 2 ||  all.isWorstLevel()) {
			//动力 拆开大修过或更换 外观大于3处严重碰撞，更换过部件
			return 0;
		} else if((json.getDl().getEngine() != 0 || json.getDl().getGear() != 0 ) || json.getQt().size() > 5 || all.isWorngLevel()){
			//动力的变数箱和引擎都有值，或者电器或底盘大于5处或外观的小于2处严重碰撞，更换过部件
			return 1;
		} else if(json.getQt().size() < 2 || all.isNormalLevel()){
			//电子设备或底盘小于2处或外观小于2处一般剐蹭碰撞，需要局部钣金
			return 2;
		} else if(all.isGoodLevel() &&  json.getQt().size() == 0 ){
			//外观小于2处轻微剐蹭，只掉了一点漆
			return 3;
		} else if( json.getMileage() != null && (Double.parseDouble(json.getMileage()) < 1.000000) && isNew(json.getDate())){
			return 4;
		}
		return 2;
	}
	
	private  static boolean isNew(String data){
		Calendar c = Calendar.getInstance();
		c.setTime(new Date(data));
		Calendar c2 = Calendar.getInstance();
		Calendar c3 = Calendar.getInstance();
		c3.add(Calendar.YEAR, -1);
		return c3.after(c) && c.before(c2);
		
	}
}
