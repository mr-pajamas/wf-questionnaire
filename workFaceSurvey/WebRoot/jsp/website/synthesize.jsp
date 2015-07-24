<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>首页</title>
		<style>
table {
	text-align: center;
	border-collapse: collapse;
	border: 1px solid #ccc;
}

table td {
	width: 130px;
	border: 1px solid #ccc;
}

.attation_table tr:first-child {
	height: 50px;
	background: #f8fcfb
}

.attation_table td {
	width: 130px;
	border: 1px solid #ccc;
}

.hot_news_div {
	width: 80%;
	margin: 0 auto;
	overflow: hidden
}

.news_img_div {
	width: 68px;
	height: 62px;
	border-right: 0px;
}

.news_img_div img {
	width: 68px;
	height: 62px
}

.hot_topic_img {
	width: 75px;
	height: 75px;
	margin: 0 3px;
	border: 1px solid #ccc
}

.pic_box {
	width: 100%;
	height: 25px;
}

.pic_label {
	float: left;
	width: 60px;
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

.hotnews_label_a {
	color: #2088CF;
	border-bottom: 2px solid #2088CF;
}

.span_label {
	width: 80px;
	text-align: left;
}
</style>
	</head>
	<script>
$(function(){
	$("#hot_news_a a").mouseover(function(){
		$(this).addClass("hotnews_label_a");
		$(this).siblings().removeClass("hotnews_label_a");
	});

	$(".tishi").css("opacity",0.9);
	
});
</script>
	<body>
		<div style="width: 100%">
			<div class="bdf font14 tc bdb">
				<div style="width: 50%" class="fl">
					<div style="padding-bottom: 20px" class="pd30">
						<div class="blue oh">
							<span class="fl font18">热点新闻</span>
							<div class="pic " id="pic1">
								<img src="<%=webRoot%>/images/wenhao.png" width="14" height="14" />
							</div>
							<p class="riqi">
								2015-3至2015-5
							</p>
							<!-- 	<a href="javascript:;" class="fr span_label blue">更多>></a> -->
						</div>
						<div style="display: none" class="tishi " id="tishi1">
							<p class="on">
								统计期间大众品牌热点新闻，基于网友关注量确定。
							</p>
						</div>
						<div class="oh pdtb10 mgt20">
							<div class="title">
								<p class="first">
									标题
								</p>
								<p class="second">
									关注量
								</p>
							</div>
							<div class="fl" style="width: 20%">
								<div>
									<img width="75" height="75"
										src="<%=webRoot%>/images/website/u67.jpg" />
								</div>
								<div class="tc">
									<span>关注量 </span><span class="red">${fc1}</span>
								</div>
							</div>
							<div class="fl" style="width: 80%">
								<c:forEach items="${newslist1}" var="nl1" end="10">
									<c:if test="${nl1.positive_negative < 0}">
										<div class="oh mgt10">
											<a href="${nl1.news_href}" target='_Blank' class="fl red">${nl1.news_title}</a><span
												class="fr span_label">${nl1.focus_count}</span>
										</div>
									</c:if>
									<c:if test="${nl1.positive_negative >=0}">
										<div class="oh mgt10">
											<a href="${nl1.news_href}" target='_Blank' class="fl">${nl1.news_title}</a><span
												class="fr span_label">${nl1.focus_count}</span>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					<div style=" margin-left:55px" class="sourcefrom">
						<div class="remark">
							<div class="left">
								备注:
							</div>
							<div class="right" style="margin-top:2px;">
								新闻关注量按在统计周期内相关汽车新闻浏览量统计
							</div>
						</div>
						<div class="data" style="width: 182px">
							<p>
								&nbsp;&nbsp;&nbsp;数据来源：
							</p>
							<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
									src="<%=webRoot%>/images/xinwen.png" title="新闻" width="27"
									height="27" /> </a>
							<!--<div class="right">)</div>-->
						</div>
					</div>
				</div>
				<div style="width: 50%" class="fl">
					<div class="pd30">
					<div style="display: none; top:70px;left:800px;width:350px;" class="tishi" id="tishi2">
									<p class="on">
										统计期间内最受关注的品牌与车系，基于网友关注度确定排名
									</p>
								</div>
						<div class="dingwei">
							<div class="blue oh">
								<span class="fl font18 mgl30">最受关注品牌与车系</span>
								<div class="pic" id="pic2">
									<img src="<%=webRoot%>/images/wenhao.png" width="14"
										height="14" />
								</div>
								<p class="riqi">
									2015-3至2015-5
								</p>
								<!-- 	<a href="javascript:;" class="fr blue">更多>></a> -->
								
							</div>
						</div>
						<div class="font16 mgt30 mgb20">
							<span class="attention" style="float: left; margin-left: 30px;">品牌关注度排名</span>
							<span class="attention2" style="float: left; margin-left: 30px;">车系关注度排名</span>
						</div>

						<div class="tc">
							<div style="float: left; width: 50%">
								<div class="chart_content" style="height: 250px">

									<c:forEach items="${brandlist}" var="bl">
										<div class="pic_box">
											<div class="pic_label">
												${bl.brand}
											</div>
											<div class="pic_item"
												style="width:${bl.width}%;background:${bl.colour};">
											</div>
											<div style="text-align: left;">
												${bl.tj}%
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
							<div style="float: left; width: 50%">
								<div class="chart_content" style="height: 250px">
									<c:forEach items="${serieslist}" var="sl">
										<div class="pic_box">
											<div class="pic_label">
												${sl.series}
											</div>
											<div class="pic_item"
												style="width:${sl.width}%;background:${sl.colour};"></div>
											<div style="text-align: left;">
												${sl.tj}%
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
					<div class="sourcefrom  chex">
						<div class="remark">
							<div class="left chex" style="width:32px">
								备注:
							</div>
							<div class="right" style="width:310px; padding-top:17px;">
								品牌关注度=该品牌关注量/所统计品牌关注量合计*100%
								车系关注度=该车系关注量/所统计车系关注量合计*100%
							</div>
						</div>
						<div class="data chexi">
							<p>
								&nbsp;&nbsp;&nbsp;数据来源：
							</p>
							<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
									src="<%=webRoot%>/images/xinwen.png" title="新闻" width="27"
									height="27" /> </a>
							<a href="<%=webRoot%>/employee/returnnew#source_bbs" target="_blank"><img
									src="<%=webRoot%>/images/bbs.png" title="论坛" width="27"
									height="27" /> </a>
							<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
									src="<%=webRoot%>/images/koubei (1).png" title="口碑" width="27"
									height="27" /> </a>
							<!--<div class="right">)</div>-->
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div class="bdf pd30 bdb">
				<div class="dingwei">
					<p class="font18 mgb10 blue">
						网络声量与热点话题
					</p>
					<div class="pic">
						<img id="pic3" src="<%=webRoot%>/images/wenhao.png" width="14"
							height="14" />
					</div>
					<p class="riqi">
						2015-3至2015-5
					</p>
					<div style="display: none" class="tishi  " id="tishi3">
						<p class="on">
							展示上海大众网络声量在各区域分布，按照话题声量列出排名前三的话题及声量
						</p>
					</div>
				</div>

				<div class="clear"></div>
				<div class="">
					<div id="hot_news_a" class="pd10 oh font14">
						<a id="bieke" href="javascript:" onmouseover="searchhotdata(9)"
							class="fl mg10 hotnews_label_a">上海大众</a>

					</div>
					<div style="min-height: 381px;">
						<div id="r1" class="chart_content"
							style="width: 100%; height: 500px"></div>
					</div>
					<div class="sourcefrom">
						<div class="remark">
							<div class="left">
								备注:
							</div>
							<div class="right" style=" width:485px;">
								用颜色深浅来表示各省份内上海大众网络声量高低，越深表示在区域上海大众声量越高
								网络声量是指统计周期内，相关汽车新闻/论坛/口碑等数据的上海大众提及量合计
							</div>
						</div>
						<div style="padding-top: 2px"class="data">
							<p>
								&nbsp;&nbsp;&nbsp;数据来源：
							</p>
							<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
									src="<%=webRoot%>/images/xinwen.png" title="新闻" width="27"
									height="27" /> </a>
							<a href="<%=webRoot%>/employee/returnnew#source_bbs" target="_blank"><img
									src="<%=webRoot%>/images/bbs.png" title="论坛" width="27"
									height="27" /> </a>
							<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
									src="<%=webRoot%>/images/koubei (1).png" title="口碑" width="27"
									height="27" /> </a>
							<!--<div class="right">)</div>-->
						</div>
					</div>
				</div>
			</div>
			<div class="bdf pd30">
				<div class="fl" style="width: 51%">
					<div class="mgr10 pd10">
						<div class="dingwei">
							<p class="mgb10 font18 blue">
								各级别网络声量总体情况
							</p>

							<div class="pic">
								<img id="pic4" src="<%=webRoot%>/images/wenhao.png" width="14"
									height="14" />
							</div>
							<p class="riqi">
								2015-3至2015-5
							</p>
							<div style="display: none" class="tishi  " id="tishi4">
								<p class="on">
									统计周期各个级别车辆的网络声量的分布情况，区分新闻、口碑、论坛等
								</p>
							</div>

							<div class="clear"></div>

							<div style="height: 360px">
								<div id="l2" class="chart_content"
									style="width: 100%; height: 340px"></div>
							</div>
							<div class="sourcefrom">

								<div class="remark">
									<div class="left">
										备注:
									</div>
									<div class="right" style="width:257px">
										级别网络声量是在统计周期内，相关数据各级别
										车辆的提及量合计（区分：新闻、口碑、论坛)

									</div>
								</div>
								<div class="data">
									<p>
										&nbsp;&nbsp;&nbsp;数据来源：
									</p>
									<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
											src="<%=webRoot%>/images/xinwen.png" title="新闻" width="27"
											height="27" /> </a><a href="<%=webRoot%>/employee/returnnew#source_bbs"
										target="_blank"><img src="<%=webRoot%>/images/bbs.png"
											title="论坛" width="27" height="27" /> </a><a
										href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
											src="<%=webRoot%>/images/koubei (1).png" title="口碑"
											width="27" height="27" /> </a>
									<!--<div class="right">)</div>-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="fr" style="width: 49%">
					<div class="pd10">
						<div class="dingwei">
							<p class="mgb10 font18 blue">
								各级别细分市场网络传播效率
							</p>

							<div class="pic">
								<img id="pic5" src="<%=webRoot%>/images/wenhao.png" width="14"
									height="14" />
							</div>
							<p class="riqi">
								2015-3至2015-5
							</p>
							<div style="display: none" class="tishi  " id="tishi5">
								<p class="on">
									统计周期各个级别网络传播量份额、关注量份额及传播效率情况
								</p>
							</div>
						</div>
						<div class="clear"></div>
						<div class="" style="height: 40px">

							<span
								style="float: left; width: 170px; text-align: center; font-weight: bold">关注量份额</span>
							<span
								style="float: left; width: 130px; text-indent: 1em; font-weight: bold">传播量份额</span>
							<span
								style="float: left; width: 120px; text-align: right; font-weight: bold">关注系数</span>
							<!-- 	<span style="margin-left:10px"><img src="http://www2.91survey.com:8080/bigdata_svw/images/website/q1.png"  title="关注量份额/传播量份额*100，表示网络传播效率。" width="20px" height="20px"/></span>
						 -->

						</div>
						<c:forEach items="${ranklist}" var="rl">
							<div class="chart_big_div">
								<span class="fl">${rl.rank}</span>
								<div style="width: 130px; height: 15px; float: left">
									<div class="fl"
										style="width:${rl.w1}%;height:15px;background:${rl.colour}"></div>
									<span class="fl">${rl.data1}</span>
								</div>
								<div style="width: 130px; height: 15px; float: left">
									<div class="fl"
										style="width:${rl.w2}%;height:15px;background:${rl.colour}"></div>
									<span class="fl">${rl.data2}</span>
								</div>
								<div class="" style="width: 180px; float: left;">
									<div class="chart_pic_box"
										style="margin-${rl.float}:50%;float:${rl.float}">
										<div
											style="background:${rl.colour2};width:${rl.w3}%;float:${rl.float};"></div>
										<span style="float:${rl.float};">${rl.data3}</span>
									</div>
								</div>
							</div>
						</c:forEach>
						<br />
						<br />
						<br />
						<div style="padding-top: 48px; padding-left: 0px" class="sourcefrom">
							<div class="remark">
								<div class="left">
									备注:
								</div>
								<div style="padding-top: 2px" class="right">
									关注量份额：某级别关注量/所有级别关注总量*100%
									<br />
									
									传播量份额：某级别传播量/所有级别传播总量*100%
									<br />
									
									关注系数 ：关注量份额/传播量份额*100%，表示网络传播效率
									<br />
									<br />
								</div>
							</div>
							<div style=" margin-top: -73px" class="data">
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
				<div class="clear"></div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
