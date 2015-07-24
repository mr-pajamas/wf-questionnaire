package com.web.controller.vehicle;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.alibaba.fastjson.JSON;
import com.web.common.utils.EvaluateUtil;
import com.web.common.utils.NumberUtils;
import com.web.entity.PriceEvaluate;
import com.web.entity.Search_record;
import com.web.entity.Vehicle;
import com.web.entity.vehicle.VehicleJSON;
import com.web.service.IEvaluateService;
import com.web.service.IHomeAdminService;
import com.web.service.IVehicleService;

@Controller
@RequestMapping("/evalute")
public class PriceEvaluateController {
	@Autowired
	private IEvaluateService evaluateService;
	@Autowired
	private IVehicleService vehicleService;
	@Autowired
	private IHomeAdminService homeAdminService;

	
	
	@RequestMapping(value = "dimevalute")
	public String dimEvalute(HttpServletRequest request,
			HttpServletResponse response) {
		try{
		String vehicleid = request.getParameter("vehicleid");
		String cityid = request.getParameter("cityid");
		String date = request.getParameter("date");
		String mileage = request.getParameter("mileage");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("vehicleid", vehicleid);
		map.put("cityid", cityid);
		map.put("date", date+"-01");
//		map.put("mileage",mileage);
		if(Double.parseDouble(mileage) <=0.5){
			map.put("mileage","0.5");
		}else{
			map.put("mileage", String.valueOf(Math.round(Double.parseDouble(mileage))));
		}
		PriceEvaluate evaInfo = evaluateService.getEvaluate(map);
		
		// 通过车型ID查询数据
		if (vehicleid != null && !"".equals(vehicleid) && evaInfo!=null) {
			
			try {
				double trend2016 = Float.parseFloat(evaInfo.getPerson_price()) * 0.925;
				double trend2017 = trend2016 * 0.925;
				int analysisCount = NumberUtils.getRandom(10000, 3000);
				double accuracy = NumberUtils.getRandom(0.9597, 0.7200);
//				vehicleid = "4222";
//				mileage = "3";
//				date = "2014-06-01";
				Integer.parseInt(vehicleid);
				Vehicle vehicle = vehicleService
						.searchVehicleListByVehicle(Integer.parseInt(vehicleid));
				request.setAttribute("vehicle", vehicle);
				request.setAttribute("trend2015", evaInfo.getPerson_price());
				request.setAttribute("trend2016", NumberUtils
						.setvalue(trend2016));
				request.setAttribute("trend2017", NumberUtils
						.setvalue(trend2017));
				request.setAttribute("evaInfo", evaInfo);
				request.setAttribute("mileage", mileage);
				request.setAttribute("analysisCount", analysisCount);
				request.setAttribute("accuracy", NumberUtils.set4value(accuracy * 100));

				// 保存用户查询记录

				Search_record record = homeAdminService.searchRecord("1",
						vehicleid, date);
				if (record == null) {
					record = new Search_record();
					record.setVehicleid(Integer.parseInt(vehicleid));
					record.setPrice1(evaInfo.getRepurchase_price());
					record.setPrice2(evaInfo.getPerson_price());
					record.setPrice3(evaInfo.getRetail_price());
					record.setPrice4(vehicle.getPrice());
					record.setDate(evaInfo.getLicense_plate_date());
					record.setMileage(mileage);
					record.setCityid(evaInfo.getCid());
					record.setVehiclename(vehicle.getVehiclename());
					record.setUserid(1);
					record.setCreatetime(new Date());
					record.setModifytime(new Date());
					record.setFamilyid(Integer.toString(vehicle.getFamilyid()));
				} else {
					record.setMileage(mileage);
					record.setDate(evaInfo.getLicense_plate_date());
					record.setModifytime(new Date());
				}
				homeAdminService.saveSearchRecord(record);
			} catch (NumberFormatException e) {

			}
			return "/jsp/website/dimevalute";
		}else{
			return "/jsp/website/assessment";
		}
		}catch (Exception e) {
			return "/jsp/website/assessment";
		}
	}

	@RequestMapping(value = "enteraccurateevalute")
	public String enteraccurateevalute(HttpServletRequest request,
			HttpServletResponse response) {
		String vehicleid = request.getParameter("vehicleid");
		String cityid = request.getParameter("cityid");
		String date = request.getParameter("date");
		String mileage = request.getParameter("mileage");

		// 通过车型ID查询数据
		if (vehicleid != null && !"".equals(vehicleid)) {
			try {
				Integer.parseInt(vehicleid);
				Vehicle vehicle = vehicleService
						.searchVehicleListByVehicle(Integer.parseInt(vehicleid));
				request.setAttribute("vehicle", vehicle);
				request.setAttribute("cityid", cityid);
				request.setAttribute("cityname", vehicleService.searchCityByID(cityid));
				request.setAttribute("date", date + "-01");
				request.setAttribute("mileage", mileage);
			} catch (NumberFormatException e) {

			}

		}
		return "/jsp/website/enteryaccurateevalute";
	}

