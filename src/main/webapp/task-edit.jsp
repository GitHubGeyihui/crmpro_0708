<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>编辑任务</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript">
        $(function () {
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/usual/getTaskById',
                data: {"id":${param.id}},
                dataType: 'json',
                success: function (rs) {
                    console.info(rs);
                    $("#title").val(rs.tasktitle);
                },
            });

            //获取接替人员的信息
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/emp/showEmpInfo',
                data: {"eid":${param.eid}, "mark": 3},
                dataType: "json",
                success: function (rs) {
                    $(rs).each(function (index, item) {
                        var op = "<option value=" + item.eid + ">" + item.ename + "</option>";
                        $("#emp").append(op);
                    });
                }
            });

        });
        function commit() {
            $("#form8").submit();
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
                    <td>
                        当前位置:任务管理>>编辑任务
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<form name="form2" id="form8" action="${pageContext.request.contextPath}/usual/updateTaskStatus" method="post">
    <!-- 任务主键ID-->
<input type="hidden" value="${param.id}" name="id">
    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑任务&nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">任务标题：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input id="title" readonly="true"/>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input value="2015-02-03" readonly="true"/>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">结束时间 ：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input value="2015-02-15" readonly="true"/>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">执行者：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="emp" name="empFk2">
                    <option value="0">选择接受任务的人</option>
                </select></td>
        </tr>

        <tr>
            <td align="right" bgcolor="#FAFAF1">调节方案：</td>
            <td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';">
                <textarea rows=10 cols=130 name="remark">暂无</textarea>
            </td>
        </tr>


        <tr bgcolor="#FAFAF1">
            <td height="28" colspan=4 align=center>&nbsp;
                <a href="javascript:commit()" class="coolbg">保存</a>
            </td>
        </tr>
    </table>

</form>


</body>
</html>