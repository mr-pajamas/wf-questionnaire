<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="commonincludes.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>人员管理</title>
		<link href="<%=webRoot %>/ligerUIlib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
		<link href="<%=webRoot %>/ligerUIlib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
		<link href="<%=webRoot %>/ligerUIlib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
		<script src="<%=webRoot %>/ligerUIlib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
		<script src="<%=webRoot %>/ligerUIlib/ligerUI/js/core/base.js" type="text/javascript"></script>
		<script src="<%=webRoot %>/ligerUIlib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
		<script type="text/javascript">
    var grid = null;
    var CustomersData=null;
    $(function () {
        grid = $("#listtable").ligerGrid({
        	checkbox: true,
            columns: [
            { display: '用户名', name: 'username'},
            { display: '姓名', name: 'name',width:'60'  },
            { display: '性别', name: 'gender',width:'50'  },
            { display: '部门', name: 'department',width:'100'  },
            { display: '岗位', name: 'position',width:'100'  },
            { display: '工号', name: 'jobnum',width:'100'  },
            { display: '联系电话', name: 'phonenum',width:'100'  },
            { display: '邮箱', name: 'email'  },
            { display: '审核状态', name: 'state' ,width:'60',
                render: function (item){
            	 if (parseInt(item.state) == 0) return '待审核';
            	 else if(parseInt(item.state) == 1) return '已审核';
            	}
            },
            { display: '密码', name: 'pwd',width:'80',
            	render: function (row)
                {
                    var html = "<a href='#' onclick='resetpwdclick("+JSON.stringify(row)+");' >重置</a>";
                    return html;
                }
            },
            { display: '操作', isAllowHide: false,width:60,
                render: function (row)
                {
                    var html = "<a href='#' onclick='showwindow("+JSON.stringify(row)+");' >修改</a>";
                    return html;
                }
            }
            ],
            url : "searchemp",pageSize:30,
            selectRowButtonOnly : true,
            width:'100%',height:'100%',
            toolbar : {
				items : [ {
					id : '1',
					text : '审核',
					click : itemclick
				
				}, {
					id : '0',
					text : '取消审核',
					click : itemclick
				
				}]
			}

        });

        $("#pageloading").hide();
        
    });

    
    function search()
    {
    	grid.setParm("name", $("#s_name").val());
    	grid.setParm("username", $("#s_username").val());
    	grid.setParm("department", $("#s_department").val());
    	grid.setParm("state", $("#s_state").val());
    	grid.loadData();
    }
    
    	function itemclick(item) {
				var data = grid.getCheckedRows();
				if (data.length == 0) {
					$.ligerDialog.warn('请选择行');
				} else {
					$.ligerDialog.confirm('确认要修改?', function(yes) {
						if (yes) {
							upData(data,item.id);
						}
					});
				}
	
		}
	function upData(data,id) {
		$.ajax({
			type : "POST",
			url : "updatestate",
			data : {"json":JSON.stringify(data),"state":id},
			success : function(result) {
				$.ligerDialog.success("处理成功", "提示", function(){
				$.ligerDialog.hide();
				grid.loadData();
			});
			}
		});
	}
	
	function showwindow(data){
       $("#username").text(data.username);
       $("#name").val(data.name);
       $("#gender").val(data.gender);
       $("#department").val(data.department);
       $("#position").val(data.position);
       $("#jobnum").val(data.jobnum);
       $("#phonenum").val(data.phonenum);
       $("#email").text(data.email);
       $("#id").val(data.id);
       $("#state").val(data.state);
  	  $.ligerDialog.open({target: $("#window"),title:"处理",width:500});
  	  
  }
  
	function resetpwdclick(data) {
		$.ligerDialog.confirm('是否重置密码为111111?', function(yes) {
			if (yes) {
				resetpwd(data);
			}
		});
	}
	
  function resetpwd(data){
       var id = data.id;
       	$.ajax({
			url : "resetpwd",
			data : {id:id},
			type : "POST",
			success : function(result) {
				$.ligerDialog.success("重置成功", "提示", function(){
				$.ligerDialog.hide();
				grid.loadData();
			});
			}
		});
  }
    
    function showadd(){
    	  $.ligerDialog.open({ target: $("#target1"),title:"添加用户",width:500});
    }

	function showupdate() {
		var id = document.getElementsByName("checkbox");
		alert(id);
		location.href = '<%=webRoot%>/org/queryemploye`e';
	}

    function closewindow(){
  	  $.ligerDialog.hide();
  }
    function submitdata(){
    	$.ajax( {
    		url : "updateempinfo", 
    		data:$("#dataForm").serialize(),
    		type : "POST", 
    		success : function(result) {
    			$.ligerDialog.success("处理成功", "提示", function(){
    				$.ligerDialog.hide();
    				grid.loadData();
    			});
    	}
    	});
    }

    