	@RequestMapping(value = "accurateevalute")
	public String accurateevalute(HttpServletRequest request,
			HttpServletResponse response) {

		try {
		VehicleJSON json = new VehicleJSON();
		json.setCityid(request.getParameter("cityid"));
		json.setVehicleId(request.getParameter("vehicleid"));
		json.setColor(request.getParameter("color"));
		json.setDate(request.getParameter("date"));
		json.setMileage(request.getParameter("mileage"));
		json.setDueday(request.getParameter("dueday"));
		json.setRepare(request.getParameter("repare"));
		json.setFee(request.getParameter("fee"));
		json.setUsed(request.getParameter("used"));

		String data = request.getParameter("dd");
		VehicleJSON j2 = JSON.parseObject(data, VehicleJSON.class);

		Map<String, String> map = new HashMap<String, String>();
		map.put("vehicleid", json.getVehicleId());
		map.put("cityid", json.getCityid());
		map.put("date", json.getDate());
		map.put("mileage", json.getMileage());
		PriceEvaluate evaInfo = evaluateService.getEvaluate(map);
		if(json.getVehicleId() == null) {
			return "redirect:/admin/home/assessment";
		}
		
		Vehicle vehicle = vehicleService.searchVehicleListByVehicle(Integer
				.parseInt(json.getVehicleId()));

		if (evaInfo != null) {
			Integer level = EvaluateUtil.getLevel(j2);
			Double[] priceRange = EvaluateUtil.CaculateVauleRange(Double
					.valueOf(evaInfo.getArea1_price()), Double.valueOf(evaInfo
					.getRetail_price()), Double.valueOf(vehicle.getPrice()),
					level);
			double accuracy = 0.0;
			Double price = 0.0;
			if (level == 0) {
				accuracy = NumberUtils.getRandom(0.85, 0.97);
				priceRange[0] = 0.0;
				price = priceRange[1] * accuracy;
			} else if (level == 4) {
				accuracy = NumberUtils.getRandom(1.15, 1.3);
				price = priceRange[0] * accuracy;
				priceRange[1] = 0.0;
			} else {
				accuracy = NumberUtils.getRandom(0.45, 0.56);
				Double diff = priceRange[1] - priceRange[0];
				price = priceRange[0] + diff * accuracy;
			}
		

			 BigDecimal   b  =   new BigDecimal(priceRange[0]);  
			 priceRange[0]  =  b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();  
			 
			 b  =   new BigDecimal(priceRange[1]);  
			 priceRange[1]  =  b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			 
			 b  =   new BigDecimal(price);  
			 price = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			 
			Search_record record = new Search_record();
			record.setVehicleid(Integer.parseInt(json.getVehicleId()));
			record.setPrice1(Double.toString(priceRange[0]));
			record.setPrice2(Double.toString(price));
			record.setPrice3(Double.toString(priceRange[1]));
			record.setCityid(json.getCityid());
			record.setMileage(json.getMileage());
			record.setDueday(json.getDueday());
			record.setDate(json.getDate());
			record.setVehiclename(vehicle.getVehiclename());
			record.setUesd(json.getUsed());
			record.setMaintain(json.getRepare());
			record.setOutside(JSON.toJSONString(j2.getWg()));
			record.setInside((JSON.toJSONString(j2.getNs())));
			record.setOhter(JSON.toJSONString(j2.getQt()));
			record.setEngine(JSON.toJSONString(j2.getDl()));
			record.setPrice4(vehicle.getPrice());
			record.setFee(json.getFee());
			record.setColor(json.getColor());
			record.setUserid(1);
			record.setFee(json.getFee());
			record.setCreatetime(new Date());
			record.setModifytime(new Date());
			record.setCarcondition(carcondition(level));
			record.setFamilyid(Integer.toString(vehicle.getFamilyid()));
			homeAdminService.saveSearchRecord(record);
			request.setAttribute("recordid", record.getId());
			return "redirect:/usercar/guzhi?id=" + record.getId();
		}
		} catch (Exception e) {
			return "redirect:/admin/home/assessment";
		}
		return "redirect:/admin/home/assessment";
	}
	
	private String carcondition(Integer level) {
		if(level == 0){
			return "车况很差";
		} else if(level == 1) {
			return "车况较差";
		} else if(level == 2) {
			return "车况一般";
		} else if(level == 3) {
			return "良好车况";
		} else {
			return "准新车";
		}
	}
}
