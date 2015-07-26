<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<html>
<head>
<title>WorkFace Survey</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title></title>
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/login.css" />
		<script src="<%=webRoot %>/js/jquery-1.11.1.js" rel="stylesheet"  type="text/javascript"></script>  
	    <script type="text/javascript">
	    	function checkform(form){
	    		if(form.phoneNum.value==""){alert('抱歉，用户名不能为空！');return(false);}
	    		if(form.password.value==""){alert('抱歉，密码不能为空！');return(false);}
	    	}
	    </script>
	    
	</head>
	<body class="demo1">
		<div class="main">
			<section class="page1">
		      	<div class="page_container">
		        	<div >
		        		<img class='logo' alt="workface" src="<%=webRoot%>/images/logo.png">
		        	</diV>
		        	<div class="title" style="font-weight:bold">
		        		创&nbsp;业&nbsp;上&nbsp;海&nbsp;万&nbsp;人&nbsp;田&nbsp;野&nbsp;调&nbsp;查&nbsp;&nbsp;&nbsp;&nbsp;
		        	</div>
		        	<form action='<%=webRoot %>/survey/login' method='post'>
			        	<div class='shuru'>
			        		<input type="text" placeholder="手机号" id='phoneNum' name='phoneNum'/>
			        		
			        		<input type="password" placeholder="密  码" id='password' name='password'/>

			        	</div>
			        	<div>
			        		<p class='submit'><input type='submit' onclick="javascript:return checkform(this.form)" value='登&nbsp;&nbsp;录'></input></p>
			        		<p class='query'><a style="" href="<%=webRoot %>/admin/home/assessment">注&nbsp;&nbsp;&nbsp;&nbsp;册</a></p>
			        	</div>
			        	<div style="color:#b02f2a;font-size:12px;margin-top:10px">${error}</div>
			        	
		        	</form>
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