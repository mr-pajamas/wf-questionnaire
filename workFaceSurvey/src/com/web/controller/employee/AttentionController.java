package com.web.controller.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.web.common.utils.NumberUtils;
import com.web.common.utils.StringUtil;
import com.web.common.utils.TimeUtil;
import com.web.service.IAttentionService;
import com.web.service.ICarDataService;
import com.web.service.ISynthesizeService;
import com.web.service.ITopicService;


/**
 * 声量/关注
 * @author 杨树楷
 *
 */
@Controller
@RequestMapping("/attention")
public class AttentionController {
	private static final Log log = LogFactory.getLog(AttentionController.class);

	@Autowired
	public IAttentionService attentionService;
	@Autowired
	public ISynthesizeService synthesizeService;
	@Autowired
	ICarDataService carDataService;
	
	
	@RequestMapping(value = "/index")
	public String attention(HttpServletRequest request,
			HttpServletResponse response) {

		log.info(" 声量/关注主页--------");
		
		
		// 查询级别关注度排名
		int i = 1;
		int t1 = 0;
		int t2 = 0;
		int t3 = 0;
		List<Map>  ranklist = synthesizeService.searchRankFocusSpread(new HashMap());
		int spread_countall=0;
		int foucs_countall=0;
		int maxspread_count=0;
		int maxfoucs_count=0;
		int maxdata3=0;
		for (Map map : ranklist) {
			int foucs_count=Integer.parseInt(StringUtil.safeToString(map.get("foucs_count"), "")); 
			int spread_count=Integer.parseInt(StringUtil.safeToString(map.get("spread_count"), "")); 
			int data3=foucs_count/spread_count *100;
			spread_countall=spread_countall+spread_count;
			foucs_countall=foucs_countall+foucs_count;
			
			if(foucs_count>maxfoucs_count){
				maxfoucs_count=foucs_count;
			}
			if(spread_count>maxspread_count){
				maxspread_count=spread_count;
			}
			if(data3>maxdata3){
				maxdata3=data3;
			}
		}
		int w1=70;
		int w2=70;
		for (Map map : ranklist) {
			int foucs_count=Integer.parseInt(StringUtil.safeToString(map.get("foucs_count"), "")); 
			int spread_count=Integer.parseInt(StringUtil.safeToString(map.get("spread_count"), "")); 
			String data1=count(String.valueOf(foucs_count),String.valueOf(foucs_countall));
			String data2=count(String.valueOf(spread_count),String.valueOf(spread_countall));
			int data3=Integer.parseInt(StringUtil.safeToString(map.get("xs"), "")); 
		    
			
			map.put("data1", data1);
			map.put("data2", data2);
			map.put("data3", data3);

	
			if(1==i){
				map.put("colour", "#0070c1");
			}else if(i==ranklist.size()){
				map.put("colour", "#91db78");
			}else {
				map.put("colour", "#00b1f1");
			}
			if(data3>=100){
				map.put("colour2", "#0000FF");
				map.put("float", "left");
			}else {
				map.put("colour2", "#FF0000");
				map.put("float", "right");
			}
			
			if(foucs_count==maxfoucs_count){
				map.put("w1", w1);
			}else{
				map.put("w1",(long)foucs_count * w1 / (long)maxfoucs_count);
			}
			
			if(spread_count==maxspread_count){
				map.put("w2", w2);
			}else{
				map.put("w2",(long)spread_count * w2/ (long)maxspread_count);
			}
			i++;
		}
		
		
		
		
		
		request.setAttribute("ranklist", ranklist);
		
		return "/jsp/website/attention";
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
	
	public String searchfocusByList(String series, String data_time, List<Map> list) {
		String result = "0";
		for (Map map : list) {
			String s = StringUtil.safeToString(map.get("series"), "");
			String d = StringUtil.safeToString(map.get("data_time"), "");
			String t = StringUtil.safeToString(map.get("focus_count"), "");
			if (s.equals(series) && data_time.equals(d)) {
				result = t;
				break;
			}
		}
		return result;
	}
	public String searchspreadByList(String series, String data_time, List<Map> list) {
		String result = "0";
		for (Map map : list) {
			String s = StringUtil.safeToString(map.get("series"), "");
			String d = StringUtil.safeToString(map.get("data_time"), "");
			String t = StringUtil.safeToString(map.get("spread_count"), "");
			if (s.equals(series) && data_time.equals(d)) {
				result = t;
				break;
			}
		}
		return result;
	}
	
	/**
	 * 查询车系传播量关注量数据图
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchspreadfocusdata")
	public void searchnewdata(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String seriesid = request.getParameter("seriesid");
			String cid=StringUtil.safeToString(request.getParameter("cid"), "");
			String source_type = request.getParameter("source_type");
			// 1=30天 2=90天 3=180天 4=全部
			String datetype = StringUtil.safeToString(request
					.getParameter("datetype"), "2");
			List<String> dateList = new ArrayList<String>();
			Map map = new HashMap();
			String begindate = "";
			String enddate = "";
			if(cid.length()>1){
				map.put("cid", cid+seriesid);
			}else{
				map.put("seriesid", seriesid);
			}
			if(!"".equals(source_type) && source_type !=null){
				map.put("source_type", source_type);
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
			
			List<Map> list = attentionService.searchSeriesSpreadFocus(map);
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
				// 如果查询全部,找出最大时间和最小时间
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
				String spread_count="";
				String focus_count="";
				for (String sd : dateList) {
					if(spread_count.length()>0){
						spread_count+=",";
					}
					if(spread_count.length()>0){
						focus_count+=",";
					}
					spread_count+=searchspreadByList(str, sd, list);
					focus_count+=searchfocusByList(str, sd, list);
				}
				Map mm=new HashMap();
				mm.put("series", str);
				mm.put("spread_count", spread_count);
				mm.put("focus_count", focus_count);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "/searchseries_spread_foucsrank")
	public void searchnewrank(HttpServletRequest request,
			HttpServletResponse response) {
		// 查询各级别车系排名
		try {
			String seriesid = request.getParameter("seriesid");
			Map p = new HashMap();
			p.put("seriesid", seriesid);
			
			String rankid="";
			 List<Map> carList= carDataService.searchSeries(p);
			if(carList.size()>0){
				rankid=StringUtil.safeToString(carList.get(0).get("rankid"), "");
			}
			
			Map r_map = new HashMap();
			r_map.put("rankid", rankid);
			List<Map> serieslist = attentionService.searchCompactFoucsSpreadTop(r_map);
			long allfoucs = attentionService.searchCompactSeriesFoucsAll(r_map);
			long allspread = attentionService.searchCompactSeriesSpreadAll(r_map);
			
			int i = 1;
			long maxspread_count=0;
			long t1 = 0;
			
			for (Map map : serieslist) {
				long spread_count = (long)Integer.parseInt(StringUtil.safeToString(map
						.get("spread_count"), ""));
				if(spread_count>maxspread_count){
					maxspread_count=spread_count;
				}
			}
			
			for (Map map : serieslist) {
				map.put("tj", count(StringUtil.safeToString(
						map.get("focus_count"), ""), String.valueOf(allfoucs)));
				map.put("tj1", count(StringUtil.safeToString(
						map.get("spread_count"), ""), String.valueOf(allspread)));
				String brandid = StringUtil.safeToString(map.get("brandid"), "");
				long foucs_count = (long)Integer.parseInt(StringUtil.safeToString(map
						.get("focus_count"), ""));
				long spread_count = (long)Integer.parseInt(StringUtil.safeToString(map
						.get("spread_count"), ""));

				if(spread_count==maxspread_count){
					map.put("s_width", "70");
				}else{
					map.put("s_width", ((long) spread_count * 70) / maxspread_count);
				}
				if (1 == i) {
					map.put("colour", "#0070c1");
					t1 = (long)foucs_count;
					map.put("f_width", "70");
				} else if ("9".equals(brandid) ) {
					map.put("colour", "#91db78");
					map.put("f_width", ((long)foucs_count * 70) /(long) t1);
//					System.out.println((long)foucs_count);
				} else {
					map.put("colour", "#00b1f1");
					map.put("f_width", ((long)foucs_count * 70) / (long)t1);
//					System.out.println(map.get("s_width"));
				}
				i++;
			}
			for (Map m : serieslist) {
				m.put("rankname", CarRankEnum.getCarRank(rankid));
			}
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(serieslist);
			out.println(json);
			out.flush();
			out.close();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/searchspreadspeed")
	public void searchspreadspeed(HttpServletRequest request,
			HttpServletResponse response) {
		// 查询车系传播效率
		try {
			String seriesid = request.getParameter("seriesid");
			Map s_map = new HashMap();
			s_map.put("seriesid", seriesid);
			
			int i=1;
			int spread_countall=0;
			int foucs_countall=0;
			int maxspread_count=0;
			int maxfoucs_count=0;
			double maxdata3=0;
			List<Map>  spreadSpeedlist = attentionService.searchSeriesSpreadSpeed(s_map);
			for (Map map : spreadSpeedlist) {
				int foucs_count=Integer.parseInt(StringUtil.safeToString(map.get("focus_count"), "")); 
				int spread_count=Integer.parseInt(StringUtil.safeToString(map.get("spread_count"), ""));
				spread_countall += spread_count;
				foucs_countall += foucs_count;
			}
			
			for (Map map : spreadSpeedlist) {
				int foucs_count=Integer.parseInt(StringUtil.safeToString(map.get("focus_count"), "")); 
				int spread_count=Integer.parseInt(StringUtil.safeToString(map.get("spread_count"), ""));
				String data1=count(String.valueOf(foucs_count),String.valueOf(foucs_countall));
				String data2=count(String.valueOf(spread_count),String.valueOf(spread_countall));
				double data3= (count2(String.valueOf(foucs_count),String.valueOf(foucs_countall)))/(count2(String.valueOf(spread_count),String.valueOf(spread_countall)))*100;
				data3 = NumberUtils.setvalue(data3);
				if(foucs_count>maxfoucs_count){
					maxfoucs_count=foucs_count;
				}
				if(spread_count>maxspread_count){
					maxspread_count=spread_count;
				}
				if(data3>maxdata3){
					maxdata3=data3;
				}
				
				map.put("data1", data1);
				map.put("data2", data2);
				map.put("data3", data3);
				
				if(1==i){
					map.put("colour", "#0070c1");
				}else {
					map.put("colour", "#00b1f1");
				}
				
				if(data3>=100){
					map.put("colour2", "#0000FF");
					map.put("float", "left");
				}else {
					map.put("colour2", "#FF0000");
					map.put("float", "right");
				}
				
				int w1=70;
				int w2=70;
				int w3=50;
				if(foucs_count==maxfoucs_count){
					map.put("w1", w1);
				}else{
					map.put("w1",foucs_count * w1 / maxfoucs_count);
				}
				
				if(spread_count==maxspread_count){
					map.put("w2", w2);
				}else{
					map.put("w2",spread_count * w2/ maxspread_count);
				}
				
				if(data3>=100){
//					if(data3==maxdata3){
//						map.put("w3", w3);
//					}else{
						map.put("w3",(data3-100) * w3/ maxdata3);
//					}
				}else{
					if(data3==maxdata3){
						map.put("w3", w3);
					}else{
						map.put("w3",(100-data3)*w3/maxdata3);
					}
				}
				
				i++;
			}
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(spreadSpeedlist);
			out.println(json);
			out.flush();
			out.close();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 计算百分比
	 * 
	 * @return
	 */
	public String count(String value, String allvalue) {
		Double c = Double.parseDouble(value) * 100
				/ Double.parseDouble(allvalue);
		return NumberUtils.setvalue(c) + "%";
	}
	
	public Double count2(String value, String allvalue) {
		Double c = Double.parseDouble(value) * 100
				/ Double.parseDouble(allvalue);
		return c;
	}

	public static void main(String[] args) {
		String a = "13334";
		String b = "4213412";

		Double c = Double.parseDouble(a) * 100 / Double.parseDouble(b);
		System.out.println(c + "%");
	}
}
