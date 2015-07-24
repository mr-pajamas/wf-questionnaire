package com.web.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.entity.City;
import com.web.entity.Family;
import com.web.entity.Vehicle;
import com.web.service.IVehicleService;

@Service
public class VehicleServiceImpl extends CommonServiceSpringImpl implements IVehicleService{

	public List<Vehicle> searchVehicleListByFamily(Integer familyId) {
		List<Vehicle> result = new ArrayList<Vehicle>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select id, vehiclename,makeyear,factoryname,familyname,brandname,price from vehicle_basicinfor");
		sql.append(" where familyid = ");
		sql.append(familyId);
		sql.append("  order by makeyear desc  ");
		List<Map> tmp = super.searchObjectBySQL(sql.toString(), null, null);
		for(Map m : tmp) {
			Vehicle vehicle = new Vehicle();
			vehicle.setBrandname(m.get("brandname").toString());
			vehicle.setPrice(m.get("price").toString());
			vehicle.setFamilyname(m.get("familyname").toString());
			vehicle.setMakeyear(m.get("makeyear").toString());
			vehicle.setFactoryname(m.get("factoryname").toString());
			vehicle.setId(Integer.parseInt(m.get("id").toString()));
			vehicle.setVehiclename(m.get("vehiclename").toString());
			result.add(vehicle);
		}
		
		return result;
	} 

	public List<Family> searchFamilyListByBrand(Integer brandId) {
		List<Family> result = new ArrayList<Family>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,vehicleimg,familyname,factoryname from vehicle_family ");
		sql.append(" where brandid = ");
		sql.append(brandId);
		List<Map> tmp = super.searchObjectBySQL(sql.toString(), null, null);
		for(Map m : tmp) {
			Family family = new Family();
			family.setId(Integer.parseInt(m.get("id").toString()));
			family.setFactoryname(m.get("factoryname").toString());
			family.setFamilyname(m.get("familyname").toString());
			family.setImgpath(m.get("vehicleimg").toString());
			result.add(family);
		}
		
		return result;
	} 
	
	public Vehicle searchVehicleListByVehicle(Integer vehicleId) {
		List<Vehicle> result = new ArrayList<Vehicle>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,familyId, vehiclename,makeyear,factoryname,familyname,brandname,price from vehicle_basicinfor");
		sql.append(" where id = ");
		sql.append(vehicleId);
		sql.append("  order by makeyear desc  ");
		List<Map> tmp = super.searchObjectBySQL(sql.toString(), null, null);
		for(Map m : tmp) {
			Vehicle vehicle = new Vehicle();
			vehicle.setBrandname(m.get("brandname").toString());
			vehicle.setPrice(m.get("price").toString());
			vehicle.setFamilyname(m.get("familyname").toString());
			vehicle.setMakeyear(m.get("makeyear").toString());
			vehicle.setFactoryname(m.get("factoryname").toString());
			vehicle.setId(Integer.parseInt(m.get("id").toString()));
			vehicle.setVehiclename(m.get("vehiclename").toString());
			vehicle.setFamilyid(Integer.parseInt(m.get("familyId").toString()));
			result.add(vehicle);
		}
		
		if(result.size() > 0){
			return result.get(0);
		} else {
			return null;
		}
 	}
	
	public String searchCityByID(String cityId){
		StringBuffer sql = new StringBuffer();
		sql.append("from City");
		sql.append(" where cityid ='").append(cityId).append("'");
		List<City> cityList=super.searchObjectByHQL(sql.toString(), null, null, null);
		if(cityList.size()>0){
			City city =cityList.get(0);
			return city.getCityname();
		}else{
			return null;
		}
		
	}
	
	
}
