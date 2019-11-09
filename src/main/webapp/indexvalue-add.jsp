<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>添加对标信息</title>
	<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<link type="text/css" href="http://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />

	<link href="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.css" type="text/css" />
	<link href="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/demos.css" rel="stylesheet" type="text/css" />

	<script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.9.1/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	<!--中文-->
	<script src="${pageContext.request.contextPath}/datejs/js/jquery.ui.datepicker-zh-CN.js.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/datejs/js/jquery-ui-timepicker-zh-CN.js" type="text/javascript" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toDate.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$(function(){
			// 时间设置
			jQuery('.time').datetimepicker({
				timeFormat: "HH:mm:ss",
				dateFormat: "yy-mm-dd"
			});
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/db/showDaInfo?mark=1',
				dataType:'json',
				success:function(resultData){
					$(resultData).each(function(index,item){
						var option="<option value="+item.daid+">"+item.dacname+"</oiption>";
						$("#com").append(option);
					});
				},
			});
		});

		function showInfo(obj){
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/db/getOneByDaid',
				data:{"daid":obj},
				dataType:'json',
				success:function(rs){
					console.info(rs);
					var resultData= rs.one;

					$("#cname1").val(resultData.dacname);
					$("#money1").val(resultData.daturnover);
					$(".ot").remove();
					var option="<option class='ot' value='"+resultData.daid+"'>"+toDate(resultData.datime)+"</option>";
					$("#year").append(option);
					$("#maindo1").val(resultData.dabusiness);
					$("#good1").val(resultData.dasuperiority);
					$("#nogood1").val(resultData.dainforiority);
					$("#po1").val(resultData.dasort);
					$("#count1").val(resultData.empcount);
					$("#build1").val(resultData.buildtime);
					$("#remark1").val(resultData.remark);
					$("#attachment").text(resultData.daother);
					//添加其余的年份
					$(rs.more).each(function(index,item){
						var option="<option class='ot'value='"+item.daid+"'>"+toDate(item.datime)+"</option>";
						$("#year").append(option);
					});
					// 表单数据
					$("#pname").val(resultData.dacname);
					$("#comnameFk").val(resultData.daid);
				},
			});
		}

		function commit(){
			$("#form17").submit();
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
						当前位置:对标管理>>添加对标基本信息
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<div>

	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="40" colspan="12" background="skin/images/tbg.gif">
				<h1>选择对标企业：</h1>
				<select id="com" onchange="showInfo(this.value)">
					<option>选择对标企业</option>
				</select>

			</td>
		</tr>
	</table>


	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;<font color="red">对标企业信息如下</font>&nbsp;</td>
		</tr>
		<tr >

			<td align="right" bgcolor="#FAFAF1" height="22">公司名称：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" name="pname" id="cname1"/>
			</td>

			<td align="right" bgcolor="#FAFAF1" height="22" >营业额：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" id="money1"/>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">年份：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<select id="year" onchange="showInfo(this.value)">

				</select>
			</td>
			<td align="right" bgcolor="#FAFAF1" height="22">主要业务：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<textarea rows="3" cols="18" id="maindo1"></textarea>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22" >优势：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<textarea rows="3" cols="18" id="good1"></textarea>
			</td>
			<td align="right" bgcolor="#FAFAF1" height="22">劣势：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<textarea rows="3" cols="18" id="nogood1"></textarea>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">行业地位：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" name="buildtime" id="po1"/>
			</td>
			<td align="right" bgcolor="#FAFAF1" height="22">员工数量：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" name="cost" id="count1"/>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">创建时间：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" name="cost" id="build1"/>
			</td>
			<td align="right" bgcolor="#FAFAF1" height="22"></td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">

			</td>
		</tr>

		<tr >
			<td align="right" bgcolor="#FAFAF1" >简单描述：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<textarea type="text" rows=15 cols=130 id="remark1"></textarea>
			</td>
		</tr>

		<tr >
			<td align="right" bgcolor="#FAFAF1" >附件下载：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<a href="#" id="attachment"></a>
			</td>
		</tr>

	</table>

</div>




<!-- 添加指标 -->


<form name="form2" id="form17" action="${pageContext.request.contextPath}/db/saveIndexValueInfo" method="POST" enctype="multipart/form-data">
	<!-- 向后台传递的关联外键 -->
	<input type="hidden" id="comnameFk"  name="comnameFk">
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;<font color="red">添加对标信息</font>&nbsp;</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">目标公司：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" id="pname"/>
			</td>

			<td align="right" bgcolor="#FAFAF1" height="22" >目标营业额：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text" name="inTurnover"/>
			</td>

		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22">业务方向：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="text"  id="cp" name="inBusiness"/>
			</td>
			<td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="datetime" class="time" name="inStarttime"/>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" height="22" >截止时间：</td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<input type="datetime" class="time" name="inEndtime"/></td>
			<td align="right" bgcolor="#FAFAF1" height="22"></td>
			<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"></td>
		</tr>


		<tr >
			<td align="right" bgcolor="#FAFAF1" >备注：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<textarea type="text" rows=15 cols=130 name="inRemark"></textarea><span id="number"></span>
			</td>
		</tr>
		<tr >
			<td align="right" bgcolor="#FAFAF1" >上传详细计划书：</td>
			<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
				<input type="file" name="files" >
			</td>
		</tr>

		<tr bgcolor="#FAFAF1">
			<td height="28" colspan=4 align=center>
				&nbsp;
				<A class="coolbg" onclick="commit()" >保存</A>
				<a href="project-base.jsp" class="coolbg">返回</a>
			</td>
		</tr>
	</table>

</form>


</body>
</html>