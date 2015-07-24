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
		Map map=new HashMap();
		String page = StringUtil.safeToString(request.getParameter("page"), "1");
        int totalRows = synthesizeService.getTotalRows(map);
        int intPage = Integer.valueOf(page);
        int pageSize = 5;
        int totalPage = 0;
        if(totalRows%pageSize == 0){
        	totalPage = totalRows/pageSize;
        }else{
        	totalPage = totalRows/pageSize + 1;
        }
        int start = pageSize*(intPage - 1);
        map.put("firstrs", String.valueOf(start));
		List<Map> list=synthesizeService.searchUser(map);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalRows",totalRows);
		request.setAttribute("listPage", intPage);
		
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
