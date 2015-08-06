<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title>【创业上海万人田野调查】- 详细信息表</title>
  <link rel="shortcut icon" href="${contextPath}/images/favicon.ico" type="image/vnd.microsoft.icon">

  <!-- Bootstrap -->
  <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">

  <link href="${contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">

  <link href="${contextPath}/css/bootstrap-wizard.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${contextPath}/css/question-items.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="${contextPath}/js/html5shiv.min.js"></script>
  <script src="${contextPath}/js/respond.min.js"></script>
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

    <div class="col-xs-4 bs-wizard-step active">
      <div class="text-center bs-wizard-stepnum">步骤 2</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">详细信息表</div>
    </div>

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 3</div>
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">访谈问卷（选填）</div>
    </div>
  </div>

  <form class="form-horizontal" action="${contextPath}/synthesize/save_other_items" method="post">
  	<input type="hidden" name="phone" value="${phone}"/>
    <div class="form-group">
      <label class="col-md-2 control-label">创业前是否有过工作经历</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="a1" value="没有" ${anwser.q5 eq '没有' ? 'checked' : ''}> 没有（毕业即创业）
            </label>
          </div>
          <div class="radio col-sm-4 check-other">
            <label class="pull-left">
              <input type="radio" name="a1" value="有" ${anwser.q5 eq '有' ? 'checked' : ''}> 有过工作经历
            </label>
            <span class="pull-right">年</span>
            <div style="margin-left: 125px; margin-right: 25px;">
              <input type="text" name="a1-other" id="inputA1Other" value="${anwser.q6}" style="width: 100%;" disabled>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">（继上问）若有工作经历，是在目前创业的行业吗</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="a2" value="相同行业" ${anwser.q7 eq '相同行业' ? 'checked' : ''}> 相同行业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="a2" value="相关连行业" ${anwser.q7 eq '相关连行业' ? 'checked' : ''}> 相关连行业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="a2" value="完全不同行业" ${anwser.q7 eq '完全不同行业' ? 'checked' : ''}> 完全不同行业
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="inputA3" class="col-md-2 control-label">专职员工数</label>
      <div class="col-md-2">
        <input type="text" name="a3" class="form-control" value="${anwser.q42}" id="inputA3">
      </div>
    </div>

    <div class="form-group">
      <label for="inputA4" class="col-md-2 control-label">兼职员工数</label>
      <div class="col-md-2">
        <input type="text" name="a4" class="form-control" id="inputA4" value="${anwser.q16}">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">在创业过程中，你特别想感谢的人</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a5" value="家人" ${anwser.q20 eq '家人' ? 'checked' : ''}> 家人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a5" value="合作伙伴" ${anwser.q20 eq '合作伙伴' ? 'checked' : ''}> 合作伙伴
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a5" value="投资方" ${anwser.q20 eq '投资方' ? 'checked' : ''}> 投资方
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a5" value="人生导师" ${anwser.q20 eq '人生导师' ? 'checked' : ''}> 人生导师
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a5" value="其他" ${anwser.q20 eq '其他' ? 'checked' : ''}> 其他
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">婚姻状况</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a6" value="已婚"  ${user.marriage_staus eq '已婚' ? 'checked' : ''}> 已婚
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a6" value="未婚" ${user.marriage_staus eq '未婚' ? 'checked' : ''}> 未婚
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">家族里是否有经营企业的人</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a7" value="没有" ${anwser.q22 eq '没有' ? 'checked' : ''}> 没有
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a7" value="有" ${anwser.q22 eq '有' ? 'checked' : ''}> 有
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">（继上问）若有，是哪位亲属</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a8" value="父母亲" ${anwser.q23 eq '父母亲' ? 'checked' : ''}> 父母亲
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a8" value="兄弟姐妹" ${anwser.q23 eq '兄弟姐妹' ? 'checked' : ''}> 兄弟姐妹
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a8" value="爱人" ${anwser.q23 eq '爱人' ? 'checked' : ''}> 爱人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a8" value="其他" ${anwser.q23 eq '其他' ? 'checked' : ''}> 其他
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="inputA9" class="col-md-2 control-label">在上海工作/生活多久</label>
      <div class="col-md-2">
        <span class="pull-right" style="padding-top: 7px;">年</span>
        <div style="margin-right: 25px;">
          <input type="text" name="a9" class="form-control" id="inputA9" value="${anwser.q27}" style="width: 100%;">
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">家乡在哪里</label>
      <div class="col-md-2">
        <select name="a10" id="a10" class="form-control">
          <option ${anwser.q28 eq '北京市' ? 'selected' : ''}>北京市</option>
          <option ${anwser.q28 eq '天津市' ? 'selected' : ''}>天津市</option>
          <option ${anwser.q28 eq '河北省' ? 'selected' : ''}>河北省</option>
          <option ${anwser.q28 eq '山西省' ? 'selected' : ''}>山西省</option>
          <option ${anwser.q28 eq '内蒙古自治区' ? 'selected' : ''}>内蒙古自治区</option>
          <option ${anwser.q28 eq '辽宁省' ? 'selected' : ''}>辽宁省</option>
          <option ${anwser.q28 eq '吉林省' ? 'selected' : ''}>吉林省</option>
          <option ${anwser.q28 eq '黑龙江省' ? 'selected' : ''}>黑龙江省</option>
          <option ${anwser.q28 eq '上海市' ? 'selected' : ''}>上海市</option>
          <option ${anwser.q28 eq '江苏省' ? 'selected' : ''}>江苏省</option>
          <option ${anwser.q28 eq '浙江省' ? 'selected' : ''}>浙江省</option>
          <option ${anwser.q28 eq '安徽省' ? 'selected' : ''}>安徽省</option>
          <option ${anwser.q28 eq '福建省' ? 'selected' : ''}>福建省</option>
          <option ${anwser.q28 eq '江西省' ? 'selected' : ''}>江西省</option>
          <option ${anwser.q28 eq '山东省' ? 'selected' : ''}>山东省</option>
          <option ${anwser.q28 eq '河南省' ? 'selected' : ''}>河南省</option>
          <option ${anwser.q28 eq '湖北省' ? 'selected' : ''}>湖北省</option>
          <option ${anwser.q28 eq '湖南省' ? 'selected' : ''}>湖南省</option>
          <option ${anwser.q28 eq '广东省' ? 'selected' : ''}>广东省</option>
          <option ${anwser.q28 eq '广西壮族自治区' ? 'selected' : ''}>广西壮族自治区</option>
          <option ${anwser.q28 eq '海南省' ? 'selected' : ''}>海南省</option>
          <option ${anwser.q28 eq '重庆市' ? 'selected' : ''}>重庆市</option>
          <option ${anwser.q28 eq '四川省' ? 'selected' : ''}>四川省</option>
          <option ${anwser.q28 eq '贵州省' ? 'selected' : ''}>贵州省</option>
          <option ${anwser.q28 eq '云南省' ? 'selected' : ''}>云南省</option>
          <option ${anwser.q28 eq '西藏自治区' ? 'selected' : ''}>西藏自治区</option>
          <option ${anwser.q28 eq '陕西省' ? 'selected' : ''}>陕西省</option>
          <option ${anwser.q28 eq '甘肃省' ? 'selected' : ''}>甘肃省</option>
          <option ${anwser.q28 eq '青海省' ? 'selected' : ''}>青海省</option>
          <option ${anwser.q28 eq '宁夏回族自治区' ? 'selected' : ''}>宁夏回族自治区</option>
          <option ${anwser.q28 eq '新疆维吾尔自治区' ? 'selected' : ''}>新疆维吾尔自治区</option>
          <option ${anwser.q28 eq '香港特别行政区' ? 'selected' : ''}>香港特别行政区</option>
          <option ${anwser.q28 eq '澳门特别行政区' ? 'selected' : ''}>澳门特别行政区</option>
          <option ${anwser.q28 eq '台湾省' ? 'selected' : ''}>台湾省</option>
          <option ${anwser.q28 eq '海外' ? 'selected' : ''}>海外</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">海外留学经历</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a11" value="没有" ${anwser.q37 eq '没有' ? 'checked' : ''} > 没有
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="a11" value="有" ${anwser.q37 eq '有' ? 'checked' : ''}> 有
            </label>
          </div>
        </div>
      </div>
    </div>

    <hr>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <input type="submit" class="btn btn-primary btn-lg" value="保存"/>
      </div>
    </div>
  </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${contextPath}/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${contextPath}/js/bootstrap.min.js"></script>

<script>
  $("input:radio, input:checkbox").change(function() {
    $(".check-other").each(function() {
      var $checkInput = $(this).find("label input");
      var $textInput = $(this).find("div input");
      if ($checkInput.is(":checked")) {
        $textInput.removeAttr("disabled");
      } else {
        $textInput.val("").attr("disabled", "disabled");
      }
    });
  }).change();
</script>
</body>
</html>
