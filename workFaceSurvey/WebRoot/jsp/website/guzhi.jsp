<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线估值</title>
  <link href="<%=webRoot %>/css/ztw/comm-20150114.css" type="text/css" rel="stylesheet">
  <link href="<%=webRoot %>/css/ztw/tbwb-3.css" type="text/css" rel="stylesheet">
  <link type="text/css" href="<%=webRoot %>/css/ztw/new_lstyle.css" rel="stylesheet">
  <link type="text/css" href="<%=webRoot %>/css/ztw/eval-report.css" rel="stylesheet">
</head>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <script src="<%=webRoot %>/js/jquery-1.11.1.js" rel="stylesheet"  type="text/javascript"></script>
 <script type="text/javascript">
	$(function(){
	 var json='${json}';
	 var a=json.split(",");
	 for (var i in a){
		 var b=$("#"+a[i]).attr("class");
		 var c=b.replace("hover","checked");
		 $("#"+a[i]).attr("class",c);
	 }
	});
</script>
<body>
﻿<div class="head"><!--头开始-->  
	<div class="area">
		<div class="head-l">
			<a href="http://www.91survey.com/"><img width="178" height="66" src="<%=webRoot %>/css/ztw/logo.png" alt="logo"></a>
		</div>
		<div class="head-r">
			<div class="head-zc" id="LoginBar">
				<span class="bor" onclick="javascript:ShowLoginRegist('1');"><a href="javascript:void(0);">注册</a></span>
				<span onclick="javascript:ShowLoginRegist('0');"><a href="javascript:void(0);">登录</a></span>   
			</div>
			
		</div>
	</div>
</div><!--头结束-->
<div class="nav"><!--导航开始-->
		<ul class="ulmenu">
					<li><a href='<%=webRoot %>'>首页</a></li>
				<li><a href='<%=webRoot %>/admin/home/assessment'>在线估值</a></li>
				<li><a href='<%=webRoot %>/usercar/index'>我的二手车</a></li>
		</ul>
</div><!--导航结束-->
<!--面包屑开始-->
<div class="mbx">
	<span><a href="#">当前位置</a></span> ： <span><a href="#">二手车评估</a></span> &gt; <span><a href="#">上海二手车评估</a></span> &gt; <span><a class="zd-blue-a" href="#">上海2014款 奥迪A6L 舒适型二手车评估详情</a></span>
</div>
<!--面包屑结束-->

