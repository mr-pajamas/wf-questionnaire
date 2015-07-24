package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.service.IAttentionService;
/**
 * 声量/关注
 * @author 杨树楷
 *
 */
@Service
public class AttentionServiceImp extends CommonServiceSpringImpl implements IAttentionService{
	
	/**
	 * 查询车系传播量关注量
	 * @param map
	 * @return
	 */
	public List<Map> searchSeriesSpreadFocus(Map map){
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.spread_count) AS  spread_count, SUM(t.focus_count) AS  focus_count,DATE_FORMAT(data_time, '%Y-%m') AS data_time,a.series As series ");
		sql.append(" FROM series_focus_spread t LEFT JOIN car_series a ON t.seriesid =a.seriesid ");
		sql.append(" where 1=1");
		if(map.containsKey("seriesid")){
			sql.append(" and t.seriesid=").append(map.get("seriesid"));
		}
		if(map.containsKey("cid") && !"".equals(map.get("cid"))){
			sql.append(" and t.seriesid in (").append(map.get("cid")).append(")");
		}
		if(map.containsKey("source_type")){
			sql.append(" AND t.source_type=").append(map.get("source_type"));
		}
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append(" GROUP BY t.seriesid,t.data_time");
		System.out.println(sql);
		return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	
	
	/**
	 * 查询紧凑型车系关注度排名
	 * @param map
	 * @return
	 */
	public List<Map> searchCompactFoucsSpreadTop(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.spread_count) AS  spread_count, SUM(t.focus_count) AS  focus_count,t.series,a.brandid  ");
		sql.append(" FROM series_focus_spread t LEFT JOIN car_series a ON t.seriesid =a.seriesid WHERE 1=1");
		if(map.get("rankid")!=null || !"".equals(map.get("rankid"))){
			sql.append(" AND a.rankid=").append(map.get("rankid"));
		}
		sql.append(" GROUP BY series ORDER BY focus_count DESC  LIMIT 10");

		return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	/**
	 * 查询紧凑型车系总关注度
	 * @param map
	 * @return
	 */
	public int searchCompactSeriesFoucsAll(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.focus_count) FROM series_focus_spread t");
		sql.append(" LEFT JOIN car_series a ON t.seriesid =a.seriesid WHERE 1=1");
		if(map.get("rankid")!=null || !"".equals(map.get("rankid"))){
			sql.append(" AND a.rankid=").append(map.get("rankid"));
		}
		return super.searchObjectUnique(sql.toString(), null);
	}
	
	/**
	 * 查询紧凑型车系总传播量
	 * @param map
	 * @return
	 */
	public int searchCompactSeriesSpreadAll(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.spread_count) FROM series_focus_spread t");
		sql.append(" LEFT JOIN car_series a ON t.seriesid =a.seriesid WHERE 1=1 ");
		if(map.get("rankid")!=null || !"".equals(map.get("rankid"))){
			sql.append(" AND a.rankid=").append(map.get("rankid"));
		}
		return super.searchObjectUnique(sql.toString(), null);
	}
	
	/**
	 * 查询紧凑型车系关注度排名
	 * @param map
	 * @return
	 */
	public List<Map> searchRankFoucsSpreadTop(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(t.spread_count) AS  spread_count, SUM(t.focus_count) AS  focus_count,t.series,a.brandid  ");
		sql.append(" FROM series_focus_spread t LEFT JOIN car_series a ON t.seriesid =a.seriesid ");
		sql.append(" WHERE a.rankid=4 GROUP BY series ORDER BY focus_count DESC  LIMIT 10");
		return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	/**
	 * 查询网络传播效率
	 * @param map
	 * @return
	 */
	public  List<Map> searchSeriesSpreadSpeed(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(s.spread_count) AS spread_count,SUM(s.focus_count) AS focus_count,t.topic ");
		sql.append("FROM series_hot_topic s LEFT JOIN topic t ON s.topicid=t.topicid WHERE ");
		sql.append("s.seriesid=").append(map.get("seriesid"));
		sql.append(" GROUP BY s.topicid ORDER BY focus_count DESC");
		return super.searchObjectBySQL(sql.toString(), null,null );
	}
	
}

