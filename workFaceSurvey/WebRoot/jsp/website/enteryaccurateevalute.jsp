<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
<head>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线估值</title>
  <link href="<%=webRoot%>/css/ztw/comm-20150114.css" type="text/css" rel="stylesheet">
  <link href="ztw/tbwb-3.css" type="text/css" rel="stylesheet">
  <link type="text/css" href="<%=webRoot%>/css/ztw/new_lstyle.css" rel="stylesheet">
  <link type="text/css" href="<%=webRoot%>/css/ztw/tbwb-3.css" rel="stylesheet">
  
   	<link rel="shortcut icon" type="image/x-icon" href="<%=webRoot%>/images/favicon.ico" /> 
   
     <script type="text/javascript" src="<%=webRoot%>/css/ztw/jquery.min.js"></script>
	

    <link type="text/css" href="<%=webRoot%>/css/ztw/eval-report.css" rel="stylesheet">
    <link type="text/css" href="<%=webRoot%>/css/ztw/citySelector.css" rel="stylesheet">


<script type="text/javascript" >

	  $(function (){
	  



	$("#get-report1").click(function(){
	bClick2();
	   
		$("#aa").submit();
	
	});
	
	
	});
	
	function bClick2(){
	var wg={};//外观
	var ns={};//内饰
	var dl={};//动力
	var records={};//结果集合
	var qt=[];
  $(".place-carinfo").each(function (index, domEle) { 
	   var key_name=$(domEle).attr("key-name");
	   var val=$(domEle).attr("data-info");
	    if($(domEle).attr("data-id") == "wg-cl" || $(domEle).attr("data-id") == "wg-def"){
		    wg[key_name]=val;//添加外观
		 }
	     if($(domEle).attr("data-id") == "ns-def" ){
		    ns[key_name]=val;//添加内饰
		 }
         if($(domEle).attr("data-id") == "dl-fdj" ||  $(domEle).attr("data-id") == "dl-bsx"){
		     dl[key_name]=val;//添加动力
		 }
	});
	var classisJson={};
	var eleticequipJson={};
	var chassis_val=[];
	var eleticequip_val=[];
  $(".select-info-check").each(function (index, domEle) { //车辆行驶及底盘 电子设备
       var id_name = $(domEle).attr("for");
	   var checkclass=$(domEle).attr("class");
	   var key_name=$("#"+id_name+"").attr("key-name");
	   if(key_name == "CLXSWT" || key_name == "CLDPWT"){//汽车行驶与底盘
		        if(checkclass == "select-info-check info-checked"){  //选中状态
					chassis_val.push(id_name);
					}
		 }else{//电子设备
		 
			if(checkclass == "select-info-check info-checked"){
					eleticequip_val.push(id_name);
			}
	     }
	});	
	classisJson.chassis=eval(chassis_val);
	eleticequipJson.eleticequip=eval(eleticequip_val);
	qt.push(classisJson);
	qt.push(eleticequipJson);
	records.wg=eval(wg);
    records.ns=eval(ns);
    records.dl=eval(dl);
	records.qt=eval(qt);
	 $("#jso").val(JSON.stringify(records));
	}

</script>
</head>

<body>
﻿<div class="head"><!--头开始-->  
	<div class="area">
		<div class="head-l">
			<a href="http://www.91survey.com/"><img width="178" height="66" src="<%=webRoot%>/css/ztw/logo.png" alt="logo"></a>
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
			<li class="sy"><a href="<%=webRoot%>" id="lixshouye">首页</a></li>
			<li class="carguzhi blue"><a id="liqichgz" href="<%=webRoot %>/admin/home/assessment">在线估值</a></li>
            <li><a href="<%=webRoot%>/usercar/index">我的二手车</a></li>
		</ul>
</div><!--导航结束-->
<!--面包屑开始-->
<div class="mbx">
	<span><a href="#">当前位置</a></span> ： <span><a href="#">二手车评估</a></span> &gt; <span><a href="#">上海二手车评估</a></span> &gt; <span><a class="zd-blue-a" href="#">${vehicle.vehiclename}二手车评估详情</a></span>
</div>
<!--面包屑结束-->
	<form class="form-list" action="<%=webRoot%>/evalute/accurateevalute" method="post" id="aa">
