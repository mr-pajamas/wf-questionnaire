<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>

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
		<script type="text/javascript" src="<%=webRoot %>/js/pagenav1.1.cn.js"></script>
         <script type="text/javascript" src="<%=webRoot %>/js/jquery-1.11.1.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function() {
			//optional set
			pageNav.pre="上一页";
			pageNav.next="下一页";
			 //  p,当前页码,pn,总页面
			pageNav.fn = function(p,pn){
				//document.getElementById("test").innerHTML ="当前页:"+p+"  ,  总页: "+pn;
				//$("#test").text("Page:"+p+" of "+pn + " pages."); // jquery调用方式
				if(${listPage}!=p){
					$("#page").val(p);
				    $("#pageNumber").submit();
				}
			};
			
			//重写分页状态
			pageNav.go(${listPage},${totalPage});

		});
		
		function writedata(phone){
			window.open("<%=webRoot%>/synthesize/questionnaire1?phone="+phone);        
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
		        	<div class="container" style="">
		        	  <form action="index" name="pageNumber" id="pageNumber" method="post">
			
		<input type="text" id="search" name="search" />
		<input type="button" title="查询" value="查询"/>
		        	</div>
		  			<c:forEach items="${list}" var="list">
					<div class="container" style="width: 50%">
						<div style="">
							<div style="float:left" >
								<img style=" width:100px;height:100px" alt="用户头像" src="<%=webRoot %>/images/man.png">
							</div>
							<div style="float:left;padding-top:25px;margin-left:10px">
								<div style="float:left" >
									<span>姓名：${list.name}</span>
								</div>
								<div style="clear"></div>
								<div style="float:left">
									<span>公司地址：${list.province}${list.city}${list.street}</span>
								</div>
								<div style="clear"></div>
								<div style="float:left">
									<span>手机号：${list.phone}</span>
								</div>
							</div>
							
							<div style="float:right;margin-left:100px" >
							<a href="###" onclick="writedata(${list.phone})" style="background-color:#7AA9D0;border-color: #7AA9D0;margin-top:30px;" class="btn btn-lg btn-info active" >填写</a>
								
							</div>
						</div>
					</div>
					</c:forEach>
								   <!-- 分页控件 -->
					<input type="hidden" id="page" name="page" />
		            <div id="pageNav"></div>
			</form>
									
		    	</div>
		    	
	    	</section>
	    	
		</div>
	</body>
</html>