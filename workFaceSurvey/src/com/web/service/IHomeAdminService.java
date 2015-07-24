package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Search_record;
/**
 * 汇总模块
 * @author 高扬
 *
 */
@Transactional
public interface IHomeAdminService {
	
	/**
	 * 查询用户信息
	 * @param map
	 * @return
	 */
	public List<Map> searchemp(Map map);
	
	/**
	 * 查询记录数
	 * @param map
	 * @return
	 */
	public int countEmpInfo(Map map);

	
	public void saveSearchRecord(Search_record record);
	
	public Search_record  searchRecord(String userid,String vehicleid , String date);
	
	public List<Map>  searchRecord(Map map);

	
}
