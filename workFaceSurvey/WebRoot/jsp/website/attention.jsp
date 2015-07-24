<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>别克-凯越声量关注</title>
		<style>
.pic_box {
	width: 100%;
	height: 25px;
}

.pic_label {
	float: left;
	width: 50px;
	font-size: 12px;
	height: 15px;
}

.pic_item {
	float: left;
	margin-top: 5px;
	height: 10px;
	margin-right: 5px;
}

.chart_big_div {
	margin: 5px 0px;
	overflow: hidden
}

.chart_middle_div {
	width: 130px;
	height: 15px;
	float: left
}

.chart_big_div>span {
	width: 50px;
	text-align: right
}

.chart_big_div span {
	height: 15px;
	line-height: 15px;
	margin: 0 2px;
}

.chart_big_div div {
	height: 15px;
}

.chart_pic_box {
	width: 50%
}
</style>
		<script>
		$(function(){
		$(".trend_item").click(function(){
			$(this).addClass("menu_item_hover").siblings().removeClass("menu_item_hover");
			$("#"+$(this).attr("id")+"_div").css("display","block").siblings().css("display","none");
		});
		$("#volume_attention a").mouseover(function(){
			$(this).css("color","#2088CF").siblings().css("color","#5e5e5e");
			$("#"+$(this).attr('id')+"_show").css({"display":"block"});
			$("#"+$(this).attr('id')+"_show").siblings().css("display","none");
		});
		$("#rank_attention a").mouseover(function(){
			$(this).css("color","#2088CF").siblings().css("color","#5e5e5e");
			$("#"+$(this).attr('id')+"_show").css({"display":"block"});
			$("#"+$(this).attr('id')+"_show").siblings().css("display","none");
		});
	});

