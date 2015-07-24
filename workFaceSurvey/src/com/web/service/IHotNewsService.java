package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface IHotNewsService{

	public List<Map> searchHotNewsMonth(Map map);
	
	public List<Map> searchHotNewsMonthTitle(Map map);
	
	public List<Map> searchHotNewsMonthByRank(Map map);
	
	public List<Map> searchHotNewsMonthByMonth(Map map);
	
	public List<Map> searchHotNewsMonthByJP(Map map);
	
}
