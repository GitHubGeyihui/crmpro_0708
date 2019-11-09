<%@ page language="java"  import="com.ujiuye.usual.bean.Baoxiao,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>添加附件</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
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
					$(rs.et).each(function(index,item){
						var opt ="";
						if(item.etid==rs.baoxiao.expendituretype.etid){
							opt="<option value="+item.etid+" selected>"+item.etname+"</option>";
						}else{
							opt="<option value="+item.etid+">"+item.etname+"</option>";
						}
						$("#paymode").append(opt);
					});
					//显示驳回信息的记录
					if(rs.bxreply.length>0){
						$("#pz").show();
						var content=""
						$(rs.bxreply).each(function(index,item){
							var newDate = new Date(item.replytime);
							var time = newDate.getFullYear()+"-"+(newDate.getMonth()+1)+"-"+newDate.getDate()+" "+newDate.getHours()+":"+newDate.getMinutes()+":"+newDate.getSeconds();
							content+="批注内容:"+item.content+" 批注时间:"+time+"&#13";
							$("#pizhu").html(content);
						});
					}
				},
			});
		});

		function commit(){
			$("#form11").submit();
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
						当前位置:报销管理>>添加新的报销
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2" id="form11" action="${pageContext.request.contextPath}/usual/updateBaoxiao" method="post" >
	<input type="hidden" value="${param.bxid}" id="bxid" name="bxid">
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;添加新的报销单&nbsp;</td>
		</tr>

		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">支出类型：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<select name="paymode" id="paymode">

				</select>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">总金额：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input size="26"  id="totalmoney" name="totalmoney" />
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">使用时间：</td>
			<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input size="52" name="bxtime" id="bxtime"/>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" >备注：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<textarea rows=10 cols=130  id="bxremark" name="bxremark"></textarea>
			</td>
		</tr>
		<tr style="display: none" id="pz">
			<td align="right" bgcolor="#FAFAF1" >批注：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
			<textarea rows=3 cols=130 name="result" id="pizhu" readonly="true">
			</textarea>
			</td>
		</tr>
		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<a href="javascript:commit()" class="coolbg">保存</a>
				<a href="project-file.jsp" class="coolbg">返回</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>