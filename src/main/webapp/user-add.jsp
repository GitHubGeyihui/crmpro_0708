<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加用户</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<link type="text/css" href="http://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />

	<link href="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.css" type="text/css" />
	<link href="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/demos.css" rel="stylesheet" type="text/css" />

	<script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.9.1/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/datejs/jQuery-Timepicker-Addon/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	<!--中文-->
	<script src="${pageContext.request.contextPath}/datejs/js/jquery.ui.datepicker-zh-CN.js.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/datejs/js/jquery-ui-timepicker-zh-CN.js" type="text/javascript" charset="UTF-8"></script>
	<script type="application/javascript">
          $(function(){
              // 时间设置
              jQuery('#time').datetimepicker({
                  timeFormat: "HH:mm:ss",
                  dateFormat: "yy-mm-dd"
              });
              $.ajax({
                  type:'GET',
                  url:'${pageContext.request.contextPath}/emp/getPosition',
                  dataType:'json',
                  success:function(resultData){
                      $(resultData).each(function(index,item){
                          var option="<option value="+item.id+">"+item.name+"</oiption>";
                          $("#position").append(option);
                      });
                  },
              });
              $.ajax({
                  type:'GET',
                  url:'${pageContext.request.contextPath}/emp/getLevel',
                  dataType:'json',
                  success:function(resultData){
                      $(resultData).each(function(index,item){
                          var option="<option value="+item.jid+">"+item.jname+"</oiption>";
                          $("#level").append(option);
                      });
                  },
              });
              $.ajax({
                  type:'GET',
                  url:'${pageContext.request.contextPath}/emp/getDept',
                  dataType:'json',
                  success:function(resultData){
                      $(resultData).each(function(index,item){
                          var option="<option value="+item.deptno+">"+item.dname+"</oiption>";
                          $("#dept").append(option);
                      });
                  },
              });
              $.ajax({
                  type:'GET',
                  url:'${pageContext.request.contextPath}/emp/getAllRole',
                  dataType:'json',
                  success:function(resultData){
                      $(resultData).each(function(index,item){
                          var option="<option value="+item.roleid+">"+item.rolename+"</oiption>";
                          $("#role").append(option);
                      });
                  },
              });


		  });

          function commit(){
			  $("#form19").submit();
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
    当前位置:权限管理>>添加用户信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" action="${pageContext.request.contextPath}/emp/addEmp" method="post" id="form19">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;添加用户&nbsp;</td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">姓名：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="ename"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">性别：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="esex">
			<option value="1">男</option>
			<option value="0">女</option>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">年龄：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="eage"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">联系电话：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="telephone"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">入职时间：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="hiredate" id="time"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">身份证号码：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="pnum"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">用户名：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="username"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">密码：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input name="password"/></td>
</tr>
	<tr >
		<td align="right" bgcolor="#FAFAF1" height="22">职位：</td>
		<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<select name="pFk" id="position">
				<option value=1>选择职位</option>
			</select>
		</td>
	</tr>
	<tr >
		<td align="right" bgcolor="#FAFAF1" height="22">级别：</td>
		<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<select name="lFk" id="level">
				<option value=1>选择级别</option>
			</select>
		</td>
	</tr>
	<tr >
		<td align="right" bgcolor="#FAFAF1" height="22">部门：</td>
		<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<select name="dFk" id="dept">
				<option value=1>选择部门</option>
			</select>
		</td>
	</tr>

	<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">赋角色：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="roleFk" id="role">
			<option value=1>选择角色</option>
		</select>
	</td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >备注：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=10 cols=130 name="remark"></textarea>
	</td>
</tr>

<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="javascript:commit()" class="coolbg">保存</a>
	<a href="user.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>