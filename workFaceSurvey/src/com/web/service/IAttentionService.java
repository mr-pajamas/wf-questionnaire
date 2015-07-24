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
public interface IAttentionService {
	
	/**
	 * 查询车系传播量关注量
	 * @param map
	 * @return
	 */
	public List<Map> searchSeriesSpreadFocus(Map map);
	
	/**
	 * 查询紧凑型车系关注度排名
	 * @param map
	 * @return
	 */
	public List<Map> searchCompactFoucsSpreadTop(Map map);
	
	/**
	 * 查询紧凑车型总关注度
	 * @param map
	 * @return
	 */
	public int searchCompactSeriesFoucsAll(Map map);
	
	/**
	 * 查询紧凑车型总关注度
	 * @param map
	 * @return
	 */
	public int searchCompactSeriesSpreadAll(Map map);
	
	/**
	 * 查询网络传播效率
	 * @param map
	 * @return
	 */
	public  List<Map> searchSeriesSpreadSpeed(Map map);
}
