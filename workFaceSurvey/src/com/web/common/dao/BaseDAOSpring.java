package com.web.common.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.log4j.Logger;
import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.web.common.utils.StringUtil;


/**
 * 
 * @author 高扬
 * 
 */
@Repository
public class BaseDAOSpring {
	Logger logger = Logger.getLogger(BaseDAOSpring.class);

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * 保存对象
	 * 
	 * @param obj
	 * @return
	 */
	public Object saveObject(Object obj) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(obj);
		session.getTransaction().commit();
		session.close();
		return obj;
	}

	/**
	 * 获取对象
	 * @param entityClass
	 * @param Objectid
	 * @return
	 */
	public Object getObject(Class<?> entityClass, Serializable Objectid) {
		return sessionFactory.getCurrentSession().get(entityClass, Objectid);
	}
	
	
	/**
	 * 删除对象
	 * @param obj
	 */
	public void removeObject(Object obj) {
		sessionFactory.getCurrentSession().delete(obj);
	}
	
	/**
	 * 根据主键ID删除对象
	 * @param entityClass
	 * @param id
	 */
	public void removeObjectByPrimaryKey(Class<?> entityClass, Serializable id) {
		Object obj = getObject(entityClass, id);
		if( null != obj )
			removeObject(obj);
	}



	/**
	 * SQL查询
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List<Map> searchObjectBySQL(String sql,String firstResult,String maxResults){
		Query query = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString());
		if (null!=firstResult && !"".equals(firstResult)) {
			query.setFirstResult(Integer.parseInt(firstResult));
		}
		if (null!=maxResults && !"".equals(maxResults)) {
			query.setMaxResults(Integer.parseInt(maxResults));
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
				.list();
	}
	
	/**
	 * SQL查询
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @param searchParmValue
	 * @return
	 */
	public List<Map> searchObjectBySQL(String sql,Map searchParmValue,String firstResult,String maxResults){
		Query query = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString());
		if (null!=firstResult && !"".equals(firstResult)) {
			query.setFirstResult(Integer.parseInt(firstResult));
		}
		if (null!=maxResults && !"".equals(maxResults)) {
			query.setMaxResults(Integer.parseInt(maxResults));
		}
		String paramName;
		if (null != searchParmValue) {
			Set paramSet1 = searchParmValue.keySet();
			Iterator paramIter1 = paramSet1.iterator();
			while (paramIter1.hasNext()) {
				paramName = (String) paramIter1.next();
				query.setParameter(paramName, searchParmValue
						.get(paramName));
			}
		}
		return query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
				.list();
	}
	
	

	/**
	 * HQL查询
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List searchObjectByHQL(String hql,Map searchParmValue,String firstResult,String maxResults){
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		if (null!=firstResult && !"".equals(firstResult)){
			query.setFirstResult(Integer.parseInt(firstResult));
		}
		if (null!=maxResults && !"".equals(maxResults)){
			query.setMaxResults(Integer.parseInt(maxResults));
		}
		String paramName;
		if (null != searchParmValue) {
			Set paramSet1 = searchParmValue.keySet();
			Iterator paramIter1 = paramSet1.iterator();
			while (paramIter1.hasNext()) {
				paramName = (String) paramIter1.next();
				query.setParameter(paramName, searchParmValue
						.get(paramName));
			}
		}
		return query.list();
	}

	/**
	 * 根据sql获取统计结果
	 * @param sql
	 * @param searchParmValue
	 * @return
	 */
	public int searchObjectUnique(String sql,Map searchParmValue){
		Query query = sessionFactory.getCurrentSession().createSQLQuery(
				sql);
		String paramName;
		if (null != searchParmValue) {
			Set paramSet1 = searchParmValue.keySet();
			Iterator paramIter1 = paramSet1.iterator();
			while (paramIter1.hasNext()) {
				paramName = (String) paramIter1.next();
				query.setParameter(paramName, searchParmValue
						.get(paramName));
			}
		}
		int result = 0;
		Object obj = query.uniqueResult();
		if (null != obj) {
			result = Integer.parseInt(StringUtil.safeToString(obj, "0"));
		}
		return result;
	}
    public Query getQuery(String sql){
    	Query query = sessionFactory.getCurrentSession().createSQLQuery(
				sql.toString());
    	return query;
    }
}
