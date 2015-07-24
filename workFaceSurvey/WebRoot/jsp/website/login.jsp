<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<html>
<head>
<title>众调网二手车交易平台</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/default.css" />
		<link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/style.css" />
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/onepage-scroll.css" />
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/elusive-webfont.css" />
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/login.css" />
   	<link rel="shortcut icon" type="image/x-icon" href="<%=webRoot%>/images/favicon.ico" /> 
<script src="<%=webRoot %>/js/jquery-1.11.1.js" rel="stylesheet"  type="text/javascript"></script>  
	    <script type="text/javascript" src="<%=webRoot %>/js/jquery.onepage-scroll.js"></script>
	    <script src="<%=webRoot %>/js/modernizr.js"></script>
	</head>
	<body class="demo1">
		<div class="main">
			<section class="page1">
		      	<div class="page_container">
		        	<diV><img src="<%=webRoot %>/images/logo.jpg" class='logo'></diV>
		        	<div class="title">
		        		欢迎来到二手车交易平台
		        	</div>
		        	<form action='<%=webRoot %>/employee/login' method='post'>
			        	<div class='shuru'>
			        		<input type="text" placeholder="手机号" name='phoneNum'/>
			        		
			        		<input type="text" placeholder="密  码" name='password'/>

			        	</div>
			        	<div>
			        		<p class='submit'><input type='submit' value='登&nbsp;&nbsp;录'></input></p>
			        		<p class='query'><a href="<%=webRoot %>/admin/home/assessment">快速查询</a></p>
			        	</div>
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
		<script type="text/javascript">
		    $(".main").onepage_scroll({
		      sectionContainer: "section"
		    });
	  	</script>
	</body>
</html>