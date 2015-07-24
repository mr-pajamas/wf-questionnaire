package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.common.utils.StringUtil;
import com.web.entity.Employee;
import com.web.service.IEmployeeService;

@Service
public class EmployeeServiceImp extends CommonServiceSpringImpl implements IEmployeeService {
	
	/**
	 * 登陆查询
	 */
	public Employee searchlogin(Map map) {
		Employee employee=null;
		String username=StringUtil.safeToString(map.get("username"),"");
		StringBuffer sql = new StringBuffer();
		Map p=new HashMap();
		sql.append("FROM Employee t WHERE 1=1");
		if(map.containsKey("username")){
				sql.append(" and (username=:username");
				sql.append("  or jobnum=:username)");
			p.put("username", map.get("username"));
		}
		if(map.containsKey("pwd")){
			sql.append(" and pwd =:pwd");
			p.put("pwd", map.get("pwd"));
		}
		List<Employee> list=searchObjectByHQL(sql.toString(), p, null, null);
		if(list.size()>0){
			employee=list.get(0);
		}
		return employee;
	}
	
	/**
	 * 验证用户名是否重复
	 */
	public boolean check_username(Map map) {
		Employee employee=null;
		String username=StringUtil.safeToString(map.get("username"),"");
		StringBuffer sql = new StringBuffer();
		Map p=new HashMap();
		sql.append("FROM Employee t WHERE 1=1");
		if(map.containsKey("username")){
				sql.append(" and (username=:username");
				sql.append("  or jobnum=:username)");
			p.put("username", map.get("username"));
		}
		List<Employee> list=searchObjectByHQL(sql.toString(), p, null, null);
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 保存用户信息
	 * @param map
	 * @return
	 */
	public  void save_empinfo(Employee employee){
		super.saveObject(employee);
	}
	
	public Employee getEmployee(int id){
		return (Employee) super.getObject(Employee.class, id);
	}

}
