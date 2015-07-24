<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="../commonincludes.jsp"%>
<html>
	<head>


		<title>产品评价</title>

		<style>
#user_comments {
	border-collapse: collapse;
}

#user_comments tr {
	height: 30px
}

#user_comments tr td:first-child {
	border: 0px;
}

#user_comments tbody td {
	border-left: 1px solid #ccc;
}

#user_comments .jiantou_img {
	margin-left: 3px;
}

#user_comments .com_color_div {
	float: left;
	height: 20px;
}

#user_comments .com_per_div {
	float: left;
	width: 0%;
	margin-left: 1px;
	font-size: 10px;
	margin-right: 5px;
}

.car_info_table {
	text-align: center;
	border-collapse: collapse;
	border: 1px solid #ccc;
	border-right: 0px;
	
}

.car_info_table td {
	width: 130px;
	border-right: 0px;
}

.car_info_table tr td:first-child {
	background: #f9f9f9;
	color: #969696;
	border-left:0px;
}

.chexi_comment_div {
	border-left: 1px solid #ccc;
	height: 335px;
}

.chexi_comment_div p {
	text-indent: 1em;
}

.large_div {
	border: 1px solid #CCC;
	width: 100%;
	margin-top: 20px;
	background: #fff;
	border: none;
}

.product_rank {
	background: url(images/u73.png) no-repeat;
	height: 125px;
	width: 228px;
	margin-left: 100px;
	padding: 10px;
}

.sati_div {
	width: 90%;
	margin: 0 auto;
	border-radius: 10px;
	min-height: 250px;
}

.sati_div p {
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	margin-top: 10px;
}

.user_info_div {
	border-right: 0px;
	height: 45px;
	padding: 10px;
}

.user_name_span {
	height: 45px;
	line-height: 45px;
	margin-left: 10px
}

.show_all_btn {
	display: block;
	width: 100px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	border: 1px solid #e1e5ee;
	color: #3a5d95
}

.pic_box {
	width: 100%;
	height: 25px;
}

.pic_label {
	float: left;
	width: 70px;
	font-size: 12px;
	height: 15px;
}

.pic_item {
	float: left;
	margin-top: 5px;
	height: 10px;
	margin-right: 5px;
}

.highlight {
	background-color: yellow
}

.test_ellipsis {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	width: 100px;
	float: left;
}

.test_ellipsis2 {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	width: 100px;
	float: left;
}

/* 分页 */
.d00 {
	background: #dff2f4;
	color: #990000;
}

.list_page ul,li,dd {
	float: left;
}

.list_page {
	margin-top: 20px;
	padding: 20px 24px 25px 170px;
	text-align: center;
	width: 530px;
	display: block;
}

.list_pon {
	display: inline-block;
	cursor: pointer;
	height: 20px;
	line-height: 20px;
	margin-right: 7px;
	width: 50px;
}

.list_ptwo {
	display: inline-block;
	border: 1px solid #C9D7F1;
	cursor: pointer;
	height: 20px;
	line-height: 20px;
	margin-right: 7px;
	width: 20px;
}

.list_ptwo a {
	display: inline-block;
	width: 20px;
	height: 20px;
	line-height: 20px;
}

.list_current {
	background: #4183C4;
	color: #fff;
}

