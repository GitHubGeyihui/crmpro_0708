<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>角色管理</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
	<script type="text/javascript">
		$(function(){
			$.ajax({
				type : "POST",
				url  : "${pageContext.request.contextPath}/auth/getAllRole",
				success : function(rs) {
					console.info(rs);
					$(rs).each(function(index,item){
						var st="";
						if(item.status==0){
							st="未启用";
						}else{
							st="启用";
						}
						var tr="<tr align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
								"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
								"\t<td>"+item.roleid+"</td>\n" +
								"\t<td>"+item.rolename+"</td>\n" +
								"\t<td align=\"center\">"+item.roledis+"</td>\n" +
								"\t<td>"+st+"</td>\n" +
								"\t<td><a href='${pageContext.request.contextPath}/auth/deleteRole?roleid="+item.roleid+"'>删除</a> |<a href='${pageContext.request.contextPath}/role-edit.jsp?roleid="+item.roleid+"'>编辑</a> | <a href='${pageContext.request.contextPath}//role-look.jsp?roleid="+item.roleid+"'>查看详情</a></td>\n" +
								"</tr>";
						$("#ttr").append(tr);
					});
				}
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
						当前位置:权限管理>>角色管理
					</td>
					<td>
						<input type='button' class="coolbg np" onClick="location='${pageContext.request.contextPath}/role-add.jsp';" value='添加角色' />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<!--  内容列表   -->
<form name="form2">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;角色列表&nbsp;</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="4%">选择</td>
			<td width="6%">编号</td>
			<td width="10%">角色名称</td>
			<td width="10%">角色描述</td>
			<td width="8%">状态</td>
			<td width="10%">操作</td>
		</tr>

		<tbody id="ttr"></tbody>
		<%--
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
            <td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
            <td>1</td>
            <td>普通员工</td>
            <td align="center">具有日常的普通功能</td>
            <td>启用</td>
            <td><a >删除</a> |<a href="role-edit.jsp">编辑</a> | <a href="role-look.jsp">查看详情</a></td>
        </tr>
        --%>


		<tr bgcolor="#FAFAF1">
			<td height="28" colspan="12">
				&nbsp;
				<a href="" class="coolbg">全选</a>
				<a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="" class="coolbg">&nbsp;禁用&nbsp;</a>
			</td>
		</tr>
		<tr align="right" bgcolor="#EEF4EA">
			<td height="36" colspan="12" align="center"><!--翻页代码 --></td>
		</tr>
	</table>

</form>


</body>
</html>