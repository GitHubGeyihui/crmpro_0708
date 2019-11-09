<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>模块管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

    <script type="application/javascript">
        $(function(){
            $.ajax({
                type:'GET',
                url:'${pageContext.request.contextPath}/pro/showAllModule',
                dataType:'json',
                success:function(rs){
                    console.info(rs);
                    $(rs).each(function(index,item){
                        // 将毫秒值转换成日期
                        var newDate = new Date(item.analysis.addtime);
                        var time1 = newDate.getFullYear()+"-"+(newDate.getMonth()+1)+"-"+newDate.getDate();

                        // 将毫秒值转换成日期
                        var newDate = new Date(item.analysis.updatetime);
                        var time2 = newDate.getFullYear()+"-"+(newDate.getMonth()+1)+"-"+newDate.getDate();

                        var tr ="<tr align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
                            "\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
                            "\t<td>"+item.id+"</td>\n" +
                            "\t<td align=\"center\"><a href=''><u>"+item.modname+"</u></a></td>\n" +
                            "\t<td align=\"center\"><a href=''><u>"+item.analysis.title+"</u></a></td>\n" +
                            "\t<td align=\"center\"><a href=''><u>"+item.analysis.project.pname+"</u></a></td>\n" +
                            "\t<td>"+item.level+"</td>\n" +
                            "\t<td>"+time1+"</td>\n" +
                            "\t<td>"+time2+"</td>\n" +
                            "\t<td><a href=\"project-model-edit.jsp\">编辑</a> | <a href=\"project-model-look.jsp\">查看详情</a></td>\n" +
                            "</tr>";
                        //添加到指定行后面
                        $("#ttr").after(tr);
                    });
                },
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
    当前位置:项目管理>>模块管理
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='${pageContext.request.contextPath}/project-model-add.jsp';" value='添加新模块' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->
<form name='form3' action='' method='get'>
<input type='hidden' name='dopost' value='' />
<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='skin/images/wbg.gif' align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>搜索条件：</td>
          <td width='160'>
          <select name='cid' style='width:150px'>
          <option value='0'>选择类型...</option>
          	<option value='1'>项目名称</option>
          	<option value='2'>需求名称</option>
          	<option value='3'>模块名称</option>
          </select>
        </td>
        <td width='70'>
          关键字：
        </td>
        <td width='160'>
          	<input type='text' name='keyword' value='' style='width:120px' />
        </td>
        <td width='110'>
    		<select name='orderby' style='width:120px'>
            <option value='id'>排序...</option>
            <option value='pubdate'>添加时间</option>
            <option value='pubdate'>修改时间</option>
      	</select>
        </td>
        <td>
          &nbsp;&nbsp;&nbsp;<input name="imageField" type="image" src="skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<!--  内容列表   -->
<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;模块列表&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">模块名称</td>
	<td width="10%">需求名称</td>
	<td width="10%">项目名称</td>
	<td width="10%">优先级</td>
	<td width="8%">添加时间</td>
	<td width="8%">修改时间</td>
	<td width="10%">操作</td>
</tr>
<tbody id="ttr">

</tbody>
<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >--%>
<%--	<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>--%>
<%--	<td>1</td>--%>
<%--	<td align="center"><a href=''><u>帐户管理模块</u></a></td>--%>
<%--	<td align="center"><a href=''><u>帐户管理需求分析</u></a></td>--%>
<%--	<td align="center"><a href=''><u>农业银行自助管理系统</u></a></td>--%>
<%--	<td>高</td>--%>
<%--	<td>2015-02-03</td>--%>
<%--	<td>2015-06-03</td>--%>
<%--	<td><a href="project-model-edit.jsp">编辑</a> | <a href="project-model-look.jsp">查看详情</a></td>--%>
<%--</tr>--%>


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