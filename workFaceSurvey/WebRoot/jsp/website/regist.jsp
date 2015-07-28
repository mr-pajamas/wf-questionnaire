<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
   <%@ include file="../commonincludes.jsp"%>
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
		<script type="text/javascript" src="<%=webRoot %>/js/jquery-1.11.1.js"></script>
	
</head>

<body class="demo1" onload="loadImageFile()">
		<div class="main">
			<section class="page1">
		      	<div class="page_container">
		        	
					<div class="container">
						<form class="form-signin" action="<%=webRoot %>/survey/saveregist" method="post">
						    <c:if test="${!empty user.headimg}">
						     <img alt="" src="${user.headimg}" width="200" height="200" style="margin-bottom:20px "/>
						    </c:if>
						    <c:if test="${empty user.headimg}">
						        <img alt="" src="<%=webRoot %>/images/88957826084468896.jpg" width="200" height="200" style="margin-bottom:20px "/>
						    </c:if>
						    
							<label class="sr-only" for="inputTelNum">手机号码</label>
							<input id="inputTelNum" class="form-control" name="PhoneNum" type="tel" autofocus="" required="" placeholder="Phone Number">
							<label class="sr-only" for="inputPassword">Password</label>
							<input id="inputPassword" class="form-control" type="password" name="password" required="" placeholder="Password">
							<label class="sr-only" for="confirmPassword">密码</label>
							<input id="confirmPassword" class="form-control" type="password" required="" name="passwordRpe" placeholder="Confirm Password">
							<input class="btn btn-lg btn-primary btn-block" onsubmit="validate()" value="Submit" type="submit"/>
						</form>
						<div style="color:#b02f2a;font-size:12px;margin-top:10px">${error}</div>
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