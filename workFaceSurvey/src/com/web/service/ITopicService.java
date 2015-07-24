package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.web.common.service.CommonService;
@Transactional
public interface ITopicService extends CommonService {
	public List<Map>	searchNewsidcx(Map map);
	
	public List<Map> searchNews(Map map);
	
	/**
	 * 查询车系播效率排名
	 * @param map
	 * @return
	 */
	public List<Map> searchSeriesFoucsSpreadTop(Map map);
	public List<Map> searchtxtop(Map map);
	
	public List<Map> searchHotTopic(Map map);	
	
	/**
	 * 查询话题评论前3
	 * @param map
	 * @return
	 */
	public List<Map> searchtop(Map map);
	/**
	 * 查询话题评论云图
	 * @param map
	 * @return
	 */
//	public List<Map> searchht(Map map);
	
	


/**
 * 查询竞品评论
 * @param map
 * @return
 */
public List<Map> searchjpht(Map map);
/**
 * 查询话题评论云图z
 * @param map
 * @return
 */
public List<Map> searchtopEvaluate(Map map);

}

