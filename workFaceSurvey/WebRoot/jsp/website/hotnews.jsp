<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>别克-凯越热点新闻</title>
		<script>
	$(function(){
		$(".trend_item").click(function(){
			$(this).addClass("menu_item_hover").siblings().removeClass("menu_item_hover");
			$("#"+$(this).attr("id")+"_div").css("display","block").siblings().css("display","none");
		});


		$("#close").click(function(){
			$("#hide_div").fadeOut();
		});
	});

</script>
		<style type="text/css">
.test_ellipsis {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	width: 200px;
	float: left;
}

* {
	margin: 0px;
	padding: 0px;
	border: none;
}

body {
	font: 12px/ 180% Arial, Lucida, Verdana, "微软雅黑", "宋体", Helvetica,
		sans-serif;
	color: #333;
	background: #f1f1f1;
	-webkit-backface-visibility: hidden;
	-webkit-font-smoothing: antialiased;
}

a,a:visited {
	color: #5e5e5e;
	text-decoration: none;
}

ul,li {
	list-style: outside none none;
}
</style>
	</head>

	<body>
		<form action="">
			<input type="hidden" id="datetype" name="datetype" value="2" />
		</form>

		<div class="width_98">
			<div class="content_div fl">
				<div class="content_menu_div" style="">
					<div class="menu_item_box pr">
						<a class="menu_item menu_item_hover"
							href="<%=webRoot %>/news/index">热点新闻</a>
						<a class="menu_item" href="<%=webRoot %>/attention/index">声量/关注</a>
						<a class="menu_item" href="<%=webRoot %>/topic/showtopic">话题评论</a>
						<a class="menu_item" href="<%=webRoot %>/produc/showproduc">产品评价</a>
						<a class="menu_item" href="<%=webRoot %>/people/index">人群图谱</a>
					</div>
					<div class="menu_item_content">
						<div>
							<div class="dingwei">
								<div class="redianqvshi">
									<div class="qvshi">
										热点趋势
									</div>
									<div class="pic">
										<img id="pic6" src="<%=webRoot %>/images/wenhao.png"
											width="14" height="14" />
									</div>
									<p class="riqi">
<%--										2015-3至2015-5--%>
									</p>
								</div>
								<div style="display: none" class="tishi " id="tishi6">
									<p class="on">
										统计周期内新闻传播量趋势，各月的新闻热点，热点基于新闻关注量确定
									</p>
								</div>
							</div>
							<div class="fl" style="">
								<!-- 	<select class="data_sourse_select"><option>全部</option></select> -->
								<input name="hn" id="hn" value="0" checked="checked"
									onclick="getOptionData()" title="热点新闻" type="checkbox"/>
									热点新闻
							</div>

							<div class="near_time">
								<a href="javascript:void(0)" onclick="adddaytype(1)">最近30天</a>
								<a href="javascript:void(0)" onclick="adddaytype(2)">最近90天</a>
								<a href="javascript:void(0)" onclick="adddaytype(3)">最近半年</a>
								<a href="javascript:void(0)" onclick="adddaytype(4)"
									style="border-right: 1px solid #ccc">全部</a>
							</div>
							<div class="clear"></div>
						</div>
						<%--						<div>--%>
						<%--							<div class="fl" style="margin-left: 280px;">--%>
						<%--								<!-- 	<select class="data_sourse_select"><option>全部</option></select> -->--%>
						<%--								<input type="checkbox" name="hn" id="hn" value="0"--%>
						<%--									checked="checked" onclick="getOptionData()" title="热点新闻">--%>
						<%--									热点新闻</input>--%>
						<%--							</div>--%>
						<%----%>
						<%--							<div class="near_time">--%>
						<%----%>
						<%--								<a href="javascript:void(0)" onclick="adddaytype(1)">最近30天</a>--%>
						<%--								<a href="javascript:void(0)" onclick="adddaytype(2)">最近90天</a>--%>
						<%--								<a href="javascript:void(0)" onclick="adddaytype(3)">最近半年</a>--%>
						<%--								<a href="javascript:void(0)" onclick="adddaytype(4)"--%>
						<%--									style="border-right: 1px solid #ccc">全部</a>--%>
						<%--							</div>--%>
						<%--							<div class="clear"></div>--%>
						<%--						</div>--%>

						<div class="mgt20" style="position: relative;">
