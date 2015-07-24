package com.web.common.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.web.common.dao.BaseDAOSpring;
import com.web.common.service.CommonService;

@Service
public class CommonServiceSpringImpl implements CommonService {

	@Autowired
	BaseDAOSpring baseDAOSpring;

	private static final Log log = LogFactory
			.getLog(CommonServiceSpringImpl.class);

	public Object saveObject(Object obj) {
		Object object = null;
		try {
			object = baseDAOSpring.saveObject(obj);
		} catch (DataAccessException dex) {
			dex.printStackTrace();
			log.error("", dex);
		} catch (Exception ex) {
			log.error("", ex);
		} finally {

		}

		return object;
	}

	public Object getObject(Class<?> entityClass, Serializable Objectid) {
		Object object = null;
		try {
			object = baseDAOSpring.getObject(entityClass, Objectid);
		} catch (DataAccessException dex) {
			log.error("", dex);
		} catch (Exception ex) {
			log.error("", ex);
		} finally {

		}
		return object;
	}

	/**
	 * 删除对象
	 * 
	 * @param obj
	 */
	public void removeObject(Object obj) {
		try {
			baseDAOSpring.removeObject(obj);
		} catch (DataAccessException dex) {
			log.error("", dex);
		} catch (Exception ex) {
			log.error("", ex);
		} finally {

		}
	}

	/**
	 * 根据主键ID删除对象
	 * 
	 * @param entityClass
	 * @param id
	 */
	public void removeObjectByPrimaryKey(Class<?> entityClass, Serializable id) {
		try {
			baseDAOSpring.removeObjectByPrimaryKey(entityClass, id);
		} catch (Exception ex) {
			log.error("", ex);
		}
	}

	/**
	 * SQL查询
	 * 
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List<Map> searchObjectBySQL(String sql, String firstResult,
			String maxResults) {
		List<Map> resultList = new ArrayList<Map>();
		try {
			resultList = baseDAOSpring.searchObjectBySQL(sql, firstResult,
					maxResults);
		} catch (Exception ex) {
			log.error(sql);
			log.error("", ex);
		}
		return resultList;
	}
	
	/**
	 * SQL查询
	 * 
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List<Map> searchObjectBySQL(String sql,Map searchParmValue, String firstResult,
			String maxResults) {
		List<Map> resultList = new ArrayList<Map>();
		try {
			resultList = baseDAOSpring.searchObjectBySQL(sql,searchParmValue, firstResult,
					maxResults);
		} catch (Exception ex) {
			log.error("", ex);
		}
		return resultList;
	}
	
	/**
	 * HQL查询
	 * @param sql
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	public List searchObjectByHQL(String hql,Map searchParmValue,String firstResult,String maxResults){
		List<Map> resultList = new ArrayList<Map>();
		try {
			resultList = baseDAOSpring.searchObjectByHQL(hql,searchParmValue, firstResult,
					maxResults);
		} catch (Exception ex) {
			log.error("", ex);
		}
		return resultList;
	}
	
	/**
	 * 根据sql获取统计结果
	 * @param sql
	 * @param searchParmValue
	 * @return
	 */
	public int searchObjectUnique(String sql,Map searchParmValue){
		int result = 0;
		try {
			result = baseDAOSpring.searchObjectUnique(sql,searchParmValue);
		} catch (Exception ex) {
			log.error("", ex);
		}
		return result;
	}
	
}
