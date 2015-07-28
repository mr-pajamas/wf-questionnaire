<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
   <%@ include file="../commonincludes.jsp"%>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>WorkFace Survey</title>
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/login.css" />
	    <link rel="stylesheet" type="text/css" href="<%=webRoot %>/css/regist.css" />
	   <!-- 新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		
		<!-- 可选的Bootstrap主题文件（一般不用引入） -->
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=webRoot %>/js/jquery-1.11.1.js"></script>
        <SCRIPT src="<%=webRoot %>/js/imagecropper.min.js" type="text/javascript"></SCRIPT>
		<script type="text/javascript">


		var cropper;

		function init()
		{	
			cropper = new ImageCropper(200, 200, 180, 180);
			cropper.setCanvas("cropper");

			if(!cropper.isAvaiable())
			{
				alert("Sorry, your browser doesn't support FileReader, please use Firefox3.6+ or Chrome10+ to run it.");
			}
		}

		function selectImage(fileList)
		{
			cropper.loadImage(fileList[0]);
			$("#imgbt1").hide();
			$("#imgbt2").show();
		}

		

		function getdata(){
			var imgData = cropper.getCroppedImageData(180, 180);
			$("#tupian").attr('src',imgData); 
			$("#tp").val(imgData); 
			$("#imgbt2").hide();
			$("#imgbt1").show();
		}
		
		function validate(){
			var reg= new RegExp( "^0?(13|15|18|14|17)[0-9]{9}$");
			var phone=$("#inputTelNum").val();
			var password=$("#inputPassword").val();
			var passwordRpe=$("#confirmPassword").val();
			if (phone == "") {
				alert("手机号码不能为空！");
				return false;
			}
			if (password == "") {
				alert("密码不能为空！");
				return false;
			}
			if (passwordRpe == "") {
				alert("确认密码不能为空！");
				return false;
			}
			if (passwordRpe != password) {
				alert("两次密码输入不一致！");
				return false;
			}
			if (!reg.test(phone)) {
				alert('手机号码格式不正确！'); 
			return false;
			}
			return true; 
		}
		</script>
</head>

<body class="demo1" onload="init()">
		<div class="main">
			<section class="page1">
		      	<div class="page_container">
		        	
					<div class="container">
						<form class="form-signin" action="<%=webRoot %>/survey/saveregist" method="post">
							<DIV id="container" class="thumbnail" >
							
		 <INPUT name="input" id="input" style="visibility: hidden;" onchange="selectImage(this.files)" type="file" size="10">
<DIV id="wrapper"><CANVAS id="cropper"></CANVAS><SPAN id="status" 
style="left: 350px; top: 10px; width: 100px; position: absolute;"></SPAN>			 
</DIV></DIV>
<input type="hidden" name="tp" id="tp" />
       <input id="imgbt1" class="btn btn-lg btn-primary btn-block" onclick="document.getElementById('input').click();"   value="选择图片" type="button"/>
       <input id="imgbt2" class="btn btn-lg btn-primary btn-block" value="保存图片" style="display:none"  onclick="getdata();" type="button"/>
							<label class="sr-only" for="inputTelNum">Phone Number</label>
							<input id="inputTelNum" class="form-control" name="PhoneNum" type="tel" autofocus="" required="" placeholder="Phone Number">
							<label class="sr-only" for="inputPassword">Password</label>
							<input id="inputPassword" class="form-control" type="password" name="password" required="" placeholder="Password">
							<label class="sr-only" for="confirmPassword">Password</label>
							<input id="confirmPassword" class="form-control" type="password" required="" name="passwordRpe" placeholder="Confirm Password">
							<input class="btn btn-lg btn-primary btn-block" onsubmit="validate()" value="Submit" type="submit"/>
						</form>
						<div style="color:#b02f2a;font-size:12px;margin-top:10px">${error}</div>
					</div>
					
		    	</div>
		    	
	    	</section>
	    	<section class="page2">
		   		<div class="page_container">
		        	
		      	</div>
		    </section>
		    <section class="page3">
		      	<div class="page_container">
			       
		      	</div>
	    	</section>
	    	<section class="page4">
		      	<div class="page_container">
			       
		      	</div>
	    	</section>
	    	<section class="page5">
		      	<div class="page_container">
			       
		      	</div>
	    	</section>
		</div>
	</body>
</html>