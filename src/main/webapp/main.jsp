<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>main</title>
    <base target="_self">
    <link rel="stylesheet" type="text/css" href="skin/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="skin/css/main.css"/>

    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        // 将最新的3条数据展示到页面
        $(function () {
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/usual/showAllNotice?mark=1',
                dataType: 'json',
                success: function (resultData) {
                    $(resultData).each(function (index, item) {
                        var dateInfo = new Date(item.ndate);
                        var di = dateInfo.getFullYear() + "-" + (dateInfo.getMonth() + 1) + "-" + dateInfo.getDate();
                        var li = "<li class='ue-clear'><span>" + di + "</span>&nbsp;&nbsp;&nbsp;<a href='javascript:showWindow(" + item.nid + ")'class='notice-title'>" + item.ntitle + "</a></li><p>";
                        $("#notices").append(li);
                    });
                },

            });

            //异步加载我们的帖子 6个
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/usual/getOneByEid?mark=2',
                dataType: 'json',
                success: function (resultData) {
                    var i = 0;
                    var tr = "";
                    $(resultData).each(function (index, item) {
                        i++;
                        if (index % 3 == 0) {
                            tr = "<tr>";
                        }
                        var newdate = new Date(item.createtime);
                        tr += "<td><ul class='notice-list'> <li class='ue-clear'> <span id='p'> <img src='${pageContext.request.contextPath}/forumpostPic/" + i + ".png' height='50px' width='50px'/> </span> <br><font>发布时间：" + newdate.getFullYear() + "-" + (newdate.getMonth() + 1) + "-" + newdate.getDate() + "</font><br>标题： <a  onmouseover='javascript:alt()' href='${pageContext.request.contextPath}/usual/getForumpostByid?id=" + item.forumid + " 'class='notice-title'>" + item.forumtitle + "</a><br></li> </ul></td>";
                        if (index != 0 && i % 3 == 0) {
                            var ttr = tr + "</tr>";
                            $("#ff").before(ttr);
                        }
                    });
                    if (i % 3 != 0) {
                        var ttr2 = tr + "</tr>";
                        $("#ff").before(ttr2);
                    }
                },
            });
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/usual/getTaskByEid?mark=5',
                dataType: 'json',
                success: function (rs) {
                    console.info(rs.length);
                    $("#mytask").text(rs.length);
                },
            });
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/usual/showMsg',
                dataType: 'json',
                success: function (rs) {
                    console.info(rs.length);
                    $("#myMessage").text(rs.length);
                },
            });

        });

        // 弹窗
        function showWindow(obj) {
            $('#showdiv').show();  //显示弹窗
            $('#cover').css('display', 'block'); //显示遮罩层
            $('#cover').css('height', document.body.clientHeight + 'px'); //设置遮罩层的高度为当前页面高度

            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/usual/showOneInfo',
                data: {"nid": obj},
                dataType: 'json',
                success: function (resultData) {
                    console.log(resultData)
                    $("#ntitle").text(resultData.ntitle);
                    $("#content").text(resultData.remark);
                }
            });
        }

        // 关闭弹窗
        function closeWindow() {
            $('#showdiv').hide();  //隐藏弹窗
            $('#cover').css('display', 'none');   //显示遮罩层
        }

    </script>


</head>
<body leftmargin="8" topmargin='8'>
<!-- 遮罩层 -->
<div id="cover"
     style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">

</div>
<!-- 弹窗 -->
<div id="showdiv"
     style="width: 60%; margin: 0 auto; height:500px; border: 1px solid #999; display: none; position: absolute; top: 20%; left: 20%; z-index: 3; background: #fff">
    <!-- 标题 -->
    <div id="ntitle"
         style="background: #F8F7F7; width: 100%; height: 2rem; font-size: 0.65rem; line-height: 2rem; border: 1px solid #999; text-align: center;">

    </div>
    <!-- 内容 -->
    <div id="content" style="text-indent: 50px; height: 4rem; font-size: 0.5rem; padding: 0.5rem; line-height: 1rem; ">

    </div>
    <!-- 按钮 -->
    <div style="background: green; width: 10%; margin: 0 auto; height: 1.5rem; line-height: 1.5rem; text-align: center;color: #fff;margin-top: 28rem; -moz-border-radius: .128rem; -webkit-border-radius: .128rem; border-radius: .128rem;font-size: .59733rem;"
         onclick="closeWindow()">
        关闭
    </div>
</div>


<table width="98%" border="0" align="center" cellpadding="0"
       cellspacing="0">
    <tr>
        <td>
            <div style='float: left'>
                <img height="14" src="skin/images/frame/book1.gif" width="20"/>&nbsp;欢迎使用项目平台管理系统
            </div>
            <div style='float: right; padding-right: 8px;'>
                <!--  //保留接口  -->
            </div>
        </td>
    </tr>
    <tr>
        <td height="1" background="skin/images/frame/sp_bg.gif"
            style='padding: 0px'></td>
    </tr>
