package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.service.IHotNewsService;

@Service
public class HotNewsServiceImpl extends CommonServiceSpringImpl implements IHotNewsService{
	
	public List<Map> searchHotNewsMonth(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT COUNT(id) as tj ,DATE_FORMAT(data_time, '%Y-%m') AS data_time,series  FROM hot_news_month t ");
		sql.append(" where 1=1 ");
		if(map.containsKey("seriesid")){
			sql.append(" and seriesid=").append(map.get("seriesid"));
		}
		if(map.containsKey("cid") && !"".equals(map.get("cid"))){
			sql.append(" and seriesid in (").append(map.get("cid")).append(")");
		}
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append("  GROUP BY seriesid,data_time ORDER BY seriesid,data_time");
		
		
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	
	public List<Map> searchHotNewsMonthTitle(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT t.news_title,t.news_href,t.spread_count,t.focus_count,t.positive_negative FROM hot_news_month t ");
		sql.append(" LEFT JOIN car_series a ON t.seriesid=a.seriesid ");
		sql.append(" where 1=1 ");
		if(map.containsKey("seriesid")){
			sql.append(" and t.seriesid=").append(map.get("seriesid"));
		}
		if(map.containsKey("brandid")){
			sql.append(" and a.brandid=").append(map.get("brandid"));
		}
		if(map.containsKey("cid") && !"".equals(map.get("cid"))){
			sql.append(" and t.seriesid in (").append(map.get("cid")).append(")");
		}
		if(map.containsKey("begindate") && !"".equals(map.get("begindate"))){
			sql.append(" AND t.data_time>='").append(map.get("begindate")).append("'");
		}
		if(map.containsKey("enddate") && !"".equals(map.get("enddate"))){
			sql.append(" AND t.data_time<='").append(map.get("enddate")).append("'");
		}
		sql.append(" ORDER BY t.focus_count DESC LIMIT 10 ");
				
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}

	public List<Map> searchHotNewsMonthByRank(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT t.news_title,t.news_href,t.positive_negative, t.spread_count,t.focus_count FROM hot_news_month t " +
				"LEFT JOIN car_series a ON a.seriesid=t.seriesid");
		sql.append(" where 1=1 ");
		if(map.containsKey("rankid")){
			sql.append(" and a.rankid=").append(map.get("rankid"));
		}
		sql.append(" ORDER BY t.focus_count DESC LIMIT 10 ");
		
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	public List<Map> searchHotNewsMonthByMonth(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT t.news_href,t.news_title FROM hot_news_month t ");
		sql.append(" where 1=1 ");
		if(map.containsKey("date")){
			sql.append("  and DATE_FORMAT(t.data_time, '%Y-%m') ='").append(map.get("date")).append("'");
		}
		if(map.containsKey("seriesname")){
			sql.append("  and t.series='").append(map.get("seriesname")).append("'");
		}
		sql.append("  ORDER BY t.spread_count DESC LIMIT 3 ");
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	public List<Map> searchHotNewsMonthByJP(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT t.news_title,t.news_href,t.positive_negative, t.spread_count,t.focus_count FROM hot_news_month t ");
			
		sql.append(" where 1=1 ");
		if(map.containsKey("seriesids") && !"".equals(map.get("seriesids"))){
			sql.append(" and t.seriesid in (").append(map.get("seriesids")).append(")");
		}
		sql.append(" ORDER BY t.focus_count DESC LIMIT 10 ");
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
}
