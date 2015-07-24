package com.web.common.utils;

import java.util.Random;

/**
 * 
 * @author 高扬
 *
 */
public class NumberUtils {
	/**
	 * 保留小数点2位
	 * @param val
	 * @return
	 */
	public static Double setvalue(String val){
		Double result = (double) Math.round(Double.parseDouble(val) * 100) / 100;
		return result;
	}
	
	/**
	 * 保留小数点2位
	 * @param val
	 * @return
	 */
	public static Double setvalue(Double val){
		Double result = (double) Math.round(val * 100) / 100;
		return result;
	}
	
	/**
	 * 保留小数点4位
	 * @param val
	 * @return
	 */
	public static Double set4value(Double val){
		Double result = (double) Math.round(val * 10000) / 10000;
		return result;
	}
	
	/**
	 * 去除小数点
	 * @param val
	 * @return
	 */
	public static Double fromatDouble(Double val){
		Double result = (double) Math.round(val * 1) / 1;
		return result;
	}
	
	/**
	 * 生成随机数
	 * @param val
	 * @return
	 */
	public static int getRandom (int max, int min ){
	    Random random = new Random();
	    int s = random.nextInt(max)%(max-min+1) + min;
	    return s;
	}
	
	/**
	 * 生成随机数
	 * @param val
	 * @return
	 */
	public static Double getRandom (double max, double min ){
	    Random random = new Random();
	    Double s = random.nextDouble() * (max-min)+min;
	    			  
	    return set4value(s);
	}
	
	public static void main(String[] args){
		for(int i=0;i<100000;i++){
			double s=NumberUtils.getRandom(0.9597, 0.7200)*100;
			String ss=String.valueOf(s);
			
			if(ss.length()>6){
				System.out.println(NumberUtils.set4value(s)); 
			}
			
		}
		
	}
	
	
}
