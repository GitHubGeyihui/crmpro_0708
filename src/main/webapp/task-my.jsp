<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>我的任务信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript">
        //显示有模块的项目
        $(function () {
            showInfo(4);
        });
        function showInfo(obj) {
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/usual/getTaskByEid?mark=5',
                data: {"mark": obj},
                dataType: 'json',
                success: function (rs) {
                    console.info(rs);
                    $(".qq").remove();
                    $(rs).each(function (index, item) {
                        var status = item.status;
                        var newstatus = "";
                        var a = "<a>任务详情</a>";

                        if (status == 0) {
                            newstatus = "未接收";
                            a += "| <a href='${pageContext.request.contextPath}/usual/updateTaskStatus?id="+item.id+"&status=1'>接受任务</a> | <a href='task-edit.jsp?id="+item.id+"&eid="+item.employee2.eid+"'>调节任务申请</a>"
                        }
                        if (status == 1) {
                            newstatus = "已接收";
                            a += " |  <a href='${pageContext.request.contextPath}/usual/updateTaskStatus?id="+item.id+"&status=2'>提交任务</a>"
                        }
                        if (status == 2) {
                            newstatus = "已完成";
                        }
                        var opt = "<tr class='qq' align='center' bgcolor=\"#FFFFFF\" onMouseMove=\"javascript:this.bgColor='#FCFDEE';\" onMouseOut=\"javascript:this.bgColor='#FFFFFF';\" height=\"22\" >\n" +
                            "\t<td><input name=\"id\" type=\"checkbox\" id=\"id\" value=\"101\" class=\"np\"></td>\n" +
                            "\t<td>" + item.id + "</td>\n" +
                            "\t<td>" + item.tasktitle + "</td>\n" +
                            "\t<td align=\"center\">" + item.employee.ename + "</td>\n" +
                            "\t<td align=\"center\">" + newstatus + "</td>\n" +
                            "\t<td align=\"center\">" + item.level + "</td>\n" +
                            "\t<td>2015-02-03</td>\n" +
                            "\t<td>2015-02-15</td>\n" +
                            "\t<td>"+a+"</td>\n" +
                            "</tr>";
                        //添加到指定行后面
                        $("#pro").append(opt);
                    });
                },
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
                    <td>
                        当前位置:任务管理>>我的任务信息
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--  搜索表单  -->
<form name='form3' action='' method='get'>
    <input type='hidden' name='dopost' value=''/>
    <table width='98%' border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center"
           style="margin-top:8px">
        <tr bgcolor='#EEF4EA'>
            <td background='skin/images/wbg.gif' align='center'>
                <table border='0' cellpadding='0' cellspacing='0'>
                    <tr>
                        <td width='90' align='center'>搜索条件：</td>
                        <td width='160'>
                            <select name='cid' style='width:150px'>
                                <option value='0'>选择类型...</option>
                                <option value='1'>任务标题</option>
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
                                <option value='pubdate'>开始时间</option>
                                <option value='pubdate'>结束时间</option>
                            </select>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;<input name="imageField" type="image" src="skin/images/frame/search.gif"
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

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;我的任务信息&nbsp;</td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="22" id="aaa">
            <td width="4%">选择</td>
            <td width="6%">序号</td>
            <td width="10%">任务标题</td>
            <td width="10%">分配者</td>
            <td width="8%">状态</td>
            <td width="8%">优先级</td>
            <td width="8%">开始时间</td>
            <td width="8%">结束时间</td>
            <td width="15%">操作</td>
        </tr>
<tbody id="pro"></tbody>

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