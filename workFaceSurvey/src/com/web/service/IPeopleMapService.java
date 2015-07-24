package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.web.common.service.CommonService;
import com.web.entity.Admin;
import com.web.entity.Constellation;

@Transactional
public interface IPeopleMapService extends CommonService{
    /**
     * Get data for region distribution by province
     * @param map
     * @return
     */
	public List<Map> searchRegDataByProvince(Map map);
	/**
	 * Get data for region distribution by cithy
	 * @param map
	 * @return
	 */
	public List<Map> searchRegDataByCities(Map map);
	/**
	 * Get data for gender proportion
	 * @param map
	 * @return
	 */
	public List<Map> searchPeoDataByGender(Map map);
	/**
	 * Get data for age group proportion
	 * @param map
	 * @return
	 */
	public List<Map> searchPeoDataByAge(Map map);
	/**
	 * Get data for purpose proportion
	 * @param map
	 * @return
	 */
	public List<Map> searcDataByUsing(Map map);
	/**
	 * Get data for user tags
	 * @param map
	 * @return
	 */
	public List<Map> searchUsertags(Map map);
	/**
	 * Get data for stars
	 * @param map
	 * @return
	 */
	public List<Map> searchStars(Map map);
	/**
	 * Get data for marriage proportion
	 * @param map
	 * @return
	 */	
	public List<Map> searchMedals(Map map);
	/**
	 * 
	 * Get Data for habits
	 * @param map
	 * @return
	 */
	public  List<Map> searchHabits(Map map);
	
	/**
	 * 查询userfactor中没有constellation记录的信息
	 * @param map
	 * @return
	 */
	public List<Map> searchUserfactor(Map map);
	
	/**
	 * 保存Constellation对象
	 * @param constellation
	 */
	public void saveConstellation(Constellation constellation);
	/**
	 * Get the stars english name to get the image easily
	 * @param map
	 */
	public List<Map> searchStarEname(Map map);
	
}
