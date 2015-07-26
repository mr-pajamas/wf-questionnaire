package com.web.controller.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.common.utils.NumberUtils;
import com.web.common.utils.StringUtil;
import com.web.common.utils.TimeUtil;
import com.web.entity.Anwser;
import com.web.entity.User;
import com.web.service.IHotNewsService;
import com.web.service.ISurveyService;
import com.web.service.ISynthesizeService;

/**
 * 汇总页面
 * 
 * @author 高扬
 * 
 */
@Controller
@RequestMapping("/synthesize")
public class SynthesizeController {

	private static final Log log = LogFactory
			.getLog(SynthesizeController.class);

	private static final String[] RANKNAME = { "0", "7", "3", "1", "2", "13",
			"9", "5", "4" };

	@Autowired
	public ISynthesizeService synthesizeService;
	@Autowired
	public IHotNewsService hotNewsService;
	@Autowired
	ISurveyService surveyServey;

	@RequestMapping(value = "/index")
	public String synthesize(HttpServletRequest request,
			HttpServletResponse response) {
		Map map=new HashMap();
		String page = StringUtil.safeToString(request.getParameter("page"), "1");
        int totalRows = synthesizeService.getTotalRows(map);
        int intPage = Integer.valueOf(page);
        int pageSize = 5;
        int totalPage = 0;
        if(totalRows%pageSize == 0){
        	totalPage = totalRows/pageSize;
        }else{
        	totalPage = totalRows/pageSize + 1;
        }
        int start = pageSize*(intPage - 1);
        map.put("firstrs", String.valueOf(start));
		List<Map> list=synthesizeService.searchUser(map);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalRows",totalRows);
		request.setAttribute("listPage", intPage);
		
		return "/jsp/website/synthesize";
	}

	@RequestMapping(value = "/questionnaire1")
	public String questionnaire1(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		return "/jsp/website/wenjuan1";
	}
	
	@RequestMapping(value = "/questionnaire2")
	public String questionnaire2(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		return "/jsp/website/wenjuan2";
	}
	
	@RequestMapping(value = "/SaveQ1",method=RequestMethod.POST)
	public String SaveQ1(HttpServletRequest request,
			HttpServletResponse response) {
		String name=request.getParameter("entry[field_1]");
		String gender=request.getParameter("entry[field_19]");
		String phone=request.getParameter("entry[field_3]");
		String company=request.getParameter("entry[field_6]");
		String position=request.getParameter("entry[field_20]");
		if(position.equals("其他")){
			if(!"".equals(request.getParameter("entry[field_20_other]"))){
				position=request.getParameter("entry[field_20_other]");
			}
		}
		String age=request.getParameter("entry[field_25]");
		String degree=request.getParameter("entry[field_27]");
		String tag=request.getParameter("entry[field_12]");
		String wechat=request.getParameter("entry[field_17]");//微信：
		String referrer=request.getParameter("entry[field_16]");// 是谁推荐了您：
		
		
		String Q11=request.getParameter("entry[field_13]");//第几次创业
		String Q12=request.getParameter("entry[field_21]");// 目前创业项目运营多久了
		String Q8=request.getParameter("entry[field_23]");//第一笔启动资金的来源：
		if(Q8.equals("其他")){
			if(!"".equals(request.getParameter("entry[field_23_other]"))){
				Q8=request.getParameter("entry[field_23_other]");
			}
		}
		String Q1=request.getParameter("entry[field_24]");//行业分类
		String Q39=request.getParameter("entry[field_10]");//公司/创业项目/个人简介：
		String Q2=request.getParameter("entry[field_29]");//对WorkFace了解吗
		
		User user=surveyServey.getUserByPhone(phone);
		if(user==null){
			user =new User();
			user.setCreatedate(new Date());
		}
		user.setAge(age);
		user.setCompany(company);
		user.setDegree(degree);
		user.setGender(gender);
		user.setName(name);
		user.setPosition(position);
		user.setReferrer(referrer);
		user.setWecahrt(wechat);
		user.setTag(tag);
		user.setUpdatetime(new Date());
		
		Anwser anwser=surveyServey.getAnwserByPhone(phone);
		if(anwser==null){
			anwser =new Anwser();
			anwser.setCreatetime(new Date());
		}
		anwser.setQ1(Q1);
		anwser.setQ11(Q11);
		anwser.setQ12(Q12);
		anwser.setQ8(Q8);
		anwser.setQ39(Q39);
		anwser.setQ2(Q2);
		anwser.setUpdatetime(new Date());
		
		
		surveyServey.saveUser(user);
		surveyServey.saveAnwser(anwser);
		
		
		return "/jsp/website/wenjuan1";
	}
	
	@RequestMapping(value = "/SaveQ2",method=RequestMethod.POST)
	public String SaveQ2(HttpServletRequest request,
			HttpServletResponse response) {
		String phone=request.getParameter("phone");
		String Q28=request.getParameter("entry[field_17][province]");//您是哪里人(家乡在哪里)
		String Q26=request.getParameter("entry[field_6]");//为什么在上海创业，对上海创业环境的观察体验，热爱和吐槽是：
		String Q34=request.getParameter("entry[field_13]"); //目前创业项目简介，未来的期望是：
		String Q13=request.getParameter("entry[field_15]");// 目前项目是否已有产出
		String Q15=StringUtil.safeToString(request.getParameter("entry[field_16]"), "");//目前团队规模
		if(Q15.equals("其他")){
			if(!"".equals(request.getParameter("entry[field_16_other]"))){
				Q15=request.getParameter("entry[field_16_other]");
			}
		}
		String Q40="";
		String Q40s[]=request.getParameterValues("entry[field_21][]");//目前创业碰到的问题/困难并且希望解决的：（多选）
		for(String a:Q40s){
			if(Q40.length()>0){
				Q40+="|";
			}
			if("其他".equals(a)){
				Q40+=a+request.getParameter("entry[field_21_other]");
			}else{
				Q40+=a;	
			}
		}
		String Q41=request.getParameter("entry[field_1]");//   目前的创业是怎样产生的，发心是什么？
		String Q9=request.getParameter("entry[field_2]");// 曾经历的较大困难和挑战是，当时如何解决和面对的
		String Q19=request.getParameter("entry[field_4]");// 走上创业之路感受较深的人和事 ，TA对你的影响？
		String Q21=request.getParameter("entry[field_3]");//   个人成长环境；家人朋友对创业的态度，如何平衡家庭和工作关系？
		String Q24=request.getParameter("entry[field_12]");// 给5年后的自己写封信，最想写什么？
		String Q35=request.getParameter("entry[field_5]");//  目前创业需要什么帮助？对万人大联结有什么期待
		String Q36=request.getParameter("entry[field_7]");// 其他补充： 
		Anwser anwser=surveyServey.getAnwserByPhone(phone);
		if(anwser==null){
			anwser =new Anwser();
			anwser.setCreatetime(new Date());
		}
		anwser.setQ36(Q36);
		anwser.setQ35(Q35);
		anwser.setQ24(Q24);
		anwser.setQ21(Q21);
		anwser.setQ19(Q19);
		anwser.setQ9(Q9); 
		anwser.setQ41(Q41);
		anwser.setQ40(Q40);
		anwser.setQ15(Q15);
		anwser.setQ13(Q13);
		anwser.setQ34(Q34);
		anwser.setQ26(Q26);
		anwser.setQ28(Q28);
		surveyServey.saveAnwser(anwser);
		return "/jsp/website/wenjuan2";
	}
}
