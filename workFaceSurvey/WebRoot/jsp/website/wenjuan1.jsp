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
  <link href="<%=webRoot %>/css/bootstrap.min.css" rel="stylesheet">

  <link href="<%=webRoot %>/css/bootstrap-theme.min.css" rel="stylesheet">

  <!-- Bootstrap Tags Input -->
  <link href="<%=webRoot %>/css/bootstrap-tagsinput.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=webRoot %>/css/question-items.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="<%=webRoot %>/js/html5shiv.min.js"></script>
  <script src="<%=webRoot %>/js/respond.min.js"></script>
  <![endif]-->
  
  
  
</head>
<body>
<div class="container">
  <img class="img-responsive" src="<%=webRoot %>/images/wf-logo.jpg">
  <div class="page-header">
    <h1>创业上海万人田野调查初步信息表 <small>WorkFace | 创业者理解创业者</small></h1>
    <p>创业者理解创业者，是创业者万人大联结的第一步。</p>
    <p>这是一场社会化的田野调查。我们的访谈团队会与你联系，倾听你的创业故事并分享传播给有相互需要的人，相互理解的人。</p>
    <p>创业事关我们大家的命运，我们不置身事外。创业上海，我们和你在一起！</p>
  </div>

  <form class="form-horizontal" action="<%=webRoot %>/synthesize/SaveQ1" method="post" >  
    <div class="form-group">
      <label for="inputQ1" class="col-md-2 control-label">姓名</label>
      <div class="col-md-4">
        <input type="text" name="q1"  value="${user.name}" class="form-control" id="inputQ1">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">性别</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
         
              <input type="radio" name="q2" value="男" ${user.gender eq '男' ? 'checked' : ''}> 男
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q2" value="女" ${user.gender eq '女' ? 'checked' : ''}> 女
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">手机</label>
      <div class="col-md-4">
        <p class="form-control-static">${user.phone}</p>
        <input type="hidden" name="phone" value="${user.phone}"/>
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ3" class="col-md-2 control-label">公司</label>
      <div class="col-md-8">
        <input type="text" name="q3" value="${user.company}" class="form-control" id="inputQ3">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">职务/角色</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="创始人" ${user.position eq '创始人' ? 'checked' : ''}> 创始人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="合伙人" ${user.position eq '合伙人' ? 'checked' : ''}> 合伙人
            </label>
          </div>
          <div class="radio check-other col-sm-4">
            <label class="pull-left">
              <input type="radio" name="q4" value="其他" ${user.position eq '其他' ? 'checked' : ''}> 其他
            </label>
            <div style="margin-left: 65px;">
              <input type="text" name="q4-other" value="${user.positionother}" id="inputQ4Other" style="width: 100%;" ${user.position eq '其他' ? '' : 'disabled'}>
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
              <input type="radio" name="q5" value="1次" ${anwser.q11 eq '1次' ? 'checked' : ''}> 1次
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="2-3次" ${anwser.q11 eq '2-3次' ? 'checked' : ''}> 2-3次
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="3次以上" ${anwser.q11 eq '3次以上' ? 'checked' : ''}> 3次以上
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
              <input type="radio" name="q6" value="1年内" ${anwser.q12 eq '1年内' ? 'checked' : ''}> 1年内
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q6" value="1-3年" ${anwser.q12 eq '1-3年' ? 'checked' : ''}> 1-3年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q6" value="3-5年" ${anwser.q12 eq '3-5年' ? 'checked' : ''}> 3-5年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q6" value="5年以上" ${anwser.q12 eq '5年以上' ? 'checked' : ''}> 5年以上
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
              <input type="radio" name="q7" value="5人以下" ${anwser.q15 eq '5人以下' ? 'checked' : ''}> 5人以下
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="5-10人" ${anwser.q15 eq '5-10人' ? 'checked' : ''}> 5-10人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="10-30人" ${anwser.q15 eq '10-30人' ? 'checked' : ''}> 10-30人
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="30人以上" ${anwser.q15 eq '30人以上' ? 'checked' : ''}> 30人以上
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
              <input type="radio" name="q8" value="家人朋友" ${anwser.q8 eq '家人朋友' ? 'checked' : ''}> 家人朋友
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="自己积蓄" ${anwser.q8 eq '自己积蓄' ? 'checked' : ''}> 自己积蓄
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="投资人" ${anwser.q8 eq '投资人' ? 'checked' : ''}> 投资人
            </label>
          </div>
          <div class="radio check-other col-sm-4">
            <label class="pull-left">
              <input type="radio" name="q8" value="其他" ${anwser.q8 eq '其他' ? 'checked' : ''}> 其他
            </label>
            <div style="margin-left: 65px;">
              <input type="text" name="q8-other" value="${anwser.q8other}" id="inputQ8Other" style="width: 100%;" ${anwser.q8 eq '其他' ? '' : 'disabled'}>
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
              <input type="radio" name="q9" value="还在前期投入" ${anwser.q13 eq '还在前期投入' ? 'checked' : ''}> 还在前期投入
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q9" value="收支平衡" ${anwser.q13 eq '收支平衡' ? 'checked' : ''}> 收支平衡
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q9" value="已盈利" ${anwser.q13 eq '已盈利' ? 'checked' : ''}> 已盈利
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
              <input type="checkbox" name="q10" value="团队建设"> 团队建设
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="品牌推广"> 品牌推广
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="资金不足"> 资金不足
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="产品完善"> 产品完善
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q10" value="管理经验"> 管理经验
            </label>
          </div>
        </div>
        <div class="row">
          <div class="checkbox col-sm-4 check-other">
            <label class="pull-left">
              <input type="checkbox" name="q10" value="其他"> 其他
            </label>
            <div style="margin-left: 65px;">
              <input type="text" name="q10-other" id="inputQ10Other" value="${anwser.q40other}" style="width: 100%;" disabled>
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
              <input type="radio" name="q11" value="互联网与移动" ${anwser.q1 eq '互联网与移动' ? 'checked' : ''}> 互联网与移动
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="金融服务" ${anwser.q1 eq '金融服务' ? 'checked' : ''}> 金融服务
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="运动、健身、健康护理" ${anwser.q1 eq '运动、健身、健康护理' ? 'checked' : ''}> 运动、健身、健康护理
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="新科技新应用" ${anwser.q1 eq '新科技新应用' ? 'checked' : ''}> 新科技新应用
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="媒体、公关、影视与营销" ${anwser.q1 eq '媒体、公关、影视与营销' ? 'checked' : ''}> 媒体、公关、影视与营销
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="美食、餐饮、F&amp;B" ${anwser.q1 eq '美食、餐饮、F&B' ? 'checked' : ''}> 美食、餐饮、F&amp;B
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="新农业、环境保护" ${anwser.q1 eq '新农业、环境保护' ? 'checked' : ''}> 新农业、环境保护
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="设计与文化创意" ${anwser.q1 eq '设计与文化创意' ? 'checked' : ''}> 设计与文化创意
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="品牌、经营管理、渠道与其他" ${anwser.q1 eq '品牌、经营管理、渠道与其他' ? 'checked' : ''}> 品牌、经营管理、渠道与其他
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="养老养护产业" ${anwser.q1 eq '养老养护产业' ? 'checked' : ''}> 养老养护产业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="旅行、小吃与文化" ${anwser.q1 eq '旅行、小吃与文化' ? 'checked' : ''}> 旅行、小吃与文化
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="教育训练、心灵成长、自我提升" ${anwser.q1 eq '教育训练、心灵成长、自我提升' ? 'checked' : ''}> 教育训练、心灵成长、自我提升
            </label>
          </div>
        </div>
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="社会创新" ${anwser.q1 eq '社会创新' ? 'checked' : ''}> 社会创新
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="婴童育儿产业" ${anwser.q1 eq '婴童育儿产业' ? 'checked' : ''}> 婴童育儿产业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q11" value="组织发展" ${anwser.q1 eq '组织发展' ? 'checked' : ''}> 组织发展
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
            <select name="q12-1" class="form-control" id="q12-1">
              <option>上海市</option>
            </select>
          </div>
          <div class="col-xs-6 col-md-2">
            <select name="q12-2" class="form-control" id="q12-2">
              <option>黄浦区</option>
              <option>卢湾区</option>
               <option>徐汇区</option>
                <option>长宁区</option>
                 <option>静安区</option>
                  <option>普陀区</option>
                   <option>闸北区</option>
                    <option>虹口区</option>
                     <option>杨浦区</option>
                      <option>闵行区</option>
                       <option>宝山区</option>
                        <option>嘉定区</option>
                         <option>浦东新区</option>
                          <option>金山区</option>
                           <option>松江区</option>
                            <option>青浦区</option>
                             <option>奉贤区</option>
                              <option>崇明县</option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <input type="text" name="q12-3" class="form-control" id="q12-3" placeholder="详细地址&hellip;">
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
              <input type="radio" name="q13" value="90后" ${user.age eq '90后' ? 'checked' : ''}> 90后
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="80-89年" ${user.age eq '80-89年' ? 'checked' : ''}> 80-89年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="70-79年" ${user.age eq '70-79年' ? 'checked' : ''}> 70-79年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="70年前" ${user.age eq '70年前' ? 'checked' : ''}> 70年前
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
              <input type="radio" name="q14" value="大专及以下" ${user.degree eq '大专及以下' ? 'checked' : ''}> 大专及以下
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="大学本科" ${user.degree eq '大学本科' ? 'checked' : ''}> 大学本科
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="MBA" ${user.degree eq 'MBA' ? 'checked' : ''}> MBA
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="硕士及以上" ${user.degree eq '硕士及以上' ? 'checked' : ''}> 硕士及以上
            </label>
          </div>
        </div>
      </div>
    </div>

   <!-- 
   <div class="form-group">
      <label for="inputQ15" class="col-md-2 control-label">微信</label>
      <div class="col-md-4">
        <input type="text" name="q15" value="${user.wechat_nickname}" class="form-control" id="inputQ15">
      </div>
    </div>
    -->

    <div class="form-group">
      <label for="inputQ16" class="col-md-2 control-label">邮箱</label>
      <div class="col-md-4">
        <input type="text" name="q16" class="form-control" value="${user.mail}" id="inputQ16">
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ17" class="col-md-2 control-label">个人标签</label>
      <div class="col-md-8">
        <span id="q17Help" class="help-block">例如：复旦人、阿里系、南京人、媒体转型、编剧、IT背景、80后……</span>
        <input type="text" name="q17" class="form-control" value="${user.tag}" id="inputQ17" data-role="tagsinput" aria-describedby="q17Help">
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ18" class="col-md-2 control-label">公司/创业项目/个人简介</label>
      <div class="col-md-8">
        <textarea name="q18" class="form-control" id="inputQ18" rows="5">${anwser.q39}</textarea>
      </div>
    </div>

    <div class="form-group">
      <label for="inputQ19" class="col-md-2 control-label">是谁推荐了您</label>
      <div class="col-md-4">
        <input type="text" name="q19" value="${user.referrer}" class="form-control" id="inputQ19">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">对WorkFace了解吗</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q20" value="很熟悉" ${anwser.q2 eq '很熟悉' ? 'checked' : ''}> 很熟悉
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q20" value="一般" ${anwser.q2 eq '一般' ? 'checked' : ''}> 一般
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q20" value="不了解" ${anwser.q2 eq '不了解' ? 'checked' : ''}> 不了解
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
 <script src="<%=webRoot %>/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=webRoot %>/js/bootstrap.min.js"></script>

