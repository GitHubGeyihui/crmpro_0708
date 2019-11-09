<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>发件箱</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//异步获取我们收件人的信息
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/usual/showEmail',
				dataType:"json",
				success:function(rs){
					$(rs).each(function(index,item){
						var tr="<tr align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
								"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
								"\t<td>"+item.id+"</td>\n" +
								"\t<td>"+item.title+"</td>\n" +
								"\t<td align=\"center\"><span >"+item.emailcontent+"</span></td>\n" +
								"\t<td>"+item.employee.ename+"</td>\n" +
								"\t<td>2015-02-03</td>\n" +
								"\t<td><a >删除</a></td>\n" +
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
						当前位置:信息箱>>发件箱
					</td>
					<td>
						<input type='button' class="coolbg np" onClick="location='${pageContext.request.contextPath}/email-send.jsp';" value='发送邮件' />
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
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;发件箱&nbsp;</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="4%">选择</td>
			<td width="6%">序号</td>
			<td width="10%">标题</td>
			<td width="10%">内容</td>
			<td width="10%">收件人</td>
			<td width="8%">发送时间</td>
			<td width="8%">操作</td>
		</tr>
		<tbody id="ttr"></tbody>
		<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
            <td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
            <td>1</td>
            <td>项目完成的咋样?</td>
            <td align="center"><span >最近工作累不？项目完成的咋样?加油哈</span></td>
            <td>李四</td>
            <td>2015-02-03</td>
            <td><a >删除</a></td>
        </tr>--%>


		<tr bgcolor="#FAFAF1">
			<td height="28" colspan="12">
				&nbsp;
				<a href="" class="coolbg">全选</a>
				<a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="" class="coolbg">&nbsp;删除&nbsp;</a>
			</td>
		</tr>
		<tr align="right" bgcolor="#EEF4EA">
			<td height="36" colspan="12" align="center"><!--翻页代码 --></td>
		</tr>
	</table>

</form>


</body>
</html>