</script>
	</head>

	<body>
		<form action="">
			<input type="hidden" id="datetype" name="datetype" value="2" />
		</form>
		<div class="width_98">
			<div class="content_div fl">
				<div class="content_menu_div">
					<div class="menu_item_box pr">
						<a class="menu_item" href="<%=webRoot%>/news/index">热点新闻</a>
						<a class="menu_item menu_item_hover"
							href="<%=webRoot%>/attention/index">声量/关注</a>
						<a class="menu_item" href="<%=webRoot%>/topic/showtopic">话题评论</a>
						<a class="menu_item" href="<%=webRoot%>/produc/showproduc">产品评价</a>
						<a class="menu_item" href="<%=webRoot%>/people/index">人群图谱</a>
					</div>
					<div class="menu_item_content"
						style="height: auto; overflow: hidden; background-color: #FFF">
						<div class="dingwei">
							<div class="guanzhuqvshi">
								<div class="qvshi">
									声量/关注趋势
								</div>
								<div class="pic">
									<img id="pic7" src="../images/wenhao.png" width="14"
										height="14">
								</div>
								<p class="riqi"></p>
							</div>
							<div style="display: none;" class="tishi " id="tishi7">
								<p class="on">
									统计周期内新闻传播量/关注量趋势
								</p>
							</div>
						</div>
						<div>
							<div class="fl"" >
								<span class="mgl10">数据来源</span>
								<select id="source_type" class="data_sourse_select"
									onchange="refreshIF()">
									<option value="">
										全部
									</option>
									<option value="1">
										资讯
									</option>
									<option value="2">
										口碑
									</option>
									<option value="3">
										论坛
									</option>
									<option value="4">
										微博
									</option>
								</select>
							</div>
							<div class="fl" style="margin-left: 35px;">
								<input type="checkbox" name="hn" id="hn" value="0"
									onclick="getOptionData()" checked="checked" />
								传播量
								</input>
								<img src="<%=webRoot%>/images/website/industry_trend_img.jpg/"
									title="在统计周期内，相关汽车新闻资讯、口碑评论、论坛帖子与微博的发稿量（含转载、回复等），主要包括文本资讯，不包括图片与视频" />
								<input type="checkbox" name="hn" id="hn" value="1"
									onclick="getOptionData()" style="margin-left: 5px;">
									关注量</input>
								<img src="<%=webRoot%>/images/website/industry_trend_img.jpg/"
									title="在统计周期内，以新闻资讯、口碑评论、论坛帖子的浏览量与微博的粉丝数与关注数等指标为统计对象，进行加权计算后生成关注度值。同类内容关注度之间、不同类别内容关注度之间均具有可比性" />
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
						<div class="mgt20">
							<div id="s_foucs_spread" class="chart_content"></div>
						</div>
						<%--						<div class="sourcefrom" style="margin-top: 15px">--%>
						<%----%>
						<%--							<div class="remark">--%>
						<%--								<div class="left">--%>
						<%--									备注--%>
						<%--								</div>--%>
						<%--								<div class="right">--%>
						<%--									传播量是指该车系在网络中的提及量--%>
						<%--									<br>--%>
						<%--										<br>--%>
						<%--											关注量按统计周期内相关新闻、口碑、论坛的浏览量及微博的粉丝数与关注数统计 --%>
						<%--								</div>--%>
						<%--							</div>--%>
						<%--							<div class="data">--%>
						<%--								<p>--%>
						<%--									&nbsp;&nbsp;&nbsp;数据来源：--%>
						<%--								</p>--%>
						<%--								<a href="<%=webRoot%>/employee/returnnew" target="_blank"><img src="../images/xinwen.png" title="新闻"--%>
						<%--										width="27" height="27">--%>
						<%--								</a><a href="<%=webRoot%>/employee/returnnew" target="_blank"><img src="../images/bbs.png" title="论坛"--%>
						<%--										width="27" height="27">--%>
						<%--								</a><a href="<%=webRoot%>/employee/returnnew" target="_blank"><img--%>
						<%--										src="../images/koubei (1).png" title="口碑" width="27"--%>
						<%--										height="27">--%>
						<%--								</a>--%>
						<%--								<!--<div class="right">)</div>-->--%>
						<%--							</div>--%>
						<%--						</div>--%>

						<div class="sourcefrom" style="margin-top: 20px;">
							<div class="remark">
								<div class="left">
									备注:
								</div>
								<div style="width: 440px; float: left; padding-top: 16px;"
									class="right">
									<p style="width: 400px">
										传播量是指该车系在网络提及量
									</p>
									<p style="width: 440px">
										关注量按统计周期内相关新闻、口碑、论坛的浏览量及微博的粉丝数与关注数统计
									</p>
								</div>
							</div>
							<div class="data" style="padding-top: 0px;">
								<p>
									&nbsp;&nbsp;&nbsp;数据来源：
								</p>
								<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
										src="<%=webRoot%>/images/xinwen.png" title="新闻" width="27"
										height="27" /> </a><a href="<%=webRoot%>/employee/returnnew#source_bbs"
									target="_blank"><img src="<%=webRoot%>/images/bbs.png"
										title="论坛" width="27" height="27" /> </a><a
									href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
										src="<%=webRoot%>/images/koubei (1).png" title="口碑" width="27"
										height="27" /> </a>
								<!--<div class="right">)</div>-->
							</div>
						</div>
					</div>
				</div>
				<div class="content_news_div"
					style="margin-top: 0px; border-top: 0px; margin-top: 162px;">
					<div class="content_title" style="background: #fff; border: 0px">
						<label id="series"></label>
						传播效率分析
					</div>
					<div style="overflow: hidden">
						<span
							style="float: left; width: 220px; text-align: center; font-weight: bold">关注量份额</span>
						<span
							style="float: left; width: 220px; text-align: center; font-weight: bold">传播量份额</span>
						<span
							style="float: left; width: 220px; text-align: center; font-weight: bold">
							关注系数 <img
								src="<%=webRoot%>/images/website/industry_trend_img.jpg/"
								title="关注系数：关注量份额/传播量份额*100，表示网络传播效率" /> </span>

					</div>
					<div id="spread_speed">

					</div>
					<div class="sourcefrom" style="width: 728px">

						<div class="remark">
							<div class="left">
								备注:
							</div>
							<div style="padding-top: 16px;" class="right">
								关注量份额：话题关注量/所有话题关注总量*100%，又名关注度
								<br />
								传播量份额：话题传播量/所有话题传播总量*100%
								<br />
								关注系数 ：关注量份额/传播量份额*100%，表示网络传播效率
							</div>
						</div>
						<div class="data" style="padding-top: 16px;">
							<p>
								&nbsp;&nbsp;&nbsp;数据来源：
							</p>
							<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
									src="../images/xinwen.png" title="新闻" height="27" width="27" />
							</a><a href="<%=webRoot%>/employee/returnnew#source_bbs" target="_blank"><img
									src="../images/bbs.png" title="论坛" height="27" width="27" /> </a><a
								href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
									src="../images/koubei (1).png" title="口碑" height="27"
									width="27" /> </a>
							<!--<div class="right">)</div>-->
						</div>
					</div>

				</div>
			</div>
			<div class="sidebar_div fr">
				<div class="car_hotnews_div">
					<div class="content_title" id="volume_attention">
						<label id="rankname"></label>
						<a href="javascript:;" id="attention" style="color: #2088CF">关注排名</a><span
							class="mgl5 mgr5">|</span><a href="javascript:;" id="volume">传播量排名</a>
					</div>
					<div class="news_item pd10">
						<div id="attention_show">
							关注排名
						</div>
						<div id="volume_show" class="hide">
							传播量排名
						</div>
					</div>
				</div>

				<div class="compete_hotnews_div" style="height: 385px">
					<div class="content_title" id="rank_attention">
						级别
						<a href="javascript:;" id="focus" style="color: #2088CF">关注排名</a><span
							class="mgl5 mgr5">|</span><a href="javascript:;" id="spread">传播量排名</a>
					</div>
					<div class="news_item pd10">
						<div id="focus_show">
							<c:forEach items="${ranklist}" var="rl">
								<div class="chart_big_div" style="margin: 10px">
									<span class="fl" style="width: 40px; text-align: left">${rl.rank}</span>
									<div style="width: 175px; height: 10px; float: left">
										<div class="fl"
											style="width:${rl.w1}%;height:10px;background:${rl.colour}"></div>
										<span class="fl">${rl.data1}</span>
									</div>
								</div>
							</c:forEach>
						</div>
						<div id="spread_show" class="hide">
							<c:forEach items="${ranklist}" var="rl">
								<div class="chart_big_div" style="margin: 10px">
									<span class="fl" style="width: 40px; text-align: left">${rl.rank}</span>
									<div style="width: 175px; height: 10px; float: left">
										<div class="fl"
											style="width:${rl.w2}%;height:10px;background:${rl.colour}"></div>
										<span class="fl">${rl.data2}</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
