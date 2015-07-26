package com.web.service.impl;

import java.util.List;

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
	
	public User checkLogin(String phone,String password){
		StringBuffer sql=new StringBuffer();
		sql.append("FROM User where 1=1");
		if(!"".equals(phone) && !"".equals(password) && phone!=null && password!=null){
			sql.append(" and phone='").append(phone).append("' and password='").append(password).append("'");
		}
		System.out.println(sql);
		List<User> list=super.searchObjectByHQL(sql.toString(), null, null, null);
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
		
	}
	
	public User getUserByPhone(String phone){
		StringBuffer sql=new StringBuffer();
		sql.append("FROM User where 1=1");
		if(!"".equals(phone) && phone!=null ){
			sql.append(" and phone='").append(phone).append("'");
		}
		List<User> list=super.searchObjectByHQL(sql.toString(), null, null, null);
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
		
	}
	
	public Anwser getAnwserByPhone(String phone){
		StringBuffer sql=new StringBuffer();
		sql.append("FROM Anwser where 1=1");
		if(!"".equals(phone) && phone!=null ){
			sql.append(" and phone='").append(phone).append("'");
		}
		List<Anwser> list=super.searchObjectByHQL(sql.toString(), null, null, null);
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
		
	}

}
