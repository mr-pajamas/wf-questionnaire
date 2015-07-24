package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.service.IProductService;
import com.web.common.utils.*;
import com.web.entity.TopicDesc;

@Service
public class ProductServiceimpl extends CommonServiceSpringImpl implements
		IProductService {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Map> searchpjTop(Map map) {
		StringBuffer sql = new StringBuffer();
		sql
				.append(" SELECT s.series,CAST(AVG(p.topic_score)AS decimal(38,2)) AS total_score,s.rankid FROM product_evaluate p "
						+ " LEFT JOIN car_series s ON p.seriesid =s.seriesid ");
		sql.append(" WHERE 1=1 ");
		if (map.containsKey("rankid")) {
			sql.append(" and rankid=").append(map.get("rankid"));
		}

		sql.append(" GROUP BY s.series ORDER BY total_score DESC LIMIT 10");

		return super.searchObjectBySQL(sql.toString(), null, null);

	}

	/**
	 * 查询词频
	 */
	public List<Map> searchWordsEvaluate(Map map) {
		StringBuffer sql = new StringBuffer();
		// sql
		// .append(" SELECT words_count,words,issatisfied,series FROM words_evaluate where 1=1  ");
		// if (map.containsKey("seriesid")) {
		// sql.append(" and seriesid=").append(map.get("seriesid"));
		// }
		// sql.append(" GROUP BY words");

		// 修改获取数据表--czy20150508
		sql
				.append("SELECT emotion_score,topic,issatisfied,series FROM topic_evaluate where 1=1");
		if (map.containsKey("seriesid")) {
			sql.append(" and seriesid=").append(map.get("seriesid"));
		}
		sql.append(" and topic_count > 0");
		sql.append(" GROUP BY topic");
		sql.append(" order BY topic_count desc");
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	/**
	 * 查询总体与分项评价
	 */
	public List<Map> searchProductEvaluate(Map map) {
		StringBuffer sql = new StringBuffer();
		sql
				.append(" SELECT t.series,t.seriesid,t.topic_score,t.dimensionid FROM product_evaluate t where 1=1  ");
		if (map.containsKey("seriesid")) {
			sql.append(" and seriesid in (").append(map.get("seriesid"))
					.append(")");
		}
		sql.append(" GROUP BY t.seriesid,t.dimensionid");
		sql.append(" ORDER BY t.seriesid,t.dimensionid");
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	/**
	 * 
	 public List<Map> searchProduct(Map map){
	 * 
	 * 
	 * StringBuffer sql = new StringBuffer(); sql.append("select  m1.id as uid,m1.data_time,m1.datecreated,m1.ext_fuel,m1.ext_nake_price,DATE_FORMAT(m1.ext_purchase_date, '%Y-%m') AS purchase_date,m1.ext_purchase_place,m1.ext_purpose,m1.ext_vehicle_type,m1.md5_id AS ZHid,m1.mouth_support_count,m1.reply_count,m1.series,m1.seriesid,m1.user_name,m1.view_count FROM mouth_content m1 WHERE 1=1 "
	 * ); //sql.append(" LEFT JOIN mouth_content_text m2");
	 * ,m2.id,m2.md5_id,m2.dimensionid,m2.dimension,m2.mouth_content
	 * //sql.append(" ON m1.md5_id=m2.md5_id "); //sql.append(""); if
	 * (map.containsKey("seriesid")) {
	 * sql.append("  and  seriesid in (").append(
	 * map.get("seriesid")).append(")"); } sql.append(" GROUP BY m1.md5_id");
	 * 
	 * //sql.append(" desc limit 1,3"); //
	 * 
	 * //// query.setFirstResult(3);//从第一条记录开始 ////
	 * query.setMaxResults(3);//取出四条记录
	 * 
	 * Query query = sessionFactory.getCurrentSession().createSQLQuery(
	 * sql.toString());
	 * 
	 * // sql.append(" ORDER BY m1.user_name"); // return
	 * super.searchObjectBySQL(sql.toString(), null, null); return
	 * query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP) .list();
	 * 
	 * }
	 */

	/**
	 * 查询评价总数
	 */
	public int searchPInfoByCount(Map map) {
		int result = 0;
//		StringBuffer sql = new StringBuffer(
//				"SELECT COUNT(a.zs) FROM (   SELECT      DISTINCT  m2.md5_id AS zs FROM mouth_content m1 "
//						+ "LEFT JOIN   mouth_content_text m2  ON   m1.md5_id=m2.md5_id where 1=1 ");
//
//		if (map.containsKey("seriesid")) {
//			sql.append("  and  seriesid in (").append(map.get("seriesid"))
//					.append(")");
//		}
//		//	
//		if (map.containsKey("ucid")) {
//
//			sql.append("  and  dimensionid in (").append(map.get("ucid"))
//					.append(")");
//		}
//		if (map.containsKey("content")) {
//
//			sql.append("  and  mouth_content like (" + "'" + '%').append(
//					map.get("content")).append('%' + "'" + ")");
//		}
//		sql.append(")a");
//		Object obj = sessionFactory.getCurrentSession().createSQLQuery(
//				sql.toString()).uniqueResult();
//		if (null != obj) {
//			result = Integer.parseInt(StringUtil.safeToString(obj, "0"));
//		}
		
		StringBuffer sql = new StringBuffer();
		sql.append("select COUNT(*) from topic_desc as td where 1=1");
		if (map.containsKey("seriesid") && !"".equals(map.get("seriesid"))) {
			sql.append(" and td.seriesid in (").append(map.get("seriesid"))
					.append(")");
		}
		if (map.containsKey("topic") && !"".equals(map.get("topic"))) {
			sql.append(" and td.topic in ('").append(map.get("topic")).append(
					"')");
		}
		if (map.containsKey("issatisfied")
				&& !"".equals(map.get("issatisfied"))) {
			sql.append(" and td.issatisfied in (").append(
					map.get("issatisfied")).append(")");
			if (map.get("issatisfied").equals("1")) {// 判断满意程度，显示数据按照各自满意度排序(1:最满意，0：最不满意)
				sql.append(" order by td.topic_desc_emotion_score desc");
			} else {
				sql.append(" order by td.topic_desc_emotion_score");
			}
		}
		Object obj = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString()).uniqueResult();
		if (null != obj) {
			result = Integer.parseInt(StringUtil.safeToString(obj, "0"));
		}
		return result;
	}

	//模糊查询
	public List<Map> searchProductpl(Map map) {

		StringBuffer sql = new StringBuffer();
		sql.append("select * from  mouth_content_text where 1=1");
		if (map.containsKey("content")) {

			sql.append("  and  dimension in (").append(map.get("content"))
					.append(")");
			sql.append("  and  mouth_content like (" + "'" + '%').append(
					map.get("content")).append('%' + "'" + ")");
		}
		return super.searchObjectBySQL(sql.toString(), null, null);

	}

	/**
	 * 带分页的查询
	 * 
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map> searchCarPriceInfoByFy(Map map) {
		StringBuffer sql = new StringBuffer();
		sql
				.append("select  m1.id as uid,m1.data_time,m1.datecreated,m1.ext_fuel,m1.ext_nake_price,DATE_FORMAT(m1.ext_purchase_date, '%Y-%m') AS purchase_date,m1.ext_purchase_place,m1.ext_purpose,m1.ext_vehicle_type,m1.md5_id AS ZHid,m1.mouth_support_count,m1.reply_count,m1.series,m1.seriesid,m1.user_name,m1.view_count FROM mouth_content m1 WHERE 1=1 ");
		if (map.containsKey("seriesid")) {
			sql.append("  and  seriesid in (").append(map.get("seriesid"))
					.append(")");
		}
		sql.append(" GROUP BY m1.md5_id desc ");

		// sql.append("   order by   ");
		Query query = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString());
		if (map.containsKey("firstrs")) {
			query.setFirstResult(Integer.parseInt(StringUtil.safeToString(map
					.get("firstrs"), "0")));

		} else {
			query.setFirstResult(0);
		}
		if (map.containsKey("maxrs")) {
			query.setMaxResults(Integer.parseInt(StringUtil.safeToString(map
					.get("maxrs"), "5")));
		} else {
			query.setMaxResults(5);
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
				.list();
	}

	/**
	 * 分页查询MD5集合
	 */
	public List<Map> searchMd5List(Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from topic_desc as td where 1=1");
		if (map.containsKey("seriesid") && !"".equals(map.get("seriesid"))) {
			sql.append(" and td.seriesid in (").append(map.get("seriesid"))
					.append(")");
		}
		if (map.containsKey("topic") && !"".equals(map.get("topic"))) {
			sql.append(" and td.topic in ('").append(map.get("topic")).append(
					"')");
		}
		if (map.containsKey("issatisfied")
				&& !"".equals(map.get("issatisfied"))) {
			sql.append(" and td.issatisfied in (").append(
					map.get("issatisfied")).append(")");
			if (map.get("issatisfied").equals("1")) {// 判断满意程度，显示数据按照各自满意度排序(1:最满意，0：最不满意)
				sql.append(" order by td.topic_desc_emotion_score desc");
			} else {
				sql.append(" order by td.topic_desc_emotion_score");
			}
		}
		Query query = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString());
		if (map.containsKey("firstrs")) {
			query.setFirstResult(Integer.parseInt(StringUtil.safeToString(map
					.get("firstrs"), "0")));

		} else {
			query.setFirstResult(0);
		}
		if (map.containsKey("maxrs")) {
			query.setMaxResults(Integer.parseInt(StringUtil.safeToString(map
					.get("maxrs"), "5")));
		} else {
			query.setMaxResults(5);
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
				.list();
	}

	public List<Map> searchMc(String md5) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from mouth_content where 1=1 and md5_id in ('"
				+ md5 + "')");// 查询包含MD5ID的信息
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	public List<Map> searchMct(String md5, String topic) {
		StringBuffer sql = new StringBuffer();
		sql
				.append("select * from mouth_content_text where 1=1 and md5_id in ('"
						+ md5 + "')");// 查询包含MD5ID的信息

		if (!"".equals(topic)) {
			sql.append(" and dimension = '" + topic + "'");
		}
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	public List<Map> searchContent(String md5, String content) {
		StringBuffer sql = new StringBuffer();
		sql
				.append("select * from mouth_content_text where 1=1 and md5_id in ('"
						+ md5 + "')");// 查询包含MD5ID的信息

		if (!"".equals(content)) {
			sql.append(" and mouth_content like '%" + content + "%'");
		}
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	public List<Map> searchString(String topic) {
		StringBuffer sql = new StringBuffer();
		sql.append("select topic_synset from topic_synset where 1=1");
		if(!"".equals(topic)){
			sql.append(" and topic_key ='"+topic+"'");
		}
		return super.searchObjectBySQL(sql.toString(), null, null);
	}

	public List<Map> searchCon(String md5, String id,Map map) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from mouth_content where 1=1 and md5_id in ('"
				+ md5 + "')");// 查询包含MD5ID的信息
		sql.append(" and seriesid = '"+id+"'");
		Query query = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString());
		if (map.containsKey("firstrs")) {
			query.setFirstResult(Integer.parseInt(StringUtil.safeToString(map
					.get("firstrs"), "0")));

		} else {
			query.setFirstResult(0);
		}
		if (map.containsKey("maxrs")) {
			query.setMaxResults(Integer.parseInt(StringUtil.safeToString(map
					.get("maxrs"), "5")));
		} else {
			query.setMaxResults(5);
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
				.list();
	}

	public int count(String md5, String id) {
		int result=0;
		StringBuffer sql = new StringBuffer();
		sql.append("select * from topic_desc  where 1=1 and content_md5_id in ('"
				+ md5 + "')");// 查询包含MD5ID的信息
		sql.append(" and seriesid = '"+id+"'");
		Object obj = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString()).uniqueResult();
		if (null != obj) {
			result = Integer.parseInt(StringUtil.safeToString(obj, "0"));
		}
		return result;
	}
}
