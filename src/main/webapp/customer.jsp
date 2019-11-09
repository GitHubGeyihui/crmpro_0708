<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>客户信息管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>

    <script type="application/javascript">
        //全选
        function  quan(){
            //名字是cid checkbox
            var arr = $("input[type='checkbox']");
            for(var i=0;i<arr.length;i++){
                arr[i].checked=true;
            }
        }
        //反选
        function fan(){
            //名字是cid checkbox
            var arr = $("input[type='checkbox']");
            for(var i=0;i<arr.length;i++){
                arr[i].checked=!arr[i].checked;
            }
        }

        function batchDelete(){
            // 被选中的复选框的标签
            var arr = $("input:checked");
            if(arr.length>0){
                $("#form3").submit();
            }else{
                alert("选中删除的数据");
            }

        }
        function  search() {
            var kc = $("#info").val();
            console.info(kc);
            if(kc.length>0){
                $("#form5").submit();
            }else{
                layer.alert('输入搜索关键字', {icon: 6});
                return false;
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
                    <td >
                        当前位置:客户信息管理>>客户信息
                    </td>
                    <td>
                        <input type='button' class="coolbg np" onClick="location='${pageContext.request.contextPath}/customer-add.jsp';" value='添加客户信息' />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--  搜索表单  -->
<form action="${pageContext.request.contextPath}/cus/showInfo" id="form5">
     <input type="hidden" value="2" name="status">
    <table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
        <tr bgcolor='#EEF4EA'>
            <td background='skin/images/wbg.gif' align='center'>
                <table border='0' cellpadding='0' cellspacing='0'>
                    <tr>
                        <td width='90' align='center'>搜索条件：</td>
                        <td width='160'>
                            <select id="mt" name='kinds' style='width:150px'>
                                <option value='0'>选择类型...</option>
                                <option value='1'>客户所在公司名称</option>
                                <option value='2'>联系人姓名</option>
                            </select>
                        </td>
                        <td width='70'>
                            关键字：
                        </td>
                        <td width='160'>
                            <input type='text' id="info"  name='keyCode' value="" style='width:120px' />
                        </td>
                        <td width='110'>
                            <select id="mtime" name='mark' style='width:120px'>
                                <option value='0'>排序...</option>
                                <option value='1'>编号</option>
                            </select>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;<input name="imageField" onclick="return search()" type="image" src="${pageContext.request.contextPath}/skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<!--  内容列表   -->
<form name="form2" id="form3"  action="${pageContext.request.contextPath}/cus/batchDelete">

    <table id="infotb" width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
        <tr bgcolor="#E7E7E7" >
            <td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;需求列表&nbsp;</td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="22" id="tr2">
            <td width="4%">选择</td>
            <td width="6%">序号</td>
            <td width="10%">联系人</td>
            <td width="10%">公司名称</td>
            <td width="8%">添加时间</td>
            <td width="8%">联系电话</td>
            <td width="10%">操作</td>
        </tr>
        <c:forEach items="${requestScope.customers.list}" var="cus">
            <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
                <td><input name="cid" type="checkbox" value="${cus.id}" class="np"></td>
                <td>${cus.id}</td>
                <td>${cus.companyperson}</td>
                <td align="center">${cus.comname}</td>
                <td><fmt:formatDate value="${cus.addtime}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                <td>${cus.comphone}</td>
                <td><a href="${pageContext.request.contextPath}/customer-edit.jsp?cid=${cus.id}">编辑</a> | <a href="${pageContext.request.contextPath}/customer-look.jsp?cid=${cus.id}">查看详情</a></td>
            </tr>
        </c:forEach>

        <tr bgcolor="#FAFAF1">
            <td height="28" colspan="12">
                &nbsp;
                <a href="javascript:quan()" class="coolbg">全选</a>
                <a href="javascript:fan()" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:batchDelete()" class="coolbg">&nbsp;删除&nbsp;</a>
                <a href="${pageContext.request.contextPath}/cus/OutExcel" class="coolbg">&nbsp;导出Excel&nbsp;</a>
            </td>
        </tr>
        <tr align="right" bgcolor="#EEF4EA">
            <td height="36" colspan="12" align="center">
                当前是第${requestScope.customers.pageNum}页
                <a href="showInfo?pageNum=1">首页</a>
                <c:if test="${requestScope.customers.pageNum!=1}">
                    <a href="showInfo?pageNum=${requestScope.customers.prePage}">上一页</a>
                </c:if>
                <c:if test="${requestScope.customers.pageNum!=requestScope.customers.pages}">
                    <a href="showInfo?pageNum=${requestScope.customers.nextPage}">下一页</a>
                </c:if>
                <a href="showInfo?pageNum=${requestScope.customers.pages}">尾页</a>
                共有${requestScope.customers.pages}页
            </td>
        </tr>
    </table>
</form>
</body>
</html>