</script>
	</head>
	<body style="padding: 6px; overflow: hidden;">
		<!-- 表格查询 -->
		<div class="search-params-bar">
			<form action="" id="form1">
			<table >
			<tr>
			<td class="tit">审核状态：</td>
			<td class="bd">
				<select id="s_state" name="s_state"  onchange="" style="width:120px; ">
                   <option selected value="">全部</option>
                   <option  value="1">已审核</option>
                   <option  value="0">待审核</option>
                 </select>
            </td>
			<td class="tit">用户名：</td>
			<td class="bd"><input id="s_username" style="width: 120px"  type="text" name="s_username" size="10"/></td>
			<td class="tit">部门：</td>
			<td class="bd"><input id="s_department" type="text" style="width: 120px"  name="s_department" size="10"/></td>
			<td class="tit">姓名：</td>
			<td class="bd"><input id="s_name" style="width: 120px"  type="text" name="s_name" size="10"/></td>
			<td  colspan="5">&nbsp;&nbsp;<input id="btnOK" type="button" value="查询" onclick="search()" /></td>
			</tr>
			<tr></tr>
			</table>	
			</form>
		</div>
		<!--  表格列表  -->
		<div id="listtable" style="margin: 0; padding: 0"></div>
		<div style="display: none;">
		</div>
		
		<div id="window" style="margin: 3px; display: none;">
		<form id="dataForm" name="dataForm">
	    <input id="id" name="id" type="hidden" />	
		<table class="table_css" width="100%" height="100%">
					<tr>
						<td class="hd" width="50">
							用户名
						</td>
						<td class="bd" width="150">
							<label id="username" ></label>
						</td>
						<td class="hd" width="50">
							姓名
						</td>
						<td class="bd" width="auto">
							<input type="text" id="name" name="name" size="20"></input>
						</td>
					</tr>
					
					<tr>
						<td class="hd" width="50">
							性别
						</td>
						<td class="bd" width="auto">
							<select name="gender" id="gender">
								<option value="男">
									男
								</option>
								<option value="女">
									女
								</option>
							</select>
						</td>
						<td class="hd" width="50">
							部门
						</td>
						<td class="bd" width="auto">
							<input type="text" id="department" name="department" size="20"></input>
						</td>
					</tr>
					
					<tr>
						<td class="hd" width="50">
							职位
						</td>
						<td class="bd" width="auto">
							<input type="text" id="position" name="position" size="20"></input>
						</td>
						<td class="hd" width="50">
							电话
						</td>
						<td class="bd" width="auto">
							<input type="text" id="phonenum" name="phonenum" size="20"></input>
						</td>
					</tr>
					
					<tr>
						<td class="hd" width="50">
							Email
						</td>
						<td class="bd" width="auto" colspan="3">
							<label id="email" ></label>
						</td>
					
					</tr>
					
					<tr>
						<td class="hd" width="50">
							审核状态
						</td>
						<td class="bd" width="auto" colspan="3">
							<select name="state" id="state">
								<option value="0">
									待审核
								</option>
								<option value="1">
									已审核
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="hd"></td>
						<td class="bd" colspan="3">
							<input type="button" value="保存" onclick="submitdata()"
								class="l-button l-button-submit" />
							<input type="button" value="关闭" onclick="closewindow()"
								class="l-button l-button-submit" />
						</td>
					</tr>
				</table>
				</form>
		</div>

	
	</body>
</html>