<div id="main">

	    <!--顶部title [[-->
	    <div id="m-title">
		    <h1>${map.vehiclename}<span>评估报告</span></h1>
		    <p><fmt:formatDate value="${map.createtime}" pattern="yyyy年MM月dd日"/> 生成评估报告</p>
	    </div>
	    <!--顶部title ]]-->

	    <!--填写车辆信息 [[-->
	    <div class="module-info">

	    	<h2><b><i class="ico-info-msg"></i><u>车辆信息</u></b></h2>
		    <div class="exact-module">
			    <div class="exact-cost">
				    <div class="p-carmodel">
					    
				    <img src='<%=webRoot %>${map.vehicleimg}' width="370" height="290">
					    
					    <p class="p-msg">（本图片仅供参考，颜色以实物为准）</p>
				    </div>
				    <!--<i class="star star-lv5"></i>-->
				    <p>您的车况为：<span>${map.carcondition}</span></p>
				    <p>个人交易价：<span>${map.price2}万元</span></p>
				 
			    </div>
			    <div class="form-table exact-form-table">

				    <ul>
					    <li class="exact-info">
						    <div class="mb15"><p class="exact-info-title">上牌城市</p><p>${map.cityname}</p></div>
						    <div><p class="exact-info-title">车身颜色</p><p>${map.color}</p></div>
					    </li>
					    <li class="exact-info">
						    <div class="mb15"><p class="exact-info-title">上牌时间</p><p>${map.date}</p></div>
						    <div><p class="exact-info-title">过户次数</p><p>${map.uesd}</p></div>
					    </li>
					    <li class="exact-info">
						    <div class="mb15"><p class="exact-info-title">行驶里程</p><p>${map.mileage}</p></div>
						    <div><p class="exact-info-title">保养情况</p><p>${map.maintain}</p></div>
					    </li>
					    <li class="exact-info">
						    <div class="mb15"><p class="exact-info-title">保险到期</p><p>${map.dueday }</p></div>
						    <div><p class="exact-info-title">最高维修费</p><p>${map.fee}元</p></div>
					    </li>
					    <!--<li class="exact-info">-->
						    <!--<div class="mb15"><p class="exact-info-title">年检到期</p><p></p></div>-->
						    <!--<div></div>-->
					    <!--</li>-->
				    </ul>
				   
<c:choose>
<c:when test="${map.price1==0.0}">
 <div class="show-cost">
					    <div class="cost-line">
						    <span class="txt-newcar">新车价</span>						    
						    <div class="costdiv max-cost" data-cost="10.90万">
							    <i class="ico-cir"></i>
							    <p class="cost-btm">${map.price3}万</p>
						    </div>
						    <div class="costdiv newcar-cost" data-cost="14.69万">
							    <i class="ico-cir"></i>
							    <p class="cost-btm">${map.price4}万</p>
						    </div>
						    <div style="left: 220px;" class="costdiv buy-cost" data-cost="11.04万">
							    <ul style="opacity: 1; margin-bottom: 14px;" class="buycost-pop">
								    <li class="pop-title">
									    个人交易价
								    </li>
								    <li class="pop-cost">
									    ¥${map.price2}万
									    <b class="ico-tip ico-tip-f">◆</b>
									    <b class="ico-tip ico-tip-e">◆</b>
								    </li>
							    </ul>
							    <i class="ico-cir"></i>
						    </div>
						    <div class="line-midcost2">
							    <span></span>
						    </div>
					    </div>
				    </div>
</c:when>
<c:when test="${map.price3==0.0}">
 <div class="show-cost">
					    <div class="cost-line">
						    <span class="txt-newcar">新车价</span>						    
						    <div class="costdiv max-cost" data-cost="10.90万">
							    <i class="ico-cir"></i>
							    <p class="cost-btm">${map.price1}万</p>
						    </div>
						    <div class="costdiv newcar-cost" data-cost="14.69万">
							    <i class="ico-cir"></i>
							    <p class="cost-btm">${map.price4}万</p>
						    </div>
						    <div style="left: 370px;" class="costdiv buy-cost" data-cost="11.04万">
							    <ul style="opacity: 1; margin-bottom: 14px;" class="buycost-pop">
								    <li class="pop-title">
									     个人交易价
								    </li>
								    <li class="pop-cost">
									    ¥${map.price2}万
									    <b class="ico-tip ico-tip-f">◆</b>
									    <b class="ico-tip ico-tip-e">◆</b>
								    </li>
							    </ul>
							    <i class="ico-cir"></i>
						    </div>
						    <div class="line-midcost3">
							    <span></span>
						    </div>
					    </div>
				    </div>
</c:when>
<c:otherwise>
		 		  <div class="show-cost">
					    <div class="cost-line">
						    <span class="txt-newcar">新车价</span>
						    <div class="costdiv min-cost" data-cost="9.95万">
							    <i class="ico-cir"></i>
							    <p class="cost-btm">${map.price1}万</p>
						    </div>
						    <div class="costdiv max-cost" data-cost="10.90万">
							    <i class="ico-cir"></i>
							    <p class="cost-btm">${map.price3}万</p>
						    </div>
						    <div class="costdiv newcar-cost" data-cost="14.69万">
							    <i class="ico-cir"></i>
							    <p class="cost-btm">${map.price4}万</p>
						    </div>
						    <div style="left: 220px;" class="costdiv buy-cost" data-cost="11.04万">
							    <ul style="opacity: 1; margin-bottom: 14px;" class="buycost-pop">
								    <li class="pop-title">
									    个人交易价
								    </li>
								    <li class="pop-cost">
									    ¥${map.price2}万
									    <b class="ico-tip ico-tip-f">◆</b>
									    <b class="ico-tip ico-tip-e">◆</b>
								    </li>
							    </ul>
							    <i class="ico-cir"></i>
						    </div>
						    <div class="line-midcost">
							    <span>合理价格区间</span>
						    </div>
					    </div>
				    </div>
</c:otherwise>
</c:choose>
				    
				 
			    </div>
		    </div>
		    <div class="clear"></div>
	    </div>
	    <div class="report-title">
		    <img src="<%=webRoot %>/css/ztw/report-title.png">
	    </div>
	    <div class="module-info mt40">
	    	<h2><b><i class="ico-info-aspect"></i><u>车辆外观</u></b></h2>
		    <div class="select-info">
			    <div class="error-list">
					
					<dl>
						<dt>前保险杠</dt>
						<dd>一般剐蹭碰撞，需要局部钣金</dd>
					</dl>
					
			    </div>
				<div class="bg-info select-aspect fr">
					<!--右侧前后轮 [[-->
					<a id="forntRightwheel" data-id="wg-cl" href="javascript:void(0);" key-name="YQL" data-info="0" class="place-carinfo cl-rf cl-rf-hover">
						<i class="ico-cl"></i>
					</a>
					<a id="rearRightwheel" data-id="wg-cl" href="javascript:void(0);" key-name="YHL" data-info="0" class="place-carinfo cl-re cl-re-hover">
						<i class="ico-cl"></i>
					</a>
					<!--右侧前后轮 ]]-->

					<!--右侧前后门、翼子板 [[-->
					<a id="forntRightfender" data-id="wg-def" href="javascript:void(0);" key-name="YQYZB" data-info="0" class="place-carinfo yzb-rf yzb-rf-hover">
						<i></i>
					</a>
					<a  id="forntRightdoor" data-id="wg-def" href="javascript:void(0);" key-name="YQM" data-info="0" class="place-carinfo door-rf door-rf-hover">
						<i></i>
					</a>
					<a id="rearRightdoor" data-id="wg-def" href="javascript:void(0);" key-name="YHM" data-info="0" class="place-carinfo door-re door-re-hover">
						<i></i>
					</a>
					<a id="rearRightfender" data-id="wg-def" href="javascript:void(0);" key-name="YHYZB" data-info="0" class="place-carinfo yzb-re yzb-re-hover">
						<i></i>
					</a>
					<!--右侧前后门、翼子板 ]]-->

					<!--车身前保险杠至后保险杠部分 [[-->
					<a id="forntBumper" data-id="wg-def" href="javascript:void(0);" key-name="QBXG" data-info="0" class="place-carinfo guard-f guard-f-hover">
						<i></i>
					</a>
					<a id="engineHood" data-id="wg-def" href="javascript:void(0);" key-name="FDJCG" data-info="0" class="place-carinfo engine-lid engine-lid-hover">
						<i></i>
					</a>
					<!--<a data-id="wg-cd" href="javascript:void(0);" key-name="CD" data-info="0" class="place-carinfo roof roof-hover">-->
						<!--<i></i>-->
					<!--</a>-->
					<a id="baggageHood" data-id="wg-def" href="javascript:void(0);" key-name="HBXG2" data-info="0" class="place-carinfo trunk-lid trunk-lid-hover">
						<i></i>
					</a>
					<a id="rearBumper" data-id="wg-def" href="javascript:void(0);" key-name="HBXG" data-info="0" class="place-carinfo guard-e guard-e-hover">
						<i></i>
					</a>
					<!--车身前保险杠至后保险杠部分 ]]-->

					<!--车身左侧前后门、翼子板 [[-->
					<a id="forntLeftfender" data-id="wg-def" href="javascript:void(0);" key-name="ZQYZB" data-info="0" class="place-carinfo wing-lf wing-lf-hover">
						<i></i>
					</a>
					<a id="forntLeftdoor" data-id="wg-def" href="javascript:void(0);" key-name="ZQM" data-info="0" class="place-carinfo door-lf door-lf-hover">
						<i></i>
					</a>
					<a id="rearLeftdoor" data-id="wg-def" href="javascript:void(0);" key-name="ZHM" data-info="0" class="place-carinfo door-le door-le-hover">
						<i></i>
					</a>
					<a id="rearLeftfender" data-id="wg-def" href="javascript:void(0);" key-name="ZHYZB" data-info="0" class="place-carinfo wing-le wing-le-hover">
						<i></i>
					</a>
					<!--车身左侧前后门、翼子板 ]]-->

					<!--左侧前后轮 [[-->
					<a id="forntLeftwheel" data-id="wg-cl" href="javascript:void(0);" key-name="ZQL" data-info="0" class="place-carinfo cl-lf cl-lf-hover">
						<i class="ico-cl"></i>
					</a>
					<a id="rearLeftwheel" data-id="wg-cl" href="javascript:void(0);" key-name="ZHL" data-info="0" class="place-carinfo cl-le cl-le-hover">
						<i class="ico-cl"></i>
					</a>
					<!--左侧前后轮 ]]-->
				</div>
			    <div class="clearboth"></div>
		    </div>
	    </div>
	    <div class="module-info module-info-print">
	    	<h2><b><i class="ico-info-stimulus"></i><u>车辆内饰</u></b></h2>
		    <div class="select-info">
		    		<div class="error-list">
					
					<dl>
						<dt></dt>
						<dd>内饰无磨损，破损</dd>
					</dl>
					
			    </div>
			    <div class="bg-info select-stimulus fr">
				    <!--内饰部分 [[-->
				    <a id="console" data-id="ns-def" href="javascript:void(0);" key-name="JST" data-info="0" class="place-carinfo jst jst-hover">
					    <i></i>
				    </a>
				    <!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSYQM" data-info="0" class="place-carinfo n-yqm n-yqm-hover">-->
					    <!--<i></i>-->
				    <!--</a>-->
				    <!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSYHM" data-info="0" class="place-carinfo n-yhm n-yhm-hover">-->
					    <!--<i></i>-->
				    <!--</a>-->
				    <a id="forntLeftchair" data-id="ns-def" href="javascript:void(0);" key-name="NSYQZY" data-info="0" class="place-carinfo n-yqz n-yqz-hover">
					    <i></i>
				    </a>
				    <a id="rearchairs" data-id="ns-def" href="javascript:void(0);" key-name="NSZHZY" data-info="0" class="place-carinfo n-yhz n-yhz-hover">
					    <i></i>
				    </a>
				    <!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZYFS" data-info="0" class="place-carinfo n-zyfs n-zyfs-hover">-->
					    <!--<i></i>-->
				    <!--</a>-->
				    <a id="forntRightchair" data-id="ns-def" href="javascript:void(0);" key-name="NSZQZY" data-info="0" class="place-carinfo n-zqz n-zqz-hover">
					    <i></i>
				    </a>
				    <!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZHZY" data-info="0" class="place-carinfo n-zhz n-zhz-hover">-->
					    <!--<i></i>-->
				    <!--</a>-->
				    <!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZQM" data-info="0" class="place-carinfo n-zqm n-zqm-hover">-->
					    <!--<i></i>-->
				    <!--</a>-->
				    <!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZHM" data-info="0" class="place-carinfo n-zhm n-zhm-hover">-->
					    <!--<i></i>-->
				    <!--</a>-->
				    <!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSDP" data-info="0" class="place-carinfo n-dptc n-dptc-hover">-->
					    <!--<i></i>-->
				    <!--</a>-->
				    <!--内饰部分 ]]-->
			    </div>
			    <div class="clearboth"></div>
		    </div>
	    </div>
	    <div class="module-info">
	    	<h2><b><i class="ico-info-travel"></i><u>车辆动力</u></b></h2>
		    <div class="select-info">
		    		<div class="error-list">
					
					<dl>
						<dt></dt>
						<dd>发动机、变速箱没有维修过，无渗油、漏油、异响</dd>
					</dl>
					
			    </div>
			    <div class="bg-info select-travel fr">
				    <a id="engine"  data-id="dl-fdj" href="javascript:void(0);" key-name="FDJ" data-info="0" class="place-carinfo fdg fdg-hover">
					    <i></i>
				    </a>
				    <a id="gear" data-id="dl-bsx" href="javascript:void(0);" key-name="BSX" data-info="0" class="place-carinfo bsx bsx-hover">
					    <i></i>
				    </a>
			    </div>
			    <div class="clearboth"></div>
		    </div>
	    </div>
	    <div class="module-info flow-hide">
	    	<h2><b><i class="ico-info-trim"></i><u>车辆行驶及底盘</u></b></h2>
		    <ul class="check-list">
		    		
					<li><i></i>行驶正常，挂档、换挡正常，刹车较好</li>
				
				
					<li><i></i>底盘无撞击，减震无异响</li>
				
			</ul>
	    </div>
	    <div class="module-info flow-hide">
	    	<h2><b><i class="ico-info-chassis"></i><u>电子设备</u></b></h2>
		    <ul class="check-list">
				
					<li><i></i>空调有问题</li>
				
		    </ul>
	    </div>
	    
	    <!--填写车辆信息 ]]-->
	    <!--endprint-->
	    <div class="form-submit mt40">
		    
	    </div>
    </div>


