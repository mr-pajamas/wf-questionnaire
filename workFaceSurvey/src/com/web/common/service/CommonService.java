package com.web.common.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author 高扬
 * 
 */
@Transactional
public interface CommonService {

	/**
	 * 保存对象
	 * 
	 * @param obj
	 * @return
	 */
	public Object saveObject(Object obj);

	/**
	 * 获取对象
	 * 
	 * @param entityClass
	 * @param Objectid
	 * @return
	 */
	public Object getObject(Class<?> entityClass, Serializable Objectid);

	/**
	 * 删除对象
	 * 
	 * @param obj
	 */
	public void removeObject(Object obj);

	/**
	 * 根据主键ID删除对象
	 * 
	 * @param entityClass
	 * @param id
	 */
	public void removeObjectByPrimaryKey(Class<?> entityClass, Serializable id);

	/**
	 * SQL查询
	 * 
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List<Map> searchObjectBySQL(String sql, String firstResult,
			String maxResults);

	/**
	 * SQL查询
	 * 
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List<Map> searchObjectBySQL(String sql, Map searchParmValue,
			String firstResult, String maxResults);

	/**
	 * HQL查询
	 * 
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List searchObjectByHQL(String hql, Map searchParmValue,
			String firstResult, String maxResults);

	/**
	 * 根据sql获取统计结果
	 * 
	 * @param sql
	 * @param searchParmValue
	 * @return
	 */
	public int searchObjectUnique(String sql, Map searchParmValue);
}