.list_ptwo a:hover {
	background: #4183C4;
	color: #fff;
}
</style>
		<link href="<%=webRoot%>/css/zzsc.css" rel="stylesheet"
			type="text/css" />


		<script type="text/javascript" src="<%=webRoot%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=webRoot%>/js/highlight.js"></script>

		<script type="text/javascript"
			src="<%=webRoot%>/js/jqcloud-1.0.4.min.js"></script>
		<script type="text/javascript" src="<%=webRoot%>/js/zzsc.js"></script>





	</head>

	<body>





		<form action="">

			<input type="hidden" id="obid" name="obid" />
		</form>
		<div class="width_98">
			<div class="content_div fl" style="width: 100%">
				<div class="content_menu_div"
					style="float: left; width: 72%; height: 400px;">
					<div class="menu_item_box pr">
						<a class="menu_item" href="<%=webRoot%>/news/index">热点新闻</a>
						<a class="menu_item " href="<%=webRoot%>/attention/index">声量/关注</a>
						<a class="menu_item" href="<%=webRoot%>/topic/showtopic">话题评论</a>
						<a class="menu_item menu_item_hover"
							href="<%=webRoot%>/produc/showproduc">产品评价</a>
						<a class="menu_item" href="<%=webRoot%>/people/index">人群图谱</a>
					</div>
					<div class="menu_item_content"
						style="height: 325px; border: 1px solid #ccc">
						<div class="fl" style="width: 100%">
							<div class="dingwei">
								<div class="dingwei">
									<div class="fl" style="width: 100%">
										<p class="fb font14" style="float: left">
											产品与竞品总体与分项评价
										</p>
										<div class="pic">
											<img id="pic10" src="../images/wenhao.png" width="14"
												height="14">
										</div>
										<p class="riqi">
											2015-3至2015-5
										</p>
									</div>

									<div style="display: none;" class="tishi " id="tishi10">
										<p class="on">
											基于网友对产品评论的情感分析的产品评价得分，以5分制表示对产品细项及总体的满意程度


										</p>
									</div>



								</div>
							</div>
							<div class="" style="height: 230px;">

								<table id="user_comments" style="width: 100%">
									<thead>
										<tr>
											<td></td>
											<td></td>
											<td>
												总体评价
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												空间
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												动力
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												操控性
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												油耗
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												舒适度
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												外观
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												内饰
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
											<td>
												性价比
												<a href="javascript:;"><img class="jiantou_img"
														src="<%=webRoot%>/images/website/menu_img2.png"> </a>
											</td>
										</tr>
									</thead>
									<tbody id="tbody">
									</tbody>
								</table>
							</div>
							<div class="sourcefrom  pinglun"
								style='margin-top: -125px; position: absolute; top: 340px; width: 65%;'>

								<div class="remark">
									<div class="left">
										备注:
									</div>
									<div class="right" style="padding-top:16px;">
										基于相关评论的情感分析来统计各细项得分，总体评价基于分项加权计算
										<br>
										5分表示最满意，4表示满意，3分表示一般，2分表示不满意，1表示最不满意







									</div>
								</div>
								<div class="data" style="padding-top:1px;">
									<p>
										&nbsp;&nbsp;&nbsp;数据来源：
									</p>
									<a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank"><img
											src="../images/xinwen.png" title="新闻" width="27" height="27">
									</a><a href="<%=webRoot%>/employee/returnnew#source_bbs" target="_blank"><img
											src="../images/bbs.png" title="论坛" width="27" height="27">
									</a><a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank"><img
											src="../images/koubei (1).png" title="口碑" width="27"
											height="27">
									</a>
									<!--<div class="right">)</div>-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sidebar_div fr" style="float: right;">
					<div class="car_hotnews_div" style="height: 400px; width: 99%">
						<div class="content_title" id="showpjtitle"></div>
						<div class="news_item pd10" id="showpjtopcx"></div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="content_news_div" style="height:560px;">
				<div class="content_title" id="titlename"></div>
				<div class="news_item pd10">
					<div style="width: 90%; margin: 10px auto 0px;overflow: hidden;">
						<div>
<%--							<div style="width: 40%; height:30px; float: left; text-align: center">--%>
<%--								满意--%>
							<div
							style="width: 40%; float: left; text-align: center; position: relative;">
							<div style="position: absolute" class="beijing">
								<img src="../images/comment_03.png" width="370" height="54">
							</div>

						</div>
<%--							</div>--%>

<%--							<div style="width: 40%; float: right; text-align: center;">--%>
<%--								不满意--%>
<%--							</div>--%>
							<div
							style="width: 40%; float: right; text-align: center; position: relative">
							<div style="position: absolute" class="beijing2">
								<img src="../images/comment_05.png" width="370" height="54">
							</div>
						</div>
							<div class="clear"></div>
						</div>
						<div style="width: 100%; height: 300px;">
							<div id="tagscloud" style="float: left; width: 40%;margin-top: 80px;">

							</div>

							<div
								style="width: 19%; float: left; text-align: center; font-size: 32px; height: 300px; line-height: 300px;margin-top: 80px;">
								VS
							</div>
							<div id="tagscloud2" style="float: right; width: 40%;margin-top: 80px;">

							</div>
						</div>
					</div>
				</div>
				<div class="sourcefrom">
                  
                  <div class="remark">
                    <div class="left">备注:</div>
                    <div style="padding-top:2px;" class="right">
                 字体大小表示产品评价关键词提及量多少，字体越大表示提及量越多
                 <br/>
                 点击产品评价关键词，可查看详细信息
