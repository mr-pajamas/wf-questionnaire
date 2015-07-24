package com.web.common.enums;

public class CarRankEnum {

	public static String getCarRank(String rank) {
		int r = Integer.valueOf(rank);
		String result = "";
		switch (r) {
		case 1:
			result = "MPV";
			break;
		case 2:
			result = "小型车";
			break;
		case 3:
			result = "跑车";
			break;
		case 4:
			result = "紧凑型车";
			break;
		case 5:
			result = "SUV";
			break;
		case 7:
			result = "微型车";
			break;
		case 9:
			result = "中型车";
			break;
		case 11:
			result = "中大型车";
			break;
		case 13:
			result = "豪华车";
			break;
		case 14:
			result = "皮卡";
			break;
		case 15:
			result = "微面";
			break;
		case 16:
			result = "微卡";
			break;
		case 17:
			result = "轻客";
			break;
		}
		return result;
	}

	public static void main(String[] args) {
		System.out.println(CarRankEnum.getCarRank("2"));
	}
}
