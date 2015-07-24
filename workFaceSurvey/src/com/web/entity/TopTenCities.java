package com.web.entity;

public class TopTenCities {
	private String city_name;
	private Integer value;
	
	public TopTenCities(String city_name, Integer value){
		this.city_name = city_name;
		this.value = value;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String cityName) {
		city_name = cityName;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	

}