</div></div>
<div class="data" >
          <p>&nbsp;&nbsp;&nbsp;数据来源：</p><a href="<%=webRoot%>/employee/returnnew#source_news" target="_blank" target="new"><img src="../images/xinwen.png" title="新闻" width="27" height="27"></a><a href="<%=webRoot%>/employee/returnnew#source_bbs" target="_blank" target="new"><img src="../images/bbs.png" title="论坛" width="27" height="27"></a><a href="<%=webRoot%>/employee/returnnew#source_praise" target="_blank" target="new"><img src="../images/koubei (1).png" title="口碑" width="27" height="27"></a><!--<div class="right">)</div>--></div>
               	</div>
			</div>

			<div class="large_div" style="border-top: 1px solid #ccc;">

				<div>
					<!-- <span class="font14 fb mgr10">数据来源</span>
							<select class="bd">
								<option>全部</option><option>汽车之家</option><option>腾讯汽车</option><option>搜狐汽车</option><option>新浪汽车</option>
							</select> -->
				</div>
				<%--				<div>--%>
				<%--					<p>--%>
				<%--						<span class="font14 fb mgr10">关键字查询：</span>--%>
				<%--						<a id="tc_0" href="javascript:void(0);" onclick="getTopic(0)">全部</a>--%>
				<%--						<a id="tc_1" href="javascript:void(0);" onclick="getTopic(1)">空间</a>--%>
				<%--						<a id="tc_2" href="javascript:void(0);" onclick="getTopic(2)">动力</a>--%>
				<%--						<a id="tc_3" href="javascript:void(0);" onclick="getTopic(3)">操控</a>--%>
				<%--						<a id="tc_4" href="javascript:void(0);" onclick="getTopic(4)">油耗</a>--%>
				<%--						<a id="tc_5" href="javascript:void(0);" onclick="getTopic(5)">舒适度</a>--%>
				<%--						<a id="tc_6" href="javascript:void(0);" onclick="getTopic(6)">外观</a>--%>
				<%--						<a id="tc_7" href="javascript:void(0);" onclick="getTopic(7)">内饰</a>--%>
				<%--						<a id="tc_8" href="javascript:void(0);" onclick="getTopic(8)">性价比</a>--%>
				<%--						<input id="t1" type="hidden" />--%>
				<%----%>
				<%--						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
				<%--						<span class="font14 fb mgr10">满意程度：</span>--%>
				<%--						<a id="iss_0" href="javascript:void(0);"--%>
				<%--							onclick="getIssatisfied(0)">全部</a>--%>
				<%--						<a id="iss_1" href="javascript:void(0);"--%>
				<%--							onclick="getIssatisfied(1)">满意</a>--%>
				<%--						<a id="iss_2" href="javascript:void(0);"--%>
				<%--							onclick="getIssatisfied(2)">不满意</a>--%>
				<%--						<input id="t2" type="hidden" />--%>
				<%----%>
				<%--						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
				<%--						<input id="btn1" type="button" value="查 询"--%>
				<%--							style="width: 80px; height: 20px; margin-top: 2px;"--%>
				<%--							onclick="query()">--%>
				<%--					</p>--%>
				<%--					<div style="overflow: hidden;">--%>
				<%--						<span--%>
				<%--							style="float: left; height: 25px; line-height: 25px; margin-right: 5px;">关键字模糊查询</span>--%>
				<%--						<input--%>
				<%--							style="float: left; height: 25px; width: 250px; border: 1px solid #ccc; border-right: 0px;"--%>
				<%--							id="content" />--%>
				<%--						<a style="float: left; height: 25px;" href="javascript:;"><img--%>
				<%--								height="25" src="<%=webRoot%>/images/1.png"--%>
				<%--								onclick="javascript:queryContent()" /> </a>--%>
				<%--					</div>--%>
				<%--				</div>--%>
				<div id="searchProductcx"></div>

				<div class="list_page">
					<ul>
						<li class="list_pon">
							<input class="list_pon" type="button" href="javascript:void(0);"
								id="sou" value="首页" disabled="disabled">
						</li>

						<li class="list_pon">
							<input class="list_pon" type="button" href="javascript:void(0);"
								id="shang" value="上一页" disabled="disabled">
						</li>

						<li>

							<p id="currentpage"></p>
						</li>


						<li class="list_pon" style="margin-left: 7px; margin-right: 7px;">
							<input class="list_pon" type="button" id="xia" value="下一页"
								disabled="disabled">
						</li>

						<li class="list_pon" style="margin-left: 7px;">
							<input class="list_pon" type="button" href="javascript:void(0);"
								id="lastPage" value="末页" disabled="disabled">
						</li>
					</ul>
				</div>
			</div>

		</div>

		<script type="text/javascript">
	var page=1;
	var ucid=0;
	var max=1;
	var count=0;

	var ttt111="100";//单选参数
	var iii111="100";//满 意度
	
	function  disabledxh(){
		 if(page==max){
			
			 $("#sou").attr("disabled", false);  
			 $("#shang").attr("disabled", false);  
			 $("#xia").attr("disabled", true);  
			 $("#lastPage").attr("disabled", true);
		 }else if(page==1){
			 $("#sou").attr("disabled", true);  
			 $("#shang").attr("disabled", true); 
			 $("#xia").attr("disabled", false);  
			 $("#lastPage").attr("disabled", false);
		 }else{
			 $("#sou").attr("disabled", false);  
			 $("#shang").attr("disabled", false); 
			 $("#xia").attr("disabled", false);  
			 $("#lastPage").attr("disabled", false);
			 
		 }
	}
	
	//首页
    $("#sou").click(function(){
    	page=1;
    	getpjgxtopcx(ttt111,iii111,page);
    });
	
	  //上一页  
    $("#shang").click(function(){
      if(page==1){
    //    alert("已经到达第一页");
    //    $("#sou").attr("disabled", true); 
        return ;
      }else{
      	page--; 
      	getpjgxtopcx(ttt111,iii111,page);
      }
    });
    
    //下一页  
    $("#xia").click(function(){ 
    	
     if(page==max){
      //  alert("已经到达最后一页");
     //   $("#lastPage").attr("disabled", true); 
        return ;
      }else{ 
      	page++;
      	getpjgxtopcx(ttt111,iii111,page);
    
    	
  }
    });
    
    //末页
    $("#lastPage").bind("click",function(){ 
  	  	page=max; 
  	  	getpjgxtopcx(ttt111,iii111,page);
    });
    
    
    


	$(function(){
		
		refreshIF();
		

});
	function refreshoF() {
		
		
			$('#content').keyup(function(){
				$('#searchProductcx').removeHighlight();
				if($(this).val() != '') {
					$('#searchProductcx').highlight($(this).val());
				}
			});
		
		
	}

	function refreshIF(){
		ucid=0;
		page=1;
		
		words();
		setchart();
		getpjtop();
	//	tanchuws();

		getpjgxtopcx("","",1);
	
		refreshoF();
		
		
		
	}
	
	
	function addpage(ucid,page){
		//alert(111)
		//getpjgxtopcx(ucid,page);
		//getpjgxtopcx("","",page);
	}

	function words(){
		var t_seriesid= $('#t_seriesid', window.parent.document).val();
		$.ajax( {
			url : "searchwords", 
			data:{seriesid:t_seriesid},
			type : "POST",
			  dataType:"json",
			success : function(result) {
				var dlist = [];
				var tlist = [];
				
				var series="";
				for(var r in result){
<%--					if(result[r].issatisfied==1){--%>
<%--				 dlist.push({text:result[r].words,weight:result[r].words_count});--%>
<%--					--%>
<%--					}else if(result[r].issatisfied==2){--%>
<%--						tlist.push({text:result[r].words,weight:result[r].words_count});--%>
<%--					}--%>
<%--					else {--%>
<%--						tlist.push({text:result[r].words,weight:result[r].words_count});--%>
<%--					}--%>
<%--					series=result[r].series;--%>

					<%-- 修改词频  陈震宇  20150512--%>
					if(result[r].issatisfied==1){
				 		dlist.push({text:result[r].topic,weight:result[r].emotion_score,html:{title:result[r].topic,"style":"cursor:pointer"},handlers:{click: function(){var ttt=jQuery(this).html();getpjgxtopcx(ttt,1,1)}}});
					}else{
						//不满意时 0显示宽度最大 7显示宽度最小
						var w = 0;
						if(result[r].emotion_score>0){
							w=-(result[r].emotion_score-7);
						}else{
							w=7;
						}
						tlist.push({text:result[r].topic,weight:w,html:{title:result[r].topic,"style":"cursor:pointer"},handlers:{click: function(){var ttt=jQuery(this).html();getpjgxtopcx(ttt,0,1)}}});
					}
					
					series=result[r].series;
				}
				$("#titlename").html(series+"产品评价");
				
				tanchuws(dlist);
				tanchuws2(tlist);
			
		}
		});
	}

    function tanchuws(dlist) {
        // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
      	$("#tagscloud").empty();
        $("#tagscloud").jQCloud(dlist);
   };
   function tanchuws2(tlist) {
       // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
      $("#tagscloud2").empty();
       $("#tagscloud2").jQCloud2(tlist);
  };


