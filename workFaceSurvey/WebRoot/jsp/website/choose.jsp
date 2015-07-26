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
	    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<script src="<%=webRoot %>/js/jquery-1.11.1.js" rel="stylesheet"  type="text/javascript"></script>  

	    
	</head>
	<body class="demo1">
		<div class="main">
			<section class="page1">
		      	<div class="page_container">
		        	<div >
		        		<img class='logo' style="box-sizing:content-box" alt="workface" src="<%=webRoot%>/images/logo.png">
		        	</diV>
		        	<div class="title" style="font-weight:bold">
		        		创&nbsp;业&nbsp;上&nbsp;海&nbsp;万&nbsp;人&nbsp;田&nbsp;野&nbsp;调&nbsp;查&nbsp;&nbsp;&nbsp;&nbsp;
		        	</div>
		        	<div style="margin-top:60px">
		        		<a href="#" style="background-color:#7AA9D0;border-color: #7AA9D0;margin-right:20px" class="btn btn-lg btn-info active"  role="button">首次填写</a>
						
						<a href="#" style="background-color:#95D195;border-color: #95D195;margin-left:20px" class="btn btn-lg btn-success active" role="button">直接登陆</a>
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