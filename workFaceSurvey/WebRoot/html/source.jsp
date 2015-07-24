<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link href="../css/myformtable.css" rel="stylesheet" type="text/css">
<script src="../js/myjsfile.js" rel="stylesheet" type="text/javascript"></script>  
			<link href="../css/stk.css" rel="stylesheet" type="text/css">
<link href="../css/website/index.css" rel="stylesheet" type="text/css">
<!--<script src="jquery-1.js" rel="stylesheet" type="text/javascript"></script>  -->
<script src="../js/jquery-1.11.1.js" rel="stylesheet"  type="text/javascript"></script> 


<link href="../css/shouce.css" rel="stylesheet" type="text/css">
<script src="../js/echarts-all.js"> </script>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>海略大数据平台</title>
<script>
	$(function(){
		$(".bieke_menu li a").click(function(){
			$(this).parent().siblings().children("a").css("background-image","url(http://www2.91survey.com:8080/bigdata_svw/images/website/menu_img1.png)");
			$(this).parent().siblings().children("ul").slideUp("slow");
			if($(this).siblings("ul").is(":hidden"))
			{
				$(this).css("background-image","url(http://www2.91survey.com:8080/bigdata_svw/images/website/menu_img2.png)");
				$(this).siblings("ul").slideDown("slow");
			}
			else
			{
				$(this).css("background-image","url(http://www2.91survey.com:8080/bigdata_svw/images/website/menu_img1.png)");
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
		f_addTab('http://www2.91survey.com:8080/bigdata_svw/news/index');
		$("#t_seriesid").val(seriesid);
	}

	function searchsynthesize(){
		f_addTab('http://www2.91survey.com:8080/bigdata_svw/synthesize/index');
	}

	function showuserset(){
		f_addTab('http://www2.91survey.com:8080/bigdata_svw/myset/showmyset');
	}		

	function tohome(brandid){
		 window.location.href="http://www2.91survey.com:8080/bigdata_svw/home?brandid="+brandid; 
	}
</script>
</head>

<body>
<form action="">
<input id="t_brandid" name="t_brandid" type="hidden">
<input id="t_seriesid" name="t_seriesid" type="hidden">
<input id="t_seriesid" name="t_seriesid" type="hidden">
</form>
	<div class="head">
		<div class="logo_div fl"><img src="../images/website/ty_logo.png"></div>
		<div class="username_div fr">
	
			<div class="username_box" href="javascript:void(0)"><img src="../images/website/user_img.jpg"><span class="mgl5"></span>
			<img class="mgl5" src="../images/website/user_more_img.jpg">
				<div class="username_menu">

					<a href="http://www2.91survey.com:8080/bigdata_svw/employee/showmysetting">我的设置</a>
					<a href="#">我的报表</a>
					<a href="http://www2.91survey.com:8080/bigdata_svw/employee/logout">退出</a>
				</div>
			</div>
			
		</div>
		<div class="clear"></div>
	</div>
	<div class="height_20"></div>
	<div class="topic_label">
		<a href="http://www2.91survey.com:8080/bigdata_svw/home/index" class="mgr30" style="color:#fff">首页</a>
		<a href="javascript:tohome(9)" class="mgl30" style="color:#fff">上海大众</a>
	</div>
	<div class="height_20"></div>
	<div class="content">
	
		<div class="right_box fr" style="width: 100%">
		
		
		<div style="width:100%; background-color:#FFF; padding-top:40px; padding-bottom:40px">
           <div class="news">
             <div id="source_news" class="xinwen">新闻</div>
             <div class="liebiao">
             	<ul style="margin-top:14px">
             	  <li>中国进口汽车网 
</li>
             	  <li> 汽车画刊网</li>
             	  <li>&nbsp;51汽车网</li>
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
             	  <li style="margin-right:155px">汽车生活-AutoV</li>
             	  <li>汽车时代网</li>
             	  <li >&nbsp;汽车广场</li>
             	  <li >搜狐汽车网</li>
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
             	  <li>&nbsp;环球网汽车 </li>
             	  <li>&nbsp;&nbsp;网上车市 </li>
             	  <li>汽车点评网</li>
                  <li style="margin-right:0px">酷车网  </li>
             	</ul>             
                
                
                                                   
             </div>
       </div>     
              
              
              
              
              
              
              
              <div style="margin-top:40px" class="news">
             <div id="source_bbs" class="xinwen">论坛</div>
             <div class="liebiao">
             	<ul style="margin-top:14px">
             	  <li style="margin-right:155px">汽车生活-AutoV</li>
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
             	  <li style="margin-right:158px">中国汽车消费网  </li>
             	  <li style="margin-left:0px">SUV汽车网 </li>
             	  <li>&nbsp;&nbsp;大家车网   </li>
             	  <li>网上车市  </li>
                  
                  <li style="margin-right:0px; margin-left:15px;">越野e族</li>
             	</ul>     
                
                <ul>
             	  <li>汽车江湖网 </li>
             	  <li style="margin-left:25px">&nbsp;迪族车网  </li>
             	  <li style="margin-left:11px">&nbsp; 汽车点评   </li>
             	  <li> 腾讯汽车  </li>
                  
                  <li style="margin-right:0px; margin-left:15px;">爱卡汽车</li>
             	</ul>             
                
                
                
                                                    
             </div>
       </div>
       
       
       
       
       
       <div style="margin-top:40px" class="news">
             <div id="source_praise" class="xinwen">口碑</div>
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
             <div id="source_blog" class="xinwen">微博</div>
             <div class="liebiao">
             	<ul style="margin-top:14px">
             	  <li>新浪微博 </li>
             	  
             	</ul> 
                
                
                
                                     
             </div>
       </div>
       
       
		</div>
        
        
        
        
        
        
        
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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


</body></html>
