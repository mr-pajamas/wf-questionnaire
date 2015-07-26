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

	@RequestMapping(value = "/questionnaire1")
	public String questionnaire1(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		return "/jsp/website/wenjuan1";
	}
	
	@RequestMapping(value = "/questionnaire2")
	public String questionnaire2(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		return "/jsp/website/wenjuan2";
	}
}
