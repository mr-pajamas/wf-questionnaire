package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.entity.PriceEvaluate;
import com.web.service.IEvaluateService;

@Service
public class EvaluateServiceImp extends CommonServiceSpringImpl implements IEvaluateService{
	
	public PriceEvaluate getEvaluate(Map<String,String> map){
		StringBuffer sql = new StringBuffer();
		sql.append(" from PriceEvaluate where 1=1 ");
		if(map.containsKey("vehicleid") && !"".equals(map.get("vehicleid")) ){
			sql.append("and vehicleid='").append(map.get("vehicleid")).append("' ");
		}
		if(map.containsKey("cityid") && !"".equals(map.get("cityid")) ){
			sql.append("and cid='").append(map.get("cityid")).append("' ");
		}
		if(map.containsKey("date") && !"".equals(map.get("date")) ){
			sql.append("and license_plate_date='").append(map.get("date")).append("' ");
		}
		if(map.containsKey("mileage") && !"".equals(map.get("mileage")) ){
			sql.append("and run='").append(map.get("mileage")).append("' ");
		}
		System.out.println(sql);
		List<PriceEvaluate> info= super.searchObjectByHQL(sql.toString(), null, null,null);
		PriceEvaluate evaInfo=new PriceEvaluate();
		if(info.size()==1){
			evaInfo=info.get(0);
			return evaInfo;
		}else{
			return null;
		}
	}
}
