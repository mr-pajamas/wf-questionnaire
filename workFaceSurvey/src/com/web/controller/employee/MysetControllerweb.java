package com.web.controller.employee;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping("/myset")
public class MysetControllerweb {
	//private static final Log log = LogFactory.getLog(HomeController.class);
//	@Autowired
//	public ContentService contentService;
	


	@RequestMapping(value = "/showmyset")
	public String showcountent(HttpServletRequest request, HttpServletResponse response) {
    
		return "/jsp/website/Mysetting";

	}

}
