package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.web.common.service.CommonService;
import com.web.entity.TopicDesc;

@Transactional
public interface IProductService extends CommonService {

	/**
	 * 查询车系评价排名
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchpjTop(Map map);

	/**
	 * 查询词频
	 */
	public List<Map> searchWordsEvaluate(Map map);

	/**
	 * 查询总体与分项评价
	 */
	public List<Map> searchProductEvaluate(Map map);

	/**
	 * 查询详细个项评价
	 */
	// public List<Map> searchProduct(Map map);

	public List<Map> searchProductpl(Map map);

	/**
	 * 查询总数
	 * 
	 * @param map
	 * @return
	 */
	public int searchPInfoByCount(Map map);

	/**
	 * 带分页查询评价
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchCarPriceInfoByFy(Map map);

	/**
	 * 查询MD5集合 陈震宇 20150512
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchMd5List(Map map);

	/**
	 * 个人信息 陈震宇 20150512
	 * 
	 * @param md5
	 * @return
	 */
	public List<Map> searchMc(String md5);

	/**
	 * 评论信息 陈震宇 20150512
	 * 
	 * @param md5
	 * @return
	 */
	public List<Map> searchMct(String md5,String topic);
	
	/**
	 * 评论信息 陈震宇 20150512
	 * 
	 * @param md5
	 * @return
	 */
	public List<Map> searchContent(String md5,String content);
	
	/**
	 * 查询 匹配字段 陈震宇 20150513
	 * @param topic
	 * @return
	 */
	public List<Map> searchString(String topic);
	
//	public List<Map> searchCon();
	
	public List<Map> searchCon(String md5,String id,Map p);
	
	public int count(String md5,String id);

}
