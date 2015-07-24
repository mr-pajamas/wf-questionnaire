<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	String webRoot = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>
<link href="<%=webRoot %>/css/myformtable.css" rel="stylesheet" type="text/css" />
<script src="<%=webRoot %>/js/myjsfile.js" rel="stylesheet"  type="text/javascript"></script>  
<script src="<%=webRoot %>/js/jquery-1.10.1.min.js" rel="stylesheet"  type="text/javascript"></script>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<link href="<%=webRoot%>/css/stk.css" rel="stylesheet"
				type="text/css" />
