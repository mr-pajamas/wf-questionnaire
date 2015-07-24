package com.web.controller.employee;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.web.common.enums.CarRankEnum;
import com.web.common.utils.StringUtil;
import com.web.service.ICarDataService;
import com.web.service.ITopicService;
import com.web.service.impl.TopicServiceImpl;







@Controller
@RequestMapping("/topic")
public class TopicControllerweb {
	private static final Log log = LogFactory.getLog(HomeController.class);
	@Autowired
	public ITopicService iTopicService  ;
	
	@Autowired
	ICarDataService carDataService;

	@RequestMapping(value = "/showtopic")
	public String showcountent(HttpServletRequest request, HttpServletResponse response) {
		

		return "/jsp/website/Topic_comment";
		
		
		
		
 
	}
	
	/**
	 * 查询词yun
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchtopicyun")
	public void searchwords(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String seriesid = request.getParameter("seriesid");
			Map p=new HashMap();
			p.put("seriesid", seriesid);
			List<Map> list2 = iTopicService.searchtxtop(p);
			List<Map> list = iTopicService.searchtopEvaluate(p);
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(list);
			json.addAll(list2);
			out.println(json);
			System.out.println("ooooooooooo"+json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	
	@RequestMapping(value = "/searchcxtop")
	public void searchsyd(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();
		try {

			
			String seriesid = request.getParameter("seriesid");
			
			Map p=new HashMap();
			p.put("seriesid", seriesid);
			String brandid="";
			 List<Map> carList= carDataService.searchSeries(p);
			if(carList.size()>0){
				brandid=StringUtil.safeToString(carList.get(0).get("brandid"), "");
			}
			Map map = new HashMap();
			map.put("brandid", brandid);
			List<Map> list = iTopicService.searchNews(p);
			for(Map m:list){
				m.put("rankname", CarRankEnum.getCarRank(brandid));
			}
		//	List<Map> list = iTopicService.searchNews(brandid);
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			System.err.println("asdasddas");
			json.addAll(list);
			out.println(json);
			out.flush();
			out.close();

			System.out.println("json________"+json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
}
	
	
	/**
	 * 查询热点新闻标题
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchtopsf")
	public void searchtopictop3(HttpServletRequest request,
			HttpServletResponse response) {
		try {

			String seriesid = request.getParameter("seriesid");
			
			Map p=new HashMap();
			p.put("seriesid", seriesid);
			String brandid="";
			 List<Map> carList= carDataService.searchSeries(p);
			if(carList.size()>0){
				brandid=StringUtil.safeToString(carList.get(0).get("brandid"), "");
			}
			Map map = new HashMap();
			map.put("brandid", brandid);
			String provincename = StringUtil.safeToString(request.getParameter("provincename"),
			"");
		//	Map map = new HashMap();
			map.put("seriesid", seriesid);
			map.put("provincename", provincename);
			List<Map> list = iTopicService.searchHotTopic(map);
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
	 * 查询 话题
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchtop")
	public void searchnewtitle(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();

		
			try {
				String seriesid = request.getParameter("seriesid");
				
				Map p=new HashMap();
				p.put("seriesid", seriesid);
				String rankid="";
				 List<Map> carList= carDataService.searchSeries(p);
				if(carList.size()>0){
					rankid=StringUtil.safeToString(carList.get(0).get("rankid"), "");
				}
				Map map = new HashMap();
				map.put("rankid", rankid);
				List<Map> list = iTopicService.searchtop(map);
				for(Map m:list){
					m.put("rankname", CarRankEnum.getCarRank(rankid));
				}
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
	 * 查询 竞品话题
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchjptop")
	public void searchnewjptitle(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();

		
			try {
				String seriesid = request.getParameter("seriesid");
				
				Map p=new HashMap();
				p.put("seriesid", seriesid);
				String cid = StringUtil.safeToString(request.getParameter("cid"),
						"");
				// List<Map> carList= carDataService.searchSeries(p);
				
				Map map = new HashMap();
				map.put("cid",  cid+ seriesid);
				System.out.println("cid_________"+cid);
				List<Map> list = iTopicService.searchjpht(map);
//				for(Map m:list){
//					m.put("cidname", CarRankEnum.getCarRank(cid));
//				}
				
				
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
