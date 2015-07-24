package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.common.utils.StringUtil;
import com.web.service.ISynthesizeService;

/**
 * 汇总模块
 * 
 * @author 高扬
 * 
 */
@Service
public class SynthesizeServiceImpl extends CommonServiceSpringImpl implements
		ISynthesizeService {

	/**
	 * 查询品牌关注度排名
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchBrandFoucsSpreadTop(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(focus_count) as focus_count, brand,brandid FROM brand_focus_spread where 1=1  ");
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append(" GROUP BY brand ORDER BY focus_count DESC  LIMIT 12 ");
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	/**
	 * 查询车系关注度排名
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchSeriesFoucsSpreadTop(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.focus_count) as  focus_count, t.series,a.brandid FROM series_focus_spread t ");
		sql.append(" LEFT JOIN car_series a ON t.seriesid =a.seriesid  where 1=1 ");
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND t.data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND t.data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append(" GROUP BY series ORDER BY focus_count DESC  LIMIT 12 ");

		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	/**
	 * 查询品牌总关注度
	 * 
	 * @param map
	 * @return
	 */
	public int searchBrandFoucsSpreadAll(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(focus_count) FROM brand_focus_spread where 1=1 ");
		if(map.containsKey("brandid")){
			sql.append(" and brandid=").append(map.get("brandid"));
		}
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND data_time<='").append(map.get("enddate")).append("'");
		}
		return super.searchObjectUnique(sql.toString(), null);
	}

	/**
	 * 查询车系总关注度
	 * 
	 * @param map
	 * @return
	 */
	public int searchSeriesFoucsSpreadAll(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(focus_count) FROM series_focus_spread  where 1=1 ");
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND data_time<='").append(map.get("enddate")).append("'");
		}
		return super.searchObjectUnique(sql.toString(), null);
	}

	/**
	 * 查询网络传播效率
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchRankFocusSpread(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT rank ,SUM(spread_count) AS spread_count,SUM(foucs_count) AS foucs_count,"
						+ "ROUND(SUM(foucs_count) / SUM(spread_count)*100) AS xs  "
						+ " FROM rank_focus_spread t where 1=1 ");
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND t.data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND t.data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append("  GROUP BY t.rank ORDER BY foucs_count DESC ");
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	/**
	 * 查询各级别网络声量
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchRankFocusSpread2(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.spread_count) AS spread_count ,t.rank,t.rankid,a.source_type FROM rank_focus_spread t ");
		sql.append(" LEFT JOIN source_type a ON a.typeid=t.source_type where 1=1  ");
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND t.data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND t.data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append(" GROUP BY t.rank,t.source_type ORDER BY t.source_type DESC,t.rank");
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	/**
	 * 查询热点话题
	 * 
	 * @param map
	 * @return
	 */
	public List<Map> searchRegionHotTopic(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.spread_count) AS tj,a.provincename FROM region_hot_topic t LEFT JOIN province a ON t.provinceid=a.provinceid ");
		sql.append(" where 1=1 ");
		if(map.containsKey("brandid")){
			sql.append(" and t.brandid=").append(map.get("brandid"));
		}
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND t.data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND t.data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append("  GROUP BY t.provinceid order by tj desc ");
		System.out.println(sql);
		return super.searchObjectBySQL(sql.toString(), null, null);
	}
	/**
	 * 查询每个省份前3的话题
	 * @param map
	 * @return
	 */
	public List<Map> searchRegionHotTopicByProvincename(Map map){
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT  SUM(t.spread_count) AS tj, t.topic FROM region_hot_topic t LEFT JOIN province a ON a.provinceid=t.provinceid");
		sql.append(" where 1=1 ");
		if(map.containsKey("brandid")){
			sql.append(" and t.brandid=").append(map.get("brandid"));
		}
		if(map.containsKey("provincename")){
			sql.append(" and a.provincename='").append(map.get("provincename")).append("'");
		}
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND t.data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND t.data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append("  GROUP BY t.topicid ORDER BY tj DESC  LIMIT 3 ");
		//System.out.println(sql);
		
		return super.searchObjectBySQL(sql.toString(), null, null); 
	}
	
	public  List<Map> searchUser(Map map){
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from user ");
		sql.append(" where 1=1 ");
		
		String firstResult = StringUtil.safeToString(map.get("firstrs"), "0");
		String maxResults = StringUtil.safeToString(map.get("maxrs"), "5");
		return super.searchObjectBySQL(sql.toString(), firstResult, maxResults);
	}




	public int getTotalRows(Map p) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) from user ");
		sql.append(" where 1=1 ");

		return super.searchObjectUnique(sql.toString(), null);
	}
}
