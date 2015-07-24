<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>海略大数据平台</title>
<script>
	$(function(){
		$(".bieke_menu li a").click(function(){
			$(this).parent().siblings().children("a").css("background-image","url(<%=webRoot%>/images/website/menu_img1.png)");
			$(this).parent().siblings().children("ul").slideUp("slow");
			if($(this).siblings("ul").is(":hidden"))
			{
				$(this).css("background-image","url(<%=webRoot%>/images/website/menu_img2.png)");
				$(this).siblings("ul").slideDown("slow");
			}
			else
			{
				$(this).css("background-image","url(<%=webRoot%>/images/website/menu_img1.png)");
				$(this).siblings("ul").slideUp("slow");
			}
			
		});
		
		$("#che_series a").click(function(){
			$(this).css({"background":"#2088CF","color":"#fff"});
			$(this).parent().siblings().children().css({"background":"#fff","color":"#5E5E5E"});
		});
		
	});

	

	
	function f_addTab(url){
		$("#home").attr("src",url);
	}

	function searchseries(brandid){
    	$.ajax( {
    		url : "searchseries", 
    		data:{brandid:brandid},
    		type : "POST",
    		  dataType:"json",
    		success : function(result) {
    			var str = '';		
    			for(var r in result){
    				str += '<li><a id='+brandid+'_'+result[r].seriesid+' href="javascript:shownews('+result[r].seriesid+')">'+result[r].series+'</a>';
    			}	
    			$("#menu").html(str); 
    			searchsynthesize();
    			$("#t_brandid").val(brandid);
    	}
    	});
	}

	function shownews(seriesid){
		f_addTab('<%=webRoot %>/news/index');
		$("#t_seriesid").val(seriesid);
	}

	function searchsynthesize(){
		f_addTab('<%=webRoot %>/synthesize/index');
	}

	function showuserset(){
		f_addTab('<%=webRoot %>/myset/showmyset');
	}		

	function tohome(brandid){
		 window.location.href="<%=webRoot %>/home?brandid="+brandid; 
	}
</script>
</head>

<body>
<form action="">
<input type="hidden" id="t_brandid" name="t_brandid"/>
<input type="hidden" id="t_seriesid" name="t_seriesid"/>
<input type="hidden" id="t_seriesid" name="t_seriesid"/>
</form>
	<div class="head">
		<div class="logo_div fl"><img src="<%=webRoot%>/images/website/ty_logo.png"/></div>
		<div class="username_div fr">
	
			<div class="username_box" href="javascript:void(0)"><img src="<%=webRoot%>/images/website/user_img.jpg"/><span class="mgl5">${sessionScope.emp.username}</span>
			<img class="mgl5" src="<%=webRoot%>/images/website/user_more_img.jpg"/>
				<div class="username_menu">

					<a href="<%=webRoot %>/employee/showmysetting">我的设置</a>
					<a href="#">我的报表</a>
					<a href="<%=webRoot %>/employee/logout">退出</a>
				</div>
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
	<div class="height_20"></div>
	<div class="topic_label">
		<a href="<%=webRoot %>/home/index" class="mgr30" style="color:#fff">首页</a>
		<a href="javascript:tohome(9)" class="mgl30" style="color:#fff">上海大众</a>
	</div>
	<div class="height_20"></div>
	<div class="content">
	<%--	<div class="left_box fl">
			<div class="fl" id="che_series">
				<div><a id="bieke" class="che_series_div" href="javascript:searchseries(5)">别克</a></div>
				<div class="mgt10"><a class="che_series_div" href="javascript:searchseries(41)">雪弗兰</a></div>
				<div class="mgt10"><a class="che_series_div" href="javascript:searchseries(77)">凯迪拉克</a></div>
			</div>
			<div class="fl bd">
				<ul class="bieke_menu" id="menu">
					
				</ul>
			</div>
			
		</div>--%>
		<div class="right_box fr" style="width: 100%">
			<iframe style="width:100%;" frameborder="0" name="home" id="home" src="<%=webRoot %>/synthesize/index"></iframe>
			<script type="text/javascript">
				function reinitIframe(){
				var iframe = document.getElementById("home");
				try{
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight);
				iframe.height =  height;
				}catch (ex){}
				}
				window.setInterval("reinitIframe()", 200);
			</script>
		</div>
	</div>
	<div class="clear height_20"></div>
</body>
</html>