$(function () {
	refreshIF();
});

function refreshIF(){
	getSeriesid();
	getOptionData();
	getEachRankSeries();
//	settitledata();
//	setrankdata();
}

function getSeriesid(){
var t_seriesid= $('#t_seriesid', window.parent.document).val();
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	var series = $('#sid_'+t_seriesid, window.parent.document).text();
	$.ajax( {
		url : "searchspreadspeed", 
		data:{seriesid:t_seriesid},
		type : "POST",
		  dataType:"json",
		success : function(result) {
			var str = "";	
			for(var r in result){
			
					str+="<div class='chart_big_div'><span class='fl'>"+result[r].topic+"</span><div style='width:10px;float:left'></div><div style='width:200px;height:15px;float:left'>"+
							"<div class='fl' style='width:" + result[r].w1 + "%;height:10px;background:" + result[r].colour + "'></div><span class='fl'>" +
							result[r].data1 + "</span></div>";
					str += "<div style='width:200px;height:10px;float:left'><div class='fl' style='width:" + result[r].w2 + "%;height:10px;background:" +
							result[r].colour + "'></div><span class='fl'>" + result[r].data2 + "</span></div>";
					str += "<div style='width:200px;float:left;'><div class='chart_pic_box' style='margin-" +  result[r].float +":50%;float:" + 
					 		result[r].float + "'><div style='height:10px;background:" +result[r].colour2 + ";width:" + result[r].w3 + "%;float:" + result[r].float +
					 		";'></div><span style='float:" + result[r].float +";'>" + result[r].data3 +"</span></div></div></div>"
			}
			str +="<div style='width:5px;height:10px;float:left'></div>";
			$("#spread_speed").html(str);
			$("#series").html(series);
	}
	});
}

