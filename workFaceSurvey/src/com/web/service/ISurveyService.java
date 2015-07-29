package com.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.web.common.service.CommonService;
import com.web.entity.Anwser;
import com.web.entity.User;

@Transactional
public interface ISurveyService extends CommonService {
	
	/**
	 * 保存用户信息
	 * @param map
	 * @return
	 */
	public void saveUser(User user);
	
	
	/**
	 * 保存答卷信息
	 * @param map
	 * @return
	 */
	public void saveAnwser(Anwser anwser);
	
	/**
	 * 登陆查询
	 * @param map
	 * @return
	 */
	public User checkLogin(String phone,String password);
	

	/**
	 * 通过手机号获取用户实体查询
	 * @param map
	 * @return
	 */
	public User getUserByPhone(String phone);
	
	/**
	 * 通过手机号获取实体查询
	 * @param map
	 * @return
	 */
	public Anwser getAnwserByPhone(String phone);
	
	/**
	 * 通过offset、limit查询用户信息，进行翻页
	 * @param offset
	 * @param limit
	 * @return
	 */
	public List<Map> searchUserList(String offset,String limit,String name);

}
