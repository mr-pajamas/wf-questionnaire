package com.web.controller.employee;

import java.io.File;
import java.io.IOException;import java.io.PrintWriter;
import java.util.ArrayList;import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.common.utils.HttpUtil;
import com.web.common.utils.SignUtil;import sun.misc.BASE64Decoder;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;import com.web.common.utils.StringUtil;
import com.web.common.utils.getAccessTokenUtil;
import com.web.entity.Anwser;
import com.web.entity.Family;
import com.web.entity.MessageVO;
import com.web.entity.SimpleUserInfo;
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

	@RequestMapping(value = "/baseInfo", method = RequestMethod.POST)
	public String baseInfo(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/website/survey";
	}

	@RequestMapping(value = "/savebaseInfo", method = RequestMethod.POST)
	public String savebaseInfo(HttpServletRequest request,
			HttpServletResponse response) {
		String phone = request.getParameter("");
		Enumeration rnames = request.getParameterNames();
		for (Enumeration e = rnames; e.hasMoreElements();) {
			String thisName = e.nextElement().toString();
			String thisValue = request.getParameter(thisName);
			// System.out.println(thisName+"-------"+thisValue);
		}
		return "";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String appid =  "wx1f31aecb83b985d7";//微信公众号下的AppID
		String secret = "9e8c703c6653fe88f02674a6688d380e";//微信公众号下的secret
		String phone = request.getParameter("phoneNum");
		String password = request.getParameter("password");
		if (!"".equals(phone) && !"".equals(password) && phone != null
				&& password != null) {
			User user = surveyServey.checkLogin(phone, password);
			if (null != user) {
				request.getSession().setAttribute("phone", user.getPhone());
				request.getSession().setAttribute("id", user.getId());
				request.getSession().setAttribute("role", user.getRole());
				request.getSession().setAttribute("user", user);
				if (user.getRole().equals("1")) {
					// return "/jsp/website/choose";
					return "redirect:/survey/choose";

				} else {
					// return "/jsp/website/wenjuan1";
					// 在Session中保存手机号码
					
					return "redirect:/synthesize/questionnaire1?phone="+phone;
				}
			} else {
				request.setAttribute("error", "用户名或密码错误，请重新输入");
				return "/jsp/website/login";
			}
		} else {
			return "/jsp/website/login";
		}
	}

	@RequestMapping("/choose")
	public String choose(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/website/choose";
	}

	@RequestMapping("/regist")
	public String regist(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/website/regist";
	}

	@RequestMapping(value = "/saveregist", method = RequestMethod.POST)
	public String saveregist(HttpServletRequest request,
			HttpServletResponse response) {
		String appid =  "wx1f31aecb83b985d7";//微信公众号下的AppID
		String secret = "9e8c703c6653fe88f02674a6688d380e";//微信公众号下的secret
		String phone = request.getParameter("PhoneNum");
		String password = request.getParameter("password");
		String passwordRpe = request.getParameter("passwordRpe");
		String tp = StringUtil.safeToString("tp", "");
		String openid=request.getParameter("openid");
		if(!"".equals(openid) && openid!=null){
			String gender=request.getParameter("gender");
			String province=request.getParameter("province");
			String city=request.getParameter("city");
			String headimg=request.getParameter("headimg");
			
			User user=surveyServey.getUserByPhone(phone);
			if(user==null){
				user=new User();
				user.setWecahrt(openid);
				user.setPhone(phone);
				user.setProvince(province);
		    	user.setCity(city);
		    	user.setHeadimg(headimg);
		    	user.setGender(gender);
		    	user.setRole("2");
				surveyServey.saveUser(user);
			}else{
				user.setWecahrt(openid);
				user.setProvince(province);
		    	user.setCity(city);
		    	user.setHeadimg(headimg);
		    	user.setGender(gender);
		    	user.setRole("2");
				surveyServey.saveUser(user);
			}
			request.setAttribute("user", user);
			Anwser anwser = surveyServey.getAnwserByPhone(phone);
			if(anwser!=null){
				request.setAttribute("anwser", anwser);
			}
			request.getSession().setAttribute("username", user.getPhone());
			request.getSession().setAttribute("phone", user.getPhone());
			request.getSession().setAttribute("id", user.getId());
			request.getSession().setAttribute("role", user.getRole());
			
			 String timeStamp=String.valueOf(System.currentTimeMillis());
				timeStamp=timeStamp.substring(0, 10);
				String nonceStr = "oYeWRtwKygRjzQFwtAx7fDpE-V-M";
				String url=request.getRequestURL().toString();
//				url=url+"?code="+code+ "&state=STATE";//拼成微信转义过的URL（加上code和state参数，否则会造成签名错误）
				String jsTicket=(String) request.getSession().getAttribute("jsTicket");
				if(jsTicket=="" || jsTicket==null){
					String accessToken=(String) request.getSession().getAttribute("accessToken");
					if(accessToken=="" || accessToken==null){
						accessToken=getAccessTokenUtil.getAccessToken(appid,secret);
						request.getSession().setAttribute("accessToken", accessToken);
					}
					jsTicket=getAccessTokenUtil.getJsapiTicket(accessToken);
					request.getSession().setAttribute("jsTicket",jsTicket);
				}
				
				String signature=SignUtil.jsTicketSign(jsTicket,nonceStr,timeStamp,url);
				request.setAttribute("timeStamp", timeStamp);
				request.setAttribute("nonceStr", nonceStr);
				request.setAttribute("signature", signature);
			return "/jsp/website/wenjuan1";
		}
		else if (!"".equals(phone) && !"".equals(password)
				&& password.equals(passwordRpe)) {
			User user = surveyServey.getUserByPhone(phone);
			if (null != user) {
				request.setAttribute("error", "该手机号已被注册，请重试");
				return "/jsp/website/regist";
			} else {
				uploadimg(tp,phone+"_img.jpg");
				user = new User();
				user.setPhone(phone);
				user.setPassword(password);
				user.setRole("2");
				user.setHeadimg(phone+"_img.jpg");
				surveyServey.saveUser(user);
//				return "/jsp/website/login";//注册完毕，跳转登陆界面
				

				//跳转到问卷1
				request.setAttribute("user", user);
				request.getSession().setAttribute("username", user.getPhone());
				request.getSession().setAttribute("phone", user.getPhone());
				request.getSession().setAttribute("id", user.getId());
				request.getSession().setAttribute("role", user.getRole());
//				return "redirect:/synthesize/questionnaire1";
			    return "/jsp/website/modify_empinfo";
			    
			}
		} else {
			request.setAttribute("error", "请确保密码、用户名输入正确");
			return "/jsp/website/regist";
		}
	}

	@RequestMapping("/showmanage")
	public String showmangee(HttpServletRequest request,
			HttpServletResponse response) {
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

		return "/jsp/website/management";
	}
	
	@RequestMapping(value="/wechatLogin",method = RequestMethod.GET)
	public String getuserInfo(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		request.setCharacterEncoding("utf-8");  
		String code=request.getParameter("code");
		String appid =  "wx1f31aecb83b985d7";//微信公众号下的AppID
		String secret = "9e8c703c6653fe88f02674a6688d380e";//微信公众号下的secret
		String get_access_token_url="https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appid+"&secret="+secret+"&code="+code+"&grant_type=authorization_code";
		String json=HttpUtil.getUrl(get_access_token_url);
		
		json = new String(json.getBytes("ISO-8859-1"),"utf-8");
		JSONObject jsonObject=JSONObject.fromObject(json);
		String access_token=jsonObject.getString("access_token");
		String openid=jsonObject.getString("openid");
		String get_userinfo="https://api.weixin.qq.com/sns/userinfo?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
		String userInfoJson=HttpUtil.getUrl(get_userinfo);
		userInfoJson = new String(userInfoJson.getBytes("ISO-8859-1"),"utf-8");
		JSONObject userInfoJO=JSONObject.fromObject(userInfoJson);
		
		String user_openid=userInfoJO.getString("openid");
		String user_nickname=userInfoJO.getString("nickname");
		String user_sex=userInfoJO.getString("sex");
	    String user_province=userInfoJO.getString("province");
	    String user_city=userInfoJO.getString("city");
//	    String user_country=userInfoJO.getString("country");
	    String user_headimgurl=userInfoJO.getString("headimgurl");
	    User user=surveyServey.getUserByPhone(openid);
	    System.out.println(user==null);
	    if(user==null){
	    	user=new User();
	    	user.setWecahrt(user_openid);
	    	user.setWechat_nickname(user_nickname);
	    	if(user_sex.equals("1")){
	    		user.setGender("男");
	    	}else if(user_sex.equals("2")){
	    		user.setGender("女");
	    	}else{
	    		user.setGender("未知");
	    	}
	    	user.setProvince(user_province);
	    	user.setCity(user_city);
	    	user.setHeadimg(user_headimgurl);
//	    	surveyServey.saveUser(user);
	    }
	  
	    String timeStamp=String.valueOf(System.currentTimeMillis());
		timeStamp=timeStamp.substring(0, 10);
		String nonceStr = "oYeWRtwKygRjzQFwtAx7fDpE-V-M";
		String url=request.getRequestURL().toString();
		System.out.println(url);
		url=url+"?code="+code+ "&state=STATE";//拼成微信转义过的URL（加上code和state参数，否则会造成签名错误）
		String jsTicket=(String) request.getSession().getAttribute("jsTicket");
		if(jsTicket=="" || jsTicket==null){
			String accessToken=(String) request.getSession().getAttribute("accessToken");
			if(accessToken=="" || accessToken==null){
				accessToken=getAccessTokenUtil.getAccessToken(appid,secret);
				request.getSession().setAttribute("accessToken", accessToken);
			}
			jsTicket=getAccessTokenUtil.getJsapiTicket(accessToken);
			request.getSession().setAttribute("jsTicket",jsTicket);
		}
		
		String signature=SignUtil.jsTicketSign(jsTicket,nonceStr,timeStamp,url);
		request.setAttribute("timeStamp", timeStamp);
		request.setAttribute("nonceStr", nonceStr);
		request.setAttribute("signature", signature);
		request.setAttribute("openid", openid);
		request.setAttribute("user", user);
		if(!"".equals(user.getPhone()) && user.getPhone()!=null){
			request.getSession().setAttribute("phone", user.getPhone());
			if(user.getRole().equals("1")){
				return "/jsp/website/choose";
			}else{
//				return "/jsp/website/wenjuan1";
				return "/jsp/website/modify_empinfo";
			}
			
		}else{
			return "/jsp/website/regist";
		}
		
	}
	
	@RequestMapping("/getsurveyinfo")
	public String  getsurveyinfo(HttpServletRequest request,HttpServletResponse response){
		String phone=request.getParameter("phone");
		User user = surveyServey.getUserByPhone(phone);
		Anwser anwser = surveyServey.getAnwserByPhone(phone);

		request.setAttribute("user", user);
		request.setAttribute("anwser", anwser);
		// TODO: 临时方案ll
		if(null!=anwser )
			// TODO: 临时方案
			request.setAttribute("anwserQ40", (anwser.getQ40() == null ? Collections.<String>emptyList() : Arrays.asList(anwser.getQ40().split("\\|"))));
			// 以上是临时方案
		else
			request.setAttribute("anwserQ40",  Collections.<String>emptyList());
		// 以上是临时方案
		return "/jsp/website/wenjuan1";
	}
	/*
	@RequestMapping(value="userInfo")
	@ResponseBody
	public JSONArray searchUserInfo(String offset,String limit){
		JSONArray userJson = new JSONArray(); 
		List<Map> temp=surveyServey.searchUserList("0","20");
		for(Map m:temp){
			SimpleUserInfo userInfo=new SimpleUserInfo();
			if(!"".equals(m.get("name"))&&m.get("name")!=null){
				userInfo.setName(m.get("name").toString());
			}else{
				userInfo.setName(null);
			}
			if(!"".equals(m.get("phone"))&&m.get("phone")!=null){
				userInfo.setPhone(m.get("phone").toString());
				userInfo.setHeadimg("survey/getsurveyinfo?phone=" + m.get("phone").toString());
			}else{
				userInfo.setPhone("null");
			}
			if(!"".equals(m.get("company"))&&m.get("company")!=null){
				userInfo.setCompany(m.get("company").toString());
			}else{
				userInfo.setCompany("null");
			}
			if(!"".equals(m.get("headimg"))&&m.get("headimg")!=null){
				userInfo.setHeadimg(m.get("headimg").toString());
			}else{
				userInfo.setHeadimg("null");
			}
			JSONObject user = JSONObject.fromObject(userInfo);
			userJson.add(user);
		}
		
		System.out.println(userJson);
		return userJson;
	}
	*/
	
	@RequestMapping(value="userInfo")
	@ResponseBody
	public List<SimpleUserInfo> searchUserInfo(String offset,String limit,String q){
		List<Map> temp=surveyServey.searchUserList(offset.trim(),limit.trim(),q.trim());
		List<SimpleUserInfo> result = new LinkedList<SimpleUserInfo>();
		for(Map m:temp){
			SimpleUserInfo userInfo=new SimpleUserInfo();
			if(!"".equals(m.get("name"))&&m.get("name")!=null){
				userInfo.setFullName(m.get("name").toString());
			}
			if(!"".equals(m.get("phone"))&&m.get("phone")!=null){
				userInfo.setMobile(m.get("phone").toString());
				userInfo.setUri("survey/getsurveyinfo?phone=" + m.get("phone").toString());
			}
			if(!"".equals(m.get("company"))&&m.get("company")!=null){
				userInfo.setCompany(m.get("company").toString());
			}
			if(!"".equals(m.get("headimg"))&&m.get("headimg")!=null){
				userInfo.setAvatar(m.get("headimg").toString());
			}
			result.add(userInfo);
		}
		
		return result;
	}
	
	@RequestMapping(value="wechatSecret")
	@ResponseBody
	public void wechatSecret(HttpServletRequest request,HttpServletResponse reponse){
		String appid =  "wx1f31aecb83b985d7";//微信公众号下的AppID
		String secret = "9e8c703c6653fe88f02674a6688d380e";//微信公众号下的secret
		String timeStamp=String.valueOf(System.currentTimeMillis());
		timeStamp=timeStamp.substring(0, 10);
		String nonceStr = "oYeWRtwKygRjzQFwtAx7fDpE-V-M";
		String url=request.getRequestURL().toString();
//		url=url+"?code="+code+ "&state=STATE";//拼成微信转义过的URL（加上code和state参数，否则会造成签名错误）
		String jsTicket=(String) request.getSession().getAttribute("jsTicket");
		if(jsTicket=="" || jsTicket==null){
			String accessToken=(String) request.getSession().getAttribute("accessToken");
			if(accessToken=="" || accessToken==null){
				accessToken=getAccessTokenUtil.getAccessToken(appid,secret);
				request.getSession().setAttribute("accessToken", accessToken);
			}
			jsTicket=getAccessTokenUtil.getJsapiTicket(accessToken);
			request.getSession().setAttribute("jsTicket",jsTicket);
		}	
		String signature=SignUtil.jsTicketSign(jsTicket,nonceStr,timeStamp,url);
		request.setAttribute("timeStamp", timeStamp);
		request.setAttribute("nonceStr", nonceStr);
		request.setAttribute("signature", signature);
	}
	
	/**
	 * 包装机构数据
	 * @param <T>
	 * @param e
	 * @return
	 */
	public <T> MessageVO<T> warpeJson(List<T> e) {
		MessageVO<T> vo = new MessageVO<T>();
//		vo.setCode("200");
//		vo.setMessage("请求成功");
		vo.setResult(e);
		return vo;
	}

	String ACCESS_KEY = "ArTWIe1q_1iDUdMm2notK3vjhARjbcNa_8S1zrZ5";
	String SECRET_KEY = "N9fwW3xXTNvUCdBKQqtcYZsUmaDquwSK1xh9anFv";

	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

	private String getUpToken0(String key) {
		// return auth.uploadToken("wf-photos", key);
		String token = auth.uploadToken("wf-photos", key);
		System.out.println(token);
		return token;
	}

	private void uploadimg(String img, String key) {
		UploadManager uploadManager = new UploadManager();
		try {

			Response res = uploadManager.put(decode(img
					.substring("data:image/jpeg;base64,".length())), key,
					getUpToken0(key));

			Map<String, Object> m4 = res.jsonToObject(HashMap.class);

		} catch (QiniuException e) {
			Response r = e.response;
			System.out.println(r.toString());
			try {
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	private boolean saveImageToDisk(byte[] data, String imageName)
			throws IOException {
		FileUtils.writeByteArrayToFile(new File(imageName), data);

		return true;
	}

	private byte[] decode(String imageData) throws IOException {
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] data = decoder.decodeBuffer(imageData);
		return data;
	}
}
