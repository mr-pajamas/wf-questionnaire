<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title>【创业上海万人田野调查】- 访谈问卷</title>
  <link rel="shortcut icon" href="<%=webRoot %>/images/favicon.ico" type="image/vnd.microsoft.icon">

  <!-- Bootstrap -->
  <link href="<%=webRoot %>/css/bootstrap.min.css" rel="stylesheet">

  <link href="<%=webRoot %>/css/bootstrap-theme.min.css" rel="stylesheet">

  <link href="<%=webRoot %>/css/bootstrap-wizard.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<%=webRoot %>/css/question-items.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>
<body>

<div class="page-header">

  <div class="container">
    <div class="row">
      <div class="col-md-offset-1 col-md-11">
        <h1>创业上海万人田野调查 <small>WorkFace | 创业者理解创业者</small></h1>
        <p>创业者理解创业者，是创业者万人大联结的第一步。</p>
        <p>这是一场社会化的田野调查。我们的访谈团队会与你联系，倾听你的创业故事并分享传播给有相互需要的人，相互理解的人。</p>
        <p>创业事关我们大家的命运，我们不置身事外。创业上海，我们和你在一起！</p>

      </div>
    </div>
  </div>
</div>

<div class="container">
<!--
  <div class="page-header">
    <h1>创业上海万人田野调查初步信息表 <small>WorkFace | 创业者理解创业者</small></h1>
    <p>创业者理解创业者，是创业者万人大联结的第一步。</p>
    <p>这是一场社会化的田野调查。我们的访谈团队会与你联系，倾听你的创业故事并分享传播给有相互需要的人，相互理解的人。</p>
    <p>创业事关我们大家的命运，我们不置身事外。创业上海，我们和你在一起！</p>
  </div>
-->

  <div class="row bs-wizard">

    <div class="col-xs-4 bs-wizard-step complete">
      <div class="text-center bs-wizard-stepnum">步骤 1</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">基本信息表</div>
    </div>

    <div class="col-xs-4 bs-wizard-step complete"><!-- complete -->
      <div class="text-center bs-wizard-stepnum">步骤 2</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">详细信息表</div>
    </div>

    <div class="col-xs-4 bs-wizard-step active"><!-- complete -->
      <div class="text-center bs-wizard-stepnum">步骤 3</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">访谈问卷（选填）</div>
    </div>
  </div>

  <form action="<%=webRoot %>/synthesize/SaveQ2" method="post">
    <div class="row">
	  <input type="hidden"  name="phone" value="${phone}" id="phone" />
      <div class="col-md-8 col-md-offset-2">
        <div class="form-group">
          <label for="inputQ21" class="control-label">为什么在上海创业？对上海创业环境的观察体验，热爱和吐槽是？</label>
          <span id="q21Help" class="help-block">关于上海的创业环境</span>
          <textarea class="form-control" id="inputQ21" name="inputQ21" rows="5" aria-describedby="q21Help">${anwser.q26}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ22" class="control-label">目前创业项目简介，未来的期望是？</label>
          <textarea class="form-control" id="inputQ22" name="inputQ22"  rows="5">${anwser.q34}</textarea>
        </div>

      	<div class="form-group">
          <label for="inputQ23" class="control-label">目前的创业是怎样产生的，发心是什么？</label>
          <span id="q23Help" class="help-block">关于创业的驱动力和发心</span>
          <textarea class="form-control" id="inputQ23" name="inputQ23"  rows="5" aria-describedby="q23Help">${anwser.q41}</textarea>
        </div>

        <div class="form-group">
          <label for="" class="control-label">你是如何赚到人生第一桶金的？</label>
          <textarea class="form-control" name="inputQ18" id="inputQ18" rows="5">${anwser.q18}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ24" class="control-label">曾经历的较大困难和挑战是，当时如何解决和面对的？</label>
          <textarea class="form-control" id="inputQ24" name="inputQ24"  rows="5">${anwser.q10}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ25" class="control-label">走上创业之路感受较深的人和事 ，TA对你的影响？</label>
          <textarea class="form-control" id="inputQ25" name="inputQ25"  rows="5">${anwser.q19}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ26" class="control-label">个人成长环境；家人朋友对创业的态度，如何平衡家庭和工作关系？</label>
          <span id="q26Help" class="help-block">关于成长环境、家庭和工作关系</span>
          <textarea class="form-control" id="inputQ26" name="inputQ26"  rows="5" aria-describedby="q26Help">${anwser.q21}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ27" class="control-label">给5年后的自己写封信，最想写什么？</label>
          <textarea class="form-control" id="inputQ27" name="inputQ27"  rows="5">${anwser.q24}</textarea>
        </div>
       
        <div class="form-group">
          <label for="" class="control-label">如果请你给其他的创业者一个忠告，会对他们说什么呢？</label>
          <textarea class="form-control" name="inputQ30" id="inputQ30" rows="5">${anwser.q25}</textarea>
        </div>

        <div class="form-group">
          <label for="" class="control-label">对您目前所在办公地区园区/孵化器有什么建议吗？</label>
          <textarea class="form-control"  name="inputQ31" id="inputQ31" rows="5">${anwser.q29}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ28" class="control-label">目前创业需要什么帮助？对万人大联结有什么期待？</label>
          <textarea class="form-control" id="inputQ28" name="inputQ28" rows="5">${anwser.q35}</textarea>
        </div>

        <div class="form-group">
          <label for="" class="control-label">你对WF这个平台有什么意见/建议吗？</label>
          <textarea class="form-control"  name="inputQ32" id="inputQ32" rows="5">${anwser.q43}</textarea>
        </div>

        <div class="form-group">
          <label for="inputQ29" class="control-label">其他补充：</label>
          <textarea class="form-control" id="inputQ29" name="inputQ29"  rows="5">${anwser.q36}</textarea>
        </div>
      </div>
    </div>

    <hr>

    <div class="row">
      <div class="col-md-10 col-md-offset-2">
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-lg">完成</button>
        </div>
      </div>
    </div>
  </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>

