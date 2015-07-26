package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
/**
 * 汇总模块
 * @author 高扬
 *
 */
@Transactional
public interface ISynthesizeService {
	/**
	 * 查询品牌关注度排名
	 * @param map
	 * @return
	 */
	public List<Map> searchBrandFoucsSpreadTop(Map map);
	
	/**
	 * 查询车系关注度排名
	 * @param map
	 * @return
	 */
	public List<Map> searchSeriesFoucsSpreadTop(Map map);
	
	/**
	 * 查询品牌总关注度
	 * @param map
	 * @return
	 */
	public int searchBrandFoucsSpreadAll(Map map);
	
	/**
	 * 查询品牌总关注度
	 * @param map
	 * @return
	 */
	public int searchSeriesFoucsSpreadAll(Map map);
	
	/**
	 * 查询网络传播效率
	 * @param map
	 * @return
	 */
	public  List<Map> searchRankFocusSpread(Map map);
	
	/**
	 * 查询各级别网络声量
	 * @param map
	 * @return
	 */
	public  List<Map> searchRankFocusSpread2(Map map);
	
	/**
	 * 查询热点话题
	 * 
	 * @param map
	 * @return
	 */
	public  List<Map> searchRegionHotTopic(Map map);
	
	/**
	 * 查询每个省份前3的话题
	 * @param map
	 * @return
	 */
	public List<Map> searchRegionHotTopicByProvincename(Map map);
	
	
	public  List<Map> searchUser(Map map);
	
	public int getTotalRows(Map p);
}
