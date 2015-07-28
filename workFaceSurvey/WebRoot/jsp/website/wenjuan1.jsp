<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../commonincludes.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<META content="IE=11.0000" 
http-equiv="X-UA-Compatible">
 <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="Canvas,File,Image">  
<META name="Author" content="flashlizi - www.riaidea.com">
<META name="Description" content="HTML5 experiment"> 
<META http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<META name="GENERATOR" content="MSHTML 11.00.9600.17105">

  <title>【创业上海万人田野调查初步信息表】 WorkFace | 创业者理解创业者</title>
  <meta name="description" content="为【创业上海万人田野调查初步信息表】 WorkFace | 创业者理解创业者提交数据。&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;color: #000000;&quot;&gt;这是一场社会化的田野调查，创业者理解创业者，&lt;/span&gt;&lt;spa...">
  <link rel="shortcut icon" type="image/x-icon" href="<%=webRoot %>/assets/favicon-a1533ba989eeced36f8738b1298892b5.ico" />
  <link rel="stylesheet" media="screen" href="<%=webRoot %>/assets/published-1009c681532c6510d3fa5cea4c3a65dc.css" />
  <style type="text/css">
    .entry-container {
        background-image: url(<%=webRoot %>/assets/wallpaper/textures/texture_mini_wood_grain-2cef0a37a312b95cf42c86f36e1d8f9c.png);
        background-repeat: repeat;
        background-size: auto;

    }

</style>
<style type="text/css">
    .entry-container .banner {
          background-color: #BFB787;
      color: #FFF;

    }

    .entry-container form .form-name {
    font-size: 22px; color: #000; font-weight: normal;
    }

    .entry-container form .form-description {
    font-size: 12px; color: #666; font-weight: normal;
    }

    .entry-container form .field label.control-label {
    font-size: 14px; color: #333; font-weight: bold;
    }

    .entry-container form .field .field-content label,
    .entry-container form .field .attachment .status .file-name,
    .entry-container form .field .attachment label {
    font-size: 14px; color: #333; font-weight: bold;
      font-size: 12px;
      font-weight: normal;
    }
    .entry-container form .field .field-content .image-choices label,
    .entry-container form fieldset .goods-items .goods-item .text-wrapper .dimensions .dimension-options label {
      color: inherit;
    }

    .entry-container form .field .help-block{
    font-size: 12px; color: #777; font-weight: normal;
    }

    .entry-container form .field.section-break label {
    font-size: 16px; color: #333; font-weight: bold;
    }

    .entry-container form .field.section-break .help-block {
    font-size: 12px; color: #666; font-weight: normal;
    }

    .entry-container .message {
    font-size: 22px; color: #000; font-weight: normal;
    }

</style>
<script src="<%=webRoot %>/js/data.js"></script>
<script type="text/javascript" src="<%=webRoot %>/js/jquery-1.11.1.js"></script>
<script src="<%=webRoot %>/js/jquery.city.select.min.js"></script>
<script src="<%=webRoot %>/js/prettify.js"></script>
<SCRIPT src="<%=webRoot %>/js/imagecropper.min.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" id="main">
$(function () {
    $('#province, #city').citylist({
        data    : data,
        id      : 'id',
        children: 'cities',
        name    : 'name',
        metaTag : 'name'
    });

   $('input:radio[value=${user.gender}]').click();
   $('input:radio[value=${anwser.q11}]').click();
   $('input:radio[value=${anwser.q12}]').click();
   $('input:radio[value=${user.position}]').click();
   $('input:radio[value=${anwser.q8}]').click();
   $('input:radio[value=${anwser.q1}]').click();

   $('input:radio[value=${user.age}]').click();
   $('input:radio[value=${user.degree}]').click();
   $('input:radio[value=${anwser.q2}]').click();
   
   $('#province').val('${user.province}');
   $("#province").change();

   $('#city').val('${user.city}');
   $('#street').val('${user.street}');



      

});

