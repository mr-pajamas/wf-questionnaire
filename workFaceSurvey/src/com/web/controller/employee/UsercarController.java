package com.web.controller.employee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.common.utils.StringUtil;
import com.web.service.IHomeAdminService;
@Controller
@RequestMapping("/usercar")
public class UsercarController {
	@Autowired
	IHomeAdminService adminService;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) {
		String maxrs=StringUtil.safeToString(request.getParameter("maxrs"), "10");
		Map map=new HashMap();
		map.put("maxrs", maxrs);
		request.setAttribute("list", adminService.searchRecord(map));
		request.setAttribute("maxrs", maxrs);

		return "/jsp/website/usercar";
	}
	
	@RequestMapping(value = "/guzhi")
	public String guzhi(HttpServletRequest request,
			HttpServletResponse response) {
		try {
		String id=StringUtil.safeToString(request.getParameter("id"), "");
		
		if(!"".equals(id)){
			Map map=new HashMap();
			map.put("id", id);
			List<Map> list=adminService.searchRecord(map);
			if(list.size()>0){
				request.setAttribute("map", list.get(0));
				List<String> list2=new ArrayList<String>();
				String engine=StringUtil.safeToString(list.get(0).get("engine"), "");
				String inside=StringUtil.safeToString(list.get(0).get("inside"), "");
				String outside=StringUtil.safeToString(list.get(0).get("outside"), "");
				list2.addAll(setdata(engine));
				list2.addAll(setdata(inside));
				list2.addAll(setdata(outside));
				String a="";
				for(String s:list2){
					if(a.length()>0){
						a+=",";
					}
					a+=s;
				}
				request.setAttribute("json", a);
			}
		}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/jsp/website/guzhi";
	}
	
	
	public List<String> setdata(String json) throws JSONException{
		List<String> result=new ArrayList<String>();
		JSONObject	jsonObj = new JSONObject(json);
		for (Iterator iter = jsonObj.keys(); iter.hasNext();) { 
		    String key = (String)iter.next();  
		//    System.out.println(key + "#" + jsonObj.getString(key));
		    int a=Integer.parseInt(jsonObj.getString(key));
		    if(a>0){
			    result.add(key);	
		    }
		}
		return result;
	}
}