</table>
<br>
<table width="98%" align="center" border="0" cellpadding="4"
       cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px">
    <tr>
        <td colspan="2" background="skin/images/frame/wbg.gif"
            bgcolor="#EEF4EA" class='title'>
            <div style='float: left'>
                <span>快捷操作</span>
            </div>
            <div style='float: right; padding-right: 10px;'></div>
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="30" colspan="2" align="center" valign="bottom">
            <table
                    width="100%" border="0" cellspacing="1" cellpadding="1">
                <tr>
                    <td width="15%" height="31" align="center"><img
                            src="skin/images/frame/qc.gif" width="90" height="30"/></td>
                    <td width="85%" valign="bottom">
                        <div class='icoitem'>
                            <div class='ico'>
                                <img src='skin/images/frame/addnews.gif' width='16' height='16'/>
                            </div>
                            <div class='txt'>
                                <a href='project-base.html'><u>查看项目信息</u></a>
                            </div>
                        </div>
                        <div class='icoitem'>
                            <div class='ico'>
                                <img src='skin/images/frame/menuarrow.gif' width='16'
                                     height='16'/>
                            </div>
                            <div class='txt'>
                                <a href='task-my.html'><u>查看任务</u></a>
                            </div>
                        </div>
                        <div class='icoitem'>
                            <div class='ico'>
                                <img src='skin/images/frame/manage1.gif' width='16' height='16'/>
                            </div>
                            <div class='txt'>
                                <a href='forum.jsp'><u>我的帖子</u></a>
                            </div>
                        </div>
                        <div class='icoitem'>
                            <div class='ico'>
                                <img src='skin/images/frame/file_dir.gif' width='16'
                                     height='16'/>
                            </div>
                            <div class='txt'>
                                <a href='message-give.html'><u>收件箱</u></a>
                            </div>
                        </div>
                        <div class='icoitem'>
                            <div class='ico'>
                                <img src='skin/images/frame/part-index.gif' width='16'
                                     height='16'/>
                            </div>
                            <div class='txt'>
                                <a href='info.html'><u>个人信息</u></a>
                            </div>
                        </div>
                        <div class='icoitem'>
                            <div class='ico'>
                                <img src='skin/images/frame/manage1.gif' width='16' height='16'/>
                            </div>
                            <div class='txt'>
                                <a href='modpassword.html'><u>修改密码</u></a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<br>

<table width="98%" align="center" border="0" cellpadding="3"
       cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom: 8px; margin-top: 8px;">
    <tr>
        <td background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
            class='title'><span>待完成任务</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td>您有<a href="${pageContext.request.contextPath}/task-my.jsp" id="mytask"><font color="red"></font></a>个任务未完成……&nbsp;
        </td>
    </tr>
</table>

<br>

<table width="98%" align="center" border="0" cellpadding="3"
       cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom: 8px; margin-top: 8px;">
    <tr>
        <td background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
            class='title'><span>未读消息</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td>您有<a href="${pageContext.request.contextPath}/message-give.jsp"id="myMessage"><font color="red"></font></a>条未读消息……&nbsp;
        </td>
    </tr>
</table>


<br>


<table width="98%" align="center" border="0" cellpadding="3"
       cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom: 8px; margin-top: 8px;">
    <tr>
        <td background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
            class='title'><span>通知公告</span><a href='#' style='padding-left: 1260px'>查看更多...</a></td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td>
            <ul class="notice-list" id="notices">
                <%--
                <li class="ue-clear">
                <span>12-15</span>&nbsp;&nbsp;&nbsp;<a href="javascript:showWindow()"class="notice-title">中国移动关于设立作风建设监督举报电话的公告</a>
                </li>
                <p>
                --%>

            </ul>
        </td>
    </tr>
</table>

<br>


<table width="98%" align="center" border="0" cellpadding="3"
       cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom: 8px; margin-top: 8px;">
    <tr>
        <td colspan="3" background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
            class='title'>
            <span>员工论坛</span><a href='${pageContext.request.contextPath}/forum-showmyself.jsp'
                                style='padding-left: 1260px'>查看更多...</a>
        </td>
    </tr>
    <%--   <% for (int i = 0; i < 12; i++) {
           if (i % 3 == 0) {%>
       <tr bgcolor="#FFFFFF">
           <%}%>

           <td>
               <ul class="notice-list">
                   <li class="ue-clear">
                       <span><img src="${pageContext.request.contextPath}/forumpostPic/1.png" height="50px"
                                  width="50px"/></span> 发布时间：2018-12-25
                       <a href="role.jsp" class="notice-title">招租信息</a>
                   </li>
               </ul>
           </td>
           <%} %>
       </tr>--%>
    <tr id="ff"></tr>
</table>

</body>
</html>