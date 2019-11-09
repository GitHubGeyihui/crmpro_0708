<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>添加功能信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript">
        //显示有模块的项目
        $(function (){
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/pro/showProAndOtherInfo?mark=2',
                dataType: 'json',
                success: function (rs) {
                    console.info(rs);
                    $(rs).each(function (index,item) {
                        var opt = "<option value="+item.pid+">"+item.pname+"</option>";
                        //添加到指定行后面
                        $("#pro").append(opt);
                    });
                },
            });
        })

            function addayalisys(obj) {
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/pro/showAnalysisAndModuleByPid',
                    data: {"pid": obj},
                    dataType: 'json',
                    success: function (rs) {
                        $("#analysistitle").val(rs.title);
                        console.info(rs);
                        $(rs.moduleList).each(function (index, item) {
                            var opt="<option value="+item.id+">"+item.modname+"</option>";
                            $("#anid").append(opt);
                        })
                    },
                });
            };
        //校验当前项目下的该模块是否已添加
        function checkFunctionName(obj){
            if (obj.length>0){
                $.ajax({
                    type:'GET',
                    url:'${pageContext.request.contextPath}/pro/checkFunction',
                    data:{"functionName":obj,"mid":$("#anid").val()},
                    dataType:'json',
                    success:function(rs){
                        if(rs.flag){
                            alert(rs.message);
                            $("#mn").val("");
                        }else{
                            alert(rs.message);
                        }
                    },
                });
            }else {
                alert("请添加内容")
            }
        }
        //添加功能
        function commit() {
            $("#form5").submit();
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
                        当前位置:项目管理>>添加功能信息
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<form name="form2" action="${pageContext.request.contextPath}/pro/saveFunctionInfo" method="post" id="form5">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;添加新功能&nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">选择项目：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="pro" name="proname" onchange="addayalisys(this.value)">
                    <option value="0">选择项目</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">需求名称 ：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input type="text" id="analysistitle" readonly="true" name="qq">

            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">选择模块：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="anid" name="modeleFk">
                    <option value="0">选择添加功能的模块</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">功能名称：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input type="text" name="functionname" id="gn" onblur="checkFunctionName(this.value)"/>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select name="level">
                <option value="高">高</option>
                <option value="中">中</option>
                <option value="低">低</option>
                <option value="暂缓">暂缓</option>
            </select></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">简单描述：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><textarea rows=10 cols=130
                                                                                      name="simpledis"></textarea></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">详细描述：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><textarea rows=15 cols=130
                                                                                      name="detaileddis"></textarea>
            </td>
        </tr>

        <tr>
            <td align="right" bgcolor="#FAFAF1">备注：</td>
            <td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';">
                <textarea rows=10 cols=130 name="remark"></textarea>
            </td>
        </tr>


        <tr bgcolor="#FAFAF1">
            <td height="28" colspan=4 align=center>
                &nbsp;
                <a href="javascript:commit()" class="coolbg">保存</a>
                <a href="project-function.jsp" class="coolbg">返回</a>
            </td>
        </tr>
    </table>

</form>


</body>
</html>