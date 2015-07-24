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
		zhankai();
	});


	function zhankai(){
		$("#bid_${brandid}").css("background-image","url(<%=webRoot%>/images/website/menu_img2.png)");
		$("#bid_${brandid}").siblings("ul").slideDown("slow");

		$("#sid_${seriesid}").css("background-image","url(<%=webRoot%>/images/website/menu_img2.png)");
		$("#sid_${seriesid}").siblings("ul").slideDown("slow");
		
	}
	
	
	function f_addTab(url){
		$("#home").attr("src",url);
	}


	function shownews(seriesid){
		$("#t_seriesid").val(seriesid);
		shuaxin();
		
	}

	function searchsynthesize(){
		f_addTab('<%=webRoot%>/synthesize/index');
	}

	function showuserset(){
		f_addTab('<%=webRoot%>/myset/showmyset');
	}	

	function shuaxin(){
		home.window.refreshIF();
	}
	function tohome(brandid){
		 window.location.href="<%=webRoot%>/home?brandid="+brandid; 
	}
</script>
	</head>

	<body>
		<form action="">
			<input type="hidden" id="t_brandid" name="t_brandid" />
			<input type="hidden" id="t_seriesid" name="t_seriesid"
				value="${seriesid}" />

		</form>
		<div class="head">
			<div class="logo_div fl">
				<img src="<%=webRoot%>/images/website/ty_logo.png" />
			</div>
			<div class="username_div fr">

				<div class="username_box" href="javascript:void(0)">
					<img src="<%=webRoot%>/images/website/user_img.jpg" />
					<span class="mgl5">${sessionScope.emp.username}</span>
					<img class="mgl5"
						src="<%=webRoot%>/images/website/user_more_img.jpg" />
					<div class="username_menu">
						<a href="<%=webRoot%>/employee/showmysetting">我的设置</a>
						<a href="#">我的报表</a>
						<a href="<%=webRoot%>/employee/logout">退出</a>
					</div>
				</div>

			</div>
			<div class="clear"></div>
		</div>
		<div class="height_20"></div>
		<div class="topic_label">
			<a href="<%=webRoot%>/home/index" class="mgr30" style="color: #fff">首页</a>
			<a href="javascript:tohome(9)" class="mgl30" style="color: #fff">上海大众</a>
		</div>
		<div class="height_20"></div>
		<div class="content">
			<div class="left_box fl">

				<div class="fl bd">
					<ul class="bieke_menu">
						<li>
							<a id="bid_9" href="javascript:void(0)">上海大众</a>
							<ul class="hide">
								<c:forEach items="${blist1}" var="b1">
									<li>
										<a id="sid_${b1.seriesid}"
											href="javascript:shownews(${b1.seriesid})">${b1.series}</a>
										<ul class="hide">
											<li class="fb font14 tc">
												竞品选择
											</li>
											<c:forEach items="${b1.listjp}" var="jp">
												<li class="pr">
													<input class="compete_input" id="cid_${b1.seriesid}"
														name="cid_${b1.seriesid}" type="checkbox"
														onclick="shuaxin()" checked="checked" 
														value="${jp.competitive_seriesid }" />
													${jp.competitive_series }
												</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</li>


					</ul>
				</div>

			</div>
			<div class="right_box fr">
				<iframe style="width: 100%;" frameborder="0" name="home" id="home"
					src="<%=webRoot%>/news/index" scrolling=no ></iframe>
				<script type="text/javascript">
					function reinitIframe() {
						var iframe = document.getElementById("home");
						try {
							var bHeight = iframe.contentWindow.document.body.scrollHeight;
							var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
							var height = Math.max(bHeight, dHeight);
							iframe.height = height;
						} catch (ex) {
						}
					}
					window.setInterval("reinitIframe()", 200);

				</script>
			</div>
		</div>
		<div class="clear height_20"></div>
	</body>
</html>
