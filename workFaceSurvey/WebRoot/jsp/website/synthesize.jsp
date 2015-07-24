<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<script type="text/javascript" src="<%=webRoot %>/js/pagenav1.1.cn.js"></script>
<script type="text/javascript" src="<%=webRoot %>/js/jquery-1.11.1.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>首页</title>
	</head>
	<script>
	$(function() {
		//optional set
		pageNav.pre="上一页";
		pageNav.next="下一页";
		 //  p,当前页码,pn,总页面
		pageNav.fn = function(p,pn){
			//document.getElementById("test").innerHTML ="当前页:"+p+"  ,  总页: "+pn;
			//$("#test").text("Page:"+p+" of "+pn + " pages."); // jquery调用方式
			if(${listPage}!=p){
				$("#page").val(p);
			    $("#pageNumber").submit();
			}
		};
		
		//重写分页状态
		pageNav.go(${listPage},${totalPage});

	});
</script>
	<body>
		<div>
	  <form action="index" name="pageNumber" id="pageNumber" method="post">
			
		<input type="text" id="search" name="search" />
		<input type="button" title="查询"/>
		</div>
		<div>
			<table>
			<c:forEach items="${list}" var="list">
			<tr>
					<td rowspan="3">
						<img src="<%=webRoot %>/images/man.png" alt="" />
					</td>
					<td>
						姓名:${list.name}
					</td>
				</tr>
				<tr>
					<td>
						公司:${list.company}
					</td>
				</tr>
				<tr>
					<td>
						手机号码:${list.phone}
					</td>
				</tr>
			</c:forEach>
				
			</table>
	
						   <!-- 分页控件 -->
					<input type="hidden" id="page" name="page" />
		            <div id="pageNav"></div>
			</form>
	</body>
</html>