function getEachRankSeries(){
var t_seriesid= $('#t_seriesid', window.parent.document).val();
	$.ajax( {
		url : "searchseries_spread_foucsrank", 
		data:{seriesid:t_seriesid},
		type : "POST",
		  dataType:"json",
		success : function(result) {
			var focus = "";
			var spread="";	
			for(var r in result){                	
					focus+=" <div class='chart_big_div' style='margin:10px'> <span class='fl' style='width:40px;text-align:left'>" + result[r].series +
					     "</span><div style='width:175px;height:10px;float:left'><div class='fl' style='width:" + result[r].f_width +
					     "%;height:10px;background:" + result[r].colour +"'></div><span class='fl'>" +result[r].tj + "</span></div></div>";
					spread+="<div class='chart_big_div'> <span class='fl' style='width:40px;text-align:left'>" + result[r].series +
						 "</span><div style='width:170px;height:10px;float:left'><div class='fl' style='width:" + result[r].s_width+ 
						 "%;height:10px;background:" +result[r].colour + "'></div><span class='fl'>" + result[r].tj1 + "</span></div></div>";
			}
			rankname=result[r].rankname;
			var h=rankname +"	";
			$("#rankname").html(h);
			$("#attention_show").html(focus);
			$("#volume_show").html(spread);
	}
	});
}

function adddaytype(datetype){
	$("#datetype").val(datetype);
	getOptionData();
}

function getOptionData(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	var source =$("#source_type").val();
	var hn='';
	 $('input[name="hn"]:checked').each(function(){
          hn+= $(this).val()+','; 
    });
	var cid = '';   
    $('input[name="cid_'+t_seriesid+'"]:checked',window.parent.document).each(function(){
          cid+= $(this).val()+','; 
    });
    var datetype = $("#datetype").val();
	$.ajax( {
		url : "searchspreadfocusdata", 
		data:{seriesid:t_seriesid,source_type:source,cid:cid,datetype:datetype},
		type : "POST",
		dataType:"json",
		success : function(result) {
			var ldata=[];
			var dlist = [];
			var tlist = [];
			for(var r in result.dlist){
				dlist.push(result.dlist[r]);
			}
			for(var r in result.tlist){
				var spread_name= result.tlist[r].series + "传播量";
				var focus_name= result.tlist[r].series + "关注量";
				var item1={
					name:spread_name,
					type:'line',
					data:result.tlist[r].spread_count.split(",")
				}
				var item2={
					name:focus_name,
					type:'line',
					data:result.tlist[r].focus_count.split(",")
				}
				if(hn=='0,'){
					tlist.push(item1);
					ldata.push(spread_name);
				}
				else if(hn=='1,'){
					tlist.push(item2);
					ldata.push(focus_name);
				}
				else if(hn=='0,1,'){
					tlist.push(item1);
					tlist.push(item2);
					ldata.push(spread_name);
					ldata.push(focus_name);
				}else{
					
				}	
			}
			
			setOption(dlist,tlist,ldata);
			
	}
	});
}

function setOption(date,seiies,ldata){
var f_s1 = echarts.init(document.getElementById('s_foucs_spread')); 
var f_s1option = {
	    tooltip : {
    trigger: 'axis'
},
legend: {
    data:ldata
},

calculable : true,
dataZoom : {
    show : true,
    realtime : true,
    start : 20,
    end : 80
},
xAxis : [
    {
        type : 'category',
        splitLine:false,
        boundaryGap : true,
        data : date
    }
],
yAxis : [
    {
        type : 'value',
         axisLabel : {
                formatter: '{value}'
            },
        axisLine:{
        	show:true
        }
    }
],
series : seiies
};
                

// 为echarts对象加载数据 
f_s1.setOption(f_s1option); 
}
</script>
</html>
