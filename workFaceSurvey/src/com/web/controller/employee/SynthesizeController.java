package com.web.controller.employee;

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

import com.web.common.utils.NumberUtils;
import com.web.common.utils.StringUtil;
import com.web.common.utils.TimeUtil;
import com.web.service.IHotNewsService;
import com.web.service.ISynthesizeService;

/**
 * 汇总页面
 * 
 * @author 高扬
 * 
 */
@Controller
@RequestMapping("/synthesize")
public class SynthesizeController {

	private static final Log log = LogFactory
			.getLog(SynthesizeController.class);

	private static final String[] RANKNAME = { "0", "7", "3", "1", "2", "13",
			"9", "5", "4" };

	@Autowired
	public ISynthesizeService synthesizeService;
	@Autowired
	public IHotNewsService hotNewsService;

	@RequestMapping(value = "/index")
	public String synthesize(HttpServletRequest request,
			HttpServletResponse response) {

		
		String begindate = "";
		String enddate = "";
		begindate = TimeUtil.getPreOrNextDay(TimeUtil.getSysDate(), -90);
		enddate = TimeUtil.getSysDate();
		// 查询品牌关注度排名
		Map m=new HashMap();
		m.put("begindate", begindate);
		m.put("enddate", enddate);
		List<Map> brandlist = synthesizeService.searchBrandFoucsSpreadTop(m);
		int allbrand = synthesizeService
				.searchBrandFoucsSpreadAll(m);
		int i = 1;
		int t1 = 0;
		for (Map map : brandlist) {
			map.put("tj", count(StringUtil.safeToString(map.get("focus_count"),
					""), String.valueOf(allbrand)));
			String brandid = StringUtil.safeToString(map.get("brandid"), "");
			String spread_count = StringUtil.safeToString(map
					.get("focus_count"), "");
			if (1 == i) {
				map.put("colour", "#0070c1");
				t1 = Integer.parseInt(spread_count);
				map.put("width", "50");
			} else if ("9".equals(brandid)) {
				map.put("colour", "#91db78");
				map.put("width",  Long.parseLong(spread_count) * 50 / t1);
			} else {
				map.put("colour", "#00b1f1");
				map.put("width", Long.parseLong(spread_count) * 50 / t1);
			}
			i++;
		}

		// 查询车系关注度
		List<Map> serieslist = synthesizeService
				.searchSeriesFoucsSpreadTop(m);
		int allseries = synthesizeService.searchSeriesFoucsSpreadAll(m);
		i = 1;
		t1 = 0;
		for (Map map : serieslist) {
			map.put("tj", count(StringUtil.safeToString(map.get("focus_count"),
					""), String.valueOf(allseries)));
			String brandid = StringUtil.safeToString(map.get("brandid"), "");
			String spread_count = StringUtil.safeToString(map
					.get("focus_count"), "");

			if (1 == i) {
				map.put("colour", "#0070c1");
				t1 = Integer.parseInt(spread_count);
				map.put("width", "50");
			} else if ("9".equals(brandid)) {
				map.put("colour", "#91db78");
				map.put("width", Long.parseLong(spread_count) * 50 / t1);
			} else {
				map.put("colour", "#00b1f1");
				map.put("width", Long.parseLong(spread_count) * 50 / t1);
			}
			i++;
		}

		// 查询市场网络传播效率
		i = 1;
		t1 = 0;
		int t2 = 0;
		int t3 = 0;
		List<Map> ranklist = synthesizeService.searchRankFocusSpread(m);
		int spread_countall = 0;
		int foucs_countall = 0;
		int maxspread_count = 0;
		int maxfoucs_count = 0;
		long maxdata3 = 0;
		
		for(Map map:ranklist){
			int foucs_count = Integer.parseInt(StringUtil.safeToString(map.get("foucs_count"), ""));
			int spread_count = Integer.parseInt(StringUtil.safeToString(map.get("spread_count"), ""));
			spread_countall = spread_countall + spread_count;
			foucs_countall = foucs_countall + foucs_count;
		}
		for (Map map : ranklist) {
			int foucs_count = Integer.parseInt(StringUtil.safeToString(map.get("foucs_count"), ""));
			int spread_count = Integer.parseInt(StringUtil.safeToString(map.get("spread_count"), ""));
			Double data1 = count(String.valueOf(foucs_count), String.valueOf(foucs_countall));
			Double data2 = count(String.valueOf(spread_count), String.valueOf(spread_countall));
			long data3 = Math.round(data1 / data2 * 100);

			if (foucs_count > maxfoucs_count) {
				maxfoucs_count = foucs_count;
			}
			if (spread_count > maxspread_count) {
				maxspread_count = spread_count;
			}
			if (data3 > maxdata3) {
				maxdata3 = data3;
			}

		}
		int w1 = 40;
		int w2 = 40;
		int w3 = 40;
		for (Map map : ranklist) {
			int foucs_count = Integer.parseInt(StringUtil.safeToString(map.get("foucs_count"), ""));
			int spread_count = Integer.parseInt(StringUtil.safeToString(map.get("spread_count"), ""));
			Double data1 = count(String.valueOf(foucs_count), String.valueOf(foucs_countall));
			Double data2 = count(String.valueOf(spread_count), String.valueOf(spread_countall));
			long data3 = Math.round(data1 / data2 * 100);
			String fh = "--";
			map.put("data1", data1 + "%");
			map.put("data2", data2 + "%");
			map.put("data3", data3);
			
			
			if (0 == data3) {
				map.put("data3", fh);
			}
			if (0 == data2) {
				map.put("data2", fh);
			}
			if (0 == data1) {
				map.put("data1", fh);
			}

			if (1 == i) {
				map.put("colour", "#00b1f1");
			} else if (i == ranklist.size()) {
				map.put("colour", "#91db78");
			} else {
				map.put("colour", "#00b1f1");
			}

			if (data3 >= 100) {
				map.put("colour2", "#0000FF");
				map.put("float", "left");
			} else {
				map.put("colour2", "#FF0000");
				map.put("float", "right");
			}

			if (foucs_count == maxfoucs_count) {
				map.put("w1", w1);
			} else {
				map.put("w1", (long) foucs_count * w1 / (long) maxfoucs_count);
			}
			if (spread_count == maxspread_count) {
				map.put("w2", w2);
			} else {
				map.put("w2", (long) spread_count * w2/ (long) maxspread_count);
			}


			if (data3 == maxdata3) {
				map.put("w3", w3);
			} else {
				if (data3 > 100) {
					long d4 = data3 - 100;
					map.put("w3", d4 * w3 / (maxdata3-100));
				} else if (0 == data3) {
					map.put("w3", 0);
				} else {
					long d4 = 100 - data3;
					map.put("w3", d4 * w3 / (maxdata3-100));
				}
			}
			i++;
		}

		List<Map> ranklist2 = synthesizeService.searchRankFocusSpread2(m);

		// 各级别网络声量
		String rankFocusSpread = addRankFocusSpread(ranklist2);
		String rankFocusSpreadTip = addRankFocusSpreadTip(ranklist2);

		// 首页热点新闻
		Map map = new HashMap();
		map.put("begindate", begindate);
		map.put("enddate", enddate);
		map.put("brandid", "9");
		List<Map> newslist1 = hotNewsService.searchHotNewsMonthTitle(map);
		request.setAttribute("fc1", synthesizeService
				.searchBrandFoucsSpreadAll(map));

		// 热点新闻地图
		request.setAttribute("brandlist", brandlist);
		request.setAttribute("serieslist", serieslist);
		request.setAttribute("ranklist", ranklist);
		request.setAttribute("rankFocusSpread", rankFocusSpread);
		request.setAttribute("rankFocusSpreadTip", rankFocusSpreadTip);
		request.setAttribute("newslist1", newslist1);

		return "/jsp/website/synthesize";
	}

