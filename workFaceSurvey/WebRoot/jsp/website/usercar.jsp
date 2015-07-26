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
<img alt="" src="data:image/jpeg;base64,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"  name="tupian" id="tupian"/>
</form>
</BODY></HTML>
