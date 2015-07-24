<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="../commonincludes.jsp"%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Mysetting.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
   <script type="text/javascript">
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
			return true;
		}
	}
</script>
</head>

<body>
		<div class="width_98">
			<div>
				<a href="<%=webRoot %>/employee/showmysetting" class="settings_label">我的设置</a>
				
				<a href="<%=webRoot %>/employee/show_changepwd" class="settings_label">修改密码</a>
				<div class="clear"></div>
			</div>
			<div class="mgt20">
				<div style="width:30px;float:left"></div>
				<div >
					<div class="account_bot_r">
						<form name="change_pwdForm" action="<%=webRoot%>/employee/changepwd" method="post">
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">用户名：</span>
							<input readonly value="${username}" id="username" name="username" style="height:30px;line-height:30px;width:250px;float:left" type="text"/>
						</div>
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">密码：</span>
							<input name="password1" style="height:30px;line-height:30px;width:250px;float:left" type="text"/>
						</div>
						<div style="overflow:hidden;margin-bottom:10px;">
							<span class="fl" style="width:100px;height:30px;line-height:30px;text-align:right;margin-right:10px;">确认密码：</span>
							<input name="password2" style="height:30px;line-height:30px;width:250px;float:left" type="text"/>
						</div>
	 						<input type="submit" value="保存" style="display:block;margin-left:195px;width:80px;border:1px solid #ccc;border-radius:5px;height:30px;line-height:30px;text-align:center;"><br/>
							${error}
  						</form>
					</div>
				</div>
				
			</div>
		</div>
</body>
</html>