function setorderby(obid){
	$('#obid').val(obid);
	setchart();
}
	
function setchart(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	 var cid = '';   
     $('input[name="cid_'+t_seriesid+'"]:checked',window.parent.document).each(function(){
          cid+= $(this).val()+','; 
     });
     var obid=$('#obid').val();
	$.ajax( {
		url : "searchproductevaluate", 
		data:{seriesid:t_seriesid,cid:cid,obid:obid},
		type : "POST",
		dataType:"json",
		success : function(result) {
			$('#user_comments').find('tbody').html("");
			for(var r in result){
			var t="";
			if(t_seriesid==result[r].seriesid){
				t+="<tr><td style='color:#EB2B06;'>"+result[r].series+"</td><td style='border:0px;'></td>";
			}else{
				t+="<tr><td>"+result[r].series+"</td><td style='border:0px;'></td>";
			}
			t+="<td><div class='com_color_div' style='width:"+result[r].w_12+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_12).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_1+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_1).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_2+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_2).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_3+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_3).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_4+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_4).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_5+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_5).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_6+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_6).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_7+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_7).toFixed(2)+"</div></td>"
			t+="<td><div class='com_color_div' style='width:"+result[r].w_13+"px;background:#2088CF;'></div><div class='com_per_div'>"+(result[r].did_13).toFixed(2)+"</div></td></tr>"
			 $('#user_comments').find('tbody').append(t);  
			}
	}
	});
}


		
		//车系评价
	function getpjtop(){
	var t_seriesid= $('#t_seriesid', window.parent.document).val();
	$.ajax( {
		url : "searchpjtop", 
		data:{seriesid:t_seriesid},
		type : "POST",
		dataType:"json",
		success : function(result) {
			var str=" ";
			var rankname='';
			var i = 0;	
			for(var r in result){
				i =  result[r].total_score*10;
				str+="<div class='pic_label'><li class='test_ellipsis' >"+result[r].series+"</li></div><div class='pic_item' style='width:" + i +"px;background:#008aba;'></div><div>"+result[r].total_score+"</div></div>"
				rankname=result[r].rankname;
				$("#showpjtopcx").html(str);
				var h=rankname+"车系评价";
				$("#showpjtitle").html(h);
			}
		}
	}
	);
}
	
	
	
	function refreshtF() {
		
		
		$('#content').keyup(function(){
			$('#searchProductcx').removeHighlight();
			if($(this).val() != '') {
				$('#searchProductcx').highlight($(this).val());
			}
		});
	
	
}

	 function  getpjgxtopcx2(id){
		
		 page=1;
		 ucid=id;
		 getpjgxtopcx(ucid,page);
		//	$("#content").val("");
		
	 }
	 function  getpjgxtopcx3(id){
		 page=1;
		 var topic="";
		 if(id==1){
			topic="空间";
		 }else if(id==2){
			topic="动力";
		 }else if(id==3){
			topic="操控";
		 }else if(id==4){
			topic="油耗";
		 }else if(id==5){
			topic="舒适度";
		 }else if(id==6){
			topic="外观";
		 }else if(id==7){
			topic="内饰";
		 }else if(id==8){
			 topic="性价比";
		 }
		 getpjgxtopcx(topic,"",page);
	 }

	 //获取单选项的值 传递给T1隐藏文本
	 function getTopic(n){
		 var topic="";
		 if(n==1){
			topic="空间";
		 }else if(n==2){
			topic="动力";
		 }else if(n==3){
			topic="操控";
		 }else if(n==4){
			topic="油耗";
		 }else if(n==5){
			topic="舒适度";
		 }else if(n==6){
			topic="外观";
		 }else if(n==7){
			topic="内饰";
		 }else if(n==8){
			topic="性价比";
		 }
		 //$("#tc_"+n).css("background","red");
		 for(var i=0;i<9;i++){
			if(n==i){
			  $("#tc_"+i).css({ "color": "white","background":"#0099ff"});
			}else{
			  $("#tc_"+i).css({ "color": "","background":""});
			}
		 }
		 $("#t1").val(topic);
	 }

	 //获取满意程度 赋予T2隐藏文本
	 function getIssatisfied(n){
		 var issatisfied="";
		 if(n==1){
			 issatisfied="1";
		 }else if(n==2){
			 issatisfied="0";
		 }
		 for(var i=0;i<3;i++){
			if(n==i){
			  $("#iss_"+i).css({ "color": "white","background":"#0099ff"});
			}else{
			  $("#iss_"+i).css({ "color": "","background":""});
			}
		 }
		 //$("#iss_"+n).css("background","red");
		 $("#t2").val(n);
	 }

	//查询按钮
	function query(){
		var topic="";
		var issatisfied="";
		var page=1;
		if($("#t1").val()!=""){
			topic=$("#t1").val();
		}
		if($("#t2").val()!=""){
			issatisfied=$("#t2").val();
		}
		//alert(topic);
		//alert(issatisfied);
		getpjgxtopcx(topic,issatisfied,page);
	}

	//点击分页数获取分页
	function getPage(p){
		page = p;
		getpjgxtopcx(ttt111,iii111,p);
	}

	function queryContent(){
		page = 1;
		var content= $('#content').val();
		sContent(content,page);
	}
	
	 
	//评论查询
	function getpjgxtopcx(topic,issatisfied,page){

<%--		alert(topic)--%>
		
		if(topic=="100"){
			topic="";
		}
		if(issatisfied=="100"){
			issatisfied="";
		}
		//alert("=====aaaa"+topic);
		var t_seriesid= $('#t_seriesid', window.parent.document).val();
		var content= $('#content').val();
	
	/*    $("#currentpage1").change(function(){ 
	    	  var p1=$('#currentpage1').val();//这就是selected的值 
	    		 page= p1;
	    
	    		
	    		addpage();
	    		
	    	  });*/

	   	ttt111=topic;
	  	iii111=issatisfied;

		
		$.ajax( {
			url : "searchProduct", 
			data:{seriesid:t_seriesid,topic:topic,issatisfied:issatisfied,page:page},
			
			type : "POST",
			dataType:"json",	
			success : function(result) {
				
				max=result.data2.max;
<%--				alert("1:"+max)--%>
				count=result.data2.count;
<%--				alert(count)--%>
				var str=" ";
				var rankname='';
				var i = 0;	
				var a=[];
			
		
					var d=result.data2.max;
					$("#currentpage").empty();
					
					var rt="";
					if(result.topic==""){
						rt="100";
					}else{
						rt=result.topic;
					}
					var iss="";
					if(result.issatisfied==""){
						iss="100";
					}else{
						iss=result.issatisfied;
					}
					
					if(d<7){
						for ( var i = 1; i <= d; i++) {
							if(i==page){
								$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
							}else{
								$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
							}
						}
					}else{
						if(page<5){
							for ( var i =1; i <= 7; i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}else if(page>5){
							for ( var i =(page-3); i <= (page+3); i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}else if(page==5){
							for ( var i =(page-4); i <= (page+2); i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}else if(page<(d-3)){
							for ( var i =(d-7); i <= d; i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}
					}

					if(result.data2.max!=undefined){
					
				for(var r in result.data1){
					var str2='';
					for(var j in  result.data1[r].infolist){
						str2+="<p class='mgb10'>"+"【"+ result.data1[r].infolist[j].dimension+"】"+ result.data1[r].infolist[j].mouth_content+"</p>"
						
					}
					i =   result.data1[r].total_score*30;
					
					if(str2 != null && str2 != ""){
						//alert(1);
						str+="<div class='fl ' id= "+r+ " style='background:#fff;width: 24.9%;border-left: 1px solid #ccc; '>"+"<div class='bd user_info_div' style=' border-left: none;border-bottom:none;border-top:none; '>"+"<img class='fl' src='../images/avatar.jpg'>"+"<span class='fl user_name_span'>"+ result.data1[r].user_name+"</span></div>";
						str+="<table class='car_info_table' style='height: 156px; border-left: medium none;'><tbody><tr style='border-bottom: 1px solid rgb(204, 204, 204)'><td>"+"购买车型"+"</td><td style='border-left: 1px solid rgb(204, 204, 204)'><p>"+ result.data1[r].ext_vehicle_type+"</p></td></tr><tr style='border-bottom: 1px solid rgb(204, 204, 204)'><td>购买地点</td><td style='border-left: 1px solid rgb(204, 204, 204)'><span >"+ result.data1[r].ext_purchase_place+"</span></td></tr><tr style='border-bottom: 1px solid rgb(204, 204, 204)'><td>"+"购买时间"+"</td><td style='border-left: 1px solid rgb(204, 204, 204)'>"+ result.data1[r].purchase_date  +"</td></tr><tr style='border-bottom: 1px solid rgb(204, 204, 204)'><td>裸车购买价</td><td style='border-left: 1px solid rgb(204, 204, 204)'>"+ result.data1[r].ext_nake_price+"</td></tr><tr style='border-bottom: 1px solid rgb(204, 204, 204)'><td style='border-left: 1px solid rgb(204, 204, 204)'><p>油耗</p><p>目前行驶</p></td><td style='border-left: 1px solid rgb(204, 204, 204)'><p>"+ result.data1[r].ext_fuel+"</p><p>"+"5800公里"+"</p></td></tr><tr><td>购车目的</td><td style='border-left: 1px solid rgb(204, 204, 204)'><span class='test_ellipsis2'>"+ result.data1[r].ext_purpose+"</span></td></tr></tbody></table></div>"
						
					    //str+="	<div class='fl' style='width:75%'><div class='bd pd10' style='min-height:350px;'><p class='mgb10'>"+"啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p><a class='show_all_btn' href='javascript:;'>展开全部口碑</a></p></div></div> "
					    str+=	"<div class='fl' style='background:#fff;width:74.8%;border: 1px solid #ccc;border-top:none'><div id='acf' class='bd pd10' style='height:200px;width:90%;overflow:hidden;border:none;'>"+str2;			
					    str+=  "</div>"    
					    // str+="<a href='javascript:void(0)' id='show'  onclick='toggle(this.parentNode)'>"+ "展开"+"</a>";
					//str+="<a href='javascript:void(0)' id='hidden' style='display:none;' onclick='dixlo()'>关闭</a> ";
						str+="</div>	</div>"				    
						rankname= result.data1[r].rankname;
					}	
					
					$("#searchProductcx").html(str);
				//	alert(str);
				}
					
					}else{
						$("#searchProductcx").html("");
					}
				
				 disabledxh();
				$('#searchProductcx').removeHighlight();
<%--				if($('#content').val() != '') {--%>
<%--					$('#searchProductcx').highlight($('#content').val());--%>
<%--				}--%>

				//关键字高亮显示  
				var sss=result.sss;
				if(sss!=""){
					var strs= new Array();
					strs=sss.split(" "); 
					for(var i=0;i<strs.length;i++){
						$('#searchProductcx').highlight(strs[i]);
					}
				}else{
					if(topic!=""){
						$('#searchProductcx').highlight(topic);
					}
				}
			}
		}

		);
	}
	
	//评论查询
	function sContent(content,page){
		var t_seriesid= $('#t_seriesid', window.parent.document).val();
		$.ajax( {
			url : "searchContent", 
			data:{seriesid:t_seriesid,content:content,page:page},
			type : "POST",
			dataType:"json",	
			success : function(result) {
				
				max=result.data2.max;
				count=result.data2.count;
				var str=" ";
				var rankname='';
				var i = 0;	
				var a=[];
			
		
					var d=result.data2.max;
					$("#currentpage").empty();
					
<%--					var rt="";--%>
<%--					if(result.topic==""){--%>
<%--						rt="100";--%>
<%--					}else{--%>
<%--						rt=result.topic;--%>
<%--					}--%>
<%--					var iss="";--%>
<%--					if(result.issatisfied==""){--%>
<%--						iss="100";--%>
<%--					}else{--%>
<%--						iss=result.issatisfied;--%>
<%--					}--%>
					
					if(d<7){
						for ( var i = 1; i <= d; i++) {
							if(i==page){
								$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
							}else{
								$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
							}
						}
					}else{
						if(page<5){
							for ( var i =1; i <= 7; i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}else if(page>5){
							for ( var i =(page-3); i <= (page+3); i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}else if(page==5){
							for ( var i =(page-4); i <= (page+2); i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}else if(page<(d-3)){
							for ( var i =(d-7); i <= d; i++) {
								if(i==page){
									$("#currentpage").append('<a id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;background: #fff;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}else{
									$("#currentpage").append('<a  id="currentpage1" style="float: left;width: 20px;height: 20px;line-height: 20px;margin-right:5px;text-align: center;"  href="javascript:void(0);" onclick="getPage('+i+')" value="'+i+'">'+i+'</a>');
								}
							}
						}
					}

					if(result.data2.max!=undefined){
					
				for(var r in result.data1){
					var str2='';
					for(var j in  result.data1[r].infolist){
						str2+="<p class='mgb10'>"+"【"+ result.data1[r].infolist[j].dimension+"】"+ result.data1[r].infolist[j].mouth_content+"</p>"
						
					}
					i =   result.data1[r].total_score*30;
					
					if(str2 != null && str2 != ""){
						//alert(1);
						str+="<div class='fl ' id= "+r+ " style='background:#fff;width:25% '>"+"<div class='bd user_info_div' style=' border-left: none; border-top: none;'>"+"<img class='fl' src='../images/avatar.jpg'>"+"<span class='fl user_name_span'>"+ result.data1[r].user_name+"</span></div>";
						str+="<table class='car_info_table'><tbody><tr style='border-bottom: 1px solid rgb(204, 204, 204)'><td>"+"购买车型"+"</td><td><p>"+ result.data1[r].ext_vehicle_type+"</p></td></tr><tr><td>购买地点</td><td><span>"+ result.data1[r].ext_purchase_place+"</span></td></tr><tr><td>"+"购买时间"+"</td><td>"+ result.data1[r].purchase_date  +"</td></tr><tr><td>裸车购买价</td><td>"+ result.data1[r].ext_nake_price+"</td></tr><tr><td><p>油耗</p><p>目前行驶</p></td><td><p>"+ result.data1[r].ext_fuel+"</p><p>"+"5800公里"+"</p></td></tr><tr><td>购车目的</td><td><span class='test_ellipsis2'>"+ result.data1[r].ext_purpose+"</span></td></tr></tbody></table></div>"
						
					    //str+="	<div class='fl' style='width:75%'><div class='bd pd10' style='min-height:350px;'><p class='mgb10'>"+"啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p class='mgb10'>"+"【空间】很多人都说小科后排空间比较挤，要我说的话应该是够用了。本人身高175，后排头部略挤以外其他都完全可以接受。新科轴距缩水前提下后排空间反而更好，但是把前排座椅给生生挖出来一个坑，个人对这个很是排斥，略难看啊，你们觉得呢？"+"</p><p><a class='show_all_btn' href='javascript:;'>展开全部口碑</a></p></div></div> "
					    str+=	"<div class='fl' style='background:#fff;width:75%'><div id='acf' class='bd pd10' style='height:200px;width:90%;overflow:hidden;border-bottom:none;border-right:none'>"+str2;			
					    str+=  "</div>"    
					    // str+="<a href='javascript:void(0)' id='show'  onclick='toggle(this.parentNode)'>"+ "展开"+"</a>";
					//str+="<a href='javascript:void(0)' id='hidden' style='display:none;' onclick='dixlo()'>关闭</a> ";
						str+="</div>	</div>"				    
						rankname= result.data1[r].rankname;
					}	
					
					$("#searchProductcx").html(str);
				//	alert(str);
				}
					
					}else{
						$("#searchProductcx").html("");
					}
				
				 disabledxh();
				$('#searchProductcx').removeHighlight();
				if($('#content').val() != '') {
					$('#searchProductcx').highlight($('#content').val());
				}

				//关键字高亮显示  
				var sss=result.sss;
				if(sss!=""){
					var strs= new Array();
					strs=sss.split(" "); 
					for(var i=0;i<strs.length;i++){
						$('#searchProductcx').highlight(strs[i]);
					}
				}else{
					if(topic!=""){
						$('#searchProductcx').highlight(topic);
					}
				}
			}
		}

		);
	}
	
	
	
	/*	function dixl(){
		
		document.getElementById('acf').style.height='500px';
	
		document.getElementById('hidden').style.display='';
		document.getElementById('show').style.display='none';
	}
	
		function dixlo(){
		
	document.getElementById('acf').style.height='200px';
		document.getElementById('hidden').style.display='none';
		document.getElementById('show').style.display='';
	}*/
	
	</script>


		<script type="text/javascript">
	
	var mh = 400;//最小高度 
	var step = 5;//每次变化的px量 
	var ms = 10;//每隔多久循环一次 
	function toggle(o) {
		if (!o.tid)
			o.tid = "_" + Math.random() * 100;
		if (!window.toggler)
			window.toggler = {};
		if (!window.toggler[o.tid]) {
			window.toggler[o.tid] = {
				obj : o,
				maxHeight : mh,
				minHeight : o.offsetHeight,
				timer : null,
				action : 1
			};
		}
		o.style.height = o.offsetHeight + "px";
		if (window.toggler[o.tid].timer)
			clearTimeout(window.toggler[o.tid].timer);
		window.toggler[o.tid].action *= -1;
		window.toggler[o.tid].timer = setTimeout("anim('" + o.tid + "')", ms);
	}
	function anim(id) {
		var t = window.toggler[id];
		var o = window.toggler[id].obj;
		if (t.action < 0) {
			if (o.offsetHeight <= t.minHeight) {
				clearTimeout(t.timer);
				return;
			}
		} else {
			if (o.offsetHeight >= t.maxHeight) {
				clearTimeout(t.timer);
				return;
			}
		}
		o.style.heig
</script>
		<style type="text/css">
div.xx {
	border: solid 1px;
	overflow: hidden;
}

div.xx h5 {
	border: solid 1px;
	border-width: 0 0 1px;
	padding: 0;
	margin: 0;
	height: 30px;
	line-height: 30px;
	cursor: pointer;
	background: #E7F5F8;
}
</style>






		<script type="text/javascript">
	$(function() {
		//存入点击列的每一个TD的内容；
		var aTdCont = [];
		//点击列的索引值
		//点击列的索引值
		var thi = 0;

		//重新对TR进行排序
		var setTrIndex = function(tdIndex) {
			for (i = 0; i < aTdCont.length; i++) {
				var trCont = aTdCont[i];
				$("#tbody tr").each(
						function() {
							var thisText = $(this).children(
									"td:eq(" + tdIndex + ")").text();
							if (thisText == trCont) {
								$("#tbody").append($(this));
							}
						});
			}
		}

		//比较函数的参数函数
		var compare_down = function(a, b) {
			return a - b;
		}

		var compare_up = function(a, b) {
			return b - a;
		}
		//比较函数
		var fSort = function(compare) {
			aTdCont.sort(compare);
		}

		//取出TD的值，并存入数组,取出前二个TD值；
		var fSetTdCont = function(thIndex) {
			$("#tbody tr").each(function() {
				var tdCont = $(this).children("td:eq(" + thIndex + ")").text();
				aTdCont.push(tdCont);
			});
		}
		//点击时需要执行的函数
		var clickFun = function(thindex) {
			aTdCont = [];
			//获取点击当前列的索引值
			var nThCount = thindex;
			//调用sortTh函数 取出要比较的数据
			fSetTdCont(nThCount);
		}

		//点击事件绑定函数
		$(".jiantou_img").toggle(function() {
			thi = $(this).parent().parent().index();
			clickFun(thi);
			//调用比较函数,降序
				fSort(compare_up);
				//重新排序行
				setTrIndex(thi);
			}, function() {
				clickFun(thi);
				//调用比较函数 升序
				fSort(compare_down);
				//重新排序行
				setTrIndex(thi);
			})
	})
</script>

	</body>
</html>
