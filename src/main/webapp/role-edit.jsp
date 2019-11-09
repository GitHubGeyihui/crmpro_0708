<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>编辑角色信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ztree/zTreeStyle.css">
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/script/docs.min.js"></script>
	<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/ztree/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/auth/getOneRole',
				data:{"roleid":${param.roleid}},
				dataType:'json',
				success:function(rs){
					$("#rid").val(rs.roleid);
					$("#rname").val(rs.rolename);
					$("#rmark").text(rs.roledis);

					if(rs.status==0){
						$("#st").append("<option value='1'>启用</option><option value='0' selected>禁用</option>");
					}else{
						$("#st").append("<option value='1' selected>启用</option><option value='0'>禁用</option>");
					}
					var setting = {
						check: {
							enable: true
						},
						async: {
							enable: true,
							url:"${pageContext.request.contextPath}/auth/showAllSources",
							autoParam:["id", "name=n", "level=lv"]
						},
						callback: {
							//异步加载后回调的函数
							onAsyncSuccess: function(event, treeId, treeNode, msg){
								//获取那个树对象
								var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
								//获取树种某个单一节点对象
								$(rs.sourcesList).each(function(index,item){
									var node = treeObj.getNodeByParam("id",item.id, null);
									treeObj.checkNode(node, true, true);
								});
							}
						}
					};
					$.fn.zTree.init($("#permissionTree"), setting);
				}
			});


			//绑定提交按钮
			$("#myButton").click(function() {
				// 获取我们的树
				var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
				// 获取当前树被选中的节点
				var nodes = treeObj.getCheckedNodes(true);
				if(0 === nodes.length) {
					alert("请选择赋予的权限!");
					return;
				}
				var dataNodes = "";
				for(var i = 0; i < nodes.length; i++) {
					dataNodes += nodes[i].id + ",";
				}
				$("#sid").val(dataNodes);
				$("#form18").submit();
			});
		});
	</script>


</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
		<td height="26" background="skin/images/newlinebg3.gif">
			<table width="58%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td >
						当前位置:权限管理>>编辑角色
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2" action="${pageContext.request.contextPath}/auth/addRole" method="post" id="form18">

	<input type="hidden"  id="sid" name="sourcesid">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑角色&nbsp;</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">角色编号：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" id="rid" name="roleid" readonly>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">角色名称：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input id="rname" name="rolename" /></td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">状态：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<select name="status" id="st">
					<%--<option value=1>启用</option>
                    <option value=1>禁用</option>--%>
				</select>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">赋菜单资源：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<div class="panel-body">
					<ul id="permissionTree" class="ztree"></ul>
				</div>
				<%--<input type="checkbox" checked/>项目管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>基本信息管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>需求分析管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>模块管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>功能管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>附件管理<br/>

                <input type="checkbox" checked/>任务管理<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>创建任务<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>任务信息<br/>
                &nbsp;&nbsp;&nbsp;<input type="checkbox" checked/>我的任务<br/>--%>

			</td>
		</tr>

		<tr >
			<td align="right" bgcolor="#FAFAF1" >备注：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<textarea rows=10 cols=130 id="rmark" name="roledis"></textarea>
			</td>
		</tr>


		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="#" id="myButton" class="coolbg">保存</a>
				<a href="role.jsp" class="coolbg">返回</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>