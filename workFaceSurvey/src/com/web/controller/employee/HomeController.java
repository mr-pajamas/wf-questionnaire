package com.web.controller.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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

import com.web.common.utils.StringUtil;
import com.web.service.ICarDataService;

/**
 * 首页
 * 
 * @author 高扬
 * 
 */
@Controller
@RequestMapping("/home")
public class HomeController {

	private static final Log log = LogFactory.getLog(HomeController.class);

	@Autowired
	ICarDataService carDataService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, HttpServletResponse response) {

		log.info("主页--------");

		return "/jsp/website/index";
	}
	
	@RequestMapping(value = "/home")
	public String home(HttpServletRequest request, HttpServletResponse response) {
		String brandid="9"; //大众=9
		String seriesid="1428";

		
		Map map=new HashMap();
		map.put("brandid", "9");
		map.put("ld", "ld");
		List<Map> list=carDataService.searchSeries(map);
		List<Map> listjp=carDataService.searchCompetitiveProduct(map);
		List<Map> blist1=new ArrayList<Map>();
		List<Map> blist2=new ArrayList<Map>();
		List<Map> blist3=new ArrayList<Map>();

		for(Map m1: list){
			String sid=StringUtil.safeToString(m1.get("seriesid"), "");
			String bid=StringUtil.safeToString(m1.get("brandid"), "");
			m1.put("listjp", getjp(listjp,sid));
			
			if("9".equals(bid)){
				blist1.add(m1);
			}
		}
		
		request.setAttribute("blist1", blist1);
		request.setAttribute("blist2", blist2);
		request.setAttribute("blist3", blist3);

		
		request.setAttribute("seriesid", seriesid);
		request.setAttribute("brandid", brandid);
		return "/jsp/website/home";
	}
	
	public List<Map> getjp(List<Map> list,String sid){
		List<Map> resultList=new ArrayList<Map>();
		for(Map map:list){
			String self_seriesid=StringUtil.safeToString(map.get("self_seriesid"), "");
			if(self_seriesid.equals(sid)){
				resultList.add(map);
			}
		}
		return resultList;
	}
	

	/**
	 * 根据品牌ID查询车系
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchseries")
	public void searchseries(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();
		try {
			String brandid = request.getParameter("brandid");
			Map map = new HashMap();
			map.put("brandid", brandid);

			List<Map> list = carDataService.searchSeries(map);
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(list);
			out.println(json);
			out.flush();
			out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	/**
	 * 根据本品ID查询竞品ID
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchjp")
	public void searchjp(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();
		try {
			String seriesid = request.getParameter("seriesid");
			Map map = new HashMap();
			map.put("seriesid", seriesid);
			List<Map> list = carDataService.searchCompetitiveProduct(map);
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(list);
			out.println(json);
			out.flush();
			out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
