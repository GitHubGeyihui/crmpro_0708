<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>发信息</title>
	<link type="text/css" href="http://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />

	<link href="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.css" type="text/css" />
	<link href="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/demos.css" rel="stylesheet" type="text/css" />

	<script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.9.1/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	<!--中文-->
	<script src="${pageContext.request.contextPath}/datejs/js/jquery.ui.datepicker-zh-CN.js.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/datejs/js/jquery-ui-timepicker-zh-CN.js" type="text/javascript" charset="UTF-8"></script>



	<script type="text/javascript">
		jQuery(function () {
			// 时间设置
			jQuery('#time').datetimepicker({
				timeFormat: "HH:mm:ss",
				dateFormat: "yy-mm-dd"
			});

			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/emp/showEmpInfo',
				dataType:'json',
				success:function(resultData){
					console.info(resultData);
					$(resultData).each(function(index,item){
						var option="<option value="+item.eid+">"+item.ename+"</option>";
						$("#recvp").append(option);
					});
				},

			});

		});
		function commit(){
			$("#form12").submit();
		}
	</script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
		<td height="26" background="skin/images/newlinebg3.gif">
			<table width="58%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td >
						当前位置:消息>>发送消息
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2" id="form12" action="${pageContext.request.contextPath}/usual/sendMessage" method="post">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;发信息&nbsp;</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">收件人：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<select name="recvp" id="recvp">
					<option >选取收件人</option>
				</select>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">定时发送时间：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input name="msgtime" id="time"/></td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">内容：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<textarea rows=15 cols=130 name="msgcontent"></textarea></td>
		</tr>



		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:commit()" class="coolbg">发送</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>