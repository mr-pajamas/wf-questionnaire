<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=webRoot %>/css/jqcloud.css" />
<link rel="stylesheet" type="text/css"
	href="<%=webRoot %>/css/peoplemap.css" />
<script type="text/javascript"
	src="<%=webRoot %>/js/jqcloud-1.0.4.min.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>别克-凯越人群图谱</title>
		<script type="text/javascript">
	$(function(){
		$(".bieke_menu li a").click(function(){
			$(this).parent().siblings().children("a").css("background-image","url(images/menu_img1.png)");
			$(this).parent().siblings().children("ul").slideUp("slow");
			if($(this).siblings("ul").is(":hidden"))
			{
				$(this).css("background-image","url(images/menu_img2.png)");
				$(this).siblings("ul").slideDown("slow");
			}
			else
			{
				$(this).css("background-image","url(images/menu_img1.png)");
				$(this).siblings("ul").slideUp("slow");
			}
			
		});
		$('.crowd_divided_pfn').mouseover(function(){
			$(this).addClass('crowd_divided_pfn_hover').siblings().removeClass('crowd_divided_pfn_hover');
			$("#"+$(this).attr('id')+"_div").css("display","block").siblings().css("display","none");
		});
		$("#by_province").mouseover(function(){
		   $("#by_provinces_div").show();
		   $("#top10_provinces").show();
		   $("#more_provinces").show();
		   $("#by_cities_div").hide();
		   $("#top10_cities").hide();
		   $("#more_cities").hide();
		});
		$("#by_city").mouseover(function(){
		   $("#by_provinces_div").hide();
		   $("#top10_provinces").hide();
		   $("#more_provinces").hide();
		   $("#by_cities_div").show();
		   $("#top10_cities").show();
		   $("#more_cities").show();
		   //getCitiesDatas()
		});
		$("#by_weibo_medal").mouseover(function(){
		    $("#by_habit_div").hide();
		    $("#by_medal_div").show();
		
		});
	    $("#by_habit").mouseover(function(){
		    $("#by_habit_div").show();
		    $("#by_medal_div").hide();
		   // getHabits();		
		});	
   });
 
