package com.web.controller.employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.common.utils.NumberUtils;
import com.web.common.utils.StringUtil;
import com.web.entity.TopTenCities;
import com.web.entity.TopTenProvinces;
import com.web.service.IPeopleMapService;

/**
 * 热点新闻
 * @author 赵东宁
 *
 */
@Controller
@RequestMapping("/people")
public class PeopleMapController {

	
	private static final Log log = LogFactory.getLog(PeopleMapController.class);
	
	@Autowired
	public IPeopleMapService peopleMapService;	
	
	@RequestMapping(value = "/index")
	public String peopleMap(HttpServletRequest request,
			HttpServletResponse response) {			
		return "/jsp/website/peoplemap";
	}
	/**
	 * Search data for region distribution by province
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchprn")
	public void searchProvinces(HttpServletRequest request,
			HttpServletResponse response){
		try {
			String seriesid = request.getParameter("seriesid");
			Map para=new HashMap();
			para.put("seriesid", seriesid);
			List<Map> provinceDatas = peopleMapService.searchRegDataByProvince(para);			
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(provinceDatas);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    /**
     * Search for data for region destribution by city
     * @param request
     * @param response
     */
	@RequestMapping(value="/searchcities")
	public void searchCities(HttpServletRequest request,
			HttpServletResponse response){
		try{
			String seriesid = request.getParameter("seriesid");			
			Map para=new HashMap();
			para.put("seriesid", seriesid);
			List<Map> cities = peopleMapService.searchRegDataByCities(para);
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(cities);
			out.println(json);
			out.flush();
			out.close();			
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	/**
	 * Search data for gender proportion
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/searchgender")
	public void searchGender(HttpServletRequest request,
			HttpServletResponse response){
		try {		
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("seriesid",seriesid);
			List<Map> genderDatas = peopleMapService.searchPeoDataByGender(para);
			//Package data for gender proportion pie chart			
			PrintWriter out = response.getWriter();			
			JSONArray json = new JSONArray();
			json.addAll(genderDatas);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * Get data for age group
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/searchage")
	public void searchAgeGrp(HttpServletRequest request,
			HttpServletResponse response){
		try {
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("seriesid",seriesid);
			List<Map> ageGroupDatas = peopleMapService.searchPeoDataByAge(para);
			PrintWriter out = response.getWriter();
			JSONArray json  = new JSONArray();
			json.addAll(ageGroupDatas);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Get data for using
	 * @param request
	 * @param respons
	 */
	@RequestMapping(value="/searchuse")
	public void searchUsing(HttpServletRequest request,
			HttpServletResponse response){
		try {
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("seriesid",seriesid);
			List<Map> ageGroupDatas = peopleMapService.searcDataByUsing(para);
			PrintWriter out = response.getWriter();
			JSONArray json  = new JSONArray();
			json.addAll(ageGroupDatas);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Get data for user tags
	 * @param request
	 * @param response
	 */

	@RequestMapping (value="/searchtags")
	public void searchUserTags(HttpServletRequest request, 
			HttpServletResponse response){
		try {
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("seriesid", seriesid);
			List<Map> userTags = peopleMapService.searchUsertags(para);
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(userTags);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * Get medals for weibo medals.
	 * @param request
	 * @param response
	 */
	@RequestMapping (value="/searchmedal")
	public void searchMedal(HttpServletRequest request,
			 HttpServletResponse response){
		try {
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("seriesid", seriesid);
			List<Map> medals = peopleMapService.searchMedals(para);
			int totalMedals = 0;
			Map<String, String> proportions = new HashMap<String, String>();
			for(Map<String,String> medal:medals){				  
				  for (Map.Entry<String, String> entry : medal.entrySet()) {					  
					  Integer value = Integer.parseInt(String.valueOf(entry.getValue()));
					   totalMedals += value.intValue();
					  }
		         double yjcm = Float.parseFloat(String.valueOf(medal.get("countyjcm")))/totalMedals;
		         double szqr = Float.parseFloat(String.valueOf(medal.get("countszqr")))/totalMedals;
		         double rlsz = Float.parseFloat(String.valueOf(medal.get("countrlsz")))/totalMedals;
		         double yjsz = Float.parseFloat(String.valueOf(medal.get("countyjsz")))/totalMedals;
		         double txfs = Float.parseFloat(String.valueOf(medal.get("counttxfs")))/totalMedals;
		         double qbcs = Float.parseFloat(String.valueOf(medal.get("countqbcs")))/totalMedals;
		         double qtyh = Float.parseFloat(String.valueOf(medal.get("countqtyh")))/totalMedals;
		         double yyjd = Float.parseFloat(String.valueOf(medal.get("countyyjd")))/totalMedals;
		         double djbq = Float.parseFloat(String.valueOf(medal.get("countdjbq")))/totalMedals;
		         double ttsd = Float.parseFloat(String.valueOf(medal.get("countttsd")))/totalMedals;
		         double sdql = Float.parseFloat(String.valueOf(medal.get("countsdql")))/totalMedals;
		         double ycej = Float.parseFloat(String.valueOf(medal.get("countycej")))/totalMedals;
		         double wjaz = Float.parseFloat(String.valueOf(medal.get("countwjaz")))/totalMedals;
		         double ycdy = Float.parseFloat(String.valueOf(medal.get("countycdy")))/totalMedals;
		         double bfbz = Float.parseFloat(String.valueOf(medal.get("countbfbz")))/totalMedals;
		         double pgwd = Float.parseFloat(String.valueOf(medal.get("countpgwd")))/totalMedals;
		         DecimalFormat df = new DecimalFormat("#.00");
		         proportions.put("一举成名", df.format(yjcm*100));
		         proportions.put("舌战群儒", df.format(szqr*100));
		         proportions.put("如来神掌", df.format(rlsz*100));
		         proportions.put("语惊四座", df.format(yjsz*100));
		         proportions.put("谈笑风生", df.format(txfs*100));
		         proportions.put("七步成诗", df.format(qbcs*100));
		         proportions.put("情投意盒", df.format(qtyh*100));
		         proportions.put("一言九顶", df.format(yyjd*100));
		         proportions.put("斗酒百篇", df.format(djbq*100));
		         proportions.put("谈天说地", df.format(ttsd*100));
		         proportions.put("手到擒来", df.format(sdql*100));
		         proportions.put("一蹴而就", df.format(ycej*100));
		         proportions.put("我就愛贊", df.format(wjaz*100));
		         proportions.put("一锤定音", df.format(ycdy*100));
		         proportions.put("百发百中", df.format(bfbz*100));
		         proportions.put("刨根问底", df.format(pgwd*100));
			}
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.add(proportions);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * Search for habit data
	 * @param request
	 * @param response
	 */
	@RequestMapping (value="/searchhabits")
	public void searchHabits(HttpServletRequest request,
			 HttpServletResponse response){
		try {
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("seriesid", seriesid);
			List<Map> habits = peopleMapService.searchHabits(para);
//			int totalHabitNum = 0;
// 		    Map<String, Float> habitMap = new HashMap<String, Float>();
//			for(Map<String,String> habit:habits){
//				 habitMap.put(habit.get("habit"), Float.valueOf(String.valueOf(habit.get("proportion"))));
//			}
//				 //System.out.println(totalHabitNum);
//		         double kjcl = Float.parseFloat(String.valueOf(habit.get("countkjcl")))/totalHabitNum;
//		         double zzjs = Float.parseFloat(String.valueOf(habit.get("countzzjs")))/totalHabitNum;
//		         double ylys = Float.parseFloat(String.valueOf(habit.get("countylys")))/totalHabitNum;
//		         double rwqh = Float.parseFloat(String.valueOf(habit.get("countrwqh")))/totalHabitNum;
//		         double tyyd = Float.parseFloat(String.valueOf(habit.get("counttyyd")))/totalHabitNum;
//		         double xzqd = Float.parseFloat(String.valueOf(habit.get("countxzqd")))/totalHabitNum;		         
//		         double sycj = Float.parseFloat(String.valueOf(habit.get("countsycj")))/totalHabitNum;		         
//		         double ssjz = Float.parseFloat(String.valueOf(habit.get("countssjz")))/totalHabitNum;		         
//		         double dsyr = Float.parseFloat(String.valueOf(habit.get("countdsyr")))/totalHabitNum;		         
//		         double ysgy = Float.parseFloat(String.valueOf(habit.get("countysgy")))/totalHabitNum;
//		         DecimalFormat df = new DecimalFormat("#.0");
//		         proportions.put("科技潮流", df.format(kjcl*100));
//		         proportions.put("政治军事", df.format(zzjs*100));
//		         proportions.put("娱乐影视", df.format(ylys*100));
//		         proportions.put("人文情怀", df.format(rwqh*100));
//		         proportions.put("体育运动", df.format(tyyd*100));
//		         proportions.put("小资情调", df.format(xzqd*100));		         	         
//		         proportions.put("时尚精致", df.format(ssjz*100));	
//		         proportions.put("商业财经", df.format(sycj*100));
//		         proportions.put("读书育人", df.format(dsyr*100));		         
//		         proportions.put("艺术公益", df.format(ysgy*100));
//			}
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
	//		if(!proportions.isEmpty()){
				json.addAll(habits);
				//System.out.println(json);
	//		}			
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	/**
	 * Search stars data
	 * @param request
	 * @param response
	 */
	@RequestMapping (value="/searchstars")
	public void searchStars(HttpServletRequest request,
			 HttpServletResponse response){
		try {
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("seriesid", seriesid);
			List<Map> stars = peopleMapService.searchStars(para);
			Map<String, Float> radarStars = new HashMap<String, Float>();
			ArrayList<String> twelveStars = new ArrayList<String>();
			twelveStars.add("牡羊座");
			twelveStars.add("金牛座");
			twelveStars.add("双子座");
			twelveStars.add("巨蟹座");
			twelveStars.add("狮子座");
			twelveStars.add("处女座");
			twelveStars.add("天秤座");
			twelveStars.add("天蝎座");
			twelveStars.add("射手座");
			twelveStars.add("魔羯座");
			twelveStars.add("水瓶座");
			twelveStars.add("双鱼座");
			//stars.add(radarStars);
			for(Map<String, String> star:stars){
				radarStars.put(star.get("stars"), Float.valueOf(String.valueOf(star.get("proportion"))));
			}
			for(String cons:twelveStars){
				if(!radarStars.containsKey(cons)){
					radarStars.put(cons, 0.00f);
				}
			}
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			//json.addAll(0,stars);
			json.add(radarStars);
			json.addAll(1, stars);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	/**
	 * Get the choosed star
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/searchchsstar")
	public void searchChoosedStar(HttpServletRequest request,
			 HttpServletResponse response){
		try {
			String starname = request.getParameter("starname");
			String seriesid = request.getParameter("seriesid");
			Map para = new HashMap();
			para.put("star", starname);
			para.put("seriesid", seriesid);
			List<Map> choosedStar = peopleMapService.searchStarEname(para);
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			//json.addAll(0,stars);
			//json.add(radarStars);
			//json.addAll(1, stars);
			json.addAll(choosedStar);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	 
}