	/**
	 * 生成图形数据
	 */
	public String addRankFocusSpread(List<Map> list) {
		StringBuffer result = new StringBuffer();
		String typename = "";
		for (Map map : list) {
			String source_type = StringUtil.safeToString(
					map.get("source_type"), "");
			String spread_count = StringUtil.safeToString(map
					.get("spread_count"), "");
			if (!typename.equals(source_type)) {
				if (result.length() > 0) {
					result.append("]},");
				}
				result.append(addSourceType(source_type, addSourceData(
						source_type, list)));
				typename = source_type;
			}
		}
		result.append("]}");
		return result.toString();
	}

	public String addSourceData(String source_type, List<Map> list) {
		StringBuffer result = new StringBuffer();
		for (String rn : RANKNAME) {
			if (result.length() > 0) {
				result.append(",");
			}
			int value = 0;
			for (Map map : list) {
				String type = StringUtil.safeToString(map.get("source_type"),
						"");
				String rankid = StringUtil.safeToString(map.get("rankid"), "");
				String rank = StringUtil.safeToString(map.get("rank"), "");
				String spread_count = StringUtil.safeToString(map
						.get("spread_count"), "");
				if ("0".equals(rn)) {
					if (type.equals(source_type) && !rankid.equals("7")
							&& !rankid.equals("1") && !rankid.equals("2")
							&& !rankid.equals("3") && !rankid.equals("4")
							&& !rankid.equals("5") && !rankid.equals("9")
							&& !rankid.equals("13")) {
						value += Integer.parseInt(spread_count);
					}
				} else {
					if (type.equals(source_type) && rn.equals(rankid)) {
						value = Integer.parseInt(spread_count);
						break;
					}
				}
			}
			result.append(value);
		}
		return result.toString();
	}

