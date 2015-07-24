package com.web.service.impl;

import org.springframework.stereotype.Service;

import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.entity.Anwser;
import com.web.entity.User;
import com.web.service.IAttentionService;
import com.web.service.ISurveyService;

@Service
public class SurveyServiceImp extends CommonServiceSpringImpl implements ISurveyService {
	
	/**
	 * 保存用户信息
	 * @param map
	 * @return
	 */
	public void saveUser(User user){
		// TODO Auto-generated method stub
		super.saveObject(user);
	}

	public void saveAnwser(Anwser anwser) {
		// TODO Auto-generated method stub
		super.saveObject(anwser);
		
	}

}
