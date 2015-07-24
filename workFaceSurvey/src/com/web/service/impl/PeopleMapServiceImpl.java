package com.web.service.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.common.dao.BaseDAOSpring;
import com.web.common.service.impl.CommonServiceSpringImpl;
import com.web.entity.Constellation;
import com.web.service.IPeopleMapService;

@Service
public class PeopleMapServiceImpl extends CommonServiceSpringImpl implements
		IPeopleMapService {
	@Autowired
	BaseDAOSpring baseDAOSpring;
	public List<Map> searcDataByUsing(Map map) {
		//String hql="";
		StringBuffer strbuf = new StringBuffer();
		String sql = "SELECT seriesid, COUNT(working) working, COUNT(pickkids) pickkids, COUNT(shopping) shopping," +
         " COUNT(travel) travel, COUNT(longdis) longdis, COUNT(busipick) busipick, COUNT(makefriends) makefriends, "   + 
         "COUNT(stuff) stuff, COUNT(crossctry) crossctry, COUNT(race) race " +
         "FROM("	+
         "SELECT seriesid, CASE WHEN ext_purpose LIKE '%上下班%' THEN '上下班' END 'working', " + 
         "CASE WHEN ext_purpose LIKE '%接送小孩%' THEN '接送小孩' END 'pickkids', " +
        		"CASE WHEN ext_purpose LIKE '%购物%' THEN '购物' END 'shopping', " +
        		"CASE WHEN ext_purpose LIKE '%自驾游%' THEN '自驾游' END 'travel', " +
        		"CASE WHEN ext_purpose LIKE '%跑长途%' THEN '跑长途' END 'longdis', " +
        		"CASE WHEN ext_purpose LIKE '%商务接送%' THEN '商务接送' END 'busipick', " +
        		"CASE WHEN ext_purpose LIKE '%泡妞%' THEN '交友' END 'makefriends', " +
        		"CASE WHEN ext_purpose LIKE '%拉货%' THEN '拉货' END 'stuff', " +
        		"CASE WHEN ext_purpose LIKE '%越野%' THEN '越野' END 'crossctry', " +
        		"CASE WHEN ext_purpose LIKE '%赛车%' THEN '赛车' END 'race' " +
        		"FROM mouth_content " +
        		"GROUP BY seriesid, working, pickkids, shopping, travel, longdis, busipick, makefriends, stuff, crossctry, race " +
        		") a " +
          "where 1=1";
		strbuf.append(sql);
		if(map != null){
			if(map.containsKey("seriesid")){
				strbuf.append(" and seriesid = " + map.get("seriesid"));
			}
		}
		//System.out.println("use === " + strbuf.toString());
		strbuf.append(" GROUP BY seriesid");
		return super.searchObjectBySQL(strbuf.toString(), null, null);
	}
    /**
     *Get Datas for age group 
     */
	public List<Map> searchPeoDataByAge(Map map) {
		StringBuffer strbuf = new StringBuffer();
		String sql="SELECT CASE WHEN age BETWEEN 0 AND 19 THEN '19岁以下' " 
                   + "WHEN age BETWEEN 20 AND 29 THEN '20-29' "
                   + "WHEN age BETWEEN 30 AND 39 THEN '30-39' "
                   + "WHEN age BETWEEN 40 AND 49 THEN '40-49' "
                   + "WHEN age >49 THEN '50岁以上' "
                   + "END ageGroup, "
                   + "COUNT(age)/(SELECT COUNT(age) FROM userfactor WHERE 1=1 AND age != '' AND age IS NOT NULL";
		strbuf.append(sql);
		if(map != null){
			if(map.containsKey("seriesid")){
                  strbuf.append(" AND seriesid =" + map.get("seriesid") + ")proportion "
                   + "FROM userfactor "
		           + "WHERE 1=1 AND age IS NOT NULL AND age != '' ");				
				strbuf.append("and seriesid = " + map.get("seriesid"));
			}
		}
		
		strbuf.append(" GROUP BY ageGroup ");	
		System.out.println("age group ==" + strbuf.toString());
		return super.searchObjectBySQL(strbuf.toString(), null, null);
	}

	public List<Map> searchPeoDataByGender(Map map) {
		StringBuffer strbuf = new StringBuffer();
		String sql="SELECT gender, CASE when gender = 1 OR gender='男' THEN '男' " +
				   " WHEN gender = 0 OR gender = '女' THEN '女' END sex, "
                  + "COUNT(gender) gendernumber "
                  + "FROM userfactor "+
                    "WHERE 1=1 " +
                    "AND gender IS NOT NULL " +
                    "AND gender != ''";
		 strbuf.append(sql);
		 if(map != null){
				if(map.containsKey("seriesid")){
					strbuf.append("AND seriesid = " + map.get("seriesid"));
				}
		}
		 strbuf.append(" GROUP BY sex ");		
		return super.searchObjectBySQL(strbuf.toString(), null, null);
	}

	public List<Map> searchRegDataByProvince(Map map) {
		StringBuffer strbuf = new StringBuffer();
		String sql = "SELECT p.provincename pname, cs.series sname, sum(u.focus_count) focusnumber " 
			  + "FROM userfactor u "
			  + "JOIN province p "
			  + "ON p.provinceid = u.provinceid "
			  + "JOIN car_series cs "
			  + "ON cs.seriesid = u.seriesid " +
			  	"WHERE 1=1 ";
	   strbuf.append(sql);
		if(map != null){
			if(map.containsKey("seriesid")){
				strbuf.append("AND u.seriesid = " + map.get("seriesid"));
			}
		}		
		strbuf.append(" GROUP BY pname, sname ORDER BY focusnumber DESC");
		return super.searchObjectBySQL(strbuf.toString(), null, null);
        //return super.searchObjectBySQL(sql, null, null);
	}
	public List<Map> searchRegDataByCities(Map map) {
		// TODO Auto-generated method stub
		StringBuffer strbuf = new StringBuffer();
		String sql = "SELECT uf.city, uf.series sname, cg.longitude, cg.latitude, sum(focus_count) totalcount " +
				"FROM userfactor uf " +
				"LEFT JOIN city_geocode cg " +
				"ON uf.city = cg.city_name " +
				"WHERE 1=1 AND " +
				"city IS NOT Null AND city != '' ";
		strbuf.append(sql);
		if(map != null){
			if(map.containsKey("seriesid")){
				strbuf.append("AND seriesid = " + map.get("seriesid") + " ");
			}
		}
		
		strbuf.append("GROUP BY city, sname ORDER BY totalcount DESC");	
		//System.out.println("Cities data= " + strbuf.toString());
		return super.searchObjectBySQL(strbuf.toString(), null, null);
	}
	public List<Map> searchUsertags(Map map) {
		StringBuffer strbuf = new StringBuffer();
		String sql = "SELECT seriesid, tag, tag_count " +
				     "FROM usertag " +
				     "WHERE 1=1 ";
        strbuf.append(sql);
        if(map != null){
        	if(map.containsKey("seriesid")){
        		strbuf.append("and seriesid = " + map.get("seriesid") + " ");
        	}
        }        
        strbuf.append("ORDER BY tag_count DESC");
        //System.out.println("userTags === " + strbuf.toString());
		// TODO Auto-generated method stub
        return super.searchObjectBySQL(strbuf.toString(), null, null);
	}
	public List<Map> searchMedals(Map map) {
		StringBuffer strbuf = new StringBuffer();
		String sql = "SELECT COUNT(yjcm) countyjcm, COUNT(szqr) countszqr, COUNT(rlsz) countrlsz, COUNT(yjsz) countyjsz, COUNT(txfs) counttxfs, " +
				"COUNT(qbcs) countqbcs, COUNT(qtyh) countqtyh, COUNT(yyjd) countyyjd, COUNT(djbq) countdjbq, COUNT(ttsd) countttsd, " +
				"COUNT(sdql) countsdql, COUNT(ycej) countycej, COUNT(wjaz) countwjaz, COUNT(ycdy) countycdy, COUNT(bfbz) countbfbz, COUNT(pgwd) countpgwd " +
				"FROM " +
				    "(SELECT  seriesid,CASE WHEN category LIKE '%一举成名%' THEN '一举成名' END 'yjcm', " +
				    "CASE WHEN category LIKE '%舌战群儒%' THEN '舌战群儒' END 'szqr', " +
				    "CASE WHEN category LIKE '%如来神掌%' THEN '如来神掌' END 'rlsz', " +
				    "CASE WHEN category LIKE '%语惊四座%' THEN '语惊四座' END 'yjsz', " +
				    "CASE WHEN category LIKE '%谈笑风生%' THEN '谈笑风生' END 'txfs', " +
				    "CASE WHEN category LIKE '%七步成诗%' THEN '七步成诗' END 'qbcs', " +
				    "CASE WHEN category LIKE '%情投意盒%' THEN '情投意盒' END 'qtyh', " +
				    "CASE WHEN category LIKE '%一言九顶%' THEN '一言九顶' END 'yyjd', " +
				    "CASE WHEN category LIKE '%斗酒百篇%' THEN '斗酒百篇' END 'djbq', " +
				    "CASE WHEN category LIKE '%谈天说地%' THEN '谈天说地' END 'ttsd', " +
				    "CASE WHEN category LIKE '%手到擒来%' THEN '手到擒来' END 'sdql', " +
				    "CASE WHEN category LIKE '%一蹴而就%' THEN '一蹴而就' END 'ycej', " +
				    "CASE WHEN category LIKE '%我就愛贊%' THEN '我就愛贊' END 'wjaz', " +
				    "CASE WHEN category LIKE '%一锤定音%' THEN '一锤定音' END 'ycdy', " +
				    "CASE WHEN category LIKE '%百发百中%' THEN '百发百中' END 'bfbz', " +
				    "CASE WHEN category LIKE '%刨根问底%' THEN '刨根问底' END 'pgwd' " +
				 "FROM userfactor) ca " +
				 "WHERE 1=1 ";
		strbuf.append(sql);
		if(map != null){
			if(map.containsKey("seriesid")){
				strbuf.append("AND seriesid = " + map.get("seriesid") + " ");
			}
		}					
		strbuf.append("GROUP BY seriesid");	
		// TODO Auto-generated method stub
		return super.searchObjectBySQL(strbuf.toString(), null, null);
	}
	public List<Map> searchStars(Map map) {
		StringBuffer  strbuf = new StringBuffer();
		strbuf.append("SELECT cons.star stars, cons.star_ename, " +
				     "SUM(u.focus_count)");
		if(map != null){
			if(map.containsKey("seriesid")){
				strbuf.append("/(SELECT SUM(u.focus_count) FROM userfactor u JOIN constellation star " +
						      "ON u.seriesid = star.seriesid AND u.id = star.userfactorid WHERE 1=1 AND star.seriesid = " + map.get("seriesid")+ ") proportion ");
				strbuf.append(
					     "FROM userfactor u " +
					     "JOIN constellation cons " +
					     "ON cons.seriesid = u.seriesid AND u.id = cons.userfactorid " +
					     "WHERE 1=1 ");				   
	            strbuf.append("AND u.seriesid = " + map.get("seriesid") + " GROUP BY stars ORDER BY proportion DESC");	
	        
			}
		}
		// TODO Auto-generated method stub
		return super.searchObjectBySQL(strbuf.toString(), null, null);
	}

	public List<Map> searchStarEname(Map map){
		StringBuffer  strbuf = new StringBuffer();
		strbuf.append("SELECT star_ename, proportion FROM (SELECT cons.star stars, cons.star_ename, " +
	     "SUM(u.focus_count)");
		if(!map.isEmpty()){
			if(map.containsKey("seriesid")){
				strbuf.append("/(SELECT SUM(u.focus_count) FROM userfactor u JOIN constellation star " +
						      "ON u.seriesid = star.seriesid AND u.id = star.userfactorid WHERE 1=1 AND star.seriesid = " + map.get("seriesid")+ ") proportion ");
				strbuf.append(
					     "FROM userfactor u " +
					     "JOIN constellation cons " +
					     "ON cons.seriesid = u.seriesid AND u.id = cons.userfactorid " +
					     "WHERE 1=1 ");				   
			   strbuf.append("AND u.seriesid = " + map.get("seriesid") + " GROUP BY stars ORDER BY proportion DESC)series_stars ");		
	        }
			if(map.containsKey("star")){
				strbuf.append("WHERE stars = '" + map.get("star") + "'");
			}
		}
		//System.out.println(strbuf.toString());
		return super.searchObjectBySQL(strbuf.toString(), null, null);
	}
	public List<Map> searchHabits(Map map) {
		StringBuffer strbuf = new StringBuffer();
		strbuf.append("select habit, frequency/(select sum(frequency) from habits where 1=1 ");		
	   if(map != null){
		   if(map.containsKey("seriesid")){
			   strbuf.append("and seriesid = " + map.get("seriesid")+ ") proportion from habits where 1=1 and seriesid = " +  map.get("seriesid") );			   
		   }
	   }
       strbuf.append(" GROUP BY habit ");
       //System.out.println("habits=" + strbuf.toString());
		// TODO Auto-generated method stub
       return super.searchObjectBySQL(strbuf.toString(), null, null);
	}

	/**
	 * 查询userfactor中没有constellation记录的信息
	 * @param map
	 * @return
	 */
	
	public List<Map> searchUserfactor(Map map){
		StringBuffer sql=new StringBuffer();
		sql.append(" SELECT t.id,t.birthday,t.seriesid FROM userfactor t LEFT JOIN constellation a ON t.id=a.userfactorid " +
				" WHERE a.userfactorid IS NULL and t.birthday IS NOT NULL");
	 	return super.searchObjectBySQL(sql.toString(), null, null);
	}
	
	/**
	 * 保存Constellation对象
	 * @param constellation
	 */
	public void saveConstellation(Constellation constellation){
		super.saveObject(constellation);
	}
	
}
