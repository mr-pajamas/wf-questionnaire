package com.web.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.web.common.utils.LigerUtils;
import com.web.common.utils.StringUtil;
import com.web.entity.Employee;
import com.web.service.IEmployeeService;
import com.web.service.IHomeAdminService;




@Controller
@RequestMapping("/admin/home")
public class HomeAdminController {
	private static final Log log = LogFactory.getLog(HomeAdminController.class);
	
	@Autowired
	IHomeAdminService adminService;
	
	@Autowired
	public IEmployeeService employeeService;
	
	@RequestMapping(value = "/index")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		log.info("进入后台主页----");
		return "/jsp/proprietor/index";

	}
	
	@RequestMapping(value = "/showemp")
	public String showemp(HttpServletRequest request, HttpServletResponse response) {
		
		return "/jsp/proprietor/listemployee";

	}
	
	@RequestMapping(value = "/welcome")
	public String welcome(HttpServletRequest request, HttpServletResponse response) {

		return "/jsp/proprietor/welcome";

	}
	
	@RequestMapping(value = "/searchemp", method = RequestMethod.POST)
	public void searchemp(HttpServletRequest request,
			HttpServletResponse response) {
		String name = StringUtil.safeToString(request.getParameter("name"), "");
		String username = StringUtil.safeToString(request
				.getParameter("username"), "");
		String department = StringUtil.safeToString(request
				.getParameter("department"), "");
		String state = StringUtil.safeToString(request.getParameter("state"),"");
		
		String page = StringUtil.safeToString(request.getParameter("page"), "");
		String pagesize = StringUtil.safeToString(request
				.getParameter("pagesize"), "");
		

		try {

			Map<String, String> p = new HashMap<String, String>();
			
			p.put("name", name);
			p.put("department", department);
			p.put("username", username);
			p.put("state", state);
			p.put("firstrs", String.valueOf(Integer.valueOf(page)
					* Integer.valueOf(pagesize) - Integer.valueOf(pagesize)));
			p.put("maxrs", pagesize);
			List<Map> emp = adminService.searchemp(p);
			PrintWriter out = response.getWriter();
			out.println(LigerUtils.getJsonMap(emp, adminService
					.countEmpInfo(p)));
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/updatestate", method = RequestMethod.POST)
	public void updatestate(HttpServletRequest request,
			HttpServletResponse response) {
		String json = StringUtil.safeToString(request.getParameter("json"), "");
		String type = StringUtil.safeToString(request.getParameter("state"), "");

		JSONArray jsonArray = JSONArray.fromObject(json);
		List<Map> list = (List) JSONArray.toCollection(jsonArray, Map.class);
		for (Map map : list) {
			String id = StringUtil.safeToString(map.get("id"), "");
			Employee employee = employeeService.getEmployee(Integer.parseInt(id));
			employee.setState(Integer.parseInt(type));
			employeeService.save_empinfo(employee);
		}
	}
	
	@RequestMapping(value = "/updateempinfo", method = RequestMethod.POST)
	public void updateempinfo(HttpServletRequest request,
			HttpServletResponse response) {
		String state = StringUtil.safeToString(request.getParameter("state"), "");
		String id = StringUtil.safeToString(request.getParameter("id"), "");
		String name =StringUtil.safeToString(request.getParameter("name"), "");
		String gender =StringUtil.safeToString(request.getParameter("gender"), "");
		String department =StringUtil.safeToString(request.getParameter("department"), "");
		String position =StringUtil.safeToString(request.getParameter("position"), "");
		String jobnum =StringUtil.safeToString(request.getParameter("position"), "");
		String phonenum =StringUtil.safeToString(request.getParameter("phonenum"), "");
		Employee employee = employeeService.getEmployee(Integer.parseInt(id));
		
		employee.setState(Integer.parseInt(state));
		employee.setName(name);
		employee.setGender(gender);
		employee.setDepartment(department);
		employee.setPosition(position);
		employee.setJobnum(jobnum);
		employee.setPhonenum(phonenum);
		
		employeeService.save_empinfo(employee);
		try {
			PrintWriter out = response.getWriter();
			out.println("ok");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/resetpwd", method = RequestMethod.POST)
	public void resetpwd(HttpServletRequest request,
			HttpServletResponse response) {
		String id = StringUtil.safeToString(request.getParameter("id"), "");
		String pwd="111111";
		Employee employee = employeeService.getEmployee(Integer.parseInt(id));
		employee.setPwd(pwd);
		employeeService.save_empinfo(employee);
		try {
			PrintWriter out = response.getWriter();
			out.println("ok");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping (value="assessment")
	public String enterAssessment(){
		return "/jsp/website/assessment";
	}
}
