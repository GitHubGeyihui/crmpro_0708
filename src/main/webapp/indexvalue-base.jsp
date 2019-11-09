<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>对标管理</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">

	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toDate.js" charset="UTF-8"></script>
	<script type="application/javascript">
		$(function(){
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/db/showAllIndexValue',
				dataType:"json",
				success:function(rs){
					$(rs).each(function(index,item){
						var tr ="<tr align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
								"\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
								"\t<td>"+item.inId+"</td>\n" +
								"\t<td><a href=''><u>"+item.datacollect.dacname+"</u></a></td>\n" +
								"\t<td>"+item.inTurnover+"亿</td>\n" +
								"\t<td>"+item.employee.ename+"</td>\n" +
								"\t<td>"+toDate(item.inStarttime)+"</td>\n" +
								"\t<td>"+toDate(item.inEndtime)+"</td>\n" +
								"\t<td><a href='#'>附件下载</a> |<a href=\"project-base-edit.jsp\">编辑</a> | <a href=\"project-base-look.jsp\">查看详情</a></td>\n" +
								"</tr>";
						//添加到指定行后面
						$("#ttr").append(tr);


					});
				}
			});
		});
		function submit(){
			$("#form4").submit();
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
						当前位置:对标管理>>添加指标信息
					</td>
					<td>
						<input type='button' class="coolbg np" onClick="location='indexvalue-add.jsp';" value='添加指标信息' />
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
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;指标信息列表&nbsp;</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="4%">选择</td>
			<td width="6%">序号</td>
			<td width="15%">目标公司</td>
			<td width="15%">目标营业额</td>
			<td width="15%">指标制定人</td>
			<td width="15%">指标开始时间</td>
			<td width="15%">指标截止时间</td>
			<td width="15%">操作</td>
		</tr>
		<tbody id="ttr"></tbody>
		<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
            <td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
            <td>1</td>
            <td><a href=''><u>浪潮集团</u></a></td>
            <td>3亿</td>
            <td>张三丰</td>
            <td>2015-01-03</td>
            <td>2015-02-03</td>
            <td><a href="project-base-edit.jsp">附件下载</a> |<a href="project-base-edit.jsp">编辑</a> | <a href="project-base-look.jsp">查看详情</a></td>
        </tr>--%>


		<tr bgcolor="#FAFAF1">
			<td height="28" colspan="12">
				&nbsp;
				<a href="" class="coolbg">全选</a>
				<a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="" class="coolbg">&nbsp;删除&nbsp;</a>
				<a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
			</td>
		</tr>
		<tr align="right" bgcolor="#EEF4EA">
			<td height="36" colspan="12" align="center"><!--翻页代码 --></td>
		</tr>
	</table>

</form>


</body>
</html>