</script>
  <!--[if lte IE 8]>
    <link rel="stylesheet" media="screen" href="<%=webRoot %>/assets/ie/lte-ie8-2a9bd0f5c30bbf4deb56b3b557a2659a.css" />
    <script src="<%=webRoot %>/assets/html5-59fb957970df1cced65a604f1350247d.js"></script>
  <![endif]-->
  <!--[if lte IE 7]>
    <link rel="stylesheet" media="screen" href="<%=webRoot %>/assets/ie/lte-ie7-b34ed44ef2fd40cfae250bfa47df6b23.css" />
  <![endif]-->
  <!--[if IE 6]> <link rel="stylesheet" media="screen" href="<%=webRoot %>/assets/ie/ie6-265f79696a14803fee1078f36bfae47a.css" /> <![endif]-->
  <!--[if IE 6]>
    <script src="<%=webRoot %>/js/fix-ie6-ae022401416e12d9756a4d0fe83b2b82.js"></script>
  <![endif]-->
  <meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="SqXVsjxaF2gmqixSEibFDYni7wCNMBbXlf0r8/syB/yGqqeaIy6+IxTKdAHxbnMf4qluz0PIhSOoh+tt4tzUww==" />
</head>
<body class="entry-container bg-image" onload="init()">
  

  
<form class="center" data-form-token="hPoGPN" data-validate-url="f/hPoGPN/validate_fields" id="new_entry" action="<%=webRoot %>/synthesize/SaveQ1" accept-charset="UTF-8" method="post"><input type="hidden" name="utf8" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="HpELRBDnNOoRiZkAvG8DhmircrYLYKq9T+m0zHg8RAHSnnlsD5OdoSPpwVNfJ7WUA+DzecWYOUlyk3RSYdKXPg==" />
      <div class="banner">
          <div class="banner-img banner-content">
            <img height="382" width="700" style="height:382px;width:700px" src="<%=webRoot %>/images/55a60b8f41505030430000111436945295.jpg" alt="55a60b8f41505030430000111436945295" />
            
          </div>

    </div>

  <h1 class="form-name">
    【创业上海万人田野调查初步信息表】 WorkFace | 创业者理解创业者
  </h1>
  <div class="form-description"><p><span style="font-size: 14px;"><span style="color: #000000;">这是一场社会化的田野调查，创业者理解创业者，</span><span style="color: #000000;">我们不是任何第三方。创业事关我们自己的命运，你的成败关乎我的成败，我们不置身事外。</span></span></p>
<p><span style="font-size: 14px;">请填写以下基础信息，我们的访谈团队伙伴会与你联系，倾听你的创业故事并分享传播给有相互需要的人，懂你的人。</span></p>
<p><span style="color: #0000ff; font-size: 14px;">这是创业者万人大联结的第一步。创业上海，我们和你在一起！</span></p>

  
  <fieldset>
    <div class="form-content">
      

<div class="form-message gd-hide"></div>


        <div class="form-fields-container">
            <div class="field" data-api-code="field_1">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_1">
    被访人姓名：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <input type="text" value="${user.name}" name="entry[field_1]" id="entry_field_1" />
    </div>
  </div>
</div>


            </div>
            <div class="field" data-api-code="field_19">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_19">
    性别：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="男" name="entry[field_19]" id="entry[field_19]" />
        男
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="女" name="entry[field_19]" id="entry[field_19]"/>
        女
      </label>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_3">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_3">
    手机：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
          <input type="tel" value="${sessionScope.phone}" readonly="readonly" name="entry[field_3]" id="entry_field_3" />

    </div>

  </div>
</div>


            </div>

            <div class="field section-break" data-api-code="field_5">
                <hr/>
