package com.web.controller.employee;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.common.utils.StringUtil;
import com.web.entity.User;
import com.web.service.ISurveyService;
import com.web.service.ISynthesizeService;

@Controller
@RequestMapping("/survey")
public class surveyController {
	@Autowired
	ISurveyService surveyServey;
	
	@Autowired
	public ISynthesizeService synthesizeService;
	
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
//		        System.out.println(thisName+"-------"+thisValue);
		}
		return "";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String  login(HttpServletRequest request,HttpServletResponse response){
		String phone=request.getParameter("phoneNum");
		String password=request.getParameter("password");
		if(!"".equals(phone) && !"".equals(password) && phone!=null && password!=null){
			User user=surveyServey.checkLogin(phone,password);
			if(null!=user){
				request.getSession().setAttribute("username", user.getPhone());
				request.getSession().setAttribute("phone", user.getPhone());
				request.getSession().setAttribute("id", user.getId());
				request.getSession().setAttribute("role", user.getRole());

				if(user.getRole().equals("1")){
//					return "/jsp/website/choose";
					return "redirect:/survey/showmanage";

				}else{
//					return "/jsp/website/wenjuan1";
					//在Session中保存手机号码
					return "redirect:/synthesize/questionnaire1";
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
			if(null!=user){
				request.setAttribute("error", "该手机号已被注册，请重试");
				return "/jsp/website/regist";
			}else{
				user=new User();
				user.setPhone(phone);
				user.setPassword(password);
				user.setRole("2");
				surveyServey.saveUser(user);
				return "/jsp/website/login";
	
			}
		}else{
			request.setAttribute("error", "请确保密码、用户名输入正确");
			return "/jsp/website/regist";
		}
	}
	
	@RequestMapping("/showmanage")
	public String  showmangee(HttpServletRequest request,HttpServletResponse response){
		Map map = new HashMap();
		String page = StringUtil
				.safeToString(request.getParameter("page"), "1");
		int totalRows = synthesizeService.getTotalRows(map);
		int intPage = Integer.valueOf(page);
		int pageSize = 5;
		int totalPage = 0;
		if (totalRows % pageSize == 0) {
			totalPage = totalRows / pageSize;
		} else {
			totalPage = totalRows / pageSize + 1;
		}
		int start = pageSize * (intPage - 1);
		map.put("firstrs", String.valueOf(start));
		List<Map> list = synthesizeService.searchUser(map);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalRows", totalRows);
		request.setAttribute("listPage", intPage);

		return "/jsp/website/manage";
	}

}
