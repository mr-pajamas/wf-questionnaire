<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>在线评估-快速评估</title>
		<link href="<%=webRoot%>/css/ztw/comm-20150114.css" type="text/css"
			rel="stylesheet">
			<link href="<%=webRoot%>/css/ztw/tbwb-3.css" type="text/css"
				rel="stylesheet">
				<link type="text/css" href="<%=webRoot%>/css/ztw/new_lstyle.css"
					rel="stylesheet">
					<link type="text/css" href="<%=webRoot%>/css/ztw/common.css"
						rel="stylesheet">
						<link type="text/css" href="<%=webRoot%>/css/ztw/result.css"
							rel="stylesheet">
							   	<link rel="shortcut icon" type="image/x-icon" href="<%=webRoot%>/images/favicon.ico" /> 
	</head>

	<body>
		<div class="head">
			<!--头开始-->
			<div class="area">
				<div class="head-l">
					<a href="http://www.91survey.com/"><img width="178" height="66"
							src="<%=webRoot%>/css/ztw/logo.png" alt="logo">
					</a>
				</div>
				<div class="head-r">
					<div class="head-zc" id="LoginBar">
						<span class="bor" onclick=javascript:ShowLoginRegist('1');;
><a
							href="javascript:void(0);">注册</a> </span>
						<span onclick=javascript:ShowLoginRegist('0');;