<div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_5"></label>
  <div class="field-content">

    <div class="controls">
      
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_6">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_6">
    公司名称：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <input type="text" value="${user.company}" name="entry[field_6]" id="entry_field_6" />
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_20">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_20">
    职务/角色：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value=" 创始人" name="entry[field_20]" />
        创始人
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="合伙人" name="entry[field_20]" />
        合伙人
      </label>
      <div class="other-choice-area inline">
        <label onclick="" class="radio inline">
          <input class="other_choice" data-field-key="field_20" type="radio" value="其它" name="entry[field_20]" />
          其它
        </label>
        <input class="other-choice-input gd-input-medium" data-field-key="field_20" type="text" value="${user.positionother}" name="entry[field_20_other]" id="entry_field_20_other" />
      </div>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_13">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_13">
    现在是第几次创业：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="1次" name="entry[field_13]" />
        1次
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="2-3次" name="entry[field_13]" />
        2-3次
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="3次以上" name="entry[field_13]" />
        3次以上
      </label>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_21">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_21">
    目前创业项目运营多久了：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="1年内" name="entry[field_21]" />
        1年内
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="1-3年" name="entry[field_21]" />
        1-3年
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="3-5年" name="entry[field_21]" />
        3-5年
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="5年以上" name="entry[field_21]" />
        5年以上
      </label>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_23">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_23">
    第一笔启动资金的来源：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="家人朋友" name="entry[field_23]" />
        家人朋友
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="自己积蓄" name="entry[field_23]" />
        自己积蓄
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value=" 投资人" name="entry[field_23]" />
        投资人
      </label>
      <div class="other-choice-area inline">
        <label onclick="" class="radio inline">
          <input class="other_choice" data-field-key="field_23" type="radio" value="其它" name="entry[field_23]" />
          其它
        </label>
        <input  class="other-choice-input gd-input-medium" data-field-key="field_23" type="text" value="${anwser.q8other}" name="entry[field_23_other]" id="entry_field_23_other" />
      </div>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_24">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_24">
    行业分类：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">
      <div class="help-block"><p>    </p></div>

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="互联网与移动 " name="entry[field_24]" />
        互联网与移动 
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="金融服务" name="entry[field_24]" />
        金融服务
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="运动、健身、健康护理" name="entry[field_24]" />
        运动、健身、健康护理
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="新科技新应用" name="entry[field_24]" />
        新科技新应用
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="媒体、公关、影视与营销" name="entry[field_24]" />
        媒体、公关、影视与营销
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="美食、餐饮、F&B" name="entry[field_24]" />
        美食、餐饮、F&amp;B
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="新农业、环境保护" name="entry[field_24]" />
        新农业、环境保护
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="设计与文化创意" name="entry[field_24]" />
        设计与文化创意
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="品牌、经营管理、渠道与其他" name="entry[field_24]" />
        品牌、经营管理、渠道与其他
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="养老养护产业" name="entry[field_24]" />
        养老养护产业
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="旅行、小吃与文化" name="entry[field_24]" />
        旅行、小吃与文化
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="教育训练、心灵成长、自我提升" name="entry[field_24]" />
        教育训练、心灵成长、自我提升
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="社会创新" name="entry[field_24]" />
        社会创新
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="婴童育儿产业" name="entry[field_24]" />
        婴童育儿产业
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="组织发展" name="entry[field_24]" />
        组织发展
      </label>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_18">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_18">
    办公地址：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div data-role="address" class="">
  <div data-role="controlgroup">
    <div class="dropdown address">
      <select name="province" id="province" class="gd-input-medium needsclick" data-role="province" data-value="上海市"><option value="">- 省/自治区/直辖市 -</option></select>
      <span class="dropdown-trigger needsclick"></span>
    </div>
    <div class="dropdown address">
      <select name="city" id="city" class="gd-input-small needsclick" data-role="city" data-value="上海市"><option value="">- 市 -</option></select>
      <span class="dropdown-trigger needsclick"></span>
    </div>
  </div>
  <textarea name="street" id="street"  rows="3" class="gd-input-xxlarge" placeholder="详细地址" >
