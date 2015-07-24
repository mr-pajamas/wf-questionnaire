package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.web.entity.Employee;
/**
 * 
 * @author 杨树楷
 *
 */
@Transactional
public interface IEmployeeService{
	
	/**
	 * 登陆查询
	 * @param map
	 * @return
	 */
	public  Employee searchlogin(Map map);
	
	/**
	 * 验证用户名是否重复
	 */
	public boolean check_username(Map map);
	
	/**
	 * 保存用户信息
	 * @param map
	 * @return
	 */
	public  void save_empinfo(Employee employee);
	
	public Employee getEmployee(int id);
}