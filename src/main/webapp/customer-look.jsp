<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>查看客户信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/cus/getOneByPk',
                data: {"pk":${param.cid}},
                dataType: "json",
                success: function (rs) {
                    $("#cname").text(rs.comname);
                    $("#cp").text(rs.companyperson);
                    $("#pk").text(rs.id);
                    // 将其他字段的内容补充完整
                    $("#address").text(rs.comaddress);
                    $("#dh").text(rs.comphone);
                    $("#cm").text(rs.camera);
                    $("#pt").text(rs.present);
                    $("#rk").text(rs.remark);
                }
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
                        当前位置:客户信息管理>>查看客户信息
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<form name="form2">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;查看客户信息&nbsp;</td>
        </tr>
        <tr>
        <td align="right" bgcolor="#FAFAF1" height="22">公司名称：</td>
        <td id="cname" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
        </td>
    </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">公司联系人：</td>
            <td id="cp" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">公司地址：</td>
            <td id="address" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">联系电话：</td>
            <td id="dh" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">座机：</td>
            <td id="cm" align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">公司简介：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <p id="pt"></p>
            </td>
        </tr>

        <tr>
            <td align="right" bgcolor="#FAFAF1">备注：</td>
            <td  id="rk" colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                 onMouseOut="javascript:this.bgColor='#FFFFFF';">
            </td>
        </tr>

        <tr bgcolor="#FAFAF1">
            <td height="28" colspan=4 align=center>
                &nbsp;
                <a href="customer.jsp" class="coolbg">返回</a>
            </td>
        </tr>
    </table>

</form>


</body>
</html>