<div id="main">

<!--顶部title [[-->
<div id="m-title">
	<h5>${vehicle.vehiclename}</h5>
	<p>真实勾选您爱车有问题的部位，您将得到<span>专属、精确</span>的估值报告</p>
</div>
<!--顶部title ]]-->

<!--填写车辆信息 [[-->
<div class="module-info">
	<h2 class="mb20"><b><i class="ico-info-msg"></i><u>填写车辆信息</u></b><span>（认真填选车辆信息可帮助我们估值更加精准）</span></h2>

		<input type="hidden" name="dd" id="jso" />
		<input type="hidden" name="cityid"   value="${cityid}"/>
		<input type="hidden" name="date" value="${date}" />
		<input type="hidden" name="vehicleid"  value="${vehicle.id}" />
		<input type="hidden" name="mileage"  value="${mileage}"  />
		<div class="form-table">

			<dl>
				<div style="display:none"><input name="csrfmiddlewaretoken" value="ss6kRcnDZ7AvTZJY8M6jBvDkOr5KogPP" type="hidden"></div>
				<dd>
					<span class="form-label">上牌城市：</span>
					<div class="model-select-box">
						<div class="model-select-text"><input class="model-textbox cityinput"  id="citySelect" value="${cityname}" type="text" readonly></div>
						<label>不同地区上牌的车辆价格会有小小差异</label>
					</div>
				</dd>
				<dd>
					<span class="form-label">保养情况：</span>
					<div class="model-select-box z-27">
						<div class="model-select-text dw-sp">
                        <em class="zselet_open"></em>                     
                         <select name="repare">
                          <option value="全部4S店保养">全部4S店保养</option>
                          <option value="部分4S店保养">部分4S店保养</option>
                          <option value="无4S店保养">无4S店保养</option>
                         </select>
                        </div>
						<label>保养状况好的车辆更加好卖</label>
					</div>
				</dd>
			</dl>
			<dl>
				<dd>
					<span class="form-label">车辆颜色：</span>
					<div class="model-select-box z-26">
								<div class="model-select-text dw-sp">
                        <em class="zselet_open"></em>                        
                         <select name = "color">
                          <option value="白色">白色</option>
                          <option value="黑色">黑色</option>
                          <option value="蓝色">蓝色</option>
                          <option value="黄色">黄色</option>
                         </select>
                        </div>
						<!--<label>热门的车型颜色较其他颜色会稍贵些</label>-->
					</div>
				</dd>
				<dd>
					<span class="form-label">过户次数：</span>
					<div class="model-select-box z-26">
										<div class="model-select-text dw-sp">
                        <em class="zselet_open"></em>                         
                         <select name="used">
                          <option value="1">1次</option>
                          <option value="2">2次</option>
                          <option value="3">3次</option>
                          <option value="4">4次</option>
                         </select>
                        </div>
					</div>
				</dd>
			</dl>
			<dl>
				<dd>
					<span class="form-label">保险到期时间：</span>
					<div class="model-select-box z-25">
						<div class="model-select-text"><input class="model-textbox cityinput" key-name="mandatory_insurance" id="bx-time" type="text" name="dueday"/></div>
						<!--<input id="is-sell" class="checkbox" key-name="commercial_insurance" type="checkbox" /><label for="is-sell" class="is-sell"><span>是否随车出售商业保险</span>（80%用户选择是）</label>-->
					</div>
				</dd>
				<dd>
					<span class="form-label">最高维修费：</span>
					<div class="model-select-box">
						<div class="model-select-text" data-value=""><input class="model-textbox" name="fee" placeholder="0" type="text"><b>元</b></div>
					</div>
				</dd>
				<!--<dd>-->
				<!--<span class="form-label">钥匙数量：</span>-->
				<!--<div class="model-select-box z-25">-->
				<!--<div class="model-select-text" data-value=""><span key-name="car_key">1</span><i></i></div>-->
				<!--<ul class="model-select-option">-->
				<!--<li data-option="1" class="data-selected seleced">1</li>-->
				<!--<li data-option="2">2</li>-->
				<!--</ul>-->
				<!--</div>-->
				<!--</dd>-->
			</dl>
			<!--<dl>-->
			<!--<dd>-->
			<!--<span class="form-label">年检到期时间：</span>-->
			<!--<div class="model-select-box">-->
			<!--<div class="model-select-text"><input key-name="examine_insurance" class="model-textbox cityinput" type="text" id="nj-time" /></div>-->
			<!--</div>-->
			<!--</dd>-->
			<!--<dd>-->
			<!--<span class="form-label">最高维修费：</span>-->
			<!--<div class="model-select-box">-->
			<!--<div class="model-select-text" data-value=""><input class="model-textbox" key-name="insurance_money" type="text" value="" placeholder="0" /><b>元</b></div>-->
			<!--</div>-->
			<!--</dd>-->
			<!--</dl>-->
		</div>
		<p class="sys-error">啥地方萨芬</p>

	<div class="clearboth"></div>
</div>
<div class="module-tab">
	<ul class="tab-def">
		<li><a class="tab-checked" move-value="tab-wg" href="#tab-wg">外观</a></li>
		<li><a class="" move-value="tab-ns" href="#tab-ns">内饰</a></li>
		<li><a class="" move-value="tab-dl" href="#tab-dl">动力</a></li>
		<li><a class="" move-value="tab-other" href="#tab-other">其他</a></li>
	</ul>
</div>
<div class="module-info rl">
	<h2 id="tab-wg"><b><i class="ico-info-aspect"></i><u>车辆外观</u></b><span>（点击有问题的车况部位）</span></h2>
	<div class="select-info">
		<div class="bg-info select-aspect">
			<!--右侧前后轮 [[-->
			<a data-id="wg-cl" href="javascript:void(0);" key-name="forntRightwheel" data-info="0" class="place-carinfo cl-rf" >
				<i class="ico-cl"></i>
			</a>
			<a data-id="wg-cl" href="javascript:void(0);" key-name="rearRightwheel" data-info="0" class="place-carinfo cl-re" >
				<i class="ico-cl"></i>
			</a>
			<!--右侧前后轮 ]]-->

			<!--右侧前后门、翼子板 [[-->
			<a data-id="wg-def" href="javascript:void(0);" key-name="forntRightfender" data-info="0" class="place-carinfo yzb-rf">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="forntRightdoor" data-info="0" class="place-carinfo door-rf">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="rearRightdoor" data-info="0" class="place-carinfo door-re">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="rearRightfender" data-info="0" class="place-carinfo yzb-re">
				<i></i>
			</a>
			<!--右侧前后门、翼子板 ]]-->

			<!--车身前保险杠至后保险杠部分 [[-->
			<a data-id="wg-def" href="javascript:void(0);" key-name="forntBumper" data-info="0" class="place-carinfo guard-f">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="engineHood" data-info="0" class="place-carinfo engine-lid">
				<i></i>
			</a>
			<!--<a data-id="wg-cd" href="javascript:void(0);" key-name="CD" data-info="0" class="place-carinfo roof">-->
			<!--<i></i>-->
			<!--</a>-->
			<a data-id="wg-def" href="javascript:void(0);" key-name="baggageHood" data-info="0" class="place-carinfo trunk-lid">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="rearBumper" data-info="0" class="place-carinfo guard-e">
				<i></i>
			</a>
			<!--车身前保险杠至后保险杠部分 ]]-->

			<!--车身左侧前后门、翼子板 [[-->
			<a data-id="wg-def" href="javascript:void(0);" key-name="forntLeftfender" data-info="0" class="place-carinfo wing-lf">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="forntLeftdoor" data-info="0" class="place-carinfo door-lf">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="rearLeftdoor" data-info="0" class="place-carinfo door-le">
				<i></i>
			</a>
			<a data-id="wg-def" href="javascript:void(0);" key-name="rearLeftfender" data-info="0" class="place-carinfo wing-le">
				<i></i>
			</a>
			<!--车身左侧前后门、翼子板 ]]-->

			<!--左侧前后轮 [[-->
			<a data-id="wg-cl" href="javascript:void(0);" key-name="forntLeftwheel" data-info="0" class="place-carinfo cl-lf">
				<i class="ico-cl"></i>
			</a>
			<a data-id="wg-cl" href="javascript:void(0);" key-name="rearLeftwheel" data-info="0" class="place-carinfo cl-le">
				<i class="ico-cl"></i>
			</a>
			<!--左侧前后轮 ]]-->
		</div>
	</div>

</div>
<div class="module-info">
	<h2 id="tab-ns"><b><i class="ico-info-stimulus"></i><u>车辆内饰</u></b><span>（点击有问题的车况部位）</span></h2>
	<div class="select-info">
		<div class="bg-info select-stimulus">
			<!--内饰部分 [[-->
			<a data-id="ns-def" href="javascript:void(0);" key-name="console" data-info="0" class="place-carinfo jst">
				<i></i>
			</a>
			<!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSYQM" data-info="0" class="place-carinfo n-yqm">-->
			<!--<i></i>-->
			<!--</a>-->
			<!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSYHM" data-info="0" class="place-carinfo n-yhm">-->
			<!--<i></i>-->
			<!--</a>-->
			<a data-id="ns-def" href="javascript:void(0);" key-name="forntRightchair" data-info="0" class="place-carinfo n-yqz">
				<i></i>
			</a>
			<a data-id="ns-def" href="javascript:void(0);" key-name="rearchairs" data-info="0" class="place-carinfo n-yhz">
				<i></i>
			</a>
			<!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZYFS" data-info="0" class="place-carinfo n-zyfs">-->
			<!--<i></i>-->
			<!--</a>-->
			<a data-id="ns-def" href="javascript:void(0);" key-name="forntLeftchair" data-info="0" class="place-carinfo n-zqz">
				<i></i>
			</a>
			<!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZHZY" data-info="0" class="place-carinfo n-zhz">-->
			<!--<i></i>-->
			<!--</a>-->
			<!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZQM" data-info="0" class="place-carinfo n-zqm">-->
			<!--<i></i>-->
			<!--</a>-->
			<!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSZHM" data-info="0" class="place-carinfo n-zhm">-->
			<!--<i></i>-->
			<!--</a>-->
			<!--<a data-id="ns-def" href="javascript:void(0);" key-name="NSDP" data-info="0" class="place-carinfo n-dptc">-->
			<!--<i></i>-->
			<!--</a>-->
			<!--内饰部分 ]]-->
		</div>
	</div>
</div>
<div class="module-info">
	<h2 id="tab-dl"><b><i class="ico-info-travel"></i><u>车辆动力</u></b><span>（点击有问题的车况部位）</span></h2>
	<div class="select-info">
		<div class="bg-info select-travel">
			<a data-id="dl-fdj" href="javascript:void(0);" key-name="engine" data-info="0" class="place-carinfo fdg">
				<i></i>
			</a>
			<a data-id="dl-bsx" href="javascript:void(0);" key-name="gear" data-info="0" class="place-carinfo bsx">
				<i></i>
			</a>
		</div>
	</div>
</div>
<div class="module-info">
	<h2 id="tab-other"><b><i class="ico-info-trim"></i><u>车辆行驶及底盘</u></b><span>（点击有问题的车况部位）</span></h2>
	<ul class="select-info check-info">
		<li><input id="xsyx" key-name="CLXSWT" data-info="1" type="checkbox"><label for="xsyx" class="select-info-check" href="">行驶中有异响</label></li>
		<li><input id="xspp" key-name="CLXSWT" data-info="2" type="checkbox"><label for="xspp" class="select-info-check" href="">行驶中有跑偏</label></li>
		<li><input id="sc" key-name="CLXSWT" data-info="3" type="checkbox"><label for="sc" class="select-info-check" href="">刹车有问题</label></li>
		<li><input id="lh" key-name="CLXSWT" data-info="4" type="checkbox"><label for="lh" class="select-info-check" href="">挂档困难</label></li>
		<li><input id="hdcj" key-name="CLXSWT" data-info="5" type="checkbox"><label for="hdcj" class="select-info-check" href="">换挡冲击</label></li>
		<li><input id="td" key-name="CLDPWT" data-info="1" type="checkbox"><label for="td" class="select-info-check" href="">底盘有撞击</label></li>
		<li><input id="xg" key-name="CLDPWT" data-info="2" type="checkbox"><label for="xg" class="select-info-check" href="">减震有异响</label></li>
	</ul>
</div>
<div class="module-info">
	<h2><b><i class="ico-info-chassis"></i><u>电子设备</u></b><span>（点击有问题的车况部位）</span></h2>
	<ul class="select-info check-info">
		<li><input id="ybp" key-name="DZSBWT" data-info="1" type="checkbox"><label for="ybp" class="select-info-check" href="">仪表盘有问题</label></li>
		<li><input id="kt" key-name="DZSBWT" data-info="2" type="checkbox"><label for="kt" class="select-info-check" href="">空调有问题</label></li>
		<li><input id="cc" key-name="DZSBWT" data-info="3" type="checkbox"><label for="cc" class="select-info-check" href="">车窗（含天窗）控制有问题</label></li>
		<li><input id="dcld" key-name="DZSBWT" data-info="4" type="checkbox"><label for="dcld" class="select-info-check" href="">倒车雷达或影像有问题</label></li>
		<li><input id="zy" key-name="DZSBWT" data-info="5" type="checkbox"><label for="zy" class="select-info-check" href="">座椅调整有问题</label></li>
		<li><input id="yx" key-name="DZSBWT" data-info="6" type="checkbox"><label for="yx" class="select-info-check" href="">音响或音频部件有问题</label></li>
	</ul>
</div>
<div class="module-info">
	<h2><b><i class="ico-info-other"></i><u>其他问题</u></b><span></span></h2>
	<textarea class="txt-area"></textarea>
</div>
<!--填写车辆信息 ]]-->
<div class="form-submit">

	<a id="get-report1" class="btn-diyInfoCar" href="javascript:void(0);" >保存</a>
