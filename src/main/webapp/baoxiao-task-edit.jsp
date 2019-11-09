<%@ page import="com.ujiuye.usual.bean.Baoxiao,java.util.*" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>编辑附件</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

	<script type="application/javascript">
		$(function(){
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/usual/getOneBaoxiaoInfo?bxid=${param.bxid}',
				dataType:'json',
				success:function(rs){
					// 将毫秒值转换成日期
					var newDate = new Date(rs.baoxiao.bxtime);
					var time = newDate.getFullYear()+"-"+(newDate.getMonth()+1)+"-"+newDate.getDate();
					$("#totalmoney").val(rs.baoxiao.totalmoney);
					$("#bxtime").val(time);
					$("#bxremark").val(rs.baoxiao.bxremark);

					//显示驳回信息的记录
					if(rs.bxreply.length>0){
						$("#pizhu1").show();
						var content=""
						$(rs.bxreply).each(function(index,item){
							var newDate = new Date(item.replytime);
							var time = newDate.getFullYear()+"-"+(newDate.getMonth()+1)+"-"+newDate.getDate()+" "+newDate.getHours()+":"+newDate.getMinutes()+":"+newDate.getSeconds();
							content+="批注内容:"+item.content+" 批注时间:"+time+"&#13";
							$("#newpizhu").html(content);
						});
					}
				},
			});
		});


		function commit(obj){
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/usual/shenPi",
				data:{"bxstatus":obj,"baoxiaoFk":$("#bxid").val(),"content":$("#pi	zhu").val()},
				dataType:"json",
				success:function(resultData){
					if(resultData.flag){
						window.location.href="${pageContext.request.contextPath}/baoxiao-task.jsp";
					}
				}
			});
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
						当前位置:项目管理>>报销审批
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2" id="form10">

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr >
			<td colspan="2"  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input  type="hidden" name="bxid" id="bxid" value="${param.bxid}" />
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">金额：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input id="totalmoney" readonly="true"/></td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">使用时间</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input id="bxtime" readonly="true" /></td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" >备注：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<textarea rows=10 cols=130 readonly="true" id="bxremark"></textarea>
			</td>
		</tr>
		<tr style="display: none" id="pizhu1">
			<td align="right" bgcolor="#FAFAF1" >历史批准信息：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<!-- 批注信息 -->
				<textarea rows=10 id="newpizhu" cols=130 name="result"  readonly></textarea>
			</td>
		</tr >
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" >批准信息：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<!-- 批注信息 -->
				<textarea rows=10 id="pizhu" cols=130 name="content"></textarea>
			</td>
		</tr >

		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:commit(2)" class="coolbg">同意</a>
				<a href="javascript:commit(1)" class="coolbg">驳回</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>