</script>
	</head>

	<body>
		<div class="width_98">
			<div class="crowd_width fl">
				<div class="content_menu_div">
					<div class="menu_item_box pr">
						<a class="menu_item" href="<%=webRoot%>/news/index">新闻</a>
						<a class="menu_item" href="<%=webRoot%>/attention/index">声量/关注</a>
						<a class="menu_item" href="<%=webRoot%>/topic/showtopic">话题评论</a>
						<a class="menu_item" href="<%=webRoot%>/produc/showproduc">产品评价</a>
						<a class="menu_item menu_item_hover"
							href="<%=webRoot%>/people/index">人群图谱</a>
					</div>
					<div class="menu_item_content pd10">
						<span><div class="dingwei">
								<div class="diyu">
									地域分布
								</div>
								<div class="pic " id="pi">
									<img id="pic12" src="<%=webRoot%>/images/wenhao.png" width="14"
										height="14" />
								</div>
								<p class="riqi" style="margin-top: 0px">
									2015-3至2015-5
								</p>
								<div style="display: none; left: 60px;" class="tishi "
									id="tishi12">
									<p class="on">
										关注车系的人群区域分布情况


									</p>
								</div>
							</div> </span>

						<a id="by_city" class="crowd_divided_pfn mgr20">城市</a>
						<a id="by_province"
							class="crowd_divided_pfn crowd_divided_pfn_hover">省份</a>
						</p>
						<div class="clear"></div>
						<div class="crowd_width" style="height: 335px">
							<div id="by_provinces_div" class="dis_prn_cities"
								style="display: block"></div>
							<div id="top10_provinces" class="top10_list_prn_cities"
								style="display: block; overflow: hidden"></div>
							<div id="by_cities_div" class="dis_prn_cities"
								style="display: none"></div>
							<div id="top10_cities" class="top10_list_prn_cities"
								style="display: none; overflow: hidden"></div>
							<div id="more_provinces" class="more" style="display: block">
								<a href="javascript:void(0)">更多</a>
							</div>
							<div id="more_cities" class="more" style="display: none">
								<a href="javascript:void(0)">更多</a>
							</div>
						</div>
					</div>
					<div
						style="border-bottom: 1px solid #CCC; border-left: 1px solid #CCC; border-right: 1px solid #CCC;"
						class="sourcefrom">

						<div class="remark">
							<div class="left">
								备注:
							</div>
							<div class="right">
								用颜色深浅来表示各区域关注车系的人群数量，颜色越深表示关注人数越多

							</div>
						</div>
						<div class="data">
							<p>
								&nbsp;&nbsp;&nbsp;数据来源：
							</p>
							<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
									style="margin-top: -8px;"
									src="<%=webRoot%>/images/koubei (1).png" title="口碑" width="27"
									height="27" /> </a><a href="<%=webRoot%>/employee/returnnew#source_blog" target="_blank"><img
									style="margin-top: -8px;" src="<%=webRoot%>/images/weibo.png"
									title="微博" width="27" height="27" /> </a>
							<!--<div class="right">)</div>-->
						</div>
					</div>
				</div>

			</div>

			<div class="clear"></div>

			<div class="content_news_div" style="height: 450px;">
				<div class="content_title">
					<div class="dingwei">
						<div class="people">
							人群属性
						</div>
						<div class="pic " id="pic13">
							<img style="margin-top: 8px" src="<%=webRoot%>/images/wenhao.png"
								width="14" height="14" />
						</div>
						<p style="margin-top: 0px;" class="riqi">
							2015-3至2015-5
						</p>

						<div style="display: none; left: 90px" class="tishi " id="tishi13">
							<p class="on">
								关注车系的人群性别、年龄、兴趣等属性分布
							</p>
						</div>
					</div>
				</div>





				<div id="crowd_sex" class="crowd_chart"></div>
				<div id="crowd_age" class="crowd_chart"></div>
				<div style="margin-top: 0px;" class="data">
					<p style="float: left">
						&nbsp;&nbsp;&nbsp;数据来源：
					</p>
					<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
							style="margin-top: -8px; margin-right: 10px;"
							src="<%=webRoot%>/images/koubei (1).png" title="口碑" width="27"
							height="27" /> </a>
					<a href="<%=webRoot%>/employee/returnnew#source_blog" target="_blank"><img
							style="margin-top: -8px; margin-right: 20px;"
							src="<%=webRoot%>/images/weibo.png" title="微博" width="27"
							height="27" /> </a>
					<!--<div class="right">)</div>-->
				</div>
			</div>


			<div class="content_news_div" style="height: 500px;">
				<div class="crowd_caruse_weibo">
					<div class="content_title">
						<div class="dingwei">
							<div style="float: left" class="people">
								购车用途
							</div>

							<div class="pic " id="pic14">
								<img style="margin-top: 8px"
									src="<%=webRoot%>/images/wenhao.png" width="14" height="14" />
							</div>
							<p style="margin-top: 0px;" class="riqi">
								2015-3至2015-5
							</p>

							<div style="display: none; left: 90px" class="tishi "
								id="tishi14">
								<p class="on">
									关注该车系的微博标签
								</p>
							</div>
						</div>
					</div>
					<div id="car_use" style="width: 100%; height: 367px"></div>
					<div style="margin-top: 10px;" class="data">
						<p style="float: left">
							&nbsp;&nbsp;&nbsp;数据来源：
						</p>
						<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
								style="margin-top: -8px; margin-right: 10px;"
								src="<%=webRoot%>/images/koubei (1).png" title="口碑" width="27"
								height="27" /> </a><a href="<%=webRoot%>/employee/returnnew#source_blog" target="_blank"><img
								style="margin-top: -8px; margin-right: 20px;"
								src="<%=webRoot%>/images/weibo.png" title="微博" width="27"
								height="27" /> </a>
						<!--<div class="right">)</div>-->
					</div>
				</div>
				<div class="crowd_caruse_weibo">
					<div class="content_title">
						<div class="dingwei">
							<div style="float: left" class="people">
								微博标签
							</div>
							<div class="pic " id="pic15">
								<img style="margin-top: 8px"
									src="<%=webRoot%>/images/wenhao.png" width="14" height="15" />
							</div>
							<p style="margin-top: 0px;" class="riqi">
								2015-3至2015-5
							</p>
							<div style="display: none; left: 90px" class="tishi "
								id="tishi15">
								<p class="on">
									购买该车系用途分布
								</p>
							</div>
						</div>
					</div>
					<div
						style="height: 462px; width: 500px; border-left: 1px solid #ccc;">
						<div
							style="margin: 0px auto 0; height: 307px; padding: 30px 30px 30px 30px;">
							<div id="tagscloud"
								style="height: 310px; width: 440px; overflow: hidden"></div>
						</div>
						<div
							style="padding-left: 10px; padding-top: 0px; margin-top: 0px;"
							class="sourcefrom">

