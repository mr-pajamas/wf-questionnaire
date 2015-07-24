package com.web.controller.employee;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