<div class="footert">
	<div class="about area">
		<ul>
			<li>
				<span class="title01">关于我们</span>
				<span><a href="#">关于我们</a></span>
				<span><a href="#">联系我们</a></span>
				<span><a href="#">加入我们</a></span>
			</li>
			<li>
				<span class="title01">关注我们</span>
				<span><a href="#" target="_blank">众调网微博</a></span>
				<span><a href="#" class="zweixina">众调网微信</a></span>
                
			</li>
			<li>
				<span class="title01">帮助中心</span>
				<span><a href="http://www.jingzhengu.com/html/bangzhu/">常见问题</a></span>
				<span><a href="http://www.jingzhengu.com/gujia/">二手车市场价大全</a></span>
                <span><a href="http://www.jingzhengu.com/ershouche/salecar/">二手车出售</a></span>
				<span><a href="http://www.jingzhengu.com/form/buyoldcar.aspx">二手车求购</a></span>
			</li>
			<li>
				<span class="title01">商务合作</span>
				<span><a href="http://www.jingzhengu.com/about/shujuhezuo.shtml">数据合作</a></span>
                <span><a href="http://www.jingzhengu.com/about/disclaimet.shtml">法律声明</a></span>
                <span><a href="http://www.jingzhengu.com/html/hangyedt/">行业动态</a></span>
			</li>
		</ul>
	</div>
	<div class="footer"><!--版权开始-->
	﻿<p><span>战略支持 ｜ </span><i><a href="http://www.yiche.com/" target="_blank">易车网</a><a href="http://www.taoche.com/" target="_blank">易车二手车</a><a href="http://www.youxinpai.com/" target="_blank">优信拍</a></i></p>
    <p><span>友情链接 ｜ </span><i><a href="http://car.bitauto.com/" target="_blank">买新车</a><a href="http://baa.bitauto.com/" target="_blank">汽车论坛</a><a href="http://zijia.bitauto.com/" target="_blank">汽车自驾游</a><a href="http://dealer.bitauto.com/" target="_blank">汽车经销商</a><a href="http://www.chexun.com/" target="_blank">车讯网</a></i>
		</p><div class="clear"></div>
		
	</div>
	<div class="tail">
		<p class="bold">
			<label>Copyright © 2015 91survey.com, All Rights Reserved.版权所有众调信息科技有限公司　沪ICP备14017892号</label>
			<label>地址：上海市国康路46号同济科技大厦9楼西区　 联系电话：（8621）65980373</label>
		</p>
		</div>
</div>
</body>
</html>
