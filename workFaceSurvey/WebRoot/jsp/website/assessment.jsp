<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

			<title>众调网-在线估值</title>

			<meta name="keywords" content="">
				<meta name="description" content="">
			   	<link rel="shortcut icon" type="image/x-icon" href="<%=webRoot%>/images/favicon.ico" /> 
					<link href="<%=webRoot%>/css/ztw/comm-20150114.css"
						type="text/css" rel="stylesheet">
						<link href="<%=webRoot%>/css/ztw/tbwb-3.css" type="text/css"
							rel="stylesheet">
							<link type="text/css" href="<%=webRoot%>/css/ztw/new_lstyle.css"
								rel="stylesheet">
								<script type="text/javascript"
									src="<%=webRoot%>/css/ztw/jquery-1.js"></script>
								<script type="text/javascript"
									src="<%=webRoot%>/css/ztw/common.js"></script>

    <link type="text/css" href="<%=webRoot%>/css/ztw/citySelector.css" rel="stylesheet">
								<script type="text/javascript">

								var opergroup = "";
			  $(function (){

		    
	    	$.ajax({

	             type: "GET",

	             url: "<%=webRoot%>/v/family",

	             data: {brandId:25},

	             dataType: "json",

	             success: function(data){
		             if(data.code == "200"){
			                var o = $("#familyopetion");
			                o.empty();
			               $(o).append("<option>请选择车系</option>");
							for(i=0 ;i < data.result.length;i++){
				
									//年款
									var _opergroup = data.result[i].makeyear;
					
								addoption("familyopetion",data.result[i].id,data.result[i].familyname,_opergroup);
							}
							
			           }
	             }});


	    	$("#btnAppBase").click(function(){
				    	$("#ff").submit();
			  });

	     	$("#btnAppDetail").click(function(){
			    	$("#ff").attr("action","<%=webRoot%>/evalute/enteraccurateevalute");
			    	$("#ff").submit();

		    });

	    	$("#familyopetion").change(function(){
	    		var familyid = $(this).children('option:selected').val();
	    		$.ajax({

		             type: "GET",

		             url: "<%=webRoot%>/v/vehicle",

		             data: {familyId:familyid},

		             dataType: "json",

		             success: function(data){
			             if(data.code == "200"){
				                var o = $("#vehicleobject");
				                o.empty();
				                  $(o).append("<option >请选择车型</option>");
								for(i=0 ;i < data.result.length;i++){
					
										//年款
										var _opergroup = data.result[i].makeyear;
						
									addoption("vehicleobject",data.result[i].id,data.result[i].vehiclename +" "+data.result[i].price + "万元",_opergroup);
								}
								
				           }
		             }});
	    	});

	    	$("#vehicleobject").change(function(){
	    		var vehicleId = $(this).children('option:selected').val();
	    		var makeyearAndId  = vehicleId.split("#");

	    		$("#vehicleid").val(makeyearAndId[0]);
	    	});
	    });


	    
	    	function addoption(domid,id,name,_opergroup){
				if(_opergroup != undefined && _opergroup != "" && _opergroup != opergroup){
					 $("#"+domid).append("<optgroup label='"+_opergroup+" 款'>")
					 opergroup = _opergroup
				}
				
				 $("#"+domid).append("<option value="+id+">" +name + "</option>");
				 $("#"+domid).append("</optgroup>")
			}
	  
	</script>
	</head>
	<body class="">
	<form action="<%=webRoot%>/evalute/dimevalute" id="ff" method="post">﻿
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
						<span class="bor" onclick="javascript:ShowLoginRegist('1');"><a
							href="javascript:void(0);">注册</a>
						</span>
						<span onclick="javascript:ShowLoginRegist('0');"><a
							href="javascript:void(0);">登录</a>
						</span>
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
		<script src="ztw/huadongmen.js" type="text/javascript"></script>
		<!--[if lt IE 10]>
