<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ include file="../commonincludes.jsp"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title>【创业上海万人田野调查】- 访谈问卷</title>

  <!-- Bootstrap -->
  <link href="<%=webRoot %>/html-michael/css/bootstrap.min.css" rel="stylesheet">

  <link href="<%=webRoot %>/html-michael/css/bootstrap-theme.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=webRoot %>/html-michael/css/question-items.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>
<script type="text/javascript" id="main">

</script>
<body>
<div class="container">
  <div class="page-header">
    <h1>创业上海万人田野调查 - 访谈问卷 <small>WorkFace | 创业者理解创业者</small></h1>
    <p>谢谢你，与我们一起。</p>
  </div>

  <form>
    <div class="row">
      <div class="col-md-8 col-md-offset-1">
        <div class="form-group">
          <label for="inputQ21" class="control-label">为什么在上海创业？对上海创业环境的观察体验，热爱和吐槽是？</label>
          <span id="q21Help" class="help-block">关于上海的创业环境</span>
          <textarea class="form-control" id="inputQ21" rows="5" aria-describedby="q21Help">${anwser.q26}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ22" class="control-label">目前创业项目简介，未来的期望是？</label>
          <textarea class="form-control" id="inputQ22" rows="5">${anwser.q34}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ23" class="control-label">目前的创业是怎样产生的，发心是什么？</label>
          <span id="q23Help" class="help-block">关于创业的驱动力和发心</span>
          <textarea class="form-control" id="inputQ23" rows="5" aria-describedby="q23Help">${anwser.q41}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ24" class="control-label">曾经历的较大困难和挑战是，当时如何解决和面对的？</label>
          <textarea class="form-control" id="inputQ24" rows="5">${anwser.q9}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ25" class="control-label">走上创业之路感受较深的人和事 ，TA对你的影响？</label>
          <textarea class="form-control" id="inputQ25" rows="5">${anwser.q19}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ26" class="control-label">个人成长环境；家人朋友对创业的态度，如何平衡家庭和工作关系？</label>
          <span id="q26Help" class="help-block">关于成长环境、家庭和工作关系</span>
          <textarea class="form-control" id="inputQ26" rows="5" aria-describedby="q26Help">${anwser.q21}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ27" class="control-label">给5年后的自己写封信，最想写什么？</label>
          <textarea class="form-control" id="inputQ27" rows="5">${anwser.q24}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ28" class="control-label">目前创业需要什么帮助？对万人大联结有什么期待？</label>
          <textarea class="form-control" id="inputQ28" rows="5">${anwser.q35}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ29" class="control-label">其他补充：</label>
          <textarea class="form-control" id="inputQ29" rows="5">${anwser.q36}</textarea>
        </div>
      </div>
    </div>

    <hr>

    <div class="row">
      <div class="col-md-11 col-md-offset-1">
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-lg">完成</button>
        </div>
      </div>
    </div>
  </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=webRoot %>/html-michael/js/bootstrap.min.js"></script>
</body>
</html>