<%--							<div class="remark">--%>
<%--								<div style="margin-top: 10px;margin-left: 10px;" class="left">--%>
<%--									备注--%>
<%--								</div>--%>
<%--								<div class="right">--%>
<%--									字体大小表示关注车系的微博标签多少，--%>
<%--									<br />--%>
<%--									<br />--%>
<%--									字体越大表示该标签数量越多--%>
<%--								</div>--%>
<%--							</div>--%>
<%--							<div style="margin-top: 15px" class="data">--%>
<%--								<p>--%>
<%--									&nbsp;&nbsp;&nbsp;数据来源：--%>
<%--								</p>--%>
<%--								<a href="<%=webRoot%>/employee/returnnew" target="_blank"><img--%>
<%--										style="margin-top: -8px;"--%>
<%--										src="<%=webRoot%>/images/koubei (1).png" title="口碑" width="27"--%>
<%--										height="27" /> </a><a href="<%=webRoot%>/employee/returnnew" target="_blank"><img--%>
<%--										style="margin-top: -8px;" src="<%=webRoot%>/images/weibo.png"--%>
<%--										title="微博" width="27" height="27" /> </a>--%>
<%--								<!--<div class="right">)</div>-->--%>
<%--							</div>--%>
							
							
								<div class="remark">
									<div style="margin-top: 10px;" class="left">
										备注:
									</div>
									<div style="padding-top: 10px" class="right">
										字体大小表示关注车系的微博标签多少
										<br />
										字体越大表示该标签数量越多
									</div>
								</div>
								<div style="margin-top: 9px" class="data">
									<p>
										&nbsp;&nbsp;&nbsp;数据来源：
									</p>
									<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
											style="margin-top: -8px;" src="<%=webRoot%>/images/koubei (1).png"
											title="口碑" width="27" height="27" />
									</a><a href="<%=webRoot%>/employee/returnnew#source_blog" target="_blank"><img
											style="margin-top: -8px;" src="<%=webRoot%>/images/weibo.png" title="口碑"
											width="27" height="27" />
									</a>
									<!--<div class="right">)</div>-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="clear"></div>

			<div class="content_news_div" style="width: 1010px;">
				<div class="content_title">
					<div class="dingwei">
						<div style="float: left" class="people">
							星座分析
						</div>
						<div class="pic " id="pic16">
							<img style="margin-top: 8px" src="<%=webRoot%>/images/wenhao.png" width="14"
								height="14" />
						</div>
						<p style="margin-top: 0px;" class="riqi">
							2015-3至2015-5
						</p>

						<div style="display: none; left: 90px" class="tishi " id="tishi16">
							<p class="on">
								关注该车系的星座分布
							</p>
						</div>
					</div>
				</div>
				<div id="" style="float: left; width: 40%; height: 367px;">
					<div id="" style="width: 100%; height: 100px;">
						<div id="favoritestar" style="padding-top: 50px">

						</div>
					</div>
					<div style="width: 100%; height: 262px; text-align: center;">
						<div style="padding-top: 40px;">
							<img id="starimg" src=""
								style="width: 40%; height: 40%; align: middle" />
						</div>
					</div>
				</div>
				
				
				<div id="crowd_constellation"
					style="float: left; width: 50%; height: 367px; text-align: center;">
					<div style="padding-top: 30px;">
						<!--<img src="<%=webRoot %>/images/website/u72.jpg" alt="" />-->
					</div>
				</div>
				
				<div style="margin-top: -40px;" class="data">
					<p style="float: left">
						&nbsp;&nbsp;&nbsp;数据来源：
					</p>
					<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
							style="margin-top: -8px; margin-right: 10px;"
							src="<%=webRoot %>/images/koubei (1).png" title="口碑" width="27" height="27" />
					</a><a href="<%=webRoot%>/employee/returnnew#source_blog" target="_blank"><img
							style="margin-top: -8px; margin-right: 20px;"
							src="<%=webRoot %>/images/weibo.png" title="微博" width="27" height="27" />
					</a>
					<!--<div class="right">)</div>-->
				</div>
			</div>

			<div class="clear"></div>
			<div class="content_news_div" style="height: 500px;width: 1010px;">
				<div class="content_title">
					<div class="dingwei">
						<div style="float: left" class="people">
							人群解析
						</div>

						<div class="pic " id="pic17">
							<img style="margin-top: 8px" src="<%=webRoot %>/images/wenhao.png" width="14"
								height="14" />
						</div>
						<p style="margin-top: 0px;" class="riqi">
							2015-3至2015-5
						</p>

						<div style="display: none; left: 90px" class="tishi " id="tishi17">
							<p class="on">
								关注车系人群的评论勋章与兴趣爱好分布情况
							</p>
						</div>
					</div>
				</div>
				<div class="crowd_divided">
					<a id="by_habit" class="crowd_divided_pfn mgr20">兴趣爱好</a>
					<a id="by_weibo_medal"
						class="crowd_divided_pfn crowd_divided_pfn_hover">评论勋章</a>

				</div>
				<div class="clear"></div>
				<div style="width: 1014px;">
					<div id="by_medal_div"
						style="display: block; width: 100%; height: 320px;"></div>
					<div id="by_habit_div"
						style="display: none; width: 1014px; height: 320px;"></div>
				</div>
				
				<div style="margin-top: 10px" class="sourcefrom">