</textarea>
</div>

    </div>

  </div>
</div>


            </div>
            <div class="field section-break" data-api-code="field_14">
                <hr/>
<div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_14"></label>
  <div class="field-content">

    <div class="controls">
      
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_25">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_25">
    您的年龄：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="90后" name="entry[field_25]" />
        90后
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="80-89年" name="entry[field_25]" />
        80-89年
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="70-79年" name="entry[field_25]" />
        70-79年
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="70年前" name="entry[field_25]" />
        70年前
      </label>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_27">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_27">
    学历：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="大专及以下" name="entry[field_27]" />
        大专及以下
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="大学本科" name="entry[field_27]" />
        大学本科
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="MBA" name="entry[field_27]" />
        MBA
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="硕士及以上" name="entry[field_27]" />
        硕士及以上
      </label>

</div>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_17">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_17">
    微信：
    
    
</label>
  <div class="field-content">

    <div class="controls">
      <input type="text" name="entry[field_17]" id="entry_field_17" value="${user.wecahrt}"/>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_4">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_4">
    邮箱：
    
    
</label>
  <div class="field-content">

    <div class="controls">
      <input type="email" name="entry[field_4]" id="entry_field_4" value="${user.mail}"/>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_12">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_12">
    个人标签说明：
    
    
</label>
  <div class="field-content">
      <div class="help-block"><p><span style="font-size: 12px;">（标签不重要，只是有助于我们快速认识您）</span></p>
<p><span style="color: #666699; font-size: 12px;">例如：复旦人 / 阿里系 / 南京人 /  媒体转型 / 编剧 / IT背景/ 80后 ……</span></p></div>

    <div class="controls">
      <textarea rows="3" class="gd-input-xxlarge" name="entry[field_12]" id="entry_field_12">${user.tag}
</textarea>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_10">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_10">
    公司/创业项目/个人简介：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <textarea rows="3" class="gd-input-xxlarge" name="entry[field_10]" id="entry_field_10">${anwser.q39}
</textarea>
    </div>

  </div>
</div>


            </div>
            <div class="field section-break" data-api-code="field_26">
                <hr/>
<div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_26"></label>
  <div class="field-content">

    <div class="controls">
      
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_16">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_16">
    是谁推荐了您：
    
    <span style="color: red;">*</span>
</label>
  <div class="field-content">

    <div class="controls">
      <input type="text"  name="entry[field_16]" id="entry_field_16" value="${user.referrer }"/>
    </div>

  </div>
</div>


            </div>
            <div class="field" data-api-code="field_29">
              <div class="form-group " >
  <label class="control-label field_title" data-role="collapse_toggle" for="entry_field_29">
    对WorkFace了解吗
    
    
</label>
  <div class="field-content">

    <div class="controls">
      <div class="clearfix radio-group" data-role="controlgroup">
        <label onclick="" class="radio inline">
        <input type="radio" value="很熟悉" name="entry[field_29]" />
        很熟悉
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="一般" name="entry[field_29]" />
        一般
      </label>
      <label onclick="" class="radio inline">
        <input type="radio" value="不认识" name="entry[field_29]" />
        不认识
      </label>

</div>
    </div>

  </div>
</div>
      <div class="field submit-field ">
        
        <div class="value">
          <a href="javascript:void(0)" class="pagination-action previous-page hide btn btn-primary">上一页</a>
<a href="javascript:void(0)" class="pagination-action next-page hide btn btn-primary">下一页</a>

              <input type="submit" name="commit" value="提交" data-disable-with="提交中..." class="submit btn btn-primary" />
          <span class="page-number text-muted"></span>
            <input type="hidden" name="embedded" id="embedded" />
            <input type="hidden" name="banner" id="banner" />
            <input type="hidden" name="background" id="background" />
        </div>
      </div>

            </div>
        </div>
    </div>
  </fieldset>
</form>
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
  </body>
</html>