<%--							<div id="hide_div"--%>
<%--								style="width: 350px; height: 100px; background: #4c4c4c; color: #fff; display: none; padding: 5px 5px 0px 10px; position: absolute; z-index: 1000;">--%>
<%--								<p style="overflow: hidden">--%>
<%--									<span style="float: left;" id="hnt"></span><a--%>
<%--										style="float: right; color: #fff" id="close"--%>
<%--										href="javascript:;" alt="关闭">X --%>
<%--								</p>--%>
<%----%>
<%--								<ul style="padding-left: 10px; padding-top: 5px;" id="hnul">--%>
<%--									<li style="list-style: disc">--%>
<%--										<a href="javascript:;" style="color: #fff"></a>--%>
<%--									</li>--%>
<%--								</ul>--%>
<%--							</div>--%>
							
							<div id="hide_div"
								style="width: 350px; height: 100px; background: #4c4c4c; color: #fff; display: none; padding: 5px 5px 0px 10px; position: absolute; z-index: 1000;">
								<p style="overflow: hidden">
									<span style="float: left;" id="hnt"></span><a
										style="float: right; color: #fff" id="close"
										href="javascript:;" alt="关闭">X</a>
								</p>
								<a style="float: right; color: #fff" id="close"
									href="javascript:;" alt="关闭"> </a>
								<ul style="padding-left: 10px; padding-top: 5px;" id="hnul">
									<a style="float: right; color: #fff" id="close"
										href="javascript:;" alt="关闭"> </a>
									<li style="list-style: disc">
										<a style="float: right; color: #fff" id="close"
											href="javascript:;" alt="关闭"></a><a href="javascript:;"
											style="color: #fff"></a>
									</li>
								</ul>
							</div>
							
							<div id="l1" class="chart_content"></div>
						</div>
					</div>
				</div>

				<div class="content_news_div"
					style="margin-top: 0px; border-bottom: 0px; border-top: 0px; height: 330px">
					<div class="content_title" style="background: #fff; border: 0px">
						标题
						<span class="font12">（红色为负面新闻）</span>
						<span class="fr" style="width: 120px;">关注量 <span><img
									src="<%=webRoot%>/images/website/q1.png"
									title="在统计周期内，相关汽车新闻资讯文稿的浏览量合计;
关注量份额（或关注度）是指该统计对象的关注量占
所有统计对象关注总量的比例"
									width="20px" height="20px" /> </span> </span>

						<span class="fr" style="width: 120px;">传播量 <span><img
									src="<%=webRoot%>/images/website/q1.png"
									title="在统计周期内，相关汽车新闻资讯的发稿量（含首发、转载/发等）;
传播量份额是指该统计对象的传播量占所有统计对象传播总量的比例"
									width="20px" height="20px" /> </span> </span>

					</div>

					<div class="news_item pd10" id="newtitle">

					</div>
				</div>
				<div class="sourcefrom" style="background-color: #FFF;">

					<div class="remark">
						<div class="left">
							备注:
						</div>
						<div class="right">
							传播量是指该新闻网络发稿量，包括转发；关注量是指在统计周期内相关汽车新闻的浏览量

						</div>
					</div>
					<div class="data">
						<p>
							&nbsp;&nbsp;&nbsp;数据来源：
						</p>
						<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img src="<%=webRoot%>/images/xinwen.png" title="新闻"
								width="27" height="27" />
						</a>
						<!--<div class="right">)</div>-->
					</div>
				</div>
			</div>
			<div class="sidebar_div fr">
				<div class="car_hotnews_div" style="height: 340px">
					<div class="content_title" id="rankname"></div>
					<div class="news_item pd10" id="newrank">

					</div>
				</div>

				<div class="compete_hotnews_div"
					style="height: 340px; margin-top: 20px;">
					<div class="content_title">
						竞品热点新闻
						<span class="font12">（红色为负面新闻）</span>
					</div>
					<div class="news_item pd10" id="newjp">

					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
var l1 = echarts.init(document.getElementById('l1')); 
$(function () {
	refreshIF();
});

function refreshIF(){
	getOptionData();
	settitledata();
	setrankdata();
	setrankdatajp();
}

function adddaytype(datetype){
	$("#datetype").val(datetype);
	getOptionData();
	settitledata();
}



function getOptionData(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	 var cid = '';   
     $('input[name="cid_'+t_seriesid+'"]:checked',window.parent.document).each(function(){
          cid+= $(this).val()+','; 
     });
     var datetype = $("#datetype").val();
	$.ajax( {
		url : "searchnewdata", 
		data:{seriesid:t_seriesid,cid:cid,datetype:datetype},
		type : "POST",
		  dataType:"json", 
		success : function(result){
			l1.clear();
			var dlist = [];
			var tlist = [];
			var ldata=[];
			for(var r in result.dlist){
				dlist.push(result.dlist[r]);
			}
			
			for(var r in result.tlist){
				var dd=[];
				var listd=result.tlist[r].tjs.split(",");
				for(var j in listd){
					var d={
							value:listd[j],
							symbol:'pin',
							symbolSize:6
							};
					if($("#hn").is(":checked")){
						dd.push(d);
					}else{
						dd.push(listd[j]);
					}
					
				}
				
				var item={
						 name:result.tlist[r].series,
						 type:'line',
						 data:dd
						 }
				tlist.push(item);
				ldata.push(result.tlist[r].series);
			}
			setOption(dlist,tlist,ldata);
	}
	});
}

