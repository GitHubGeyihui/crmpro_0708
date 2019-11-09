<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/3
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        // 弹窗
        function showWindow() {
            $('#showdiv').show();  //显示弹窗
            $('#cover').css('display','block'); //显示遮罩层
            $('#cover').css('height',document.body.clientHeight+'px'); //设置遮罩层的高度为当前页面高度
        }
        // 关闭弹窗
        function closeWindow() {
            $('#showdiv').hide();  //隐藏弹窗
            $('#cover').css('display','none');   //显示遮罩层
        }
    </script>
</head>
<body>


  <a href="javascript:showWindow()">点击</a>

<!-- 遮罩层 -->
<div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">

</div>
<!-- 弹窗 -->
<div id="showdiv" style="width: 80%; margin: 0 auto; height: 9.5rem; border: 1px solid #999; display: none; position: absolute; top: 40%; left: 10%; z-index: 3; background: #fff">
    <!-- 标题 -->
    <div style="background: #F8F7F7; width: 100%; height: 2rem; font-size: 0.65rem; line-height: 2rem; border: 1px solid #999; text-align: center;" >
        提示
    </div>
    <!-- 内容 -->
    <div style="text-indent: 50px; height: 4rem; font-size: 0.5rem; padding: 0.5rem; line-height: 1rem; ">
        js弹窗 js弹出DIV,并使整个页面背景变暗
    </div>
    <!-- 按钮 -->
    <div style="background: green; width: 80%; margin: 0 auto; height: 1.5rem; line-height: 1.5rem; text-align: center;color: #fff;margin-top: 1rem; -moz-border-radius: .128rem; -webkit-border-radius: .128rem; border-radius: .128rem;font-size: .59733rem;" onclick="closeWindow()">
        确 定
    </div>
</div>



</body>
</html>
