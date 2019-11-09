<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>附件管理</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/pro/showAllAttachment',
                dataType: 'json',
                success: function (rs) {
                    console.info(rs);
                    $(rs).each(function (index, item) {
                        var tr ="<tr align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\">\n" +
                            "            <td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
                            "            <td>"+item.id+"</td>\n" +
                            "            <td>"+item.attname+"</td>\n" +
                            "            <td align=\"center\"><a href=''><u>"+item.project.pname+"</u></a></td>\n" +
                            "            <td>2019-09-11</td>\n" +
                            "            <td>2019-09-11</td>\n" +
                            "            <td><a href='${pageContext.request.contextPath}/pro/downloadAtt?filename="+item.path+"'>下载</a> |<a href=\"#\">删除</a> |<a href=\"project-file-edit.jsp\">编辑</a> | <a href=\"project-file-look.jsp\">查看详情</a></td>\n" +
                            "        </tr>";
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
                    <td>
                        当前位置:项目管理>>附件管理
                    </td>
                    <td>
                        <input type='button' class="coolbg np" onClick="location='project-file-add.jsp';"
                               value='添加新附件'/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--  搜索表单  -->
<form name='form3' action='' method='get'>
    <input type='hidden' name='dopost' value=''/>
    <table width='98%' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
        <tr bgcolor='#EEF4EA'>
            <td background='skin/images/wbg.gif' align='center'>
                <table border='0' cellpadding='0' cellspacing='0'>
                    <tr>
                        <td width='90' align='center'>搜索条件：</td>
                        <td width='160'>
                            <select name='cid' style='width:150px'>
                                <option value='0'>选择类型...</option>
                                <option value='1'>附件名称</option>
                                <option value='1'>项目名称</option>
                            </select>
                        </td>
                        <td width='70'>
                            关键字：
                        </td>
                        <td width='160'>
                            <input type='text' name='keyword' value='' style='width:120px'/>
                        </td>
                        <td width='110'>
                            <select name='orderby' style='width:120px'>
                                <option value='id'>排序...</option>
                                <option value='pubdate'>添加时间</option>
                                <option value='pubdate'>修改时间</option>
                            </select>
                        </td>
                        <td>
                            <input name="imageField" type="image" src="skin/images/frame/search.gif"
                                   width="45" height="20" border="0" class="np"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<!--  内容列表   -->
<form name="form2">

    <table width="98%" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;附件列表&nbsp;</td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="22">
            <td width="4%">选择</td>
            <td width="6%">序号</td>
            <td width="15%">附件名称</td>
            <td width="15%">所属项目</td>
            <td width="8%">上传时间</td>
            <td width="8%">修改时间</td>
            <td width="13%">操作</td>
        </tr>
        <tbody id="ttr"></tbody>
<%--        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">--%>
<%--            <td><input name="id" type="checkbox" id="id" value="101" class="np"></td>--%>
<%--            <td>${att.id}</td>--%>
<%--            <td>${att.attname}</td>--%>
<%--            <td align="center"><a href=''><u>${att.project.pname}</u></a></td>--%>
<%--            <td><%= new Date() %></td>--%>
<%--            <td><%= new Date() %></td>--%>
<%--            <td><a href="${pageContext.request.contextPath}/attachment/download?path=${att.path}">下载</a> |<a href="#">删除</a> |<a href="project-file-edit.jsp">编辑</a> | <a href="project-file-look.jsp">查看详情</a></td>--%>
<%--        </tr>--%>

        <tr bgcolor="#FAFAF1">
            <td height="28" colspan="12">
                &nbsp;
                <a href="" class="coolbg">全选</a>
                <a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="" class="coolbg">&nbsp;删除&nbsp;</a>
                <a href="${pageContext.request.contextPath}/attachment/output" class="coolbg">&nbsp;导出Excel&nbsp;</a>
            </td>
        </tr>
        <tr align="right" bgcolor="#EEF4EA">
            <td height="36" colspan="12" align="center"><!--翻页代码 --></td>
        </tr>
    </table>

</form>


</body>
</html>