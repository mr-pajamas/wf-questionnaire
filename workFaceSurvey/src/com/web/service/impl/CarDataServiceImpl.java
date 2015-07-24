package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.service.ICarDataService;

@Service
public class CarDataServiceImpl extends CommonServiceSpringImpl implements
		ICarDataService {

	/**
	 * 查询车型
	 * @param map
	 * @return
	 */
	public List<Map> searchSeries(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from car_series where 1=1  ");
		if(map.containsKey("brandid")){
			sql.append(" and brandid=").append(map.get("brandid"));
		}
		if(map.containsKey("seriesid")){
			sql.append(" and seriesid=").append(map.get("seriesid"));
		}
		if(map.containsKey("brandids")){
			sql.append(" and brandid in (").append(map.get("brandids")).append(")");
		}
		
		// 凌度demo只查询固定车系
		if(map.containsKey("ld")){
			sql.append(" and (seriesid=1428 or seriesid=190) ");
		}
		System.out.println(sql);
		sql.append(" order by series ");
		return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	/**
	 * 查询车型本品竞品关系
	 */
	public List<Map> searchCompetitiveProduct(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM competitive_product where 1=1 ");
		if(map.containsKey("seriesid")){
			sql.append(" and self_seriesid=").append(map.get("seriesid"));
		}
		return super.searchObjectBySQL(sql.toString(), null, null);
	}
}
