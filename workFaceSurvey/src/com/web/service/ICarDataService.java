package com.web.service;

import java.util.List;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ICarDataService{

	/**
	 * 查询车型
	 * @param map
	 * @return
	 */
	public List<Map> searchSeries(Map map);
	
	
	/**
	 * 查询车型本品竞品关系
	 */
	public List<Map> searchCompetitiveProduct(Map map);
}
