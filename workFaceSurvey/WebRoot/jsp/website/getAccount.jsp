<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<link href="<%=webRoot %>/css/website/regist.css" rel="stylesheet" type="text/css" />
<script src="<%=webRoot %>/js/jquery-1.10.1.min.js" rel="stylesheet"  type="text/javascript"></script>  
<script src="<%=webRoot %>/js/website/regist.js" rel="stylesheet"  type="text/javascript"></script>  
<html>
  <head>
    <title>注册页面</title>
    <script type="text/javascript">
    	function submit_reg(){
		$.ajax({
	    	url : "register", 
	    	data:$("#regist").serialize(),
	    	type : "POST", 
	    	success : function(result) {
				var obj = JSON.parse(result);
				if(obj.result){
					alert(obj.msg);
					location.href="<%=webRoot%>";
				}else{
					var msg=obj.msg;
					alert(msg);
					$("#tip").html(msg).addClass("error").attr("style","top:30px;");
				}
	   			
	   			
	    	}
	    	});
	 }

    </script>
</head>
  
<body>
	<div class="container">
		<div class="reg_head">
			<div class="logo fl"><img src="<%=webRoot %>/images/website/tongyong.jpg"/></div>
			<div class="login_label fr">
				已有账户,<a href="<%=webRoot %>">马上登录</a>
			</div>
		</div>
		<div class="reg_body">
			<div class="reg_box">
				<div class="regist_label">新用户注册</div>
				<form id="regist" onsubmit="return false;" method="post">
					<div class="item">
						<span class="label">注册邮箱：</span>
						<div class="item-ifo fl">
							<input class="text" type="text" id="email" name="email"/><i class=""></i>
							<label id="email_info"></label>
						</div>
					</div>
					<div class="item">
						<span class="label">请设置密码：</span>
						<div class="item-ifo fl">
							<input class="text" type="password"  name="pwd" id="password" onpaste="return false"/><i class=""></i>
							<label id="pwd_info"></label>
							<div id="pwdstrength" class="hide">
								<span class="strength_txt">安全程度</span>
								<div class="strength_div">
									<span>弱</span>
									<span>中</span>
									<span>强</span>
								</div>
							</div>
						</div>
						
					</div>
					<div class="item">
						<span class="label">请确认密码：</span>
						<div class="item-ifo fl">
							<input class="text" type="password" id="pwdRepeat " name="pwdRepeat" onpaste="return false"/><i class=""></i>
							<label id="pwdRepeat_info"></label>
						</div>
					</div>
					<div class="item">
						<span class="label">姓名：</span>
						<div class="item-ifo fl">
							<input class="text" type="text" id="name" name="name"/><i class=""></i>
							<label id="name_info"></label>
						</div>
					</div>
					<div class="item">
						<span class="label">工号：</span>
						<div class="item-ifo fl">
							<input class="text" type="text" id="employeeNum" name="employeeNum"/><i class=""></i>
							<label id="employeeNum_info"></label>
						</div>
					</div>
					<div class="item">
					<span class="label"></span>
						<div class="item-ifo fl">
							<script async type="text/javascript" src="http://api.geetest.com/get.php?gt=caedaf8ef139f2ff0aa905bc444a9195"></script>
							<label id="tip"></label>
						</div>
					</div>
					<div class="readmeitem">
						<span class="label"></span>
						<div class="readme fl">
							<input id="readme" type="checkbox" name="readme" checked="checked"/>
							<label class="readme_label">我已看过并同意<a href="javascript:;" style="color:#0272b8;">《海略大数据平台服务使用协议》</a></label>
							<label id="readme_info"></label>
						</div>
					</div>
					<div class="item">
						<span class="label"></span>
						<a class="btn-regist fl" href="javascript:;" onclick="submitValidate()">注册</a>
					</div>
				</form>
			</div>
		</div>
		<div class="reg_foot">
			Copyright ◎2013 shanghai General Motors Co Ltd All Rights Reserved
		</div>
	</div>
</body>
</html>