<%--					<div class="remark">--%>
<%--						<div class="left">--%>
<%--							备注--%>
<%--						</div>--%>
<%--						<div style="margin-top: 2px" class="right">--%>
<%--							评论勋章 ：众调网根据评论者的论坛、微博及话题综合打上勋章标签--%>
<%--						</div>--%>
<%--					</div>--%>
					<div class="remark">
						<div class="left">
							备注:
						</div>
						<div style="margin-top: 2px" class="right">
							评论勋章 ：众调网根据评论者的论坛、微博及话题综合打上勋章标签
						</div>
					</div>
					<div style="margin-right: 10px" class="data">
						<p>
							&nbsp;&nbsp;&nbsp;数据来源：
						</p>
						<a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
								style="margin-top: -8px;" src="<%=webRoot %>/images/koubei (1).png" title="口碑"
								width="27" height="27" />
						</a><a href="<%=webRoot%>/employee/returnnew#source_blog" target="_blank"><img
								style="margin-top: -8px;" src="<%=webRoot %>/images/weibo.png" title="微博"
								width="27" height="27" />
						</a>
						<!--<div class="right">)</div>-->
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	
	//initialize echart for crowd_sex
   var myChartGender = echarts.init(document.getElementById('crowd_sex')); 
   //initialize echart for carow ages
   var myChartAge = echarts.init(document.getElementById('crowd_age'));
   //initialize echart for car use
   var myChartUse = echarts.init(document.getElementById('car_use'));
   //initialize echart for region according to province
   var myChartProvinces = echarts.init(document.getElementById('by_provinces_div'));
   //initialize echart for cities 
   var myChartCities = echarts.init(document.getElementById('by_cities_div'));

   var myChartStars = echarts.init(document.getElementById('crowd_constellation'));

   var myChartMedal = echarts.init(document.getElementById('by_medal_div'));

   var myChartHabit = echarts.init(document.getElementById('by_habit_div'));

   //Region distribution by province
   function getPrnDatas(){
	        $("#top10_provinces").css("overflow-y","hidden");
    		var t_seriesid= $('#t_seriesid', window.parent.document).val();    		
    		$.ajax( {
    			url : "searchprn", 
    			data:{seriesid:t_seriesid},
    			type : "POST",
    			dataType:"json",
    			success : function(result) { 
    				myChartProvinces.clear(); 
    				$("#top10_provinces").empty();        			
        		    if(result != null && result != ""){
        		    	//alert("==="+result+"++++++");   				   								
        		    var i = 0;
        		    var prndatas=[];
        		    var strP = "";
        		    var sname="";
        		    //var strMaxCount = String(result[0].focusnumber);
        		    //alert(strMaxCount);
        		    //var maxCount = parseInt(strMaxCount.substring(0,strMaxCount.length-2)); 
        		    var maxCount = result[0].focusnumber;
        		    var a = maxCount/100;
        		    var b = a.toFixed(0)*100;
        		    //alert(maxCount);	    
        		    var maxWidth = 100;
    				for(var r in result){
    					sname = result[r].sname;
        				prndatas.push({name:result[r].pname, value:result[r].focusnumber});
        				var divwidth = maxWidth * (result[r].focusnumber/maxCount);
        	            i+=1;
        	            //var indexi = eval(${index}+1);
        				strP += "<div id=\"topten"+i+"\" class=\"top_ten_list a\"> "
        				       + "<table>"
        				           + "<tbody>"
        				               +"<tr>"
        				                  +"<td width=\"18px\">" + i
        				                  +".</td>"
        				                  +"<td class=\"top_ten_name\">" + result[r].pname
        				                  +"</td>"
        				                  +"<td style=\"width:130px\">"
        				                  +"<div class=\"top_ten_bar\" style=\"width:"+divwidth +"px\"></div>"
        				                  +"</td>"
        				                  +"<td style=\"width:80px;text-align:left\">" + result[r].focusnumber
        			                      +"</td>"
        				               +"</tr>"
        				           + "</tbody>"
        				       + "</table>"
        				       + "</div>"
    				}
    				$("#top10_provinces").html(strP);
    				container = $("#top10_provinces");
    				scrollTo = $("#topten1");
    				var flag = true;
    		   		$("#more_provinces").click(function(){
    		   	   		if(flag){
    		                $("#top10_provinces").css("overflow-y","auto");
    		                //$("html,body").animate({scrollTop:$("#topten1").offset().top},1000);
    		                $(this).html("<a href='javascript:void(0)'>返回</a>");
    		                //$(this).html("<a href='javascript:void(0)'>返回</a>");
    		                flag = false;
    		   	   		}else{
    		   	   		    //$("html,body").animate({scrollTop:$("#topten1").offset().top},1000);
    		   	   		    $(this).html("<a href='javascript:void(0)'>更多</a>");
    		   	   		    //container.animate({scroolTop:scrollTo.offset().top - container.offset().top + container.scrollTop()});
    			   	   		$("#top10_provinces").css("overflow-y","hidden");   			            
    			            flag = true;
    		   	   	   	}
    		   	   	});
    				 optionByProvinces = {
    					    tooltip : {
    					        trigger: 'item'
    					    },
    					    dataRange: {
    					        min: 0,
    					        max: b,
    					        x: 'left',
    					        y: 'bottom',
    					        text:['高','低'],
    					        precision:0, 
    					        splitNumber:4,
    					        calculable : true
    					    },
    					    series : [
    					        {
    					            name: sname,
    					            type: 'map',
    					            mapType: 'china',
    					            roam: false,
    					            mapLocation: {
    					                x : 'center',
    					                y : 'bottom',
    					                height : 320
    					            },
    					            itemStyle: {
    					                normal: {
    					                    borderWidth:1,
    					                    borderColor:'#fff',
    					                    color: '#ccccff',
    					                    label: {
    					                        show: false
    					                    }
    					                },
    					                emphasis: {                 // 也是选中样式
    					                    borderWidth:2,
    					                    borderColor:'#fff',
    					                    color: '#99ccff',
    					                    position:'outer',
    					                    label: {
    					                        show: true,
    					                        textStyle: {
    					                            color: '#fff',
    					                            fontSize:12
    					                        }
    					                    }
    					                }
    					            },            
    					            data:prndatas
    					            //data:MapData
    					         }
    					      ]
    					  };
    				 
    				 myChartProvinces.setOption(optionByProvinces);
        		    }
    			}
    		});
    }
    //Region distribution by citities
    function getCitiesDatas(){
    	var t_seriesid= $('#t_seriesid', window.parent.document).val(); 
    	$("#top10_cities").css("overflow-y","hidden");
    	//alert(t_seriesid);
    	$.ajax({
    		url : "searchcities", 
			data:{seriesid:t_seriesid},
			type : "POST",
			dataType:"json",
			success : function(result){
				myChartCities.clear();
				$("#top10_cities").empty();
				if(result != null && result != "" ){
                var j = 0;
                var strC = "";
                var citydatas=[];
                var sename = "";
                var divwidth=0;
    		    var maxCount = result[0].totalcount;
    		    var a = maxCount/100;
    		    var b = a.toFixed(0)*100;
    		    var geoCodes = [];
    		    var maxWidth = 100;
                var strGeoCode={};
                for(var r in result){
                    var lldata = [];
                    lldata.push(result[r].longitude);
                    lldata.push(result[r].latitude);
                    strGeoCode[result[r].city] = lldata;
                    sename = result[r].sname                                          
                    citydatas.push({name:result[r].city, value:result[r].totalcount});
                    divwidth = maxWidth * (result[r].totalcount/maxCount);
                    j+=1;
                    //var indexi = eval(${index}+1);
        			strC += "<div id=\"topten\" class=\"top_ten_list a\"> "
        			       + "<table>"
        			           + "<tbody>"
        			               +"<tr>"
        			                  +"<td width=\"18px\">" + j
        			                  +".</td>"
        			                  +"<td class=\"top_ten_name\">" + result[r].city
        			                  +"</td>"
        			                  +"<td style=\"width:130px\">"
        			                     +"<div class=\"top_ten_bar\" style=\"width:"+divwidth +"px\"></div>"
        			                  +"</td>"
        			                  +"<td width=\"80px\">" + result[r].totalcount
        			                  +"</td>"
        			               +"</tr>"
        			           + "</tbody>"
        			       + "</table>"
        			       + "</div>"
                    }         
                $("#top10_cities").html(strC);
                var flag = true;
                $("#more_cities").click(function(){
               	   	if(flag){
            			$("#top10_cities").css("overflow-y","auto");
            			$(this).html("<a href='javascript:void(0)'>返回</a>");
                        flag = false;
               	    }else{
            	   		$("#top10_cities").css("overflow-y","hidden");
                        $(this).html("<a href='javascript:void(0)'>更多</a>");
                        flag = true;
               	   	}
               	   	});
              //Region attention datas by cities
                optionByCities = {

                tooltip : {
                    trigger: 'item'
                },    
                dataRange: {
                    min : 0,
                    max : b,
                    x: 'left',
    		        y: 'bottom',
                    text:['高','低'],
                    
                    calculable : true                                       
                },
                series : [
                    {
                        name: sename,
                        type: 'map',
                        mapType: 'china',
                        hoverable: false,
                        roam:false,
                        mapLocation: {
                            x : 'center',
                            y : 'bottom',
                            height : 320
                        },
                        itemStyle: {
                            normal: {
                                borderColor:'#fff',
                                color: '#ccccff',
                                borderWidth: 1,            // 标注边线线宽，单位px，默认为1
                                label: {
                                    show: false
                                }
                            },
                            emphasis: {
                                borderColor:'#fff',
                                color: '#99ccff',  
                                borderWidth: 2,
                                label: {
                                    show: false
                                }
                            }
                        },
                        data : [],
                        markPoint : {
                            symbolSize: 5,       // 标注大小，半宽（半径）参数，当图形为方向或菱形则总宽度为symbolSize * 2
                            itemStyle: {
                                normal: {
                                    borderColor:'#fff',
                                    color: '#ccccff',
                                    borderWidth: 1,            // 标注边线线宽，单位px，默认为1
                                    label: {
                                        show: false
                                    }
                                },
                                emphasis: {
                                    borderColor:'#fff',
                                    color: '#99ccff',  
                                    borderWidth: 2,
                                    label: {
                                        show: false
                                    }
                                }
                            },
                            data: citydatas
                        },
                        geoCoord: strGeoCode
                            //
                            //{"合肥市":[117.27,31.86],"上海市":[121.48,31.22]}
                            
                    },
                    {
                        name: sename,
                        type: 'map',
                        mapType: 'china',
                        data:[],
                        markPoint : {
                            symbol:'circle',
                            symbolSize : function (v){
                                return 5 + v/1000
                            },
                            effect : {
                                show: true,
                                shadowBlur : 1
                            },
                            itemStyle:{
                                normal:{
                                    label:{show:false}
                                }
                            },
                            data: citydatas
                        }
                    }
                ]};               
                myChartCities.setOption(optionByCities);
				}
				}            
        	});
        }
    function getGedDatas(){
    	myChartGender.clear();       
    	var t_seriesid= $('#t_seriesid', window.parent.document).val();
    	$.ajax({
            url:"searchgender",
            data:{seriesid:t_seriesid},
            type:"POST",
            dataType:"json",
            success:function(result){
                if(result != null && result != ""){ 
			    var genderdatas=[];
			    for(var r in result){
				    genderdatas.push({value:result[r].gendernumber,name:result[r].sex});
				    }
				//Gender proportion
			    optionGender = {
			 	   title : {
			 			text: '性别比例',
			 			//subtext: '纯属虚构',
			 			x:'center',
			 			y:25,
			 			textStyle:{
			 		    fontSize: 12,
			 		    fontWeight: 'bolder',
			 		    color: '#333'
			 		    }
			 		},
			 		tooltip : {
			 			trigger: 'item',
			 			formatter: "{a} <br/>{b} : {c} ({d}%)"
			 		},
			 		color:['#ff69b4','#87cefa'], 
			 		//color:['#ffcc33','#2088CF'],
			 		//color:['#ff6600','#2088CF'],
			 		//color:['#ffff66','#336699'],
			 		calculable : true,
			 		series : [
			 			{
			 				name:'性别比例',
			 				type:'pie',			 				
			 				radius : '55%',
			 				center: ['50%', '60%'],				
			 				data:genderdatas
			 			}
			 		]}			    
			    myChartGender.setOption(optionGender);
                }
                }
        	});
        }
    //Set up datas for use.
    function getUseDatas(){
    	myChartUse.clear();
    	var t_seriesid= $('#t_seriesid', window.parent.document).val();
    	$.ajax({
            url:"searchuse",
            data:{seriesid:t_seriesid},
			type:"POST",
			dataType:"json",
            success:function(result){
            if(result != null && result != ""){
            var usedatas = [];
            for(var r in result){
                usedatas.push({value:result[r].working, name:'上下班'});
                usedatas.push({value:result[r].pickkids,name:'接送小孩'});
                usedatas.push({value:result[r].shopping,name:'购物'});
                usedatas.push({value:result[r].travel,name:'自驾游'});
                usedatas.push({value:result[r].longdis,name:'跑长途'});
                usedatas.push({value:result[r].busipick,name:'商务接送'});
                usedatas.push({value:result[r].makefriends,name:'交友'});
                usedatas.push({value:result[r].stuff, name:'拉货'});
                usedatas.push({value:result[r].crossctry,name:'越野'});
                usedatas.push({value:result[r].race,name:'赛车'});
            }
            
            //Car use chart
            optionUse = {
        		title : {
        			text: '购车用途',
        			//subtext: '纯属虚构',
        			x:'center',
        			y:25,
        			textStyle:{
        		    fontSize: 12,
        		    fontWeight: 'bolder',
        		    color: '#333'
        		    },
        		},
        		tooltip : {
        			trigger: 'item',
        			formatter: "{a} <br/>{b} : {c} ({d}%)"
        		},
     		    color:['#85d4e3','#f4b5bd','#9c964a','#cdc08c','#f9d87b','#00fa9a','#8277a3','#cd5c5c','#ff9900','#ff99cc'],
        		calculable : true,
        		series : [
        			{
        				name:'购车用途',
        				type:'pie',
        				radius : '55%',
        				center: ['50%', '60%'],
        				data:usedatas
        			}]
        	    };            
             myChartUse.setOption(optionUse);
            }
            }
        });
    }
    function getMedal(){
    	myChartMedal.clear(); 
    	var t_seriesid= $('#t_seriesid', window.parent.document).val();
    	$.ajax({
            url:"searchmedal",
            data:{seriesid:t_seriesid},
			type:"POST",
			dataType:"json",
            success:function(result){
            if(result != null && result != ""){
            var categories = [];
            var medaldatas = [];
            for(var r in result[0]){
               categories.push(r);
               medaldatas.push(result[0][r]);                          
            }          
            //Set data for weibo medal
			optionMedal = {
				    title : {
				        text: '评论勋章',
				        x:'center',
				        y:25,
						textStyle:{
					    fontSize: 18,
					    fontWeight: 'bolder',					    				    
					    color: '#333'
					    }, 
				    },
				    calculable : true,
				    tooltip: {
				        trigger: 'item',
				    	formatter:"{a}</br> {b}: {c}%"
				    },
				    xAxis : [
				        {
				            type : 'category',
				            splitLine:{
			                   show:false
			                },
				            data: categories
					            //['一举成名','舌战群儒','如来神掌','语惊四座','谈笑风生','七步成诗','情投意盒','一言九顶','斗酒百篇','谈天说地','手到擒来','一蹴而就','我就愛贊','一锤定音','百发百中','刨根问底']
				        }
				    ],
				     yAxis : [ 
				         {  
			                  type : 'value',  
			                  axisLabel : {  
			                     formatter : '{value}%'  
			                  }, 
			                  splitLine:{
			                   show:false
			                  }
			             }
			         ],  
				     series : [{
				            name:'微博奖牌数',
				            type:'bar',				            
				            itemStyle:{
				                normal:{
				                    label:{show:true, position:'top', formatter:'{c}%',textStyle:{color:'black'}},
				                    //color:'#f4b5bd'
				                    color:'#85d4e3'
				                }
				            },
				            data:medaldatas           	            
				        }]
				};  			             
			    myChartMedal.setOption(optionMedal);
            }
            }
        });

    }
    function getUserTags(){
    	$("#tagscloud").empty();
		var t_seriesid = $('#t_seriesid',window.parent.document).val();		
		$.ajax({
            url:"searchtags",
            data:{seriesid:t_seriesid},
            type:"POST",
            dataType:"json",
            success:function(result){
                if(result != null && result != ""){
                var tag_array = []; 
                var sizeWeight = 0;
                var intiWeight = 12;
                var maxCount = result[0].tag_count;
                for(var r in result){
                	sizeWeight = eval(intiWeight*(result[r].tag_count/maxCount));
                    tag_array.push({text:result[r].tag,weight:sizeWeight});
                }
                // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.           		
           		$("#tagscloud").jQCloud(tag_array);
                }
            }
	    });
    }
    function getHabits(){    	
    	var t_seriesid = $('#t_seriesid',window.parent.document).val();  
    	myChartHabit.clear(); 
    	//alert("aa");  	
		$.ajax({
            url:"searchhabits",
            data:{seriesid:t_seriesid},
            type:"POST",
            dataType:"json",
            success:function(result){  
                if(result != null && result != ""){                  	
                var datas = [];
                var categories = [];
                var fre = 0;
                var data = 0;
                //alert(result[0].proportion);
                //var categories = ['科技潮流','政治军事','娱乐影视','人文情怀','体育运动','小资情调','商业财经','时尚精致','读书育人','艺术公益'];
                //for(var r in result[0]){
                //var re = /([0-9]+\.[0-9]{2})[0-9]*/;
                for(var r in result){
                   
                    //fre = Math.round(result[r].proportion*100);
                    fre = result[r].proportion*100 + "";
                    //data = fre.replace(re,"$1″);
                    data = fre.substring(0,fre.indexOf(".") + 3);
                	categories.push(result[r].habit);
                	datas.push(data);
                }
                optionHabits = {
					    title : {
				        text: '兴趣爱好',
				        x:'center',
				        y:25,
						textStyle:{
					    fontSize: 18,
					    fontWeight: 'bolder',
					    //font-family: 'arial,helvetica,sans-serif',
					    color: '#333'
				    }, 
			    },
			    calculable : true,
			    tooltip: {
			        trigger: 'item',
			    	formatter:"{a}</br> {b}: {c}%"
			    },
			    xAxis : [
			        {
			            type : 'category',
			            splitLine:{
		                   show:false
		                },
			            data: categories
			        }
			    ],
			     yAxis : [ 
			         {  
		                  type : 'value',  
		                  axisLabel : {  
		                     formatter : '{value}%'  
		                  }, 
		                  splitLine:{
		                   show:false
		                  }               
		                 }
		         ],  
			     series : [{
			            name:'兴趣爱好',
			            type:'bar',
			            barWidth:40,			            
			            itemStyle:{
			                normal:{
			                    label:{show:true, position:'top', formatter:'{c}%',textStyle:{color:'black'}},
			                    //color:'#85d4e3'
			                }
			            },
			            data:datas           	            
			        }]
			    };                               
                myChartHabit.setOption(optionHabits); 
                }          
            }
	    });
    }
    function getAgeDatas(){
    	myChartAge.clear();
		var t_seriesid = $('#t_seriesid', window.parent.document).val();
		$.ajax({
			url:"searchage",
			data:{seriesid:t_seriesid},
			type:"POST",
			dataType:"json",
			success:function(result){
				if(result != null && result != ""){
				var categories=[];
				var datas=[];
				var aa;
				for(var r in result){
					//aa = eval(Math.round(result[r].proportion *100));
					aa = result[r].proportion*100 + "";
                    //data = fre.replace(re,"$1″);
                    data = aa.substring(0,aa.indexOf(".") + 3);
		            categories.push(result[r].ageGroup);
					datas.push(data);
				}
   
                //Set data for age chart
				optionAge = {
					    title : {
					        text: '各年龄段使用比例',
					        x:'center',
					        y:25,
							textStyle:{
						    fontSize: 12,
						    fontWeight: 'bolder',
						    color: '#333'
						    }, 
					    },
					    calculable : true,
					    tooltip: {
					        trigger: 'item',
					    	formatter:"{a}</br> {b}: {c}%"
					    },
					    xAxis : [
					        {
					            type : 'category',
					            splitLine:{
				                   show:false
				                },
				                //data:categories
					            data: ['19岁以下','20-29','30-39','40-49','50岁以上']
					        }
					    ],
					     yAxis : [ 
					         {  
				                  type : 'value',  
				                  axisLabel : {  
				                     formatter : '{value}%'  
				                  }, 
				                  splitLine:{
				                   show:false
				                  },                 
						            //min:0,
						            //max:100
				                 }
				         ],  
					     series : [{
					            name:'使用比例',
					            type:'bar',
					            barWidth:40,
					            itemStyle:{
					                normal:{
					    	            label:{show:true, position:'top', formatter:'{c}%',textStyle:{color:'black'}},
					                    //color:'#0099cc',
					                    color:'#ff9966'
					                }
					            },
					            data:datas           	            
					        }]
					}; 				    
					myChartAge.setOption(optionAge);
				}
			}
		});
    }

    function  getStars(){
    	myChartStars.clear();
    	$("#favoritestar").empty();
    	$("#starimg").attr("src","");
    	//var basepath = "http://localhost:8080/bigdata";
    	//var basepath = "http://www2.91survey.com:8080/bigdata/"
    	var basepath ='<%=webRoot %>';
		//alert(basepath);
    	var firstStar = "";
    	var str = "";
    	var imgname = "";
    	var t_seriesid = $('#t_seriesid', window.parent.document).val();
		$.ajax({
			url:"searchstars",
			data:{seriesid:t_seriesid},
			type:"POST",
			dataType:"json",
			success:function(result){
				if(result != null && result != ""){
				var stars = [];
				var datas = [];
				var value = 0;				
				imgname = result[1].star_ename;
				var maxvalue = Math.round(result[1].proportion*100);
				firstStar = result[1].stars;
				str = "<p style=\"width:100%;height:30px;text-align:center;font-size:14px;\">喜欢这款车的人<span  style=\"color:#0000cd;font-size:18px\">" + firstStar + "</span>最多</p>" +
				          "<p style=\"width:100%;height:30px;text-align:center;font-size:14px;\">占总数的<span  style=\"color:#0000cd;font-size:18px\">" + maxvalue +"%</span></p>";

                 $("#favoritestar").html(str);                
                 $("#starimg").attr("src", basepath + "/images/website/stars/" + imgname +".png");
                 //$("#starimg").attr("src", basepath + "/images/cute_stars/" + imgname +".jpg");				
				//alert(result[0].Aries);
				for(var star in result[0]){
				    stars.push({text:star});
				    value = Math.round(result[0][star]*100);
				    datas.push(value);
				}
				option = {
			    	    tooltip : {
			    	        trigger: 'axis',
			    	        formatter:"{a}</br> {d}: {c}%"
			    	    },

			    	    polar : [
			    	       {
			    	           indicator : stars

			    	       }
			    	    ],
			    	    calculable : true,
			    	    series : [
			    	        {
			    	            name: '星座分析',
			    	            type: 'radar',
			    	            data : [
			    	                {
			    	                    value : datas,
			    	                    name : '星座爱好'
			    	                }
			    	            ]
			    	        }
			    	    ]
			    	};			    	 
			    	myChartStars.setOption(option); 
			    	myChartStars.on(echarts.config.EVENT.HOVER, function(param) {
			        	//var t_seriesid = $('#t_seriesid', window.parent.document).val();     
			        	var chosstarname = param.name;
			        	//var basepath = "http://localhost:8080/bigdata";
			        	$.ajax({
			      		  url : "searchchsstar", 
			      		  data:{starname:chosstarname,seriesid:t_seriesid},
			      		  type : "POST",
			      		  dataType:"json",
			      		  //beforeSend : function() 
			      		  //{
			      			//$("#hide_div").fadeOut();
			      		  //},
			      		  success : function(result) {
			      		    //s$("p.star").fadeOut(1000);  	        
			      			var strOther = "";
			      			var value = 0;
			      			for(var r in result){
			          			value = Math.round(result[r].proportion*100);
			          			if(firstStar == chosstarname){
			          				$("#favoritestar").html(str);
			          				//$("#starimg").attr("src", basepath + "/images/cute_stars/" + imgname +".jpg");
			          				$("#starimg").attr("src", basepath + "/images/website/stars/" + imgname +".png");
					          	}else{
					          		strOther = "<p class='star'>喜欢这款车的人</p>" +
				    		                   "<p class='star'><span  style=\"color:#0000cd;font-size:18px\">" + chosstarname + "</span>占总数的<span style=\"color:#0000cd;font-size:18px\">" + value +"%</span></p>";				    		        
					    		    $("#favoritestar").empty();
				    	            $("#favoritestar").html(strOther);				    	            
				    	            $("#starimg").attr("src", basepath + "/images/website/stars/" + result[r].star_ename +".png");
				                    //$("#starimg").attr("src", basepath + "/images/cute_stars/" + result[r].star_ename +".jpg");	
					          	}
				      	     }
			      			//$("p.star").fadeIn(1000);
			              }
			            });
			      }); 
			   }		                	  	                    
            }
   
    	});
    	     
    } 
    
    function refreshIF(){
    	getPrnDatas();
   		getCitiesDatas();
   		getGedDatas();
   		getAgeDatas();
   		getUseDatas();
   		getUserTags();
   		getMedal();
   		getStars();
   		getHabits();
    }
    
    //Set up charts
   	$(function(){
   		getPrnDatas();
   		getCitiesDatas();
   		getGedDatas();
   		getAgeDatas();
   		getUseDatas();
   		getUserTags();
   		getMedal();
   		getStars();
   		getHabits();  		  	   	
     });          
   </script>
</html>