<script type="text/javascript" src="http://res.jingzhengu.com/ptv/2.0/js/PIE.js"></script>
<![endif]-->
		<script type="text/javascript" src="ztw/login.js"></script>
		<div class="steps-bg loginbg" style="display: none;">
			<!--登陆开始-->
		</div>
		<div class="steps logindiv" style="display: none;">
			<div class="steps-r">
				<!--登陆右开始-->
				<div id="steps_cn" class="tagContent">
					<!--切换开始-->
					<ul class="tagList">
						<li class="tagAct" id="steps0">

							<h5 class="c_word">
								登录
							</h5>

						</li>
						<li class="tagMenu" id="steps1">

							<h5 class="un_word">
								注册
							</h5>

						</li>
						<div class="ico-zc"
							onclick="javascript: $('.loginbg').hide();$('.logindiv').hide();"></div>
					</ul>

					<span style="display: block;" id="steps0_txt" class="cnList">
						<div class="form-item">
							<label>
								用户名:
							</label>
							<input class="fguang " id="LoginName" value="手机号码/邮箱"
								onfocus="javascript: $(this).removeClass('txt-red');if($(this).val()=='手机号码/邮箱'){$(this).val('');}"
								onblur="javascript:CheckLoginName();"
								onkeydown="if(event.keyCode==9){$('#ts_loginPwd').hide();$('#LoginPassword').val('');}"
								type="text">
								<em class="ico-d" id="ts_LoginName" style="display: none;"></em>
								<div class="zc-ts tstxt" id="tstxtLoginName"></div>
						</div>
						<div class="form-item">
							<label>
								密码:
							</label>
							<input class="fguang" id="LoginPassword" value="请输入密码"
								onblur="javascript:CheckLoginPwd();"
								onkeydown="if(event.keyCode==13)LoginInJZG();" type="password">
								<em class="" id="ts_icologinpwd" style="display: none;"></em>
								<div class="zc-mm" id="ts_loginPwd"
									onclick="javascript:$(this).hide();$('#LoginPassword').val('');$('#LoginPassword').focus();">
									请输入密码
								</div>
								<div class="zc-ts tstxt" id="tstxtLoginPwd"></div>
						</div>
						<div class="form-item form-item-txt">
							<i><a href="javascript:void(0);"
								onclick="javascript:FindPassword();">忘记密码</a>
							</i>
						</div>
						<div class="form-item form-item-button"
							onclick="javascript:LoginInJZG() ;">
							<h2>
								<a href="javascript:void(0);">登录</a>
							</h2>
						</div>
						<div class="form-item form-item-button mt30">
							<strong>其他账号登录:</strong>
							<div class="form-item-tu ml10 " style="cursor: pointer;"
								onclick="javascript:QQLogin();">
								QQ登录
							</div>
							<div class="form-item-tu ml10 ico-sina" style="cursor: pointer;"
								onclick="javascript:SinaWeiboLogin();">
								微博登录
							</div>
						</div> </span>
					<span style="display: none;" id="steps1_txt" class="cnList">
						<div class="form-item">
							<label>
								用户名:
							</label>
							<input class="fguang" value="手机号码/邮箱" id="RegistName"
								onfocus="javascript:$(this).removeClass('txt-red');if($(this).val()=='手机号码/邮箱'){$(this).val('');}"
								onblur="javascript:CheckRegistLoginName();"
								onkeydown="if(event.keyCode==9){$('#ts_RegistPutPwd').hide();$('#RegistPassword').val('');}"
								type="text">
								<em id="ts_RegistName" class="ico-d"></em>
								<div class="zc-ts tstxt" id="tstxt_RegistName"></div>
						</div>
						<div class="form-item">
							<label>
								密码:
							</label>
							<input class="fguang" value="" id="RegistPassword"
								onblur="javascript:CheckRegistPwd();"
								onkeydown="if(event.keyCode==13)RegistJZG();" type="password">
								<em class="" id="ts_RegistPassword"></em>
								<div class="zc-mm" id="ts_RegistPutPwd"
									onclick="javascript:$(this).hide();$('#RegistPassword').val('');$('#RegistPassword').focus();">
									请输入密码
								</div>
								<div class="zc-ts tstxt" id="tstxt_RegistPwd"></div>
						</div> <input id="hdShowValidata" value="0" type="hidden">
							<div class="form-item" id="RegistValidateDiv"
								style="display: none;">
								<label>
									验证码:
								</label>
								<input id="RegistValidataCode" class="wid118 fguang"
									value="请输入验证码"
									onfocus="javascript:if($(this).val()=='请输入验证码'){ $(this).val('');}"
									onblur="javascript:CheckRegistValicode();" type="text">
									<em class="" id="ts_YZM" style="display: none;"></em> <b> <!--<img src="http://res.jingzhengu.com/ptv/2.0/images/yzm-tu.gif" alt="验证码">-->
										<img src="ztw/validatecode.gif" alt="换一换" id="iValCode"
											onclick="javascript:ReloadVailcode('iValCode');"
											style="cursor: pointer;">
									</b>
									<div class="zc-ts tstxt" id="tstxt_YZM" style="display: none;"></div>
							</div>
							<div class="form-item form-item-txt1">
								<input class="form-checkbox" id="IsReadProtocol"
									checked="checked" value="" type="checkbox">
									<i>我已详细阅读并对<a
										href="http://www.jingzhengu.com/shtml/Licence.shtml"
										target="_blank">《用户协议》</a>内容充分理解并同意。</i>
							</div>
							<div class="form-item form-item-button"
								onclick="javascript:RegistJZG();">
								<h2 class="form-item-zc">
									<a href="javascript:void(0);">注册</a>
								</h2>
							</div>
							<div class="form-item form-item-button mt30">
								<strong>其他账号登录:</strong>
								<div class="form-item-tu ml10" style="cursor: pointer;"
									onclick="javascript:QQLogin();">
									QQ登录
								</div>
								<div class="form-item-tu ml10 ico-sina" style="cursor: pointer;"
									onclick="javascript:SinaWeiboLogin();">
									微博登录
								</div>
							</div>
					</span>
				</div>
				<!--切换结束-->
			</div>
			<!--登陆右结束-->
		</div>
		<!--登陆结束-->
		<!----完善第三方登陆后信息--->
		<div class="steps-wel  improveInfo" style="display: none;">
			<!--欢迎登陆开始-->
			<div class="steps-wel-l">
				<!--欢迎登陆左开始-->
				<div class="step-wel-tou">
					<div class="step-wel-tu">
						<img id="img_weibo" src="ztw/niu.gif" alt="头像">
					</div>
					<span>hi，<label id="lb_weiboName"></label>
						<br>
							欢迎来到精真估
					</span>
				</div>
			</div>
			<!--欢迎登陆左结束-->
			<div class="steps-wel-r">
				<!--欢迎登陆右开始-->
				<div class="steps-wel-con">
					<div class="form-item">
						<input id="txtWeiboId" type="hidden">
							<label>
								昵称：
							</label>
							<input class="fguang" value="请输入昵称" id="txtWeiboNiCheng"
								onblur="javascript:CheckWeiboNicheng();"
								onkeydown="if(event.keyCode==9){$('#txtWeiboUserName').val('');}"
								type="text">
								<em class="ico-d" style="display: none;" id="ts_weiboNicheng"></em>
					</div>
					<div class="form-item">
						<label>
							用户名:
						</label>
						<input class="fguang" value="手机号码/邮箱" id="txtWeiboUserName"
							onfocus="javascript:if($(this).val()=='手机号码/邮箱'){$(this).val('');}"
							onblur="javascript:CheckWeiboUserName();"
							onkeydown="if(event.keyCode==9){$('#dv_weibopwd').hide();$('#txtWeiboPwd').val(''); }"
							type="text">
							<em class="" style="display: none;" id="ts_weiboUserName"></em>
							<div class="zc-ts " style="display: none;" id="tstxt_wbUsername"></div>
					</div>
					<div class="form-item">
						<label>
							登录密码:
						</label>
						<input class="wid278 fguang" id="txtWeiboPwd"
							onblur="javascript:CheckWeiboPwd();"
							onkeydown="if(event.keyCode==13)RegistSinaWeiboUser();"
							type="password">

							<div class="zc-mm" id="dv_weibopwd"
								onclick="javascript:$(this).hide();$('#txtWeiboPwd').val('');$('#txtWeiboPwd').focus();">
								请输入密码
							</div>
							<em class="" style="display: none;" id="ts_weibopwd"></em>
					</div>

					<div class="form-item form-item-button"
						onclick="javascript:RegistSinaWeiboUser();">
						<h2>
							<a href="javascript:void(0);">完成</a>
						</h2>
					</div>
				</div>


				<h3 style="display: none;">
					放心买卖二手车，就在精真估
				</h3>
				<div class="form-item-bot" style="display: none;">
					<h2>
						<a href="javascript:void(0);">我的车值多少钱?</a>
					</h2>
					<h4>
						<a href="javascript:void(0);">去首页</a>
					</h4>
				</div>

			</div>
			<!--欢迎登陆右结束-->
			<div class="steps-wel-x"
				onclick="javascript:$('.improveInfo').hide();$('.loginbg').hide();"></div>
		</div>
		<!--欢迎登陆结束-->
		<div class="steps-wel  improveQQInfo" style="display: none;">
			<!--欢迎登陆开始-->
			<div class="steps-wel-l">
				<!--欢迎登陆左开始-->
				<div class="step-wel-tou">
					<div class="step-wel-tu">
						<img id="imgqq" src="ztw/niu.gif" alt="头像">
					</div>
					<span>hi，<label id="labqqusername"></label>
						<br>
							欢迎来到精真估
					</span>
				</div>
			</div>
			<!--欢迎登陆左结束-->
			<div class="steps-wel-r">
				<!--欢迎登陆右开始-->
				<div class="steps-wel-con">
					<div class="form-item">
						<input id="hdqqopenId" type="hidden">
							<label>
								昵称：
							</label>
							<input class="fguang" value="请输入昵称" id="txtqqNicheng"
								onblur="javascript:CheckQQNicheng();"
								onkeydown="if(event.keyCode==9){$('#txtqqUserName').val(''); }"
								type="text">
								<em class="ico-d" style="display: none;" id="ts_qqnicheng"></em>
					</div>
					<div class="form-item">
						<label>
							用户名:
						</label>
						<input class="fguang" value="手机号码/邮箱" id="txtqqUserName"
							onfocus="javascript:if($(this).val()=='手机号码/邮箱'){$(this).val('');}"
							onblur="javascript:CheckQQUserName();"
							onkeydown="if(event.keyCode==9){$('#dv_qqpwd').hide();$('#txtqqpwd').val(''); }"
							type="text">
							<em class="" style="display: none;" id="ts_qqUserName"></em>
							<div class="zc-ts " style="display: none;" id="tstxt_qqUserName"></div>
					</div>
					<div class="form-item">
						<label>
							登录密码:
						</label>
						<input class="wid278 fguang" value="" id="txtqqpwd"
							onblur="javascript:CheckQQpwd();"
							onkeydown="if(event.keyCode==13)RegistQQUser();" type="password">
							<div class="zc-mm" id="dv_qqpwd"
								onclick="javascript:$(this).hide();$('#txtqqpwd').val('');$('#txtqqpwd').focus();">
								请输入密码
							</div>
							<em class="" style="display: none;" id="ts_qqpwd"></em>
					</div>

					<div class="form-item form-item-button"
						onclick="javascript:RegistQQUser();">
						<h2>
							<a href="javascript:void(0);">完成</a>
						</h2>
					</div>
				</div>


				<h3 style="display: none;">
					放心买卖二手车，就在精真估
				</h3>
				<div class="form-item-bot" style="display: none;">
					<h2>
						<a href="javascript:void(0);">我的车值多少钱?</a>
					</h2>
					<h4>
						<a href="javascript:void(0);">去首页</a>
					</h4>
				</div>

			</div>
			<!--欢迎登陆右结束-->
			<div class="steps-wel-x"
				onclick="javascript:$('.improveQQInfo').hide();$('.loginbg').hide();"></div>
		</div>
		<!--欢迎登陆结束-->

		<script type="text/javascript">
        creatTag("steps");
        creatTag("zscx");
    </script>
		<div class="zhmm zhmm_One" style="display: none;">
			<!--找回密码开始--->
			<input id="zhmmUserId" type="hidden">
				<h3>
					找回密码
					<span
						onclick="javascript:$('.zhmm_One').hide();$('.loginbg').hide();"></span>
				</h3>
				<div class="zhmm-cont">
					<div class="form-item mt20">
						<input class="fguang" id="zhmmNameOne" value="请输入注册时手机号码/邮箱"
							onfocus="javascript:if($(this).val()=='请输入注册时手机号码/邮箱'){$(this).val('');}"
							onblur="javascript:CheckZHMMUserName();" type="text">
							<em class="" id="em_zhmm1"></em>
							<div class="zc-ts" id="ts_zhmm1"></div>
					</div>
					<div class="form-item">
						<input class="fguang" id="zhmmNameTwo" value="再次输入手机号码/邮箱"
							onfocus="javascript:if($(this).val()=='再次输入手机号码/邮箱'){$(this).val('');}"
							onblur="javascript:CheckZHMMRepUserName();" type="text">
							<em class="" id="em_zhmm2"></em>
							<div class="zc-ts" id="ts_zhmm2"></div>
					</div>
					<div class="form-item ">
						<input class="wid118 fguang" id="zhmmVCode" value="请输入验证码"
							onfocus="javascript:if($(this).val()=='请输入验证码'){$(this).val('');}"
							onkeydown="if(event.keyCode==13){ZHMMNextStep();}"
							onblur="javascript:CheckZHMMVailidateCode();" type="text">
							<em class="" id="em_zhmm3"></em> <label>
								验证码:
							</label>
							<b> <img src="ztw/validatecode.gif" alt="换一换"
									id="zhmmValidateCode"
									onclick="javascript:ReloadVailcode('zhmmValidateCode');"
									style="cursor: pointer;">
							</b>
					</div>

					<div class="form-item-button mt20"
						onclick="javascript:ZHMMNextStep();">
						<h2>
							<a href="javascript:void(0);">下一步</a>
						</h2>
					</div>
				</div>
		</div>
		<!--找回密码结束--->

		<div class="zhmm zhmm_two" style="display: none;">
			<!--找回密码开始--->
			<input id="hdzhmseconds" value="60" type="hidden">
				<h3>
					找回密码
					<span
						onclick="javascript:$('.zhmm_two').hide();$('.loginbg').hide();"></span>
				</h3>
				<div class="zhmm-cont">
					<div class="form-item form-item-1 mt20">
						<span id="spts_zhmmmobile"></span>
					</div>

					<div class="form-item form-item-1 ">
						<i>请输入验证码:</i>
						<input class="wid118 fguang" id="zhmmmobileVcode" value="请输入验证码"
							onfocus="javascrip:if($(this).val()=='请输入验证码'){$(this).val('');}"
							type="text">
							<em class="yzm" id="em_zhmm4"></em> <strong class="yifas"
								id="zmbtnSendcode" onclick="javascript:ZhMMGetMobileCode();">
								<a href="javascript:void(0);">获取验证码</a> </strong>
					</div>

					<div class="form-item-button mt20 ml20"
						onclick="javascript:SendMobilePwd();">
						<h2>
							<a href="javascript:void(0);">前往验证</a>
						</h2>
					</div>
				</div>
		</div>
		<!--找回密码结束--->

		<div class="zhmm zhmm_Three" style="display: none;">
			<!--找回密码开始--->
			<h3>
				找回密码
				<span
					onclick="javascript:$('.zhmm_Three').hide();$('.loginbg').hide();"></span>
			</h3>
			<div class="zhmm-cont1">
				<div class="form-item-1 form-item-2">
					<label></label>
					<span id="spzhmmSuccess"></span>
				</div>
			</div>
		</div>
		<!--找回密码结束--->



		<!--面包屑开始-->
		<div class="mbx">
			<span><a href="#">众调网</a>
			</span> &gt;
			<span><a href="#">汽车估值</a>
			</span> &gt;
			<span><a class="zd-blue-a" href="#">我要查询卖车价格</a>
			</span>
		</div>
		<!--面包屑结束-->
		<div class="banner new_banner z-19">
			<div class="clear"></div>
		</div>

		<div class="banner_2 new_banner_2 z-21">
			<div class="banner_cont_2 new_banner_cont_2">
				<div class="car_refer new_car_refer_1">
				</div>
				<div class="car_refer_cont new_car_refer_cont_1">
					<h2>
						全面了解您的爱车信息
					</h2>
					<ul class="item ml40" style="display: block;">
						<li class="z-20" style="display: none;">
							<div class="item_li z-20">
								<input value="92" id="brandid" type="hidden">
									<span class="item_span new_item_span"><a
										class="zsela_open" href="javascript:void(0);" id="brand">大众</a><em
										class="zselet_open"></em>
									</span>
									<div class="zli_div1_dl li_zli_div1_dl_1"
										style="display: none;" id="divAppMyMake">
										<dl class="pinp">
											<dd></dd>
										</dl>
									</div>
							</div>
						</li>
						<li class="z-18">
							<div class="item_li new_item_li z-18">
								<span class="item_span new_item_span dw-sp">
								 <em class="zselet_open"></em> 
		                         <select id="familyopetion">
		                         </select>
		                        </span>
							</div>
						</li>


						<li class="z-18">
						<div class="item_li new_item_li z-18">
							<span class="item_span new_item_span dw-sp">
							 <em class="zselet_open"></em> 
	                         <select id="vehicleobject" name="vehicleid">
								<option>请选择车型</option>
	                         </select>
	                        </span>
	                        </span>
						</div>
				</li>
						<li class="z-18">
					<div class="item_li new_item_li z-18">
						<span class="item_span new_item_span dw-sp">
                        <em class="zselet_open"></em>     
                         <select name="cityid" >
