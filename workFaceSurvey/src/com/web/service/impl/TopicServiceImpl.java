package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.service.ITopicService;
@Service
public class TopicServiceImpl  extends CommonServiceSpringImpl implements ITopicService {


	public List<Map> searchNewsidcx(Map map){
		StringBuffer sql=new StringBuffer();
	
		sql.append(	" select brandid from car_series where  1=1  ");
    
         
    
	//	sql.append(" and  brandid=").append(map.get("brandid"));
		
		if(map.containsKey("seriesid")){
			sql.append(" and seriesid=").append(map.get("seriesid"));
		}
		
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	public List<Map> searchNews(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append("select t1.name, SUM(VALUE) as value,seriesid  from (SELECT  p.provincename	as name  ,t.spread_count as value,t.seriesid" );
	    sql.append("	FROM series_region_hot_topic t ");
		sql.append(	"	LEFT JOIN province p ");
		sql.append(	"ON p.provinceid=t.provinceid WHERE 1=1");
	//	sql.append(" and  brandid=").append(map.get("brandid"));
		
		if(map.containsKey("seriesid")){
			sql.append(" and seriesid=").append(map.get("seriesid"));
		}
		sql.append(" ORDER BY  p.provincename ) t1 GROUP BY name order by value desc");
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}

	
	
	/**
	 * 查询每个省份前3的话题
	 * @param map
	 * @return
	 */
	public List<Map> searchHotTopic(Map map){
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT  SUM(t.spread_count) AS tj, t.topic FROM series_region_hot_topic t LEFT JOIN province a ON a.provinceid=t.provinceid");
		sql.append(" LEFT JOIN topic b ON b.topicid=t.topicid where 1=1 ");
		if(map.containsKey("seriesid")){
			sql.append(" and t.seriesid=").append(map.get("seriesid"));
		}
		if(map.containsKey("provincename")){
			sql.append(" and a.provincename='").append(map.get("provincename")).append("'");
		}
		sql.append("  GROUP BY t.topic ORDER BY tj DESC  LIMIT 3 ");
		
		return super.searchObjectBySQL(sql.toString(), null, null); 
	}
	
	public List<Map> searchtopEvaluate(Map map){
	
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT words_count,words,ispos,series FROM topic_cloud_evaluate where 1=1  ");
		if (map.containsKey("seriesid")) {
			sql.append(" and seriesid=").append(map.get("seriesid"));
		}
		sql.append(" GROUP BY  words order by   words_count DESC LIMIT 50 ");
		return super.searchObjectBySQL(sql.toString(), null, null);
	} 
	public List<Map> searchtop(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append(" SELECT s.series,sum(p.poscount+p.negcount)AS total_score, ");
		sql.append( " ROUND(sum(p.poscount)/sum(p.poscount+p.negcount)*100) AS total_poscount,");
		sql.append(" ROUND(sum(p.negcount)/sum(p.poscount+p.negcount)*100) AS total_negcount,");
	
		sql.append( "s.rankid FROM topic_cloud_evaluate p ");
		sql.append("LEFT JOIN car_series s ON p.seriesid =s.seriesid ");
		sql.append(" WHERE 1=1 ");
		if(map.containsKey("rankid")){
			sql.append(" and s.rankid=").append(map.get("rankid"));
		}
		System.out.println("---"+sql);
		sql.append(" GROUP BY p.series ORDER BY total_score DESC LIMIT 5");
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	public List<Map> searchtxtop(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append(" SELECT s.series,sum(p.poscount+p.negcount)AS total_score, ");
		sql.append( "ROUND(sum(p.poscount)/sum(p.poscount+p.negcount)*100) AS total_poscount,");
		sql.append("ROUND(sum(p.negcount)/sum(p.poscount+p.negcount)*100) AS total_negcount,");

		sql.append( "s.rankid FROM topic_cloud_evaluate p ");
		sql.append("LEFT JOIN car_series s ON p.seriesid =s.seriesid ");
		sql.append(" WHERE 1=1 ");
		if(map.containsKey("seriesid")){
			sql.append(" and s.seriesid=").append(map.get("seriesid"));
		}
		System.out.println("---ddd"+sql);
		sql.append(" GROUP BY p.series ORDER BY total_score ");
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	

	/**
	 * 查询车系播效率排名
	 * @param map
	 * @return
	 */
	public List<Map> searchSeriesFoucsSpreadTop(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT SUM(s.spread_count) AS spread_count,SUM(s.focus_count) AS focus_count,t.topic" );
		sql.append("series_hot_topic s LEFT JOIN topic t ON s.topicid=t.topicid WHERE  1=1");
		if(map.containsKey("seriesid")){
			sql.append(" and seriesid=").append(map.get("seriesid"));
		}
		sql.append(" GROUP BY s.topicid ORDER BY s.spread_count DESC ");
		
		return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	
	
	public List<Map> searchjpht(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append(" SELECT s.series,sum(p.poscount+p.negcount)AS total_score, ");
		sql.append( " ROUND(sum(p.poscount)/sum(p.poscount+p.negcount)*100) AS total_poscount,");
		sql.append(" ROUND(sum(p.negcount)/sum(p.poscount+p.negcount)*100) AS total_negcount,");
		
		sql.append( "s.rankid FROM topic_cloud_evaluate p ");
		sql.append("LEFT JOIN car_series s ON p.seriesid =s.seriesid ");
		sql.append(" WHERE 1=1 ");
		if(map.containsKey("cid") && !"".equals(map.get("cid"))){
			sql.append(" and p.seriesid in (").append(map.get("cid")).append(")");
		}
		System.out.println("---"+sql);
		sql.append(" GROUP BY p.series ORDER BY total_score DESC LIMIT 5");
		return super.searchObjectBySQL(sql.toString(), null, null);	
		
	}

}




