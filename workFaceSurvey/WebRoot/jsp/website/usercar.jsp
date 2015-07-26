<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
   <%@ include file="../commonincludes.jsp"%>
<!-- saved from url=(0037)http://www.riaidea.com/html5/cropper/ -->
<HTML>
<HEAD><META content="IE=11.0000" 
http-equiv="X-UA-Compatible">
 <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="Canvas,File,Image">  
<META name="Author" content="flashlizi - www.riaidea.com"> 
<META name="Description" content="HTML5 experiment"> 
<META http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<TITLE>头像上传组件 - HTML5版</TITLE> 
<script type="text/javascript" src="<%=webRoot %>/js/jquery-1.11.1.js"></script>
<SCRIPT src="<%=webRoot %>/js/imagecropper.min.js" type="text/javascript"></SCRIPT>
<SCRIPT type="text/javascript">

var cropper;

function init()
{	
	cropper = new ImageCropper(300, 300, 180, 180);
	cropper.setCanvas("cropper");
	cropper.addPreview("preview100");
	cropper.addPreview("preview50"); 

	if(!cropper.isAvaiable())
	{
		alert("Sorry, your browser doesn't support FileReader, please use Firefox3.6+ or Chrome10+ to run it.");
	}
}

function selectImage(fileList)
{
	cropper.loadImage(fileList[0]);
}

function getdata(){
	var imgData = cropper.getCroppedImageData(180, 180);
	$("#tupian").attr('src',imgData); 
	$("#tp").val(imgData); 
}
</SCRIPT>
 
<META name="GENERATOR" content="MSHTML 11.00.9600.17105"></HEAD> 
<BODY onload="init();">
<form action="upload" method="post" enctype="multipart/form-data">
<DIV id="container"><A id="selectBtn" onclick="document.getElementById('input').click();" 
href="javascript:void(0);"><span>选择图片</span></A> <A id="saveBtn" onclick="saveImage();" href="javascript:void(0);">
<span>上传</span></A>
		 <INPUT name="input" id="input" style="visibility: hidden;" onchange="selectImage(this.files)" type="file" size="10">
				 
<DIV id="wrapper"><CANVAS id="cropper"></CANVAS><SPAN id="status" 
style="left: 350px; top: 10px; width: 100px; position: absolute;"></SPAN>			 
</DIV></DIV>
<input type="hidden" name="tp" id="tp" />
<input type="button" onclick="getdata()"/>
<input type="submit" />
</form>
</BODY></HTML>
