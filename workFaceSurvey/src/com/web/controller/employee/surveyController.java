package com.web.controller.employee;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.entity.User;
import com.web.service.ISurveyService;

@Controller
@RequestMapping("/survey")
public class surveyController {
	@Autowired
	ISurveyService surveyServey;
	
	@RequestMapping(value="/baseInfo",method=RequestMethod.POST)
	public String  baseInfo(HttpServletRequest request,HttpServletResponse response){
		return "/jsp/website/survey";
	}
	
	@RequestMapping(value="/savebaseInfo",method=RequestMethod.POST)
	public String  savebaseInfo(HttpServletRequest request,HttpServletResponse response){
		String phone=request.getParameter("");
		Enumeration rnames=request.getParameterNames();
		for (Enumeration e = rnames ; e.hasMoreElements() ;) {
		         String thisName=e.nextElement().toString();
		        String thisValue=request.getParameter(thisName);
		        System.out.println(thisName+"-------"+thisValue);
		}
		return "";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String  login(HttpServletRequest request,HttpServletResponse response){
		String phone=request.getParameter("phoneNum");
		String password=request.getParameter("password");
		if(!"".equals(phone) && !"".equals(password) && phone!=null && password!=null){
			User user=surveyServey.checkLogin(phone,password);
			if(user!=null){
				request.getSession().setAttribute("username", user.getPhone());
				request.getSession().setAttribute("phone", user.getPhone());
				request.getSession().setAttribute("id", user.getId());
				if(user.getRole().equals("1")){
					return "/jsp/website/choose";
				}else{
					return "/jsp/website/wenjuan1";
				}
				
			}else{
				request.setAttribute("error", "用户名或密码错误，请重新输入");
				return "/jsp/website/login";
			}
			
		}else{
			return "/jsp/website/login";
		}
	}
	
	@RequestMapping("/choose")
	public String  choose(HttpServletRequest request,HttpServletResponse response){
		return "/jsp/website/choose";
	}
	
	@RequestMapping("/regist")
	public String  regist(HttpServletRequest request,HttpServletResponse response){
		return "/jsp/website/regist";
	}
	
	@RequestMapping(value="/saveregist",method=RequestMethod.POST)
	public String  saveregist(HttpServletRequest request,HttpServletResponse response){
		String phone=request.getParameter("PhoneNum");
		String password=request.getParameter("password");
		String passwordRpe=request.getParameter("passwordRpe");
		if(!"".equals(phone) && !"".equals(password) && password.equals(passwordRpe) ){
			User user=surveyServey.getUserByPhone(phone);
			if(user==null){
				user.setPhone(phone);
				user.setPassword(password);
				surveyServey.saveUser(user);
				return "/jsp/website/login";
			}else{
				request.setAttribute("error", "该手机号已被注册，请重试");
				return "/jsp/website/regist";
			}
		}else{
			request.setAttribute("error", "请确保密码、用户名输入正确");
			return "/jsp/website/regist";
		}
	}
	
	@RequestMapping("/showmanage")
	public String  showmangee(HttpServletRequest request,HttpServletResponse response){
		return "/jsp/website/manage";
	}

}