<script src="<%=webRoot %>/js/bootstrap-tagsinput.min.js"></script>
<script type="text/javascript">
	$("input[data-role=tagsinput]").tagsinput({
		confirmKeys:[13,44,32]
	});
</script>
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
  });
</script>

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript">
	!function(a,b){"function"==typeof define&&(define.amd||define.cmd)?define(function(){return b(a)}):b(a,!0)}(this,function(a,b){function c(b,c,d){a.WeixinJSBridge?WeixinJSBridge.invoke(b,e(c),function(a){g(b,a,d)}):j(b,d)}function d(b,c,d){a.WeixinJSBridge?WeixinJSBridge.on(b,function(a){d&&d.trigger&&d.trigger(a),g(b,a,c)}):d?j(b,d):j(b,c)}function e(a){return a=a||{},a.appId=z.appId,a.verifyAppId=z.appId,a.verifySignType="sha1",a.verifyTimestamp=z.timestamp+"",a.verifyNonceStr=z.nonceStr,a.verifySignature=z.signature,a}function f(a){return{timeStamp:a.timestamp+"",nonceStr:a.nonceStr,"package":a.package,paySign:a.paySign,signType:a.signType||"SHA1"}}function g(a,b,c){var d,e,f;switch(delete b.err_code,delete b.err_desc,delete b.err_detail,d=b.errMsg,d||(d=b.err_msg,delete b.err_msg,d=h(a,d,c),b.errMsg=d),c=c||{},c._complete&&(c._complete(b),delete c._complete),d=b.errMsg||"",z.debug&&!c.isInnerInvoke&&alert(JSON.stringify(b)),e=d.indexOf(":"),f=d.substring(e+1)){case"ok":c.success&&c.success(b);break;case"cancel":c.cancel&&c.cancel(b);break;default:c.fail&&c.fail(b)}c.complete&&c.complete(b)}function h(a,b){var d,e,f,g;if(b){switch(d=b.indexOf(":"),a){case o.config:e="config";break;case o.openProductSpecificView:e="openProductSpecificView";break;default:e=b.substring(0,d),e=e.replace(/_/g," "),e=e.replace(/\b\w+\b/g,function(a){return a.substring(0,1).toUpperCase()+a.substring(1)}),e=e.substring(0,1).toLowerCase()+e.substring(1),e=e.replace(/ /g,""),-1!=e.indexOf("Wcpay")&&(e=e.replace("Wcpay","WCPay")),f=p[e],f&&(e=f)}g=b.substring(d+1),"confirm"==g&&(g="ok"),"failed"==g&&(g="fail"),-1!=g.indexOf("failed_")&&(g=g.substring(7)),-1!=g.indexOf("fail_")&&(g=g.substring(5)),g=g.replace(/_/g," "),g=g.toLowerCase(),("access denied"==g||"no permission to execute"==g)&&(g="permission denied"),"config"==e&&"function not exist"==g&&(g="ok"),b=e+":"+g}return b}function i(a){var b,c,d,e;if(a){for(b=0,c=a.length;c>b;++b)d=a[b],e=o[d],e&&(a[b]=e);return a}}function j(a,b){if(!(!z.debug||b&&b.isInnerInvoke)){var c=p[a];c&&(a=c),b&&b._complete&&delete b._complete,console.log('"'+a+'",',b||"")}}function k(){if(!("6.0.2">w||y.systemType<0)){var b=new Image;y.appId=z.appId,y.initTime=x.initEndTime-x.initStartTime,y.preVerifyTime=x.preVerifyEndTime-x.preVerifyStartTime,C.getNetworkType({isInnerInvoke:!0,success:function(a){y.networkType=a.networkType;var c="https://open.weixin.qq.com/sdk/report?v="+y.version+"&o="+y.isPreVerifyOk+"&s="+y.systemType+"&c="+y.clientVersion+"&a="+y.appId+"&n="+y.networkType+"&i="+y.initTime+"&p="+y.preVerifyTime+"&u="+y.url;b.src=c}})}}function l(){return(new Date).getTime()}function m(b){t&&(a.WeixinJSBridge?b():q.addEventListener&&q.addEventListener("WeixinJSBridgeReady",b,!1))}function n(){C.invoke||(C.invoke=function(b,c,d){a.WeixinJSBridge&&WeixinJSBridge.invoke(b,e(c),d)},C.on=function(b,c){a.WeixinJSBridge&&WeixinJSBridge.on(b,c)})}var o,p,q,r,s,t,u,v,w,x,y,z,A,B,C;if(!a.jWeixin)return o={config:"preVerifyJSAPI",onMenuShareTimeline:"menu:share:timeline",onMenuShareAppMessage:"menu:share:appmessage",onMenuShareQQ:"menu:share:qq",onMenuShareWeibo:"menu:share:weiboApp",onMenuShareQZone:"menu:share:QZone",previewImage:"imagePreview",getLocation:"geoLocation",openProductSpecificView:"openProductViewWithPid",addCard:"batchAddCard",openCard:"batchViewCard",chooseWXPay:"getBrandWCPayRequest"},p=function(){var b,a={};for(b in o)a[o[b]]=b;return a}(),q=a.document,r=q.title,s=navigator.userAgent.toLowerCase(),t=-1!=s.indexOf("micromessenger"),u=-1!=s.indexOf("android"),v=-1!=s.indexOf("iphone")||-1!=s.indexOf("ipad"),w=function(){var a=s.match(/micromessenger\/(\d+\.\d+\.\d+)/)||s.match(/micromessenger\/(\d+\.\d+)/);return a?a[1]:""}(),x={initStartTime:l(),initEndTime:0,preVerifyStartTime:0,preVerifyEndTime:0},y={version:1,appId:"",initTime:0,preVerifyTime:0,networkType:"",isPreVerifyOk:1,systemType:v?1:u?2:-1,clientVersion:w,url:encodeURIComponent(location.href)},z={},A={_completes:[]},B={state:0,res:{}},m(function(){x.initEndTime=l()}),C={config:function(a){z=a,j("config",a);var b=z.check===!1?!1:!0;m(function(){var a,d,e;if(b)c(o.config,{verifyJsApiList:i(z.jsApiList)},function(){A._complete=function(a){x.preVerifyEndTime=l(),B.state=1,B.res=a},A.success=function(){y.isPreVerifyOk=0},A.fail=function(a){A._fail?A._fail(a):B.state=-1};var a=A._completes;return a.push(function(){z.debug||k()}),A.complete=function(){for(var c=0,d=a.length;d>c;++c)a[c]();A._completes=[]},A}()),x.preVerifyStartTime=l();else{for(B.state=1,a=A._completes,d=0,e=a.length;e>d;++d)a[d]();A._completes=[]}}),z.beta&&n()},ready:function(a){0!=B.state?a():(A._completes.push(a),!t&&z.debug&&a())},error:function(a){"6.0.2">w||(-1==B.state?a(B.res):A._fail=a)},checkJsApi:function(a){var b=function(a){var c,d,b=a.checkResult;for(c in b)d=p[c],d&&(b[d]=b[c],delete b[c]);return a};c("checkJsApi",{jsApiList:i(a.jsApiList)},function(){return a._complete=function(a){if(u){var c=a.checkResult;c&&(a.checkResult=JSON.parse(c))}a=b(a)},a}())},onMenuShareTimeline:function(a){d(o.onMenuShareTimeline,{complete:function(){c("shareTimeline",{title:a.title||r,desc:a.title||r,img_url:a.imgUrl||"",link:a.link||location.href},a)}},a)},onMenuShareAppMessage:function(a){d(o.onMenuShareAppMessage,{complete:function(){c("sendAppMessage",{title:a.title||r,desc:a.desc||"",link:a.link||location.href,img_url:a.imgUrl||"",type:a.type||"link",data_url:a.dataUrl||""},a)}},a)},onMenuShareQQ:function(a){d(o.onMenuShareQQ,{complete:function(){c("shareQQ",{title:a.title||r,desc:a.desc||"",img_url:a.imgUrl||"",link:a.link||location.href},a)}},a)},onMenuShareWeibo:function(a){d(o.onMenuShareWeibo,{complete:function(){c("shareWeiboApp",{title:a.title||r,desc:a.desc||"",img_url:a.imgUrl||"",link:a.link||location.href},a)}},a)},onMenuShareQZone:function(a){d(o.onMenuShareQZone,{complete:function(){c("shareQZone",{title:a.title||r,desc:a.desc||"",img_url:a.imgUrl||"",link:a.link||location.href},a)}},a)},startRecord:function(a){c("startRecord",{},a)},stopRecord:function(a){c("stopRecord",{},a)},onVoiceRecordEnd:function(a){d("onVoiceRecordEnd",a)},playVoice:function(a){c("playVoice",{localId:a.localId},a)},pauseVoice:function(a){c("pauseVoice",{localId:a.localId},a)},stopVoice:function(a){c("stopVoice",{localId:a.localId},a)},onVoicePlayEnd:function(a){d("onVoicePlayEnd",a)},uploadVoice:function(a){c("uploadVoice",{localId:a.localId,isShowProgressTips:0==a.isShowProgressTips?0:1},a)},downloadVoice:function(a){c("downloadVoice",{serverId:a.serverId,isShowProgressTips:0==a.isShowProgressTips?0:1},a)},translateVoice:function(a){c("translateVoice",{localId:a.localId,isShowProgressTips:0==a.isShowProgressTips?0:1},a)},chooseImage:function(a){c("chooseImage",{scene:"1|2",count:a.count||9,sizeType:a.sizeType||["original","compressed"],sourceType:a.sourceType||["album","camera"]},function(){return a._complete=function(a){if(u){var b=a.localIds;b&&(a.localIds=JSON.parse(b))}},a}())},previewImage:function(a){c(o.previewImage,{current:a.current,urls:a.urls},a)},uploadImage:function(a){c("uploadImage",{localId:a.localId,isShowProgressTips:0==a.isShowProgressTips?0:1},a)},downloadImage:function(a){c("downloadImage",{serverId:a.serverId,isShowProgressTips:0==a.isShowProgressTips?0:1},a)},getNetworkType:function(a){var b=function(a){var c,d,e,b=a.errMsg;if(a.errMsg="getNetworkType:ok",c=a.subtype,delete a.subtype,c)a.networkType=c;else switch(d=b.indexOf(":"),e=b.substring(d+1)){case"wifi":case"edge":case"wwan":a.networkType=e;break;default:a.errMsg="getNetworkType:fail"}return a};c("getNetworkType",{},function(){return a._complete=function(a){a=b(a)},a}())},openLocation:function(a){c("openLocation",{latitude:a.latitude,longitude:a.longitude,name:a.name||"",address:a.address||"",scale:a.scale||28,infoUrl:a.infoUrl||""},a)},getLocation:function(a){a=a||{},c(o.getLocation,{type:a.type||"wgs84"},function(){return a._complete=function(a){delete a.type},a}())},hideOptionMenu:function(a){c("hideOptionMenu",{},a)},showOptionMenu:function(a){c("showOptionMenu",{},a)},closeWindow:function(a){a=a||{},c("closeWindow",{immediate_close:a.immediateClose||0},a)},hideMenuItems:function(a){c("hideMenuItems",{menuList:a.menuList},a)},showMenuItems:function(a){c("showMenuItems",{menuList:a.menuList},a)},hideAllNonBaseMenuItem:function(a){c("hideAllNonBaseMenuItem",{},a)},showAllNonBaseMenuItem:function(a){c("showAllNonBaseMenuItem",{},a)},scanQRCode:function(a){a=a||{},c("scanQRCode",{needResult:a.needResult||0,scanType:a.scanType||["qrCode","barCode"]},function(){return a._complete=function(a){var b,c;v&&(b=a.resultStr,b&&(c=JSON.parse(b),a.resultStr=c&&c.scan_code&&c.scan_code.scan_result))},a}())},openProductSpecificView:function(a){c(o.openProductSpecificView,{pid:a.productId,view_type:a.viewType||0},a)},addCard:function(a){var e,f,g,h,b=a.cardList,d=[];for(e=0,f=b.length;f>e;++e)g=b[e],h={card_id:g.cardId,card_ext:g.cardExt},d.push(h);c(o.addCard,{card_list:d},function(){return a._complete=function(a){var c,d,e,b=a.card_list;if(b){for(b=JSON.parse(b),c=0,d=b.length;d>c;++c)e=b[c],e.cardId=e.card_id,e.cardExt=e.card_ext,e.isSuccess=e.is_succ?!0:!1,delete e.card_id,delete e.card_ext,delete e.is_succ;a.cardList=b,delete a.card_list}},a}())},chooseCard:function(a){c("chooseCard",{app_id:z.appId,location_id:a.shopId||"",sign_type:a.signType||"SHA1",card_id:a.cardId||"",card_type:a.cardType||"",card_sign:a.cardSign,time_stamp:a.timestamp+"",nonce_str:a.nonceStr},function(){return a._complete=function(a){a.cardList=a.choose_card_info,delete a.choose_card_info},a}())},openCard:function(a){var e,f,g,h,b=a.cardList,d=[];for(e=0,f=b.length;f>e;++e)g=b[e],h={card_id:g.cardId,code:g.code},d.push(h);c(o.openCard,{card_list:d},a)},chooseWXPay:function(a){c(o.chooseWXPay,f(a),a)}},b&&(a.wx=a.jWeixin=C),C});