<option value="3" selected="selected">上海</option>
<option value="11">南京</option>
<option value="12">杭州</option>
<option value="14">福州</option>
<option value="16">济南</option>
<option value="41">无锡</option>
<option value="42">宁波</option>
<option value="46">青岛</option>
<option value="70">温州</option>
<option value="125">苏州</option>
<option value="128">泉州</option>
<option value="156">漳州</option>

                         </select>
                        </span>
					</div>
				</li>
						  <li class="z-16 clearfix">
					<div class="model-select-box z-25">
						<div class="model-select-text"><input class="model-textbox cityinput" key-name="mandatory_insurance" id="bx-time" type="text" name="date" value="请选择上牌日期" style="font-size:12px;"/></div>
					</div>
					<div class="item_li item_span_long">
						<span class="span_long_left span_long_left_2"><input class="zsela_open" id="txtAppMyMileage" value="" onfocus="javascript:if($.trim($(this).val())=='请输入行驶里程'){$(this).val('');$(this).removeClass('active');}$(this).addClass('zsela_open');" onblur="javascript:if($.trim($(this).val())==''){$(this).val('请输入行驶里程').removeClass('zsela_open');}" style="ime-mode:disabled" type="text" name="mileage"><i>万公里</i>
</span>
					</div>
				</li>
						<li>
							<div class="zban_left_btn li_zban_left_btn">
								<a href="javascript:void(0);" class="btn_oreg" id="btnAppBase">快速评估</a><a
									href="javascript:void(0);" class="btn_blue" id="btnAppDetail">精准评估</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>


		﻿
		<div class="footert">
			<div class="about area">
				<ul>
					<li>
						<span class="title01">关于我们</span>
						<span><a href="#">关于我们</a>
						</span>
						<span><a href="#">联系我们</a>
						</span>
						<span><a href="#">加入我们</a>
						</span>
					</li>
					<li>
						<span class="title01">关注我们</span>
						<span><a href="#" target="_blank">众调网微博</a>
						</span>
						<span><a href="#" class="zweixina">众调网微信</a>
						</span>

					</li>
					<li>
						<span class="title01">帮助中心</span>
						<span><a href="http://www.jingzhengu.com/html/bangzhu/">常见问题</a>
						</span>
						<span><a href="http://www.jingzhengu.com/gujia/">二手车市场价大全</a>
						</span>
						<span><a
							href="http://www.jingzhengu.com/ershouche/salecar/">二手车出售</a>
						</span>
						<span><a
							href="http://www.jingzhengu.com/form/buyoldcar.aspx">二手车求购</a>
						</span>
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
						target="_blank">优信拍</a>
					</i>
				</p>
				<p>
					<span>友情链接 ｜ </span><i><a href="http://car.bitauto.com/"
						target="_blank">买新车</a><a href="http://baa.bitauto.com/"
						target="_blank">汽车论坛</a><a href="http://zijia.bitauto.com/"
						target="_blank">汽车自驾游</a><a href="http://dealer.bitauto.com/"
						target="_blank">汽车经销商</a><a href="http://www.chexun.com/"
						target="_blank">车讯网</a>
					</i>
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
		

		

</form>
	</body>
</html>
