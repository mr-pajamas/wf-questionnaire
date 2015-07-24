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
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.common.enums.CarRankEnum;
import com.web.common.utils.StringUtil;
import com.web.common.utils.TimeUtil;
import com.web.service.ICarDataService;
import com.web.service.IHotNewsService;

/**
 * 热点新闻
 * 
 * @author 高扬
 * 
 */
@Controller
@RequestMapping("/news")
public class HotNewsController {

	private static final Log log = LogFactory.getLog(HotNewsController.class);

	@Autowired
	public IHotNewsService hotNewsService;

	@Autowired
	ICarDataService carDataService;

	@RequestMapping(value = "/index")
	public String hotnews(HttpServletRequest request,
			HttpServletResponse response) {

		return "/jsp/website/hotnews";
	}

	/**
	 * 查询热点新闻数据图
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchnewdata")
	public void searchnewdata(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();
		try {
			String seriesid = request.getParameter("seriesid");
			String cid = StringUtil.safeToString(request.getParameter("cid"),
					"");
			// 1=30天 2=90天 3=180天 4=全部
			String datetype = StringUtil.safeToString(request
					.getParameter("datetype"), "2");
			List<String> dateList = new ArrayList<String>();
			Map map = new HashMap();
			String begindate = "";
			String enddate = "";
			if (cid.length() > 1) {
				map.put("cid", cid + seriesid);
			} else {
				map.put("seriesid", seriesid);
			}
			if ("1".equals(datetype)) {
				begindate = TimeUtil
						.getPreOrNextDay(TimeUtil.getSysDate(), -30);
				enddate = TimeUtil.getSysDate();
				map.put("begindate", begindate);
				map.put("enddate", enddate);

				if (!begindate.equals(enddate)) {
					dateList.add(formateDate(begindate));
					dateList.add(formateDate(enddate));
				} else {
					dateList.add(formateDate(begindate));
				}
			} else if ("2".equals(datetype)) {
				begindate = TimeUtil
						.getPreOrNextDay(TimeUtil.getSysDate(), -90);
				enddate = TimeUtil.getSysDate();
				map.put("begindate", begindate);
				map.put("enddate", enddate);
				dateList.addAll(adddate(begindate, enddate));
			} else if ("3".equals(datetype)) {
				begindate = TimeUtil.getPreOrNextDay(TimeUtil.getSysDate(),
						-180);
				enddate = TimeUtil.getSysDate();
				map.put("begindate", begindate);
				map.put("enddate", enddate);
				dateList.addAll(adddate(begindate, enddate));
			}

			List<Map> list = hotNewsService.searchHotNewsMonth(map);
			List<Map> resultList = new ArrayList<Map>();
			String s = "";
			String maxd = "";
			String mind = "";
			List<String> serieslist = new ArrayList<String>();
			for (Map m : list) {
				String series = StringUtil.safeToString(m.get("series"), "");
				String d = StringUtil.safeToString(m.get("data_time"), "");

				if (!s.equals(series)) {
					serieslist.add(series);
					s=series;
				}
				// 如果查询全部。找出最大时间和最小时间
				if ("4".equals(datetype)) {
					if ("".equals(maxd) || "".equals(mind)) {
						maxd = d;
						mind = d;
					} else {
						long b = TimeUtil.getBetweenDays(TimeUtil.formatDate(d
								+ "-01", "yyyy-MM-dd"), TimeUtil.formatDate(
										maxd + "-01", "yyyy-MM-dd"));
						long c= TimeUtil.getBetweenDays(TimeUtil.formatDate(d
								+ "-01", "yyyy-MM-dd"), TimeUtil.formatDate(
										mind + "-01", "yyyy-MM-dd"));
						if (b < 0) {
							maxd = d;
						}
						if (c > 0){
							mind = d;
							
						}
					}

				}
			}
			

			
			if ("4".equals(datetype)) {
				if(mind.equals(maxd)){
					dateList.add(mind);
				}else {
					dateList.addAll(adddate(mind+"-01", maxd+"-01"));
				}
			}
			
			for (String str : serieslist) {
				String v="";
				for (String sd : dateList) {
					if(v.length()>0){
						v+=",";
					}
					v+=searchdataByList(str, sd, list);
				}
				Map mm=new HashMap();
				mm.put("series", str);
				mm.put("tjs", v);
				resultList.add(mm);
			}
			Map rmap=new HashMap();
			rmap.put("dlist", dateList);
			rmap.put("tlist", resultList);
			JSONObject resultJSON = JSONObject.fromObject(rmap);
			PrintWriter out = response.getWriter();
			out.println(resultJSON);
			out.flush();
			out.close();
			

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public String searchdataByList(String series, String data_time, List<Map> list) {
		String result = "0";
		for (Map map : list) {
			String s = StringUtil.safeToString(map.get("series"), "");
			String d = StringUtil.safeToString(map.get("data_time"), "");
			String t = StringUtil.safeToString(map.get("tj"), "");
			if (s.equals(series) && data_time.equals(d)) {
				result = t;
				break;
			}
		}
		return result;
	}
	

	public String formateDate(String date) {
		return TimeUtil.formatDateToString(date, "yyyy-MM");
	}

	public List<String> adddate(String begin, String end) {
		List<String> result = new ArrayList<String>();
		String d = begin;
		while (!formateDate(end).equals(formateDate(d))) {
			result.add(formateDate(d));
			d = TimeUtil.getNextMonth(d, "yyyy-MM-dd");
		}
		result.add(formateDate(end));
		return result;
	}

	/**
	 * 查询热点新闻标题
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchnewtitle")
	public void searchnewtitle(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();
		try {
			String seriesid = request.getParameter("seriesid");
			String cid = StringUtil.safeToString(request.getParameter("cid"),
			"");
	         // 1=30天 2=90天 3=180天 4=全部
         	String datetype = StringUtil.safeToString(request.getParameter("datetype"), "2");
			Map map = new HashMap();
			String begindate = "";
			String enddate = "";
			if (cid.length() > 1) {
				map.put("cid", cid + seriesid);
			} else {
				map.put("seriesid", seriesid);
			}
			if ("1".equals(datetype)) {
				begindate = TimeUtil
						.getPreOrNextDay(TimeUtil.getSysDate(), -30);
				enddate = TimeUtil.getSysDate();
				map.put("begindate", begindate);
				map.put("enddate", enddate);

			} else if ("2".equals(datetype)) {
				begindate = TimeUtil
						.getPreOrNextDay(TimeUtil.getSysDate(), -90);
				enddate = TimeUtil.getSysDate();
				map.put("begindate", begindate);
				map.put("enddate", enddate);
			} else if ("3".equals(datetype)) {
				begindate = TimeUtil.getPreOrNextDay(TimeUtil.getSysDate(),
						-180);
				enddate = TimeUtil.getSysDate();
				map.put("begindate", begindate);
				map.put("enddate", enddate);
			}
			
			List<Map> list = hotNewsService.searchHotNewsMonthTitle(map);
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
	 * 查询热点新闻车级别
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchnewrank")
	public void searchnewrank(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();
		try {
			String seriesid = request.getParameter("seriesid");

			Map p = new HashMap();
			p.put("seriesid", seriesid);
			String rank = "";
			List<Map> carList = carDataService.searchSeries(p);
			if (carList.size() > 0) {
				rank = StringUtil
						.safeToString(carList.get(0).get("rankid"), "");
			}
			Map map = new HashMap();
			map.put("rankid", rank);
			List<Map> list = hotNewsService.searchHotNewsMonthByRank(map);
			for (Map m : list) {
				m.put("rankname", CarRankEnum.getCarRank(rank));
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
	 * 查询热点新闻竞品
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchnewrankjp")
	public void searchnewrankjp(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String seriesids = request.getParameter("seriesids");

			Map p = new HashMap();
			if(seriesids.length()>0){
				seriesids=seriesids.substring(0,seriesids.length()-1);
			}
			p.put("seriesids", seriesids);
			List<Map> list = hotNewsService.searchHotNewsMonthByJP(p);
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
	 * 查询热点新闻标题
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchnewtitle3")
	public void searchnewtitle3(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String seriesname = request.getParameter("seriesname");
			String date = StringUtil.safeToString(request.getParameter("date"),"");
		
			Map map=new HashMap();
			map.put("seriesname", seriesname);
			map.put("date", date);
			List<Map> list = hotNewsService.searchHotNewsMonthByMonth(map);
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

	
	
	public static void main(String[] args) {
		int maxw=50, minw=10;
		Double v=4.69;
		System.out.println((v-3) *40/2);

	}
}
