<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Access-Control-Allow-Origin" content="*" />
<meta name="viewport" content="initial-scale=1.0,user-scalable=no" />
<link rel='stylesheet' href='<%=webRoot %>/css/used_car.css'>
   	<link rel="shortcut icon" type="image/x-icon" href="<%=webRoot%>/images/favicon.ico" /> 
<title>众调网--我的二手车</title>                        
<script type="text/javascript">

function showmore(){
	var a=$("#maxrs").val();
	c=parseInt(a)+parseInt(10)
	   window.location.href="<%=webRoot %>/usercar/index?maxrs="+c; 
}
</script>
</head>
<body>
<input type="hidden" id="maxrs" name="maxrs" value="${maxrs}">
	<!-- header部分 begin-->
	<div class='container'>
		<div class='header'>
			<div class="header_logo"><img src="<%=webRoot %>/css/ztw/logo.png"></div>
			<div class="header_user">
				<img src="<%=webRoot %>/images/man.png">
				<div class='xinxi'>
					<label>欢迎您，<span>李强</span></label>
				</div>
			</div>
			
		</div>
	</div>
	<!-- header部分 end -->

	<!-- 导航部分 begin -->
	<div class='wrap'>
		<div class='container nav'>
			<ul>
				<li><a href='<%=webRoot %>'>首页</a></li>
				<li><a href='<%=webRoot %>/admin/home/assessment'>在线估值</a></li>
				<li><a href='<%=webRoot %>/usercar/index'>我的二手车</a></li>
			</ul>
		</div>
	</div>
	<!-- 导航部分 end -->

	<!-- 面包屑导航 begin -->
	<div class='container sec_nav'>
		<div class='sec_left'>
			<label><a href='#'>众调网</a><span>></span><a href='#'>我的二手车</a><span>></span><a href='#' class='now'>用户管理</a></label>
		</div>
		<div class='sec_right'>
		
		</div>
	</div>
	<!-- 面包屑导航 end -->
	
	<!-- 正文部分 begin -->
	<div class='container content'>

<c:forEach items="${list}" var="list">
		<div class='list'>
			<div class='img'>
				<img src='<%=webRoot %>${list.vehicleimg}' width="370" height="290">
			</div>
			<div class='info'>
				<div class='title'>${list.vehiclename}</div>
				<table>
					<tr>
						<td>上牌时间:<span>${list.date}</span></td><td class='color1'>车商卖车价格:<span class='price'>￥
						<c:choose>
                        <c:when test="${list.price1==0.0}">
						<fmt:formatNumber value="${list.price2 * 0.88}" type="currency" pattern=".0#" />
						</c:when>
						<c:otherwise>
						${list.price1}
						</c:otherwise>
						</c:choose>
						</span>万</td>
					</tr>
					<tr>
						<td>城市:${list.cityname}</td><td class='color2'>个人买卖价格:<span class='price'>￥${list.price2}</span>万</td>
					</tr>
					<tr>
						<td>里程数：${list.mileage}万公里</td><td class='color3'>车商零售价格:<span class='price'>￥
						<c:choose>
                        <c:when test="${list.price3==0.0}">
					 <fmt:formatNumber value="${list.price4 * 0.98}" type="currency" pattern=".0#" />
						</c:when>
						<c:otherwise>
						${list.price3}
						</c:otherwise>
						</c:choose>
						</span>万</td>
					</tr>
					<tr>
						<td></td><td></td>
					</tr>
				</table>
				<div class='bt'>
					<button class='sold'>我要卖</button>
					<button class='buy'>我要买</button>
				</div>
			</div>
		</div>
</c:forEach>
		<div class='loadmore'><a href='###' onclick="showmore()">点击查看更多>>></a></div>


	</div>

	<!-- 正文部分 end -->
	<!-- 弹出窗口  begin -->

<div id='buy_bt' class="popup">
<p class='title blue'>我要买车</p>
<form>
<table>
	<tr>
		<td>姓名:</td><td><input type="text" placeholder='请输入您的姓名'></td>
	</tr>
	<tr>
		<td>手机号:</td><td><input type="text" placeholder='请输入您的手机号'></td>
	</tr>
	<tr>
		<td>购车预算:</td><td><input type="text" placeholder='请输入您的预算'></td>
	</tr>
</table>
</form>

<p class='conn'>我们将于2个工作日内与您取得联系</p>
<div class='bt'>
<button class='confirm blue' id='confirm_buy'>确&nbsp;&nbsp;定</button>
<button class='cancel blue' id='cancel_buy'>取&nbsp;&nbsp;消</button>
</div>
</div>


<div id='sell_bt' class="popup">
<p class='title red'>我要卖车</p>
<form>
<table>
	<tr>
		<td>姓名:</td><td><input type="text" placeholder='请输入您的姓名'></td>
	</tr>
	<tr>
		<td>手机号:</td><td><input type="text" placeholder='请输入您的手机号'></td>
	</tr>
	
</table>
</form>

<p class='conn'>我们将于2个工作日内与您取得联系</p>
<div class='bt'>
<button class='confirm red' id='confirm_sell'>确&nbsp;&nbsp;定</button>
<button class='cancel red' id='cancel_sell'>取&nbsp;&nbsp;消</button>
</div>
</div>
<!-- 弹出窗口  end -->

<script src="<%=webRoot %>/js/jquery-1.11.1.js" rel="stylesheet"  type="text/javascript"></script>  
<script>
	var bts = $(".list button") ;
	$.each(bts , function(index , element){
		// console.log($(element).text());
		$(element).click(function(){
			if($(element).text() == '我要买')
			{
				$('#buy_bt').css('display' , 'block');
				$('#sell_bt').css('display' , 'none');
			}
			else
			{
				$('#buy_bt').css('display' , 'none');
				$('#sell_bt').css('display' , 'block');	
			}
		});
	})

	$('#confirm_buy').click(function(){
		$('#buy_bt').css('display' , 'none');
	});
	$('#cancel_buy').click(function(){
		$('#buy_bt').css('display' , 'none');
	});

	$('#confirm_sell').click(function(){
		$('#sell_bt').css('display' , 'none');
	});
	$('#cancel_sell').click(function(){
		$('#sell_bt').css('display' , 'none');
	});

</script>


</body>
</html>