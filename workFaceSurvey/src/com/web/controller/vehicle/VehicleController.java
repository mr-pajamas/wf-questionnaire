package com.web.controller.vehicle;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Family;
import com.web.entity.MessageVO;
import com.web.entity.Vehicle;
import com.web.service.IVehicleService;

@Controller
@RequestMapping("/v")
public class VehicleController {
	@Autowired
	private IVehicleService vehicleService;
	
	@RequestMapping(value="vehicle")
	@ResponseBody
	public MessageVO<Vehicle> searchVehicle(Integer familyId){
		return warpeJson(vehicleService.searchVehicleListByFamily(familyId));
	}
	
	@RequestMapping(value="family")
	@ResponseBody
	public MessageVO<Family> searchFamily(Integer brandId){
		
		return warpeJson(vehicleService.searchFamilyListByBrand(brandId));
	}
	
	
	/**
	 * 包装机构数据
	 * @param <T>
	 * @param e
	 * @return
	 */
	public <T> MessageVO<T> warpeJson(List<T> e) {
		MessageVO<T> vo = new MessageVO<T>();
		vo.setCode("200");
		vo.setMessage("请求成功");
		vo.setResult(e);
		return vo;
	}
}
