package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.common.utils.StringUtil;
import com.web.entity.Employee;
import com.web.entity.Search_record;
import com.web.service.IEmployeeService;
import com.web.service.IHomeAdminService;

@Service
public class HomeAdminServiceImp extends CommonServiceSpringImpl implements IHomeAdminService {
	
	/**
	 * 查询用户
	 */
	public List<Map>  searchemp(Map map) {
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT t.* ");
		sql.append(" from employee t WHERE 1=1 ");
		if (map.containsKey("username") && !"".equals(map.get("username"))) {
			sql.append(" and username ='").append(map.get("username")).append("'");
		}
		if (map.containsKey("state") && !"".equals(map.get("state"))) {
			sql.append(" and state ='").append(map.get("state")).append("'");
		}
		
		if(map.containsKey("department") && !"".equals(map.get("department"))){
			sql.append(" and department='").append(map.get("department")).append("'");
		}
		
		if(map.containsKey("name") && !"".equals(map.get("name"))){
			sql.append(" and name like '%").append(map.get("name")).append("%'");
		}
		String firstResult = StringUtil.safeToString(map.get("firstrs"), "0");
		String maxResults = StringUtil.safeToString(map.get("maxrs"), "10");
		return super.searchObjectBySQL(sql.toString(),firstResult,maxResults);
	}
	
	/**
	 * 查询记录数
	 * @param map
	 * @return
	 */
	public int countEmpInfo(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append("select COUNT(*) from employee where 1=1 ");
		return super.searchObjectUnique(sql.toString(), null);
	}
	
	public void saveSearchRecord(Search_record record){
		super.saveObject(record);
	}
	
	public Search_record  searchRecord(String userid,String vehicleid , String date) {
		StringBuffer sql=new StringBuffer();
		sql.append(" from Search_record t WHERE 1=1 ");
		sql.append("and userid=").append(userid).append(" and vehicleid=").append(vehicleid).append(" and date='").append(date).append("'");
		List<Search_record> records= super.searchObjectByHQL(sql.toString(), null, null, null);
		if(records.size()>0){
			return records.get(0);
		}else{
			return null;
		}
		 
	}
	
	public List<Map> searchRecord(Map map) {
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT t.*,a.cityname,b.vehicleimg FROM  search_record t ");
		sql.append(" LEFT JOIN city a ON t.cityid=a.cityid ");
		sql.append(" LEFT JOIN vehicle_family b ON t.familyid=b.id ");
		sql.append(" where 1=1 ");
		if (map.containsKey("id") && !"".equals(map.get("id"))) {
			sql.append(" and t.id =").append(map.get("id"));
		}
//		System.out.println(sql);
		String firstResult = StringUtil.safeToString(map.get("firstrs"), "0");
		String maxResults = StringUtil.safeToString(map.get("maxrs"), "10");
//		System.out.println(maxResults);
		return super.searchObjectBySQL(sql.toString(), firstResult, maxResults);
	}
	
}