><a
							href="javascript:void(0);">登录</a> </span>
					</div>

				</div>
			</div>
		</div>
		<!--头结束-->
		<div class="nav">
			<!--导航开始-->
			<ul class="ulmenu">
				<li class="sy">
					<a href="<%=webRoot%>" id="lixshouye">首页</a>
				</li>
				<li class="carguzhi blue">
					<a id="liqichgz" href="<%=webRoot %>/admin/home/assessment">在线估值</a>
				</li>
				<li>
					<a href="<%=webRoot%>/usercar/index">我的二手车</a>
				</li>
			</ul>
		</div>
		<!--导航结束-->
		<!--面包屑开始-->
		<div class="mbx">
			<span><a href="#">当前位置</a> </span> ：
			<span><a href="#">二手车评估</a> </span> &gt;
			<span><a class="zd-blue-a" href="#">${vehicle.vehiclename}二手车评估详情</a> </span>
		</div>
		<!--面包屑结束-->
		<div class="container">
			<div class="row" style="margin-top: 10px;">
				<div class="car_inf">
					<div class="car_detail">
						<div class="car_logo">
							 <div class="pc_img"><img src="<%=webRoot%>/images/carImg/${vehicle.familyid}.jpg"/></div>
						</div>
						<div class="car_data" style="margin-top: -10px">
							<p class="car_title">
								${vehicle.vehiclename}
							</p>
							<p>
								<span class="data_span"
									style="padding-left: 0px; border-right: none;">行驶里程：${mileage}</span>
								<span class="data_span" style="border-right: none;">上牌时间：${evaInfo.license_plate_date}</span>
							</p>
							<p>
								<span class="data_span"
									style="padding-left: 0px; border-right: none;">新车指导价：<span
									class="guide_price">${vehicle.price}万</span> </span>

							</p>
						</div>
					</div>
				</div>
				<div class="hr20"></div>
				<div class="car_result">
					<div class="price_trend">
						<div data-highcharts-chart="0" style="height: 195px;"
							id="carPriceDistributionChartNode" class="chartNode">
							<div
								style="position: relative; overflow: hidden; width: 479px; height: 195px; text-align: left; line-height: normal; z-index: 0; left: 0.5px; top: 0px;"
								id="highcharts-0" class="highcharts-container">
								<svg height="195" width="479" xmlns="http://www.w3.org/2000/svg"
									style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;"
									version="1.1"> <desc>Created with Highcharts 4.0.3</desc>
								<defs> <clipPath id="highcharts-1"> <rect
									height="407" width="147" y="0" x="0"></rect></clipPath> </defs> <rect
									class=" highcharts-background" fill="#FFFFFF" strokeWidth="0"
									height="195" width="479" y="0" x="0"></rect> <g zIndex="1"
									class="highcharts-grid"></g> <g zIndex="1"
									class="highcharts-grid"> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 119.5 10 L 119.5 157"
									fill="none"></path> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 177.5 10 L 177.5 157"
									fill="none"></path> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 235.5 10 L 235.5 157"
									fill="none"></path> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 294.5 10 L 294.5 157"
									fill="none"></path> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 352.5 10 L 352.5 157"
									fill="none"></path> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 410.5 10 L 410.5 157"
									fill="none"></path> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 469.5 10 L 469.5 157"
									fill="none"></path> <path opacity="1" zIndex="1"
									stroke-width="1" stroke="#C0C0C0" d="M 61.5 10 L 61.5 157"
									fill="none"></path> </g> <g zIndex="2" class="highcharts-axis">
								<path opacity="1" stroke-width="1" stroke="#C0D0E0"
									d="M 62 59.5 L 52 59.5" fill="none"></path> <path opacity="1"
									stroke-width="1" stroke="#C0D0E0" d="M 62 108.5 L 52 108.5"
									fill="none"></path> <path opacity="1" stroke-width="1"
									stroke="#C0D0E0" d="M 62 157.5 L 52 157.5" fill="none"></path>
								<path opacity="1" stroke-width="1" stroke="#C0D0E0"
									d="M 62 9.5 L 52 9.5" fill="none"></path> <path
									visibility="visible" zIndex="7" stroke-width="1"
									stroke="#C0D0E0" d="M 61.5 10 L 61.5 157" fill="none"></path> </g>
								<g zIndex="2" class="highcharts-axis"></g> <g zIndex="3"
									class="highcharts-series-group"> <g
									clip-path="url(#highcharts-1)" height="147" width="407"
									style="cursor:pointer;"
									transform="translate(469,157) rotate(90) scale(-1,1) scale(1 1)"
									zIndex="0.1" visibility="visible"
									class="highcharts-series highcharts-tracker"> <rect
									stroke-width="1" stroke="#FFFFFF" ry="0" rx="0" fill="#65e94e"
									height="372" width="24" y="35.5" x="110.5"> </rect> <rect
									stroke-width="1" stroke="#FFFFFF" ry="0" rx="0" fill="#65e94e"
									height="330" width="24" y="77.5" x="61.5"></rect> <rect
									stroke-width="1" stroke="#FFFFFF" ry="0" rx="0" fill="#65e94e"
									height="187" width="24" y="220.5" x="12.5"></rect> </g> <g
									clip-path="none" height="147" width="407"
									transform="translate(469,157) rotate(90) scale(-1,1) scale(1 1)"
									zIndex="0.1" visibility="visible" class="highcharts-markers"></g>
								</g> <g style="cursor:pointer;" opacity="1"
									transform="translate(62,10) scale(1 1)" zIndex="6"
									visibility="visible"
									class="highcharts-data-labels highcharts-tracker"> <g
									transform="translate(372,14)" style="cursor:pointer;"
									zIndex="1"> <text y="15"
									style="font-size:11px;color:#606060;fill:#606060;" zIndex="1"
									x="3">${trend2015}</text> </g> <g transform="translate(330,63)"
									style="cursor:pointer;" zIndex="1"> <text y="15"
									style="font-size:11px;color:#606060;fill:#606060;" zIndex="1"
									x="3">${trend2016}</text> </g> <g transform="translate(187,112)"
									style="cursor:pointer;" zIndex="1"> <text y="15"
									style="font-size:11px;color:#606060;fill:#606060;" zIndex="1"
									x="3">${trend2017}</text> </g> </g> <g zIndex="7"
									class="highcharts-axis-labels highcharts-xaxis-labels"> <text
									opacity="1" y="39"
									style="width:138px;color:#606060;cursor:default;font-size:11px;fill:#606060;"
									text-anchor="end" x="47">2015年</text> <text opacity="1" y="88"
									style="width:138px;color:#606060;cursor:default;font-size:11px;fill:#606060;"
									text-anchor="end" x="47">2016年</text> <text opacity="1" y="137"
									style="width:138px;color:#606060;cursor:default;font-size:11px;fill:#606060;"
									text-anchor="end" x="47">2017年</text> </g> </svg>
							</div>
						</div>
						<h1>
							未来两年价格趋势预测图
						</h1>
					</div>
					<div class="analysis">
						<div style="height: 40px;">
							<div class="label_style">
								分析数据
							</div>
							<div class="analysis_font analysis_data">
								${analysisCount}
							</div>
						</div>
						<div style="height: 40px; margin-top: 20px;">
							<div class="label_style">
								估值准确率
							</div>
							<div class="analysis_font eval_data">
							<fmt:formatNumber value="${accuracy}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber> %   
								<!--${accuracy}.toFixed(2)%  -->
							</div>
						</div>
					</div>
				</div>
				<div style="height: 40px;"></div>
			</div>
		</div>
		<!-- 价格分布图 -->
		<div class="container" style="margin-top: 20px">
			<div class="row">
				<div class="tab-top">
					<div class="tab-title-active">
						此款车型价格分布图
					</div>
				</div>
				<div class="tab-content">
					<ul>
						<li>
							· 卖车价格
						</li>
						<li>
							· 个人买卖交易价
						</li>
						<li>
							· 买车价格
						</li>
					</ul>
					<div class="price_range"
						style="background: url(http://www.che300.com//theme/images/resource/eval_range.png) no-repeat center">
						<p class="price_range_detail">
							<span class="car_price_num01">${evaInfo.area1_price}万</span>
							<span class="car_price_num02">${evaInfo.area2_price}万</span>
							<span class="car_price_num03">${evaInfo.area3_price}万</span>
							<span class="car_price_num04">${evaInfo.area4_price}万</span>
						</p>
						<div class="dealer_price">
							<p>
								车商收购价
							</p>
							<p>
								￥${evaInfo.repurchase_price}万
							</p>
						</div>
						<div class="person_price">
							<p>
								个人交易价
							</p>
							<p>
								￥
								<span style="font-size: 20px">${evaInfo.person_price}万</span>
							</p>
						</div>
						<div class="dealer_retial_prices">
							<p>
								车商零售价
							</p>
							<p>
								￥${evaInfo.retail_price}万
							</p>
						</div>
					</div>
					<div class="price_advice">
						<p>
							<span class="advice_item">车商收购价</span><span>是指车商从车主收购或其它车商处批发的价格，绝大部分车商以此方式购入车辆。车主选择此方式交易周期最短，但价格不具备优势。</span>
						</p>
						<p>
							<span class="advice_item">个人交易价</span><span>是指车主或小黄牛将车辆销售给个人购买者的价格。销售方式一般是通过互联网、张贴小广告或门店，交易周期较长，不能提供相关的售后服务和品牌担保，但价格较为真实反映车辆实际价值。</span>
						</p>
						<p>
							<span class="advice_item">车商零售价</span><span>是指品牌车商或中介平台采用帮卖、寄售或直销等方式将车辆转卖给购车者的价格。车商和中介从中赚取差价或收取交易佣金，价格与车商的品牌信誉和提供的服务保障挂钩。</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="footert">
			<div class="about area">
				<ul>
					<li>
						<span class="title01">关于我们</span>
						<span><a href="#">关于我们</a> </span>
						<span><a href="#">联系我们</a> </span>
						<span><a href="#">加入我们</a> </span>
					</li>
					<li>
						<span class="title01">关注我们</span>
						<span><a href="#" target="_blank">众调网微博</a> </span>
						<span><a href="#" class="zweixina">众调网微信</a> </span>

					</li>
					<li>
						<span class="title01">帮助中心</span>
						<span><a href="http://www.jingzhengu.com/html/bangzhu/">常见问题</a>
						</span>
						<span><a href="http://www.jingzhengu.com/gujia/">二手车市场价大全</a>
						</span>
						<span><a
							href="http://www.jingzhengu.com/ershouche/salecar/">二手车出售</a> </span>
						<span><a
							href="http://www.jingzhengu.com/form/buyoldcar.aspx">二手车求购</a> </span>
					</li>
					<li>
						<span class="title01">商务合作</span>
						<span><a
							href="http://www.jingzhengu.com/about/shujuhezuo.shtml">数据合作</a>
						</span>
						<span><a
							href="http://www.jingzhengu.com/about/disclaimet.shtml">法律声明</a>
						</span>
						<span><a href="http://www.jingzhengu.com/html/hangyedt/">行业动态</a>
						</span>
					</li>
				</ul>
			</div>
			<div class="footer">
				<!--版权开始-->
				﻿
				<p>
					<span>战略支持 ｜ </span><i><a href="http://www.yiche.com/"
						target="_blank">易车网</a><a href="http://www.taoche.com/"
						target="_blank">易车二手车</a><a href="http://www.youxinpai.com/"
						target="_blank">优信拍</a> </i>
				</p>
				<p>
					<span>友情链接 ｜ </span><i><a href="http://car.bitauto.com/"
						target="_blank">买新车</a><a href="http://baa.bitauto.com/"
						target="_blank">汽车论坛</a><a href="http://zijia.bitauto.com/"
						target="_blank">汽车自驾游</a><a href="http://dealer.bitauto.com/"
						target="_blank">汽车经销商</a><a href="http://www.chexun.com/"
						target="_blank">车讯网</a> </i>
				</p>
				<div class="clear"></div>

			</div>
			<div class="tail">
				<p class="bold">
					<label>
						Copyright © 2015 91survey.com, All Rights Reserved.版权所有众调信息科技有限公司
						沪ICP备14017892号
					</label>
					<label>
						地址：上海市国康路46号同济科技大厦9楼西区 联系电话：（8621）65980373
					</label>
				</p>
			</div>
		</div>
	</body>
</html>
