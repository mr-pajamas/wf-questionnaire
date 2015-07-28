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

function rotateImage(e)
{
	switch(e.target.id)
	{
		case "rotateLeftBtn":
			cropper.rotate(-90);
			break;
		case "rotateRightBtn":
			cropper.rotate(90);
			break;
	}
}
</SCRIPT>
 
<META name="GENERATOR" content="MSHTML 11.00.9600.17105"></HEAD> 
<BODY onload="init();">
更改资料（只有电脑用户可更改资料）
<DIV id="container"><A id="selectBtn" onclick="document.getElementById('input').click();" 
href="javascript:void(0);"><span>选择图片</span></A>		 <A id="saveBtn" onclick="saveImage();" href="javascript:void(0);"><span>上传</span></A>
		 <INPUT id="input" style="visibility: hidden;" onchange="selectImage(this.files)" type="file" size="10">
				 
<DIV id="wrapper"><CANVAS id="cropper"></CANVAS>			 <A id="rotateLeftBtn" 
onclick="rotateImage(event);" href="javascript:void(0);">向左旋转</A>
<A id="rotateRightBtn" 
onclick="rotateImage(event);" href="javascript:void(0);">向右旋转</A>						 <SPAN id="status" 
style="left: 350px; top: 10px; width: 100px; position: absolute;"></SPAN>			 
<DIV id="previewContainer"><CANVAS 
width="100" height="100" class="preview" id="preview100" style="left: 230px; top: 0px; position: absolute;"></CANVAS>
				 <SPAN style="left: 230px; top: 110px; width: 100px; text-align: center; position: absolute;">中尺寸图片 
100x100像素</SPAN>				 <CANVAS width="50" height="50" class="preview" id="preview50" 
style="left: 255px; top: 150px; position: absolute;"></CANVAS>				 <SPAN style="left: 245px; top: 210px; width: 70px; text-align: center; position: absolute;">小尺寸图片 
50x50像素</SPAN>			 </DIV></DIV></DIV>


<img s
</BODY></HTML>
