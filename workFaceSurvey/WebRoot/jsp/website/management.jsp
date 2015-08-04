<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ include file="../commonincludes.jsp"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title>【创业上海万人田野调查】- 调查汇总</title>

  <!-- Bootstrap -->
  <link href="<%=webRoot %>/html-michael/css/bootstrap.min.css" rel="stylesheet">

  <link href="<%=webRoot %>/html-michael/css/bootstrap-theme.min.css" rel="stylesheet">

  <link href="<%=webRoot %>/html-michael/css/infinite-scroll.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=webRoot %>/html-michael/css/question-items.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="<%=webRoot %>/html-michael/js/html5shiv.min.js"></script>
  <script src="<%=webRoot %>/html-michael/js/respond.min.js"></script>
  <![endif]-->

  <script src="<%=webRoot %>/html-michael/js/underscore-min.js"></script>
</head>
<body>
<div class="container">
  <div class="page-header">
    <h1>创业上海万人田野调查 - 调查汇总 <small>WorkFace | 创业者理解创业者</small></h1>
  </div>

  <form style="margin-bottom: 20px;">
    <div class="row">
      <div class="col-xs-12">
        <div class="input-group input-group-lg">
        <span class="input-group-addon">
          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
        </span>
          <input type="text" class="form-control" placeholder="姓名/公司&hellip;">
        <span class="input-group-btn">
          <!--<button type="button" class="btn btn-default">找活动</button>-->
          <button type="submit" class="btn btn-default">查询</button>
        </span>
        </div><!-- /.input-group -->
      </div>
    </div>
  </form>

  <div class="row" id="resultList"></div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=webRoot %>/html-michael/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=webRoot %>/html-michael/js/bootstrap.min.js"></script>

<script src="<%=webRoot %>/html-michael/js/infinite-scroll.js"></script>

<script>
  $("form").submit(function(e) {
    initialList($("#resultList"), "<%=webRoot %>/survey/userInfo", {q: $("form input").val()}, function(data) {
      var items = [];
      $.each(data, function(i, val) {
        items.push(
            "<div class=\"col-xs-12 col-sm-6 col-lg-4\">" +
            "<div class=\"thumbnail\">" +
            "<a href=\"" + "<%=webRoot %>" +"/"+val.uri + "\">" +
            "<div class=\"thumbnail-img\" style=\"background-image: url('" + (val.avatar || "<%=webRoot %>/images/avatar.png") + "')\"></div>" +
            "<div class=\"caption\">" +
            "<h3>" + (val.fullName || "N/A") + "</h3>" +
            "<p>" + val.mobile + "</p>" +
            "<p class=\"text-overflow\">" + (val.company || "N/A") + "</p>" +
            "</div>" +
            "</a>" +
            "</div>" +
            "</div>"
        );
      });

      $("#resultList").append(items.join(""));
    });
    e.preventDefault();
  }).submit();
</script>
</body>
</html>
   