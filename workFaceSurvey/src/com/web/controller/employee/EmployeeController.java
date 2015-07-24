package com.web.controller.employee;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.common.utils.BeanUtils;
import com.web.common.utils.GeetestLib;
import com.web.common.utils.SettingUtil;
import com.web.common.utils.StringUtil;
import com.web.entity.Employee;
import com.web.service.IEmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	private static final Log log = LogFactory.getLog(EmployeeController.class);

	@Autowired
	public IEmployeeService employeeService;

	@RequestMapping(value = "/returnnew")
	public String returnnew(HttpServletRequest request,
			HttpServletResponse response) {
		return "/html/source";
	}

	/**
	 * 登陆
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
	
		return "redirect:/usercar/index";

	}

	/**
	 * 验证用户名
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/checkusername")
	public void checkusername(HttpServletRequest request,
			HttpServletResponse response) {
		String username = StringUtil.safeToString(request
				.getParameter("username"), "");
		Map map = new HashMap<String, String>();
		map.put("username", username);
		log.info("验证用户名-------------------");
		String result = "0";// 1=true 0=false
		boolean isexits = employeeService.check_username(map);
		if (isexits) {
			result = "1";
		}
		try {
			PrintWriter out = response.getWriter();
			out.println(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 显示注册页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/show_register")
	public String showregister(HttpServletRequest request,
			HttpServletResponse response) {

		return "/jsp/website/getAccount";
	}

	/**
	 * 注册页面
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/register")
	public void register(HttpServletRequest request,
			HttpServletResponse response) {
		String username = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String position = request.getParameter("position");
		String department = request.getParameter("department");
		String jobnum = request.getParameter("employeeNum");
		String tip = "您已成功注册，通过审核后即可登录。审核流程不超过一个工作日，届时系统会发送通知至您的注册邮箱。";
		String privateKey = "037a485bcbab695f365a6821cc30339a";
		GeetestLib geetest = new GeetestLib(privateKey);
		boolean gtResult = false;
		if (geetest.resquestIsLegal(request)) {
			gtResult = geetest.validateRequest(request);
		} else {// TODO use you own system
			gtResult = false;
		}

		if (gtResult) {
			Employee employee = new Employee();
			employee.setUsername(username);
			employee.setPwd(pwd);
			employee.setName(name);
			employee.setPosition(position);
			employee.setDepartment(department);
			employee.setJobnum(jobnum);
			employee.setEmail(username);
			employeeService.save_empinfo(employee);
		} else {
			tip = "请先通过验证";
		}
		try {
			JSONObject map = new JSONObject();
			map.put("result", gtResult);
			map.put("msg", tip);

			PrintWriter out = response.getWriter();
			out.println(map);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 显示修改密码页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/show_changepwd")
	public String showupdatePWD(HttpServletRequest request,
			HttpServletResponse response) {

		String username = StringUtil.safeToString(request.getSession()
				.getAttribute("username"), "");
		request.setAttribute("username", username);

		return "/jsp/website/modify_pwd";
	}

	/**
	 * 修改密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/changepwd")
	public String change_pwd(HttpServletRequest request,
			HttpServletResponse response) {
		String id = StringUtil.safeToString(request.getSession().getAttribute(
				"id"), "");
		String pwd1 = request.getParameter("password1");
		String pwd2 = request.getParameter("password2");
		String error = "修改成功";
		if (pwd1.equals(pwd2)) {
			Employee employee = employeeService.getEmployee(Integer
					.parseInt(id));
			if (null != employee) {
				employee.setPwd(pwd1);
				employeeService.save_empinfo(employee);
				try {
					PrintWriter out = response.getWriter();
					out.println(error);
					out.flush();
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				error = "用户不存在";
			}

		} else {
			error = "两次密码输入不一致，请重新输入";
		}
		request.setAttribute("error", error);
		return "/jsp/website/modify_pwd";
	}

	@RequestMapping(value = "/showmysetting")
	public String showmysetting(HttpServletRequest request,
			HttpServletResponse response) {
		String id = StringUtil.safeToString(request.getSession().getAttribute(
				"id"), "");
		Employee emp = employeeService.getEmployee(Integer.parseInt(id));

		return "/jsp/website/Mysetting";
	}

	@RequestMapping(value = "/show_modify_empinfo")
	public String show_modify_empinfo(HttpServletRequest request,
			HttpServletResponse response) {

		return "/jsp/website/modify_empinfo";
	}

	/**
	 * 更新employee基本信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/modify_empinfo")
	public String modify_emp_baseinfo(HttpServletRequest request,
			HttpServletResponse response) {
		String id = StringUtil.safeToString(request.getSession().getAttribute(
				"id"), "");

		String name = StringUtil.safeToString(request.getParameter("name"), "");
		String gender = StringUtil.safeToString(request.getParameter("gender"),
				"");
		String jobnum = StringUtil.safeToString(request.getParameter("jobnum"),
				"");
		String position = StringUtil.safeToString(request
				.getParameter("position"), "");
		String department = StringUtil.safeToString(request
				.getParameter("department"), "");
		String phoneNum = StringUtil.safeToString(request
				.getParameter("phonenum"), "");
		String email = StringUtil.safeToString(request.getParameter("email"),
				"");

		Employee employee = employeeService.getEmployee(Integer.parseInt(id));
		if (null != employee) {
			// shsgmNew.setPosition(position);
			employee.setName(name);
			employee.setPosition(position);
			employee.setGender(gender);
			employee.setJobnum(jobnum);
			employee.setDepartment(department);
			employee.setPhonenum(phoneNum);
			employee.setEmail(email);
			employeeService.save_empinfo(employee);

			try {
				PrintWriter out = response.getWriter();
				out.println("保存成功");
				out.flush();
				out.close();
				employee = employeeService.getEmployee(Integer.parseInt(id));
				Map emp = BeanUtils.BeanToMap(employee);
				request.getSession().setAttribute("emp", emp);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return "/jsp/website/Mysetting";
	}

	/**
	 * 退出清空session
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String removeuser(HttpServletRequest request,
			HttpServletResponse response) {
		request.getSession().setAttribute("username", "");
		log.info("清除用户");
		return "/jsp/website/login";

	}

	/**
	 * 退出清空session
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/demo")
	public String demo(HttpServletRequest request, HttpServletResponse response) {

		return "/jsp/proprietor/demo";

	}

}
