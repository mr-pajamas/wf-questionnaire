<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="../commonincludes.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<script>
	$(function(){
		$(".bieke_menu p").click(function(){
			$(this).addClass("bieke_menu_p");
			$(this).parent().siblings().children().removeClass("bieke_menu_p");
			$("#"+$(this).attr("id")+"_show").css("display","block");
			$("#"+$(this).attr("id")+"_show").siblings().css("display","none");
		});
	});
	
	function checksubmit() {
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if(password1 == "" || password1 == null) {
			alert("请输入密码");
			return false;
		}
		else if(password2 == "" || password2 == null) {
			alert("确认密码不能为空");
			return false;
		}
		else if(password1 != password2) {
			alert("两次密码输入不一致，请重新输入");
			return false;
		}
		else {
			resetpwd(password1,password2);
			return true;
		}
	}

	  function resetpwd(pw1,pw2){
       	$.ajax({
			url : "changepwd",
			data :  {password1:pw1,password2:pw2},
			type : "POST",
			success : function(result) {
				alert(result);
				location.href="<%=webRoot %>/employee/showmysetting";
			}
		});
	}
	function tohome(brandid){
		 window.location.href="<%=webRoot %>/home?brandid="+brandid; 
	}
</script>
<style>
.bieke_menu{width:100%}
.bieke_menu p{cursor:pointer;font-size:14px;text-align:center;height:30px;line-height:30px;}
.bieke_menu_p{background:#f1f1f1;}
</style>
</head>
<body>
	<div class="head">
		<div class="logo_div fl"><img src="<%=webRoot%>/images/website/ty_logo.png"/></div>
		<div class="username_div fr">
			<div class="username_box" href="javascript:void(0)"><img src="<%=webRoot%>/images/website/user_img.jpg"/><span class="mgl5">${sessionScope.emp.username}</span>
				<img class="mgl5" src="<%=webRoot%>/images/website/user_more_img.jpg"/>
				<div class="username_menu">
					<a id="my_settings" href="<%=webRoot %>/employee/showmysetting">我的设置</a>
					<a href="#">我的报表</a>
					<a href="<%=webRoot %>/employee/logout">退出</a>
				</div>
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
	<div class="topic_label">
		<a href="<%=webRoot %>/home/index" class="mgr30" style="color:#fff">首页</a>
			<a href="javascript:tohome(5)" class="mgl30" style="color:#fff">别克</a>
		<a href="javascript:tohome(41)" class="mgl30" style="color:#fff">雪佛兰</a>
		<a href="javascript:tohome(77)" class="mgl30" style="color:#fff">凯迪拉克</a>
	</div>
	<div class="height_20"></div>
	<div class="content">
		<div class="left_box fl">
			<div class="bd bdf">
				<ul class="bieke_menu">
					<li><p id="mysetting" class="bieke_menu_p">我的设置</p></li>
					<li><p id="changepsw">修改密码</p></li>
				</ul>
				
			</div>
		</div>
		<div class="right_box fr" style="background:#fff;height:460px;">
			<div id="mysetting_show" class="mgl30">
				<div class="mgt20">
					<p style="font-size:14px;color:#008000;font-weight:700" class="mgb30">基本信息</p>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">登陆邮箱：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.username }</span>
					</div>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">姓名：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.name }</span>
					</div>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">性别：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.gender }</span>
					</div>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">工号：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.jobnum }</span>
					</div>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">岗位：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.position }</span>
					</div>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">部门：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.department }</span>
					</div>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">手机：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.phonenum }</span>
					</div>
					<div style="overflow:hidden;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">邮箱：</span>
						<span style="height:30px;line-height:30px;width:250px;float:left">${sessionScope.emp.email }</span>
					</div>
					<a href="<%=webRoot %>/employee/show_modify_empinfo" style="display:block;margin-left:110px;width:80px;height:30px;line-height:30px;text-align:center;background:#2088CF;border-radius:5px;color:#fff;margin-top:10px;">编辑</a>
				</div>
			</div>
			<div id="changepsw_show" class="hide mgl30">
				<div class="mgt20">
					<p style="font-size:14px;color:#008000;font-weight:700" class="mgb30">修改密码</p>
					<div style="overflow:hidden;margin-bottom:10px;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">用户名：</span>
						<input  readonly value="${username}"style="height:30px;line-height:30px;width:250px;float:left;" type="text"/>
						</div>
					<div style="overflow:hidden;margin-bottom:10px;">
						<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">新密码：</span>
						<input id="password1" style="height:30px;line-height:30px;width:250px;float:left;border:1px solid #ccc" type="password"/>
					</div>
					<div style="overflow:hidden;margin-bottom:10px;">
					<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">确认密码：</span>
					<input id="password2" style="height:30px;line-height:30px;width:250px;float:left;border:1px solid #ccc" type="password"/></div>
					<a href="javascript:void(0)" onclick="return checksubmit()" style="display:block;margin-left:195px;width:80px;border:1px solid #ccc;height:30px;line-height:30px;text-align:center;background:#2088CF;border-radius:5px;color:#fff;">保存</a>
				</div>
			</div>
		</div>
	</div>
	<div class="clear height_20"></div>
</body>
</html>
