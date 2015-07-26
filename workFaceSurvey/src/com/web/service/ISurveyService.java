package com.web.service;

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

}
