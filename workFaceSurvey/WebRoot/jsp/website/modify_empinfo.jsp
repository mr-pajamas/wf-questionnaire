<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="../commonincludes.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<script>
	$(function(){
		$(".setting_menu a").click(function(){
			$(this).addClass("setting_menu_p");
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
	
	function submitdata(){
	 	
	    	$.ajax( {
	    		url : "modify_empinfo", 
	    		data:$("#modify_emp").serialize(),
	    		type : "POST", 
	    		success : function(result) {
	    			alert(result);
	    			location.href="<%=webRoot %>/employee/showmysetting";
	    	}
	    	});
	 }
</script>
<style>
.setting_menu{width:100%;height:450px;padding-top:10px;}
.setting_menu p{cursor:pointer;font-size:14px;text-align:center;height:30px;line-height:30px;}
.setting_menu a{cursor:pointer;font-size:14px;text-align:center;height:30px;line-height:30px;display:block}
.setting_menu_p{background:#f1f1f1;}
.setting_menu_a{background:#f1f1f1;}
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
				<ul class="setting_menu">
					<li class="setting_menu_p"> <a href="<%=webRoot %>/employee/showmysetting">我的设置</a></li>
					<li><a id="changepsw">修改密码</a></li>
				</ul>
				
			</div>
		</div>
		<div class="right_box fr" style="background:#fff;height:460px;">
			<div id="mysetting_show" class="mgl30 pr">
				<div class="mgt20">
					<p style="font-size:14px;color:#008000;font-weight:700" class="mgb30">基本信息</p>
					<form name="modify_emp" method="post" action=""id="modify_emp">
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:60px;height:30px;line-height:30px;text-align:right;margin-right:10px;">姓名：</span>
							<input id="name" name="name" value="${sessionScope.emp.name }" style="height:30px;line-height:30px;width:250px;float:left;border:1px solid #ccc" type="text"/>
						</div>
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:60px;height:30px;line-height:30px;text-align:right;margin-right:10px;">性别：</span>
							<input class="fl" type="radio" name="gender" value="男" checked style="height:30px;line-height:30px;float:left"/>
							<span class="fl" style="height:30px;line-height:30px;">男</span>
							<div style="height:30px;line-height:30px;width:50px;float:left"></div>
	       					<input type="radio" name="gender" value="女" style="height:30px;line-height:30px;float:left;"/>
	        				<span class="fl" style="height:30px;line-height:30px;">女</span>
						</div>
						<div style="overflow:hidden;margin-bottom:10px;">
							<span id="position" name="position" class="fl" style="width:60px;height:30px;line-height:30px;text-align:right;margin-right:10px;">岗位：</span>
							<input id="position" name="position" value="${sessionScope.emp.position }" style="height:30px;line-height:30px;width:250px;float:left;border:1px solid #ccc" type="text"/>
						</div>
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:60px;height:30px;line-height:30px;text-align:right;margin-right:10px;">部门：</span>
							<input id="department" name="department" value="${sessionScope.emp.department }" style="height:30px;line-height:30px;width:250px;float:left;border:1px solid #ccc" type="text"/>
						</div>
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:60px;height:30px;line-height:30px;text-align:right;margin-right:10px;">手机：</span>
							<input id="phonenum" name="phonenum"  value="${sessionScope.emp.phonenum }" style="height:30px;line-height:30px;width:250px;float:left;border:1px solid #ccc" type="text"/>
						</div>
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:60px;height:30px;line-height:30px;text-align:right;margin-right:10px;">联系邮箱：</span>
							<input id="email" name="email" value="${sessionScope.emp.email }" style="height:30px;line-height:30px;width:250px;float:left;border:1px solid #ccc" type="text"/>
						</div>
						<a href="javascript:void(0)" onclick="return submitdata()" style="display:block;margin-left:135px;width:80px;border:1px solid #ccc;height:30px;line-height:30px;text-align:center;background:#2088CF;border-radius:5px;color:#fff;">保存</a>
					</form>
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
