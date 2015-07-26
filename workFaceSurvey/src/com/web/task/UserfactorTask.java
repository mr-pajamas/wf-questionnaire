package com.web.task;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.web.common.utils.StringUtil;
import com.web.common.utils.TimeUtil;
import com.web.entity.Constellation;
import com.web.service.IPeopleMapService;

@Component("userfactorTask")
public class UserfactorTask {

	@Autowired
	public IPeopleMapService peopleMapService;	
	

	private static final Log log = LogFactory.getLog(UserfactorTask.class);

	public static final String[] starArr = { "魔羯座", "水瓶座", "双鱼座", "牡羊座", "金牛座",
			"双子座", "巨蟹座", "狮子座", "处女座", "天秤座", "天蝎座", "射手座" };
	public static final int[] DayArr = { 22, 20, 19, 21, 21, 21, 22, 23, 23,
			23, 23, 22 };
	
	public static final String[] starEnameArr = { "Capricorn", "Aquarius", "Pisces", "Aries", "Taurus",
		"Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius" };

	public void updatCconstellation() {
		//每天23点执行
		log.info("task---------updatCconstellation-----start");
		List<Map> list = peopleMapService.searchUserfactor(new HashMap());
		for (Map map : list) {
			String uid = StringUtil.safeToString(map.get("id"), "");
			String birthday = StringUtil.safeToString(map.get("birthday"), "");
			String seriesid = StringUtil.safeToString(map.get("seriesid"), "");
			if(!"".equals(birthday)){				
				Constellation constellation=new Constellation();
				constellation.setCreatetime(new Date());
				constellation.setUpdatetime(new Date());
				constellation.setUserfactorid(Integer.parseInt(uid));
				if(!"".equals(seriesid)){
					constellation.setSeriesid(Integer.parseInt(seriesid));	
				}
				constellation.setStar(getConstellation(TimeUtil.formatDate(birthday, "yyyy-MM-dd HH:mm:ss")));
				constellation.setStarename(getStarEname(TimeUtil.formatDate(birthday, "yyyy-MM-dd HH:mm:ss")));
				peopleMapService.saveConstellation(constellation);
			}
		}

		log.info("task---------updatCconstellation-------end");
	}

	public static String getStarEname(Date time) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		if (day < DayArr[month]) {
			month = month - 1;
		}
		if (month >= 0) {
			return starEnameArr[month];
		}
		return starEnameArr[0];
	}
	
	public static String getConstellation(Date time) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		if (day < DayArr[month]) {
			month = month - 1;
		}
		if (month >= 0) {
			return starArr[month];
		}
		return starArr[0];
	}
	public static void main(String args[]){
		UserfactorTask ut = new UserfactorTask();
		ut.updatCconstellation();
	}

}
