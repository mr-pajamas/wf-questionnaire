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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.web.service.ICarDataService;
import com.web.service.IProductService;
import com.web.common.enums.CarRankEnum;
import com.web.common.utils.NumberUtils;
import com.web.common.utils.StringUtil;
import com.web.entity.ProList;
import com.web.entity.TopicDesc;

@Controller
@RequestMapping("/produc")
public class ProductControllerweb {
	private static final Log log = LogFactory.getLog(HomeController.class);
	@Autowired
	public IProductService iProductService;

	@Autowired
	ICarDataService carDataService;

	public static final String[] dimensionid = { "1", "2", "3", "4", "5", "6",
			"7", "12", "13" };

	@RequestMapping(value = "/showproduc")
	public String showcountent(HttpServletRequest request,
			HttpServletResponse response) {

		return "/jsp/website/Product_evaluation";

	}

	/**
	 * 查询词频
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchwords")
	public void searchwords(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String seriesid = request.getParameter("seriesid");
			Map p = new HashMap();
			p.put("seriesid", seriesid);
			List<Map> list = iProductService.searchWordsEvaluate(p);
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
	@RequestMapping(value = "/searchpjtop")
	public void searchnewtitle(HttpServletRequest request,
			HttpServletResponse response) {
		Map jsonmap = new LinkedHashMap();

		try {

			String seriesid = request.getParameter("seriesid");

			Map p = new HashMap();
			p.put("seriesid", seriesid);
			String rankid = "";
			List<Map> carList = carDataService.searchSeries(p);
			if (carList.size() > 0) {
				rankid = StringUtil.safeToString(carList.get(0).get("rankid"),
						"");
			}
			Map map = new HashMap();
			map.put("rankid", rankid);
			List<Map> list = iProductService.searchpjTop(map);
			for (Map m : list) {
				m.put("rankname", CarRankEnum.getCarRank(rankid));
			}
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(list);
			out.println(json);
			out.flush();
			out.close();
			System.out.println("asdsadasda11111" + list);
			System.out.println("asdsadasda2222" + json);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 查询产品评价
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchproductevaluate")
	public void searchProductEvaluate(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String seriesid = request.getParameter("seriesid");
			String cid = StringUtil.safeToString(request.getParameter("cid"),
					"");
			String obid = StringUtil.safeToString(request.getParameter("obid"),
					"");
			Map p = new HashMap();
			if (cid.length() > 1) {
				p.put("seriesid", cid + seriesid);
			} else {
				p.put("seriesid", seriesid);
			}
			List<Map> list = iProductService.searchProductEvaluate(p);
			List<Map> resultlist = new ArrayList<Map>();
			String s = "";
			int maxw = 50;
			int minw = 10;
			int a = 3;
			for (Map map : list) {
				String sid = StringUtil.safeToString(map.get("seriesid"), "");
				if (!s.equals(sid)) {
					s = sid;
					Map m = new HashMap();
					m.put("series", map.get("series"));
					m.put("seriesid", sid);
					for (String d : dimensionid) {
						Double v = Double.parseDouble(getvalue(list, d, s));
						m.put("did_" + d, v);
						if (v != 0) {
							m.put("w_" + d, NumberUtils.setvalue((v - a)
									* (maxw - minw) / 2));
						} else {
							m.put("w_" + d, "0");
						}
					}
					resultlist.add(m);
				}
			}
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			json.addAll(resultlist);

			out.println(json);
			out.flush();
			out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getvalue(List<Map> list, String did, String sid) {
		String result = "0";
		for (Map map : list) {
			String seriesid = StringUtil.safeToString(map.get("seriesid"), "");
			String dimensionid = StringUtil.safeToString(
					map.get("dimensionid"), "");
			String topic_score = StringUtil.safeToString(
					map.get("topic_score"), "");
			if (dimensionid.equals(did) && sid.equals(seriesid)) {
				result = topic_score;
				break;
			}
		}
		return result;
	}

	/**
	 * 查询产品各项评价
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchProduct")
	public String searchProduct(HttpServletRequest request,
			HttpServletResponse response) {

		// String seriesid = StringUtil.safeToString(request
		// .getParameter("seriesid"), "");
		// String page = StringUtil
		// .safeToString(request.getParameter("page"), "1");
		//						
		// try {
		//						
		// int s = 5; // 每页显示的条数
		// Map p = new HashMap();
		// p.put("seriesid", seriesid);
		// p.put("firstrs", Integer.parseInt(page) * s - s);
		//						
		// List<Map> list = iProductService.searchCarPriceInfoByFy(p);
		// // 提供分页
		//						
		// PrintWriter out = response.getWriter();
		//						
		// // JSONArray json = new JSONArray();
		//						
		// String ucid = request.getParameter("ucid");
		// String content = request.getParameter("content");
		//						
		// Map ucmap = new HashMap();
		// if (null != ucid && !"".equals(ucid) && !"0".equals(ucid)) {
		// ucmap.put("ucid", ucid);
		// } else if (null != content && !"".equals(content)) { // &&
		// // !"0".equals(content)
		// ucmap.put("content", content);
		// }
		//						
		// // List l= new ArrayList();
		// List<Map> list2 = iProductService.searchProductpl(ucmap);
		// // Map map = new LinkedHashMap();
		// Map map2 = new LinkedHashMap();
		// for (Map map : list) {
		//						
		// if (ucid == "0") {
		// String id = StringUtil.safeToString(map.get("ZHid"), "");
		// System.out.println("ucid______" + ucid);
		// map.put("infolist", getlist(list2, id));
		// }
		// String id = StringUtil.safeToString(map.get("ZHid"), "");
		//						
		// map.put("infolist", getlist(list2, ucid));
		// map.put("infolist", getlist(list2, id));
		//						
		// }
		// for (Map m : list) {
		//						
		// // 分页
		//						
		// int max = 0;
		//						
		// int count = iProductService.searchPInfoByCount(p);
		// max = count / s;
		// if (count % s != 0)
		// max++;
		// map2.put("count", count);
		// map2.put("max", max);
		// map2.put("page", page);
		// map2.put("ucid", ucid);
		//						
		// System.out.println("总条数:" + count);
		// System.out.println("页数:" + max);
		// }
		//						
		// p.put("data1", list);
		// p.put("data2", map2);
		//						
		// JSONObject resultJSON = JSONObject.fromObject(p);
		//						
		// out.println(resultJSON);
		// System.out.println("输出的数据——————————" + resultJSON);
		// out.flush();
		// out.close();
		//						
		// } catch (IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// 分页查询 修改 陈震宇 20150512
		try {
			String seriesid = StringUtil.safeToString(request
					.getParameter("seriesid"), "");// 车系ID
			String topic = StringUtil.safeToString(request
					.getParameter("topic"), "");// 主题词
			String issatisfied = StringUtil.safeToString(request
					.getParameter("issatisfied"), "");// 满意度
			String page = StringUtil.safeToString(request.getParameter("page"),
					"1");

			int s = 5; // 每页显示的条数
			Map p = new HashMap();
			p.put("seriesid", seriesid);
			p.put("topic", topic);
			p.put("issatisfied", issatisfied);
			p.put("firstrs", Integer.parseInt(page) * s - s);

			List<Map> list = iProductService.searchMd5List(p);// md5id集合
			String md5id = "";// 查询条件
			for (int i = 0; i < list.size(); i++) {
				String id = StringUtil.safeToString(list.get(i).get(
						"content_md5_id"), "");
				System.out.println(id);
				if (!"".equals(id) && i != list.size()) {
					md5id += id + "','";
				} else {
					md5id += id;
				}
			}
			List<Map> mcList = iProductService.searchMc(md5id);// 个人信息集合
			List<Map> mctList = new ArrayList<Map>();
//			mctList = iProductService.searchMct(md5id,topic);// 评价集合
//			if(mctList.size()==0){
//				mctList=iProductService.searchContent(md5id, topic);
//			}
			
			List<Map> aList = new ArrayList<Map>();
			String sss="";
			if(!"".equals(topic)){
				List<Map> strList=iProductService.searchString(topic);
				for(Map pp : strList){
					sss = StringUtil.safeToString(pp.get("topic_synset"), "");
				}
				if(!"".equals(sss)){
					String[] st=sss.split(" ");
					for (int i = 0; i < st.length; i++) {
						mctList = iProductService.searchMct(md5id,st[i].trim());// 评价集合
						if(mctList.size()==0){
							mctList=iProductService.searchContent(md5id, st[i].trim());
						}
						aList.addAll(mctList);
					}
				}else{
					mctList = iProductService.searchMct(md5id,topic);
					if(mctList.size()==0){
						mctList=iProductService.searchContent(md5id, topic);
					}
					aList.addAll(mctList);
				}
			}else{
				mctList = iProductService.searchMct(md5id,topic);
				aList.addAll(mctList);
			}
			
			PrintWriter out = response.getWriter();

			Map map2 = new LinkedHashMap();

			for (Map map : mcList) {
				String mcid = StringUtil.safeToString(map.get("md5_id"), "");
				for (Map mmm : aList) {
					String mctid = StringUtil.safeToString(mmm.get("md5_id"),
							"");
					if (mcid.equals(mctid)) {
						map.put("infolist", getlist(aList, mctid));// 封装
					}
				}
			}

			for (Map m : list) {
				// 分页
				int max = 0;

				int count = iProductService.searchPInfoByCount(p);
				max = count / s;
				if (count % s != 0)
					max++;
				map2.put("count", count);
				map2.put("max", max);
				map2.put("page", page);

				System.out.println("总条数:" + count);
				System.out.println("页数:" + max);
			}

			p.put("data1", mcList);
			p.put("data2", map2);
			p.put("sss", sss);

			JSONObject resultJSON = JSONObject.fromObject(p);
			out.println(resultJSON);
			System.out.println("输出的数据——————————" + resultJSON);
			out.flush();
			out.close();
			
			

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/jsp/website/Product_evaluation";
	}
	
	/**
	 * 模糊查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/searchContent")
	public String searchContent(HttpServletRequest request,
			HttpServletResponse response) {
		// 分页查询 修改 陈震宇 20150512
		try {
			String seriesid = StringUtil.safeToString(request
					.getParameter("seriesid"), "");// 车系ID
			String topic = StringUtil.safeToString(request
					.getParameter("content"), "");// 主题词
			String page = StringUtil.safeToString(request.getParameter("page"),
					"1");

			int s = 5; // 每页显示的条数
			Map p = new HashMap();
			p.put("seriesid", seriesid);
			p.put("topic", topic);
			p.put("firstrs", Integer.parseInt(page) * s - s);

			List<Map> list=iProductService.searchProductpl(p);
			String md5id = "";// 查询条件
			for (int i = 0; i < list.size(); i++) {
				String id = StringUtil.safeToString(list.get(i).get(
						"md5_id"), "");
				System.out.println(id);
				if (!"".equals(id) && i != list.size()) {
					md5id += id + "','";
				} else {
					md5id += id;
				}
			}
			
			List<Map> mcList = iProductService.searchCon(md5id,seriesid,p);// 个人信息集合
			List<Map> mctList = new ArrayList<Map>();
			
			mctList = iProductService.searchMct(md5id,topic);
			if(mctList.size()==0){
				mctList=iProductService.searchContent(md5id, topic);
			}
			
			PrintWriter out = response.getWriter();

			Map map2 = new LinkedHashMap();

			for (Map map : mcList) {
				String mcid = StringUtil.safeToString(map.get("md5_id"), "");
				for (Map mmm : mctList) {
					String mctid = StringUtil.safeToString(mmm.get("md5_id"),
							"");
					if (mcid.equals(mctid)) {
						map.put("infolist", getlist(mctList, mctid));// 封装
					}
				}
			}

			for (Map m : list) {
				// 分页
				int max = 0;

				int count = iProductService.searchPInfoByCount(p);
				max = count / s;
				if (count % s != 0)
					max++;
				map2.put("count", count);
				map2.put("max", max);
				map2.put("page", page);

				System.out.println("总条数:" + count);
				System.out.println("页数:" + max);
			}

			p.put("data1", mcList);
			p.put("data2", map2);

			JSONObject resultJSON = JSONObject.fromObject(p);
			out.println(resultJSON);
			System.out.println("输出的数据——————————" + resultJSON);
			out.flush();
			out.close();
			
			

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/jsp/website/Product_evaluation";
	}
	

	/**
	 * 
	 * @param request
	 * @param modelMap
	 * @return
	 * @RequestMapping(value = "/carquotes") public String
	 *                       showcarquotes(HttpServletRequest request, ModelMap
	 *                       modelMap) { String typeid =
	 *                       StringUtil.safeToString(
	 *                       request.getParameter("typeid"), ""); String
	 *                       seriesid = StringUtil.safeToString(request
	 *                       .getParameter("seriesid"), ""); String brandid =
	 *                       StringUtil.safeToString(request
	 *                       .getParameter("brandid"), "");
	 * 
	 *                       String brand =
	 *                       StringUtil.safeToString(request.getParameter
	 *                       ("brand"), ""); String series =
	 *                       StringUtil.safeToString
	 *                       (request.getParameter("series"), ""); String type =
	 *                       StringUtil
	 *                       .safeToString(request.getParameter("type"), "");
	 * 
	 *                       String actiontype = StringUtil.safeToString(request
	 *                       .getParameter("actiontype"), "0"); // 如果
	 *                       actiontype=1 表示 是外部跳转 需要补全数据
	 * 
	 * 
	 *                       int s = 10; // 每页显示的条数 String page = StringUtil
	 *                       .safeToString(request.getParameter("page"), "1");
	 *                       String city =
	 *                       StringUtil.safeToString(request.getParameter
	 *                       ("cityname"), "上海"); List<Map> list = new
	 *                       ArrayList<Map>(); int max = 0; if
	 *                       (!"".equals(typeid) || !"".equals(seriesid)) { Map
	 *                       p = new HashMap(); p.put("city", city);
	 *                       p.put("firstrs", Integer.parseInt(page) * s - s);
	 *                       if (!"".equals(typeid)) { p.put("id", typeid); }
	 * 
	 *                       list = iProductService.searchCarPriceInfoByFy(p);
	 * 
	 *                       // request.setAttribute("resultlist",list ); int
	 *                       count = iProductService.searchPInfoByCount(p); max
	 *                       = count / s; if (count % s != 0) max++; }
	 * 
	 *                       // if ("".equals(brandid)) { // Map p = new
	 *                       HashMap(); // p.put("city", city); //
	 *                       p.put("firstrs", Integer.parseInt(page) * s - s);
	 *                       // list =
	 *                       searchPriceService.searchCarPriceInfoByFy(p); //
	 *                       max = 1; // } request.setAttribute("brand", brand);
	 *                       request.setAttribute("type", type);
	 *                       request.setAttribute("series", series);
	 *                       request.setAttribute("brandid", brandid);
	 *                       request.setAttribute("typeid", typeid);
	 *                       request.setAttribute("seriesid", seriesid);
	 *                       request.setAttribute("city", city);
	 *                       request.setAttribute("listmax", max);
	 *                       request.setAttribute("listpage", page);
	 *                       request.setAttribute("resultlist", list);
	 *                       request.setAttribute("resultlistsize",
	 *                       list.size()); return "/jsp/searchprice/carquotes";
	 *                       }
	 */

	public List<Map> getlist(List<Map> list2, String md5id) {
		List<Map> resultlist = new ArrayList<Map>();

		for (Map map : list2) {
			String md5_id = StringUtil.safeToString(map.get("md5_id"), "");
			if (md5_id.equals(md5id)) {
				resultlist.add(map);
			}
		}
		return resultlist;
	}

}