var brandid='9';
setoption(brandid);
var r1 = echarts.init(document.getElementById('r1')); 
function searchhotdata(bid){
	    brandid=bid;
		setoption(bid);
}

function setoption(bid){
	$.ajax( {
		url : "searchtopic", 
		data:{bid:bid},
		type : "POST",
		  dataType:"json",
		success : function(result) {
			r1.clear();
			var topicdata=[];
		 for(var i in result){
			 var item={
					 name:result[i].provincename,
					 value:result[i].tj
					 }
			 topicdata.push(item);
		 }

		 var a=(result[0].tj+100)/100;
		 var b=a.toFixed(0)*100;
		 addOption(topicdata,parseInt(b));
	}
	});
}


function addOption(topicdata,max){
	var r1option = {

	tooltip : {
	    trigger: 'item',
	    formatter: function (params,ticket,callback) {
            var res = '热点话题: <br/>';
            res+=params.name+':'+params.value;

            $.ajax( {
        		url : "searchtopictop3", 
        		data:{bid:brandid,provincename:params.name},
        		type : "POST",
        		  dataType:"json",
        		success : function(result) {
        		for(var a in result){
        			res+= "<br/>"+result[a].topic+":"+result[a].tj;
        		}
        	    callback(ticket, res);
                
        	}
        	});      
            return res;
        }
	},

	dataRange: {
	    min: 0,
	    max: max,
	    x: 'left',
	    y: 'bottom',
	    text:['高','低'],           // 文本，默认为数值文本
	    calculable : true
	},


	series : [
	    {
	        name: '热点话题',
	        type: 'map',
	        mapType: 'china',
	        roam: false,
	        itemStyle:{
	            normal:{label:{show:true}},
	            emphasis:{label:{show:true}}
	        },
	        data:topicdata
	    }
	]
	};    
	// 为echarts对象加载数据 
	r1.setOption(r1option); 
}




var l2 = echarts.init(document.getElementById('l2')); 
var l2option = {
	    tooltip : {
    trigger: 'axis',
    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
    }
},
legend: {
   data:${rankFocusSpreadTip}
},

calculable : true,
yAxis : [
    {
        type : 'category',
        splitLine:{show :false} ,
        data : ['其他','微型车','跑车','MPV','小型车','豪华型车','中型车','SUV','紧凑型']
    }
],
xAxis : [
    {
        type : 'value',
        	splitLine:{show :false}  
    }
],
series : [${rankFocusSpread}],
color:['#87cefa','#ff69b4','#7294d4','#d8a499']
};
                    
// 为echarts对象加载数据 
l2.setOption(l2option); 

</script>
</html>

