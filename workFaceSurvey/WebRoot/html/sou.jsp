<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="../css/myformtable.css" rel="stylesheet" type="text/css">
<script src="../js/myjsfile.js" rel="stylesheet" type="text/javascript"></script>  
			<link href="../css/stk.css" rel="stylesheet" type="text/css">
<link href="../css/website/index.css" rel="stylesheet" type="text/css">

<link href="../css/shouce.css" rel="stylesheet" type="text/css">
<!--<script src="jquery-1.js" rel="stylesheet" type="text/javascript"></script>  -->

<script src="../js/jquery-1.11.1.js" rel="stylesheet"  type="text/javascript"></script> 


<!-- echarts  -->
<script src="echarts-all.js"></script>



<title>首页</title>
<style>
table{text-align:center;border-collapse:collapse;border:1px solid #ccc;}
table td{width:130px;border:1px solid #ccc;}
.attation_table tr:first-child{height:50px;background:#f8fcfb}
.attation_table td{width:130px;border:1px solid #ccc;}
.hot_news_div{width:80%;margin:0 auto;overflow:hidden}
.news_img_div{width:68px;height:62px;border-right:0px;}
.news_img_div img{width:68px;height:62px}
.hot_topic_img{width:75px;height:75px;margin:0 3px;border:1px solid #ccc}

.pic_box{width:100%;height:25px;}
.pic_label{float:left;width:50px;font-size:12px;height:15px;}
.pic_item{float:left;margin-top:5px;height:10px;margin-right:5px;}

.chart_big_div{margin:5px 0px;overflow:hidden}
.chart_middle_div{width:130px;height:15px;float:left}
.chart_big_div>span{width:50px;text-align:right}
.chart_big_div span{height:15px;line-height:15px;margin:0 2px;}
.chart_big_div div{height:15px;}
.chart_pic_box{width:50%}

.hotnews_label_a{color:#2088CF;border-bottom:2px solid #2088CF;}
.span_label{width:80px;text-align:left;}

</style>
<script>
$(function(){
	$("#hot_news_a a").mouseover(function(){
		$(this).addClass("hotnews_label_a");
		$(this).siblings().removeClass("hotnews_label_a");
	});
});

	
	
</script></head>

<body>
	
<div style="width:100%; background-color:#FFF; padding-top:40px; padding-bottom:40px">
           <div class="news">
             <div class="xinwen">新闻</div>
             <div class="liebiao">
             	<ul style="margin-top:14px">
             	  <li>中国进口汽车网 
</li>
             	  <li> 汽车画刊网</li>
             	  <li>51汽车网</li>
             	  <li>搜狐汽车网</li>
                  <li style="margin-right:0px">万家车网</li>
             	</ul> 
                
                <ul>
             	  <li>中国汽车交易网</li>
             	  <li>中国网汽车</li>
             	  <li>&nbsp;汽车之友 </li>
             	  <li>盖世汽车网</li>
                  <li style="margin-right:0px">网易汽车</li>
             	</ul>
                
                 <ul>
             	  <li>汽车生活-AutoV</li>
             	  <li>汽车时代网</li>
             	  <li>&nbsp;汽车广场</li>
             	  <li>搜狐汽车网</li>
                  <li style="margin-right:0px">凤凰汽车 </li>
             	</ul>                 
                
                 <ul>
             	  <li>中國汽車消費網</li>
             	  <li>环球汽车网</li>
             	  <li>&nbsp;第一车网 </li>
             	  <li>中国买车网</li>
                  <li style="margin-right:0px">车讯网</li>
             	</ul>      
                
                
                <ul>
             	  <li>深圳汽车大世界</li>
             	  <li>华夏二手车</li>
             	  <li>&nbsp;车主之家  </li>
             	  <li>我要汽车网</li>
                  <li style="margin-right:0px">万车网</li>
             	</ul>     
                
                
                
                <ul>
             	  <li>21CN 大家车网</li>
             	  <li>太平洋汽车</li>
             	  <li>&nbsp;&nbsp;爱卡汽车  </li>
             	  <li>汽车卓众网</li>
                  <li style="margin-right:0px">车神榜</li>
             	</ul>                        
                
                 <ul>
             	  <li>&nbsp;&nbsp;&nbsp;搜车客二手车</li>
             	  <li>汽车画刊网 </li>
             	  <li>&nbsp;&nbsp;汽车江湖 </li>
             	  <li>盖世汽车网</li>
                  <li style="margin-right:0px">易车网 </li>
             	</ul>             
                
                <ul>
             	  <li>&nbsp;&nbsp;中国二手车城 </li>
             	  <li>环球网汽车 </li>
             	  <li>&nbsp;&nbsp;&nbsp;网上车市 </li>
             	  <li>汽车点评网</li>
                  <li style="margin-right:0px">酷车网  </li>
             	</ul>             
                
                
                                                   
             </div>
       </div>     
              
              
              
              
              
              
              
              <div style="margin-top:40px" class="news">
             <div class="xinwen">论坛</div>
             <div class="liebiao">
             	<ul style="margin-top:14px">
             	  <li>汽车生活-AutoV</li>
             	  <li>汽车画报网 </li>
             	  <li>&nbsp;&nbsp;网易汽车  </li>
             	  <li>环球汽车网 </li>
                  
                  <li style="margin-right:0px">易车网</li>
             	</ul> 
                
                <ul>
             	  <li>&nbsp;&nbsp;我要汽车网</li>
             	  <li style="margin-left:18px">凤凰网汽车 </li>
             	  <li>&nbsp;&nbsp;汽车之家  </li>
             	  <li>新浪汽车网 </li>
                  
                  <li style="margin-right:0px">车讯网</li>
             	</ul>
                
                 <ul>
             	  <li>&nbsp;&nbsp;中国买车网 </li>
             	  <li style="margin-left:18px">车天下汽车 </li>
             	  <li>&nbsp;&nbsp;我爱车网   </li>
             	  <li>探索爱驾网 </li>
                  
                  <li style="margin-right:0px">车讯网</li>
             	</ul>                 
                
                 <ul>
             	  <li>中国汽车消费网  </li>
             	  <li style="margin-left:0px">SUV汽车网 </li>
             	  <li>&nbsp;&nbsp;大家车网   </li>
             	  <li>网上车市  </li>
                  
                  <li style="margin-right:0px; margin-left:15px;">越野e族</li>
             	</ul>     
                
                <ul>
             	  <li>汽车江湖网 </li>
             	  <li style="margin-left:25px">迪族车网  </li>
             	  <li style="margin-left:11px">&nbsp;&nbsp; 汽车点评   </li>
             	  <li> 腾讯汽车  </li>
                  
                  <li style="margin-right:0px; margin-left:15px;">爱卡汽车</li>
             	</ul>             
                
                
                
                                                    
             </div>
       </div>
       
       
       
       
       
       <div style="margin-top:40px" class="news">
             <div class="xinwen">口碑</div>
             <div class="liebiao">
             	<ul style="margin-top:14px">
             	  <li>网易汽车 </li>
             	  <li style="margin-left:40px">汽车之家</li>
             	  <li style="margin-left:12px">腾讯汽车</li>
             	  <li style="margin-left:12px">新浪汽车</li>
                  <li style="margin-right:0px;margin-left:12px">搜狐汽车</li>
             	</ul> 
                
                <ul>
             	  <li>牛车网  </li>
             	  <li style="margin-left:52px">爱卡</li>
             	  
             	</ul>
                
                 <                      
             </div>
       </div>
       
       
       <div style="margin-top:40px" class="news">
             <div class="xinwen">微博</div>
             <div class="liebiao">
             	<ul style="margin-top:14px">
             	  <li>新浪微博 </li>
             	  
             	</ul> 
                
                
                
                                     
             </div>
       </div>
       
       
		</div>

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
   data:['论坛','口碑','新闻']
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
series : [{ name:'论坛', type:'bar', barWidth : 10, stack: '来源', data:[2313,446,1438,4823,3088,3293,3983,3553,8438]},{ name:'口碑', type:'bar', barWidth : 10, stack: '来源', data:[1279,530,200,1378,2931,129,4193,8502,11173]},{ name:'新闻', type:'bar', barWidth : 10, stack: '来源', data:[2732,796,2537,2677,2974,5604,4195,9118,7852]}],
color:['#87cefa','#ff69b4','#7294d4','#d8a499']
};
                    
// 为echarts对象加载数据 
l2.setOption(l2option); 

</script>


</body></html>
