<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setAttribute("contextPath", request.getContextPath());
String webRoot = "http://" + request.getServerName() + ":"
		+ request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title></title>
</head>
<body>
<script src="<%=webRoot %>/js/jquery-1.11.3.min.js"></script>
<script>
	$(function(){
		var phone='${user.phone}';
		window.location = "<%=webRoot %>/synthesize/questionnaire1?phone="+phone;
	});
</script>
</body>
</html>
