<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>省市下拉联动插件 @soulteary</title>
   <%@ include file="../commonincludes.jsp"%>
    <script src="<%=webRoot %>/js/data.js"></script>
    <script src="<%=webRoot %>/js/jquery-1.11.1.js"></script>
    <script src="<%=webRoot %>/js/jquery.city.select.min.js"></script>
    <script src="<%=webRoot %>/js/prettify.js"></script>
</head>
<body>
<div class="container">
    <div class="row span8 offset2">
        <h1>jQuery City Select</h1>
    </div>
    <div class="row span8 offset2">
        <form class="bs-docs-example form-horizontal">
            <h3>省市二级关联例子:</h3>
            <div class="control-group">
                <label class="control-label" for="province">省份</label>

                <div class="controls">
                    <select id="province">
                        <option value="载入中">载入中</option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="city">城市</label>

                <div class="controls">
                    <select id="city">
                        <option value="载入中">载入中</option>
                    </select>
                </div>
            </div>
 
        </form>
        <pre class="prettyprint linenums"></pre>
    </div>
</div>


<script type="text/javascript" id="main">
$(function () {

    $('#province, #city').citylist({
        data    : data,
        id      : 'id',
        children: 'cities',
        name    : 'name',
        metaTag : 'name'
    });

    $('#all').citylist({
        data    : data,
        id      : 'id',
        children: 'cities',
        name    : 'name',
        metaTag : 'name'
    });

    $('#pre-province, #pre-city').citylist({
        data    : data,
        id      : 'id',
        children: 'cities',
        name    : 'name',
        metaTag : 'name',
        selected: [14, 1401]
    });

    $('#pre-all').citylist({
        data    : data,
        id      : 'id',
        children: 'cities',
        name    : 'name',
        metaTag : 'name',
        idVal   : true,
        selected: 1401
    });
});
</script>

</body>
</html>