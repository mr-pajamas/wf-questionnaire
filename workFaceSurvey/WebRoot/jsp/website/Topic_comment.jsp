<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="../commonincludes.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>别克-凯越话题评论</title>
		<link rel="stylesheet" type="text/css"
			href="<%=webRoot %>/css/zzcs.css" />
		<script type="text/javascript"
			src="<%=webRoot %>/js/jqcloud-1.0.4.min.js"></script>
		<script type="text/javascript" src="<%=webRoot %>/js/zzsc.js"></script>
		<style type="text/css">
div#topten:hover {
	display: block;
	padding: 8px;
	clear: both;
	color: #666;
	width: 198px;
	height: 15px;
	background-color: #f8f8f8
}
-->
</style>
	</head>
	<body>
		<script src="<%=webRoot %>/js/echarts-all.js" type="text/javascript"></script>
		<div class="width_98">
			<div class="content_div fl">
				<div class="content_menu_div" style="height: 525px;">
					<div class="menu_item_box pr">

						<a class="menu_item" href="<%=webRoot %>/news/index">热点新闻</a>
						<a class="menu_item " href="<%=webRoot %>/attention/index">声量/关注</a>
						<a class="menu_item menu_item_hover"
							href="<%=webRoot %>/topic/showtopic">话题评论</a>
						<a class="menu_item" href="<%=webRoot %>/produc/showproduc">产品评价</a>
						<a class="menu_item" href="<%=webRoot %>/people/index">人群图谱</a>
					</div>
					<div class="menu_item_content" style="height: 451px">
						<div class="dingwei">
							<div class="yuntu">
								话题评论云图
							</div>
							<div class="pic " id="pic8">
								<img src="<%=webRoot %>/images/wenhao.png" width="14"
									height="14" />
							</div>
							<p class="riqi">
								2015-3至2015-5
							</p>
							<div style="display: none" class="tishi " id="tishi8">
								<p class="on">
									统计周期内该车系话题明细关键词与评论量可视化
								</p>
							</div>
						</div>
						<div class="mgt10">
							<div id="showop" style="width: 300px; height: 20px;"></div>
							<div id="yuntu" class="chart_box"
								style="margin-top: 10px; height: 290px; width: 700px;">
								<!-- （蓝色表示正面评论，红色表示负面评论，灰色表示中立评论）<div id="showop"></div> -->
							</div>

						</div>
						<div class="sourcefrom" style="margin-top: 25px;">
							<div class="remark">
								<div class="left">
									备注:
								</div>
								<div class="right" style="width:420px; padding-top:15px;">
									字体大小表示话题评论的提及量，字体越大表示该话题评论的提及量越大
									<br />
									红色字体表示话题评论为正面，蓝色字体为负面
								</div>
							</div>
							<div class="data" style="padding-top:0px">
								<p>
									&nbsp;&nbsp;&nbsp;数据来源：
								</p>
								<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
										src="<%=webRoot %>/images/xinwen.png" title="新闻" width="27"
										height="27" /> </a><a href="<%=webRoot%>/employee/returnnew#source_bbs"
									target="_blank"><img src="<%=webRoot %>/images/bbs.png"
										title="论坛" width="27" height="27" /> </a><a
									href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
										src="<%=webRoot %>/images/koubei (1).png" title="口碑"
										width="27" height="27" /> </a>
								<!--<div class="right">)</div>-->
							</div>
						</div>
					</div>
				</div>

				
			</div>
			
			<div class="sidebar_div fr">
				<div class="car_topic_div">
					<div class="content_title" id="showtitle"></div>
					<div class="news_item pd10" id="showtopcx">
					</div>
				</div>
				<div class="car_topic_div">
					<div class="content_title" id="showjptitle"></div>
					<div class="news_item pd10" id="showjptopcx">
					</div>
				</div>
			</div>
			
			<div class="clear" ></div>
			<div class="content_news_div" style="width: 1010px; height: 500px;; overflow: hidden;">
					<div class="dingwei">
						<div class="content_title">
							<div style="float: left;" class="huati">
								话题区域分布
							</div>
							<div style="margin-top: 14px;"  class="pic " id="pic9" style="display: block;">
								<img src="<%=webRoot %>/images/wenhao.png" width="14"
									height="14" />
							</div>
							<p style="margin-top: 0px;" class="riqi">
								2015-3至2015-5
							</p>
						</div>
						<div style="display: none" class="tishi " id="tishi9">
							<p class="on">
								展示该车系的话题评论量区域分布，并列出话题评论量排名前三的话题及评论量
							</p>
						</div>
					</div>

					<div id="main"
						style="height: 370px; width: 780px; margin-top: 10px; float: left">
					</div>
					<%--					<div _echarts_instance_="1431327668794" id="main"--%>
					<%--						style="height: 370px; width: 780px; margin-top: 10px; float: left; background-color: transparent;">--%>
					<%--						<div--%>
					<%--							style="position: relative; overflow: hidden; width: 780px; height: 370px;">--%>
					<%--							<div data-zr-dom-id="bg" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></div>--%>
					<%--							<canvas data-zr-dom-id="1" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></canvas>--%>
					<%--							<canvas data-zr-dom-id="2" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></canvas>--%>
					<%--							<canvas data-zr-dom-id="3" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></canvas>--%>
					<%--							<canvas data-zr-dom-id="4" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></canvas>--%>
					<%--							<canvas data-zr-dom-id="5" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></canvas>--%>
					<%--							<canvas data-zr-dom-id="8" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></canvas>--%>
					<%--							<canvas data-zr-dom-id="_zrender_hover_" height="370" width="780"--%>
					<%--								style="position: absolute; left: 0px; top: 0px; width: 780px; height: 370px;"></canvas>--%>
					<%--						</div>--%>
					<%--					</div>--%>

					<%--					<div style="height: 367; width: 200px; float: left;">--%>
					<%--						<div id="top10List"--%>
					<%--							style="height: 340px; width: 200px; overflow: hidden; border: none">--%>
					<%--							<div id="topten"--%>
					<%--								style="display: block; padding: 8px; clear: both; color: #666; width: 198px; height: 18px;">--%>
					<%--					--%>
					<%--					</div></div></div>--%>
					<div style="height: 367; width: 200px; float: left;">
						<div id="top10List"
							style="height: 340px; width: 200px; overflow: hidden; border: none">
						</div>
						<div id="more"
							style="display: block; border: none; float: right; width: 200px; height: 25px; text-align: right; margin-top: 0px;">
							<a href="javascript:void(0)">更多</a>
						</div>
					</div>
					
					<div class="sourcefrom" style="width: 960px; float: left;">

						<div class="remark">
							<div class="left">
								备注:
							</div>
							<div class="right" style=" padding-top:0px;">
								用颜色深浅来表示该车系在各省份内的评论量高低，颜色越深表示此省份内评论量越高
								<br />
								评论量是指统计周期内，该车系在相关新闻/论坛/口碑中的话题评论量合计
							</div>
						</div>
						<div class="data">
							<p>
								&nbsp;&nbsp;&nbsp;数据来源：
							</p>
							<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
									src="<%=webRoot %>/images/xinwen.png" title="新闻" width="27" height="27" />
							</a><a href="<%=webRoot%>/employee/returnnew#source_bbs" target="_blank"><img src="<%=webRoot %>/images/bbs.png"
									title="论坛" width="27" height="27" />
							</a><a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
									src="<%=webRoot %>/images/koubei (1).png" title="口碑" width="27" height="27" />
							</a>
							<!--<div class="right">)</div>-->
						</div>
					</div>
					
				</div>
			
		</div>

		<script type="text/javascript">
	
	$(function(){
		refreshIF();
	

	//gettopicData()
});
	function gettopicData(){
		var t_seriesid= $('#t_seriesid', window.parent.document).val();
		$.ajax( {
			url : "searchcxtop", 
			data:{seriesid:t_seriesid},
			type : "POST",
			  dataType:"json",
			success : function(result) {
				var topicdata=[];
				var num = 0;
				var maxWidth = 120;
				var maxValue = result[0].value;
				//alert(maxValue);
				var divWidth = 120;
				var str = "";
				 for(var i in result){
					 var item={
							 name:result[i].name,
							 value:result[i].value
							 }
					 topicdata.push(item);
			//var dlist = [];
		//	var tlist = [];
			//for(var r in result){
			//	 dlist.push({name:result[r].name,value:result[r].value});
			//	 tlist.push();
			   num += 1;
			   divWidth = maxWidth*(result[i].value/maxValue);
			   str += "<div id=\"topten\" style=\"display:block;padding:8px; clear:both; color:#666; width:198px; height:18px;\"> "
        				       + "<table>"
        				           + "<tbody>"
        				               +"<tr>"
        				                  +"<td width=\"18px\">" + num
        				                  +".</td>"
        				                  +"<td style=\"width:50px;word-break:break-all;word-wrap:break-word;\">" + result[i].name
        				                  +"</td>"
        				                  +"<td>"
        				                     +"<div style='display:block;background-color:rgb(110,135,215);height:6px;margin-bottom:1px;font-size:0;width:"+divWidth +" 'px'></div>"
        				                  +"</td>"
        				               +"</tr>"
        				           + "</tbody>"
        				       + "</table>"
        				       + "</div>"
		    }
			    //alert(str);
		    $("#top10List").html(str);
		    
			 var opaiu=(maxValue+100)/100;
			
			 var max=opaiu.toFixed(0);
			
			settopicData(topicdata,parseInt(max*100));						
		}
				
			
		
		}
		);
	}
	
	function settopicData(topicdata,max){
			
		var t_seriesid= $('#t_seriesid', window.parent.document).val();
		// 初始化一个图表实例
		var myChart = echarts.init(document.getElementById('main'));
	var	option = {
		//    title : {
		  //      text: '',
		  //      subtext: '',
		 //      x:'center'
//	    },
		    tooltip : {
		        trigger: 'item',
        	    formatter: function (params,ticket,callback) {
	                  var res = '热点话题: <br/>';
	                  res+=params.name+':'+params.value;
	
	                  $.ajax({
	              		url : "searchtopsf", 
	              		data:{seriesid:t_seriesid,provincename:params.name},
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
		 
		  // roamController: {
		    //   show: true,
		     //   x: 'right',
		 //    mapTypeControl: {
		   //       'china': true
		 //     }
		  //  },
		 
		    series : [
		  
		        {
		            name: '话题',
		            type: 'map',
		            mapType: 'china',
		            itemStyle:{
		               // normal:{label:{show:true}},
		                emphasis:{label:{show:true}}
		            },
		            data: topicdata 
		        }		     
		    ]
		};

		// 为图表实例加载数据
		myChart.setOption(option);
		

	}

	function callback(){
		alert("11112");
	}
	
function refreshIF(){
	topicyun()
	getOptionData();
	getOptionData2();
gettopicData();

	
	var flag = true;
	$("#more").click(function(){			
		if(flag){
			$("#top10List").css({"overflow-y":"auto","width":"215px"});
			$(this).html("<a href='javascript:void(0)'>返回</a>");
			flag = false;
		}else{
	    	$("#top10List").css({"overflow-y":"hidden","width":"200px"});
	    	//$("#top10List").css("width","200px");
			$(this).html("<a href='javascript:void(0)'>更多</a>");
			flag = true;
		}
	});	
}
	function getOptionData(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	$.ajax( {
		url : "searchtop", 
		data:{seriesid:t_seriesid},
		type : "POST",
		  dataType:"json",
		success : function(result) {
			var str="";
			var rankname='';	
			for(var r in result){
			str+="<div style='padding:0px 10px; background:#f0f6ff;margin-bottom:10px;overflow:hidden'>";
		//str+="<div><a href='"+result[r].series+"'>"+result[r].series+"</a></div>";
			str+=	"	<div>";
			str+=	"<div>";
		//	str+=	"	<span class='fl'>评论指数:"+result[r].total_score+"</span>";
			str+=	"	<ul class='fr' style='font-size:12px;float:left;'>";
			str+=			"<li class='fl' style='list-style:none;margin-left:0px;width:50px'><span><p>"+result[r].series+"</p></span></li>";
			str+=			"<li class='fl' style='list-style:none;margin-left:0px;color:#74757c'>评论量:"+result[r].total_score+"</li>";
			str+=			"<li class='fl' style='list-style:none;margin-left:10px;color:#ff2c26'>"+result[r].total_poscount+"%</li>";
			str+=		"	<li class='fl' style='list-style:none;margin-left:10px;color:#396eff'>"+result[r].total_negcount+"%</li>";
		//	str+=		"<li class='fl' style='list-style:none;margin-left:10px;color:#74757c'>"+result[r].total_neutral+"%</li>";
		//	str+=		"<li class='fl' style='list-style:none;margin-left:25px;color:#74757c'>"+"<a></a>"+"</li>";
			str+=	"</ul></div></div>";
			str+=	"</div>";
		
			rankname=result[r].rankname;	
			$("#showtopcx").html(str);
			var h=rankname+"话题(评论量<img src='<%=webRoot%>/images/website/industry_trend_img.jpg/'title='在统计周期内，相关汽车口碑评论、论坛帖子与微博的发稿量（含首发、转载/发等）' />)";
			$("#showtitle").html(h); 
				}
			}
			
		
	
	}
	);
}
	
	function getOptionData2(){
		var t_seriesid= $('#t_seriesid', window.parent.document).val();
		 var cid = '';   
	     $('input[name="cid_'+t_seriesid+'"]:checked',window.parent.document).each(function(){
	          cid+= $(this).val()+','; 
	     });
		$.ajax( {
			url : "searchjptop", 
			data:{seriesid:t_seriesid,cid:cid},
			type : "POST",
			  dataType:"json",
			success : function(result) {
				var str="";
				var series='';	
				for(var r in result){
				str+="<div style='padding:0px 10px; background:#f0f6ff;margin-bottom:10px;overflow:hidden'>";
				//str+="<div><a href='"+result[r].series+"'>"+result[r].series+"</a></div>";
				str+=	"	<div>";
				str+=	"<div>";
				str+=	"	<ul class='fr' style='font-size:12px;float:left;'>";
				str+=			"<li class='fl' style='list-style:none;margin-left:0px;width:50px'><span><p>"+result[r].series+"</p></span></li>";
				str+=			"<li class='fl' style='list-style:none;margin-left:0px;color:#74757c'>评论量:"+result[r].total_score+"</li>";
				str+=			"<li class='fl' style='list-style:none;margin-left:10px;color:#ff2c26'>"+result[r].total_poscount+"%</li>";
				str+=			"<li class='fl' style='list-style:none;margin-left:10px;color:#396eff'>"+result[r].total_negcount+"%</li>";
				//str+=		"<li class='fl' style='list-style:none;margin-left:25px;color:#74757c'>"+result[r].total_neutral+"%</li>";
			//	str+=		"<li class='fl' style='list-style:none;margin-left:25px;color:#74757c'>"+"<a></a>"+"</li>";
				str+=	"</ul></div></div>";
				str+=	"</div>";
			
				series=result[r].series;	
				$("#showjptopcx").html(str);
				var h="竞品话题";
				$("#showjptitle").html(h);
					}
				}
				
			
		
		}
		);
	}
	

	
	function topicyun(){
		var t_seriesid= $('#t_seriesid', window.parent.document).val();
		$.ajax( {
			url : "searchtopicyun", 
			data:{seriesid:t_seriesid},
			type : "POST",
			  dataType:"json",
			success : function(result) {
				var dlist = [];
				var tlist = [];
				
				var series="";
				for(var r in result){
					if(result[r].ispos==1){
				 dlist.push({text:result[r].words,weight:result[r].words_count});
					
					}else{
						tlist.push({text:result[r].words,weight:result[r].words_count});
					}
					series=result[r].series;
				}
		//		$("#titlename").html(series+"产品评价");
				
				tanchuws(dlist,tlist);
			
				
				//tanchuws2(tlist);
			
			var str="";
				//var series='';	//百分比
			//	for(var i in result){
			//	str="<div position:absolute;border:1px solid #ccc;width:300px;height:50px;>";
		//	str+="<div><a href='"+result[r].series+"'>"+result[r].series+"</a></div>";
		//		str+=	"<ul class='fr' style='font-size:10px;float:left;'>";
		//		str+=	"<li class='fl' style='list-style:none;margin-left:15px;'>"+"<span  class='fl'><p>"+result[r].series+"</p></span></li>";
		//		str+=	"<li class='fl' style='list-style:none;margin-left:15px;color:#ff2c26'>"+result[r].total_positive+"%</li>";
		//		str+=	"<li class='fl' style='list-style:none;margin-left:15px;color:#396eff'>"+result[r].total_negative+"%</li>";
		//	str+=		"<li class='fl' style='list-style:none;margin-left:15px;color:#74757c'>"+result[r].total_neutral+"%</li>";
		//		str+=	"</ul>";
		//		str+=	"</div>";
			
			//	series=result[r].series;	
		//	$("#showop").html(str); 
				
		//}
				
		}
		});
	}

    function tanchuws(dlist,tlist,str) {
        // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
      //	$("#yuntu").empty();
       
      	$("#yuntu").empty();
        
        $("#yuntu").jQCloud(dlist,tlist);
       // $("#yuntu2").empty();
     //   $("#yuntu2").jQCloud2(tlist,{
     //       removeOverflowing: true,
       //     width: 300,
         //   height: 300,
       //     shape :"rectangular",
     //  });
    	
    //	alert(str);
   };
   
 
   
  
   
 
	</script>

	</body>
</html>
