<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>发信息</title>
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//异步获取我们收件人的信息
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/emp/showEmpInfo?mark=5',
				dataType:"json",
				success:function(rs){
					$(rs).each(function(index,item){
						var op="<option value='"+item.eid+","+item.archives.email+"'>"+item.ename+"</option>";
						$("#emp").append(op);
					});
				}
			});
		});

		function getEmailAddress(obj){
			var arr = obj.split(",");
			$("#ed").val(arr[1]);
			$("#efk").val(arr[0]);
		}

		function commit(){
			$("#form12").submit();
		}


	</script>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
		<td height="26" background="skin/images/newlinebg3.gif">
			<table width="58%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td >
						当前位置:信息箱>>发信息
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2" id="form12" action="${pageContext.request.contextPath}/usual/sendEmail" method="post" enctype="multipart/form-data">
	<input type="hidden" name="emailAddress" id="ed" />
	<input type="hidden" name="empFk2" id="efk" />
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;发信息&nbsp;</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">收件人：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<select name="ek" id="emp" onchange="getEmailAddress(this.value)">
					<option>选择收件人</option>
				</select>

			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">标题：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input name="title"/></td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">内容：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<textarea rows=15 cols=130 name="emailcontent"></textarea></td>
		</tr>

		<tr >
			<td align="right" bgcolor="#FAFAF1" >附件：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<input type="file" name="files"/>
			</td>
		</tr>

		<tr >
			<td align="right" bgcolor="#FAFAF1" >附件：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<input type="file" name="files"/>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" >附件：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<input type="file" name="files"/>
			</td>
		</tr>


		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:commit()" class="coolbg">保存</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>