<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.5/layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
        layui.use('table', function () {
            var table = layui.table;

            table.render({
                elem: '#test'
                , limit: 2
                , url: '/cus/layuishowInfo'
                , cols: [[
                    {field: 'id', width: 80, title: '编号', sort: true}
                    , {field: 'comname', width: 80, title: '公司名称'}
                    , {field: 'companyperson', width: 80, title: '联系人名称', sort: true}
                    , {field: 'comaddress', width: 80, title: '地址'}
                    , {field: 'comphone', title: '电话'}
                    , {field: 'camera', title: '座机', sort: true}
                    , {field: 'present', title: '描述', sort: true}
                    , {field: 'remark', title: '备注'}
                ]]
                , page: true

            });
        });
    </script>
</head>
<body>
<table class="layui-hide" id="test">

</table>
</body>
</html>