	public String addSourceType(String source_type, String spread_count) {
		StringBuffer result = new StringBuffer();
		result.append("{ name:'").append(source_type).append("',");
		result.append(" type:'bar',");
		result.append(" barWidth : 10,");
		result.append(" stack: '来源',");
		result.append(" data:[").append(spread_count);
		return result.toString();
	}

	/**
	 * 生成图形数据TIP
	 */
	public String addRankFocusSpreadTip(List<Map> list) {
		StringBuffer result = new StringBuffer("[");
		String typename = "";
		for (Map map : list) {
			String source_type = StringUtil.safeToString(
					map.get("source_type"), "");
			if (!typename.equals(source_type)) {
				if (result.length() > 1) {
					result.append(",");
				}
				result.append("'").append(source_type).append("'");
				typename = source_type;
			}

		}
		result.append("]");
		return result.toString();
	}

	/**
	 * 计算百分比
	 * 
	 * @return
	 */
	public Double count(String value, String allvalue) {
		Double c = Double.parseDouble(value) * 100
				/ Double.parseDouble(allvalue);
		return NumberUtils.setvalue(c);
	}

	/**
	 * 查询网络声量
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/searchtopic")
	public void searchtopic(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String bid = StringUtil.safeToString(request.getParameter("bid"),
					"");
			String begindate = "";
			String enddate = "";
			begindate = TimeUtil.getPreOrNextDay(TimeUtil.getSysDate(), -90);
			enddate = TimeUtil.getSysDate();
			Map map = new HashMap();
			map.put("begindate", begindate);
			map.put("enddate", enddate);
			map.put("brandid", bid);
			List<Map> list = synthesizeService.searchRegionHotTopic(map);
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
	@RequestMapping(value = "/searchtopictop3")
	public void searchtopictop3(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String bid = StringUtil.safeToString(request.getParameter("bid"),
					"");
			String provincename = StringUtil.safeToString(request
					.getParameter("provincename"), "");
			String begindate = "";
			String enddate = "";
			begindate = TimeUtil.getPreOrNextDay(TimeUtil.getSysDate(), -90);
			enddate = TimeUtil.getSysDate();
			// 查询品牌关注度排名
			Map map = new HashMap();
			map.put("brandid", bid);
			map.put("provincename", provincename);
			map.put("begindate", begindate);
			map.put("enddate", enddate);
			List<Map> list = synthesizeService
					.searchRegionHotTopicByProvincename(map);
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
