<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title>【创业上海万人田野调查初步信息表】 WorkFace | 创业者理解创业者</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <link href="css/bootstrap-theme.min.css" rel="stylesheet">

  <!-- Bootstrap Tags Input -->
  <link href="css/bootstrap-tagsinput.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/question-items.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<div class="container">
  <img class="img-responsive" src="images/wf-logo.jpg">
  <div class="page-header">
    <h1>创业上海万人田野调查初步信息表 <small>WorkFace | 创业者理解创业者</small></h1>
    <p>创业者理解创业者，是创业者万人大联结的第一步。</p>
    <p>这是一场社会化的田野调查。我们的访谈团队会与你联系，倾听你的创业故事并分享传播给有相互需要的人，相互理解的人。</p>
    <p>创业事关我们大家的命运，我们不置身事外。创业上海，我们和你在一起！</p>
  </div>

  <form class="form-horizontal">
    <div class="form-group">
      <label for="inputQ1" class="col-md-2 control-label">姓名</label>
      <div class="col-md-4">
        <input type="text" name="q1" class="form-control" id="inputQ1">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">性别</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q2" value="1"> 男
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q2" value="2"> 女
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">手机</label>
      <div class="col-md-4">
        <p class="form-control-static">18601646631</p>
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ3" class="col-md-2 control-label">公司</label>
      <div class="col-md-8">
        <input type="text" name="q3" class="form-control" id="inputQ3">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">职务/角色</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="1"> 创始人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="2"> 合伙人
            </label>
          </div>
          <div class="radio col-sm-4">
            <label class="pull-left">
              <input type="radio" name="q4" value="3"> 其他
            </label>
            <div style="margin-left: 65px;">
              <input type="text" name="q4-other" id="inputQ4Other" style="width: 100%;">
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">现在是第几次创业</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="1"> 1次
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="2"> 2-3次
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="3"> 3次以上
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">目前创业项目运营多久了</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q6" value="1"> 1年内
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q6" value="2"> 1-3年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q6" value="3"> 3-5年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q6" value="4"> 5年以上
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">目前团队规模</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="1"> 5人以下
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="2"> 5-10人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="3"> 10-30人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="4"> 30人以上
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">第一笔启动资金的来源</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="1"> 家人朋友
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="2"> 自己积蓄
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="3"> 投资人
            </label>
          </div>
          <div class="radio col-sm-4">
            <label class="pull-left">
              <input type="radio" name="q8" value="4"> 其他
            </label>
            <div style="margin-left: 65px;">
              <input type="text" name="q8-other" id="inputQ8Other" style="width: 100%;">
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">目前项目是否已有产出</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q9" value="1"> 还在前期投入
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q9" value="2"> 收支平衡
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q9" value="3"> 已盈利
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">目前创业碰到的问题/困难并且希望解决的（多选）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="1"> 团队建设
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="2"> 品牌推广
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="3"> 资金不足
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="4"> 产品完善
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="5"> 管理经验
            </label>
          </div>
        </div>
        <div class="row">
          <div class="checkbox col-sm-4">
            <label class="pull-left">
              <input type="checkbox" name="q10" value="6"> 其他
            </label>
            <div style="margin-left: 65px;">
              <input type="text" name="q10-other" id="inputQ10Other" style="width: 100%;">
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">行业分类</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="1"> 互联网与移动
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="2"> 金融服务
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="3"> 运动、健身、健康护理
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="4"> 新科技新应用
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="5"> 媒体、公关、影视与营销
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="6"> 美食、餐饮、F&B
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="7"> 新农业、环境保护
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="8"> 设计与文化创意
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="9"> 品牌、经营管理、渠道与其他
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="10"> 养老养护产业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="11"> 旅行、小吃与文化
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="12"> 教育训练、心灵成长、自我提升
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="13"> 社会创新
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="14"> 婴童育儿产业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="15"> 组织发展
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group" style="margin-bottom: 10px">
      <label class="col-md-2 control-label">办公地址</label>
      <div class="col-md-8">
        <div class="row" style="margin-bottom: 10px;">
          <div class="col-xs-6 col-md-2">
            <select name="q12-1" class="form-control">
              <option>上海市</option>
            </select>
          </div>
          <div class="col-xs-6 col-md-2">
            <select name="q12-2" class="form-control">
              <option>黄浦区</option>
              <option>徐汇区</option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <input type="text" name="q12-3" class="form-control" id="inputQ12-3" placeholder="详细地址&hellip;">
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">您的年龄</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="1"> 90后
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="2"> 80-89年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="3"> 70-79年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="4"> 70年前
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">学历</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="1"> 大专及以下
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="2"> 大学本科
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="3"> MBA
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="4"> 硕士及以上
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ15" class="col-md-2 control-label">微信</label>
      <div class="col-md-4">
        <input type="text" name="q15" class="form-control" id="inputQ15">
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ16" class="col-md-2 control-label">邮箱</label>
      <div class="col-md-4">
        <input type="text" name="q16" class="form-control" id="inputQ16">
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ17" class="col-md-2 control-label">个人标签</label>
      <div class="col-md-8">
        <span id="q17Help" class="help-block">例如：复旦人、阿里系、南京人、媒体转型、编剧、IT背景、80后……</span>
        <input type="text" name="q17" class="form-control" id="inputQ17" data-role="tagsinput" aria-describedby="q17Help">
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ18" class="col-md-2 control-label">公司/创业项目/个人简介</label>
      <div class="col-md-8">
        <textarea name="q18" class="form-control" id="inputQ18" rows="5"></textarea>
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ19" class="col-md-2 control-label">是谁推荐了您</label>
      <div class="col-md-4">
        <input type="text" name="q19" class="form-control" id="inputQ19">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">对WorkFace了解吗</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q20" value="1"> 很熟悉
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q20" value="2"> 一般
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q20" value="3"> 不了解
            </label>
          </div>
        </div>
      </div>
    </div>

    <hr>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-lg">保存</button>
      </div>
    </div>
  </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>

<script src="js/bootstrap-tagsinput.min.js"></script>
</body>
</html>
