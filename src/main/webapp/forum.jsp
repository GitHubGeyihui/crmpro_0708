<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>main</title>
    <base target="_self">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/main.css"/>

    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //异步加载我们的帖子 6个
            $.ajax({
                type:'GET',
                url:'${pageContext.request.contextPath}/usual/getOneByEid',
                dataType:'json',
                success:function(resultData){
                    console.info(resultData);
                    var i =0;
                    var tr ="";
                    $(resultData).each(function(index,item){
                        i++;
                        if(index %3 ==0){
                            tr ="<tr>";
                        }
                        var newdate = new Date(item.createtime);
                        tr += "<td><ul class='notice-list'> <li class='ue-clear'> <span id='p'> <img src='${pageContext.request.contextPath}/forumpostPic/"+i+".png' height='50px' width='50px'/> </span> <br><font>发布时间："+newdate.getFullYear()+"-"+(newdate.getMonth()+1)+"-"+newdate.getDate()+"</font><br>标题： <a  onmouseover='javascript:alt()' href='${pageContext.request.contextPath}/usual/getForumpostByid?id="+item.forumid+" 'class='notice-title'>"+item.forumtitle+"</a><br> </li> </ul></td>";
                        if(index!=0 && i%3 ==0 ) {
                            var ttr = tr + "</tr>";
                            $("#ff").before(ttr);
                        }
                    });
                    if(i %3 !=0){
                        var ttr2 = tr + "</tr>";
                        $("#ff").before(ttr2);
                    }
                },
            });
        });



    </script>

</head>
<body leftmargin="8" topmargin='8'>

<table width="98%" align="center" border="0" cellpadding="3"
       cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom: 8px; margin-top: 8px;">
    <tr>
        <td colspan="3" background="skin/images/frame/wbg.gif" bgcolor="#EEF4EA"
            class='title'>
            <span>论坛分类</span> &nbsp; &nbsp;&nbsp;|<span>生活广场</span> |<span>租房信息</span><a href='${pageContext.request.contextPath}/forum-add.jsp' style='padding-left: 1260px'><font
                size="5">发帖</font></a>
        </td>
    </tr>
    <% for (int i = 0; i < 12; i++) {
        if (i % 3 == 0) {%>
    <tr bgcolor="#FFFFFF">
        <%}%>

        <td>
            <ul class="notice-list">
                <li class="ue-clear">
                    <span><img src="${pageContext.request.contextPath}/forumpostPic/10.png" height="50px"
                               width="50px"/></span> 发布时间：2018-12-25
                    <a href="role.jsp" class="notice-title">招租信息</a>
                </li>
            </ul>
        </td>
        <%} %>

    </tr>
</table>

</body>
</html>