</script>
	<script type="text/javascript">
		var shareUrl="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx1f31aecb83b985d7&redirect_uri=http://www.meetuuu.com/survey/wechatLogin&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		var imgUrl= "<%=webRoot%>/images/logo.png";
		// 微信配置
	    wx.config({
	        debug: false, 
	        appId: "wx1f31aecb83b985d7",
	        timestamp: "${timeStamp}", 
	        nonceStr: "${nonceStr}", 
	        signature: "${signature}",
	        jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 功能列表，我们要使用JS-SDK的什么功能
	    });
	    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在 页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready 函数中。
	    wx.ready(function(){
	        // 获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
	        wx.onMenuShareTimeline({
	            title: 'Work Face创业上海万人田野调查', // 分享标题
	            link: shareUrl,
	            imgUrl: imgUrl, // 分享图标
	            success: function () { 
					
	            },
	            cancel: function () { 
	                
	            }
	        });
	        // 获取“分享给朋友”按钮点击状态及自定义分享内容接口
	        wx.onMenuShareAppMessage({
	            title: 'Work Face创业上海万人田野调查', // 分享标题
	            desc: "【创业上海万人田野调查初步信息表】 WorkFace | 创业者理解创业者", // 分享描述
	            link: shareUrl,
	            imgUrl: imgUrl, // 分享图标
	            type: 'link', // 分享类型,music、video或link，不填默认为link
	            success: function () {
					
	            },
	            cancel: function () { 
	                
	            }
	        });
	    });
	</script>
	
	<script type="text/javascript" id="main">
$(function () {
	   $('#q12-1').val('${user.province}');
	   $('#q12-2').val('${user.city}');
	   $('#q12-3').val('${user.street}');

	 
	 
	 
	   var Q40s='${anwser.q40}'.split("|");
	   $.each(Q40s,function(n,value) {   
	   $('input:checkbox[value='+value+']').attr("checked", true);  
	   $('input:checkbox[value='+value+']').change();
	   });

	   $('#inputQ10Other').val('${anwser.q40other}');
	   $('#inputQ8Other').val('${anwser.q8other}');
	   $('#inputQ4Other').val('${user.positionother}');
});

</script>

</body>
</html>