</div>

</div>
	</form>
<div id="wg-def" class="info-msglist" style="top: 748px; left: 817px; display: none;">
	<b class="b-front">◆</b>
	<b class="b-end">◆</b>
	<ul>
	<li name="">轻微剐蹭，只掉了一点漆</li>
	<li name="">一般剐蹭碰撞，需要局部钣金</li>
	<li name="">严重碰撞，更换过部件</li>
	<li name="nothing">没有任何问题</li>
	</ul>
	</div>
<div id="wg-cl" class="info-msglist" style="top: 751px; left: 799px; display: none;">
	<b class="b-front">◆</b>
	<b class="b-end">◆</b>
	<ul>
	<li name="">轮毂有磨损</li>
	<li name="">轮胎需要更换</li>
	<li name="nothing">没有任何问题</li>
	</ul>
</div>
<div id="ns-def" class="info-msglist" style="display: none;">
<b class="b-front">◆</b>
<b class="b-end">◆</b>
<ul>
<li name="">有磨损</li>
<li name="">有划痕，破损</li>
<li name="nothing">没有任何问题</li>
</ul>
</div>
<div id="dl-fdj" class="info-msglist" style="display: none;">
<b class="b-front">◆</b>
<b class="b-end">◆</b>
<ul>
<li name="">进行过轻微的维修</li>
<li name="">拆开大修过或更换过</li>
<li name="">发动机异响</li>
<li name="">渗油、漏油</li>
<li name="nothing">没有任何问题</li>
</ul>
</div>
<div id="dl-bsx" class="info-msglist" style="display: none;">

<b class="b-front">◆</b>
<b class="b-end">◆</b>
<ul>
<li name="">进行过轻微的维修</li>
<li name="">拆开大修过或更换过</li>
<li name="">变速箱异响</li>
<li name="">渗油、漏油</li>
<li name="nothing">没有任何问题</li>
</ul>
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
 <script type="text/javascript" src="<%=webRoot%>/css/js/jquery-ui.min.js"></script>

 <script type="text/javascript" src="<%=webRoot%>/css/js/tip.js"></script>
<script type="text/javascript" src="<%=webRoot%>/css/js/cb_wide_base.js"></script>
<script type="text/javascript" src="<%=webRoot%>/css/js/sea.js"></script>
<script type="text/javascript">
 seajs.use('main');
	seajs.config({
		
	alias:{
	'jquery':'jquery.js',
   'dateSelect':'dateSelect.js',
   'carInfo':'_require/carInfo.js' 
	}
	});

</script>
</div>
</body>

</html>