function setOption(dlist,series,ldata){

	var l1option = {
		    tooltip : {
	    trigger: 'axis'
	},
	legend: {
	    data:ldata
	},
    title : {
        text: '',
        textStyle :{fontSize: 18,
		fontWeight:'bolder',color: '#2088cf'}
    },
	dataZoom : {
	    show : true,
	    realtime : true,
	    start : 20,
	    end : 80
	},
	xAxis : [
	    {
	        type : 'category',
	        boundaryGap : false,
	        data:dlist
	    }
	],
	yAxis : [
	    {
	        type : 'value'
	    }
	],
	series:	series
	};
	// 为echarts对象加载数据 
	l1.setOption(l1option);
	if($("#hn").is(":checked")){
		l1.on('click', eConsole); 
	}
	
	
}
function eConsole(param) { 
	if($("#hn").is(":checked")){
		$.ajax( {
			url : "searchnewtitle3", 
			data:{seriesname:param.seriesName,date:param.name},
			type : "POST",
			  dataType:"json",
			  beforeSend : function() 
				{
				$("#hide_div").fadeOut();
				},
			success : function(result) {
				var str = "";
				for(var r in result){
					str+="<li style='list-style:disc'><a href='"+result[r].news_href+"' target='_Blank' style='color:#fff'>"+result[r].news_title+"</a></li>";
				}
				str += "";
				$("#hnul").html(str);
				$("#hnt").html(param.name);
				$("#hide_div").fadeIn(); 
		}
		});
	}
	
	
  
} 

function settitledata(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	 var cid = '';   
     $('input[name="cid_'+t_seriesid+'"]:checked',window.parent.document).each(function(){
          cid+= $(this).val()+','; 
     });
     var datetype = $("#datetype").val();
	$.ajax( {
		url : "searchnewtitle", 
		data:{seriesid:t_seriesid,cid:cid,datetype:datetype},
		type : "POST",
		  dataType:"json",
		success : function(result) {
			var str = "<ol class='news_ol'>";
			for(var r in result){
				if(0 > result[r].positive_negative){
					str += "<li style='color:#eb2b06'><a style='color:#eb2b06' target='_Blank' href='"+result[r].news_href+"'>"+result[r].news_title+"</a><span  class='account_percent fr'>"+result[r].focus_count+"</span><span class='account_percent fr'>"+result[r].spread_count+"</span></li>";
				}else{
					str += "<li><a target='_Blank' href='"+result[r].news_href+"'>"+result[r].news_title+"</a><span class='account_percent fr'>"+result[r].focus_count+"</span><span class='account_percent fr'>"+result[r].spread_count+"</span></li>";
					
				}
			}
			str += "</ol>";
			$("#newtitle").html(str);
	}
	});
}

function setrankdata(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	$.ajax( {
		url : "searchnewrank", 
		data:{seriesid:t_seriesid},
		type : "POST",
		  dataType:"json",
		success : function(result) {
			var str = "<ol class='news_ol'><div class='oh'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题<span class='fr'>关注量</span></div>";
			var rankname='';	
			for(var r in result){
				if(0 > result[r].positive_negative){					
					str += "<div class='oh'><li class='test_ellipsis' style='color:#eb2b06'><a style='color:#eb2b06' title='"+result[r].news_title+"' target='_Blank' href='"+result[r].news_href+"'>"+result[r].news_title+"</a></li><span class='fr'>"+result[r].focus_count+"</span></div>";
				}else{
					str += "<div class='oh'><li class='test_ellipsis' ><a target='_Blank' title='"+result[r].news_title+"'  href='"+result[r].news_href+"'>"+result[r].news_title+"</a></li><span class='fr'>"+result[r].focus_count+"</span></div>";
				}
				rankname=result[r].rankname;
			}
			str += "</ol>";
			$("#newrank").html(str);
			var h=rankname+"热点新闻<span class='font12'>（红色为负面新闻）</span>";
			$("#rankname").html(h);
			
	}
	});   
}

function setrankdatajp(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	 var cid = '';   
     $('input[name="cid_'+t_seriesid+'"]:checked',window.parent.document).each(function(){
          cid+= $(this).val()+','; 
     });
	$.ajax( {
		url : "searchnewrankjp", 
		data:{seriesids:cid},
		type : "POST",
		dataType:"json",
		success : function(result) {
			var str = "<ol class='news_ol'><div class='oh'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题<span class='fr'>关注量</span></div>";
			var rankname='';	
			for(var r in result){
				if(0 > result[r].positive_negative){
					str += "<div class='oh'><li class='test_ellipsis' style='color:#eb2b06'><a style='color:#eb2b06' title='"+result[r].news_title+"' target='_Blank' href='"+result[r].news_href+"'>"+result[r].news_title+"</a></li><span class='fr'>"+result[r].focus_count+"</span></div>";
				}else{
					str += "<div class='oh'><li class='test_ellipsis' ><a target='_Blank' title='"+result[r].news_title+"'  href='"+result[r].news_href+"'>"+result[r].news_title+"</a></li><span class='fr'>"+result[r].focus_count+"</span></div>";
				}
			}
			str += "</ol>";
			$("#newjp").html(str);
			
	}
	});

	                     
}
</script>

</html>
