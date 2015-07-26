<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>WorkFace Survey</title>
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/login.css" />
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/regist.css" />
	   <!-- 新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		
		<!-- 可选的Bootstrap主题文件（一般不用引入） -->
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function validate(){
			var reg= new RegExp( "^0?(13|15|18|14|17)[0-9]{9}$");
			var phone=$("#inputTelNum").val();
			var password=$("#inputPassword").val();
			var passwordRpe=$("#confirmPassword").val();
			if (phone == "") {
				alert("手机号码不能为空！");
				return false;
			}
			if (password == "") {
				alert("密码不能为空！");
				return false;
			}
			if (passwordRpe == "") {
				alert("确认密码不能为空！");
				return false;
			}
			if (passwordRpe != password) {
				alert("两次密码输入不一致！");
				return false;
			}
			if (!reg.test(phone)) {
				alert('手机号码格式不正确！'); 
			return false;
			}
			return true; 
		}
		</script>
</head>

<body class="demo1">
		<div class="main">
			<section class="page1">
		      	<div class="page_container">
		        	<div >
		        		<img class='logo' style="padding-top:0px;box-sizing:content-box" alt="workface" src="<%=webRoot%>/images/logo.png">
		        	</diV>
		        	<div class="title" style="padding-top: 16px;font-weight:bold">
		        		创&nbsp;业&nbsp;上&nbsp;海&nbsp;万&nbsp;人&nbsp;田&nbsp;野&nbsp;调&nbsp;查&nbsp;&nbsp;
		        	</div>
					<div class="container">
						<div>
							<div style="float:left" >
								<img style=" width:100px;height:100px" alt="用户头像" src="<%=webRoot%>/images/logo.png">
							</div>
							<div style="float:left;padding-top:25px;margin-left:10px">
								<div style="float:left" >
									<span>姓名：</span>杨树楷
								</div>
								<div style="clear"></div>
								<div style="float:left">
									<span>公司地址：</span>国定东路XXX
								</div>
								<div style="clear"></div>
								<div style="float:left">
									<span>手机号：</span>15800531997
								</div>
							</div>
						</div>
					</div>
		    	</div>
		    	
	    	</section>
	    	<section class="page2">
		   		<div class="page_container">
		        	
		      	</div>
		    </section>
		    <section class="page3">
		      	<div class="page_container">
			       
		      	</div>
	    	</section>
	    	<section class="page4">
		      	<div class="page_container">
			       
		      	</div>
	    	</section>
	    	<section class="page5">
		      	<div class="page_container">
			       
		      	</div>
	    	</section>
		</div>
	</body>
</html>