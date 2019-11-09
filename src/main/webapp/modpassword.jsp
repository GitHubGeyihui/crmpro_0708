<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript">

        function checkSp(obj) {
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/emp/checkPass',
                data: {"password": obj},
                dataType: 'json',
                success: function (rs) {
                    if (rs.flag) {
                        $("#ops").html("<font color='#006400'>原密码输入正确</font>");
                    } else {
                        $("#ops").html("<font color='#dc143c'>原密码输入错误</font>");
                        $("#sp").val("");
                    }
                }
            });
        }

        function checkNewPass(obj) {
            var patrn = /^[0-9]{4,8}$/;
            if (patrn.exec(obj)) {
                $("#nps").html("<font color='#006400'>新密码输入正确</font>");

            } else {
                $("#nps").html("<font color='#dc143c'>新密码输入格式错误（4-8个）</font>");
                $("#newpass").val("");
            }

        }

        function rpCheckNewPass(obj) {
            var np = $("#newpass").val()
            if (np === obj) {
                $("#rps").html("<font color='#006400'>重复密码输入正确</font>");
            } else {
                $("#rps").html("<font color='#dc143c'>重复密码输入错误</font>");
                $("#rp").val("");
            }
        }

        function commit() {
            var p1 = $("#sp").val();
            var p2 = $("#newpass").val();
            var p3 = $("#rp").val();
            if (p1 != null && p2 != null && p3 != null && p1.length > 0 && p2.length > 0 && p3.length > 0) {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/emp/modifyPass',
                    data: {"password": p2},
                    dataType: 'json',
                    success: function (rs) {
                        console.info(rs);
                        if (rs.flag) {
                            parent.window.location.href = "${pageContext.request.contextPath}/login.jsp";
                        } else {
                            alert("error");
                        }
                    }
                });
            } else {
                alert("表单中的值为必填项");
                return;
            }

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
                        当前位置:我的信息>>修改密码
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<form name="form2" action="${pageContext.request.contextPath}/emp/modifyPass" id="form20">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;修改密码&nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">原密码：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input type="text" id="sp" onblur="checkSp(this.value)"/>
                <div id="ops"></div>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">新密码：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input name="password" id="newpass" onblur="checkNewPass(this.value)"/>
                <div id="nps"></div>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">重复密码：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input name="repassword" id="rp" onblur="rpCheckNewPass(this.value)"/>
                <div id="rps"></div>
            </td>
            </td>
        </tr>


        <tr bgcolor="#FAFAF1">
            <td height="28" colspan=4 align=center>
                &nbsp;
                <a href="javascript:commit()" class="coolbg">保存</a>
            </td>
        </tr>
    </table>

</form>


</body>
</html>