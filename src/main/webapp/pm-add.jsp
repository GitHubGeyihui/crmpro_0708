<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>用户管理</title>
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">

	<script type="text/javascript">
		function commit(){
			$("#form14").submit();
		}
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
						当前位置:权限管理>>添加菜单资源
					</td>
					<td>

					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!--  内容列表   -->
<form name="form2" id="form14" action="${pageContext.request.contextPath}/auth/addSources" method="post">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;添加资源&nbsp;</td>
		</tr>
		<input type="hidden" name="pid" value="${param.id}">
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">菜单资源名称：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input name="name" /></td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">菜单资源路径：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input name="url" /></td>
		</tr>
		<tr>
			<td align="right" bgcolor="#FAFAF1" >资源描述：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<textarea rows=10 cols=130 name="remark"></textarea>
			</td>
		</tr>


		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:commit()" class="coolbg">保存</a>
				<a href="resources.jsp" class="coolbg">返回</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>