package com.web.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.web.entity.City;
import com.web.entity.Family;
import com.web.entity.Vehicle;

/**
 * 
 * 车型
 * @author chenchao
 *
 */
@Transactional
public interface IVehicleService {

	
	/**
	 * 按车系ID获取车型
	 * @param familyId
	 * @return 车型集合
	 */
	public List<Vehicle> searchVehicleListByFamily(Integer familyId);
	/**
	 * 按品牌ID获取车系
	 * @param brandId
	 * @return 车型集合
	 */
	public List<Family> searchFamilyListByBrand(Integer brandId);
	/**
	 * 按车型ID获取车型
	 * @param vehicleId
	 * @return 车型
	 */
	public Vehicle searchVehicleListByVehicle(Integer vehicleId);
	/**
	 * 按城市ID获取城市名称
	 * @param cityid
	 * @return 城市名称
	 */
	public String searchCityByID(String cityid);
	
}
