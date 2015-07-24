package com.web.entity;

import java.util.*;

public class PeopleMap {
	Map<String,Integer> regionData;
	Map<String,Integer> peoDateByGender;
	Map<String,Integer> peoDataByAge;
	Map<String,Integer> dataByUsing;
	public Map<String, Integer> getRegionData() {
		return regionData;
	}
	public void setRegionData(Map<String, Integer> regionData) {
		this.regionData = regionData;
	}
	public Map<String, Integer> getPeoDateByGender() {
		return peoDateByGender;
	}
	public void setPeoDateByGender(Map<String, Integer> peoDateByGender) {
		this.peoDateByGender = peoDateByGender;
	}
	public Map<String, Integer> getPeoDataByAge() {
		return peoDataByAge;
	}
	public void setPeoDataByAge(Map<String, Integer> peoDataByAge) {
		this.peoDataByAge = peoDataByAge;
	}
	public Map<String, Integer> getDataByUsing() {
		return dataByUsing;
	}
	public void setDataByUsing(Map<String, Integer> dataByUsing) {
		this.dataByUsing = dataByUsing;
	}
	
	
}
