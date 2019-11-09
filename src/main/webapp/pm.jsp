<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>用户管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/script/docs.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ztree/zTreeStyle.css">
    <script type="text/javascript">
        $(function(){
            var setting = {
                async: {
                    enable: true,
                    url:"${pageContext.request.contextPath}/auth/showAllSources",
                    autoParam:["id", "name=n", "level=lv"]
                },

                view: {
                    //鼠标移入事件
                    addHoverDom: function(treeId, treeNode){
                            var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                        //aObj.attr("href", "javascript:;");
                        if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
                        var s = '<span id="btnGroup'+treeNode.tId+'">';
                        if ( treeNode.level == 0 ) {
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')"  >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                        } else if ( treeNode.level == 1 ) {
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')"  title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                            if (treeNode.children.length == 0) {
                                s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                            }
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')"  >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                        } else if ( treeNode.level == 2 ) {
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')"  title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                        }
                        s += '</span>';
                        aObj.after(s);
                    },
                    //鼠标移除事件
                    removeHoverDom: function(treeId, treeNode){
                        $("#btnGroup"+treeNode.tId).remove();
                    }
                }
            };
            $.fn.zTree.init($("#permissionTree"), setting);

        });


        //添加节点
        function addNode(id){
            window.location.href = "${pageContext.request.contextPath}/pm-add.jsp?id="+id;
        }



        //编辑节点 更新节点
        function editNode(id) {
            window.location.href = "${pageContext.request.contextPath}/pm-edit.jsp?id="+id;
        }

        //删除节点
        function deleteNode(id){
            layer.confirm("删除资源信息, 是否继续",  {icon: 3, title:'提示'}, function(cindex){
                // 删除选择的用户信息
                $.ajax({
                    type : "POST",
                    url  : "${pageContext.request.contextPath}/auth/deleteSources",
                    data : {id : id},
                    success : function(result) {
                        if (result.flag) {
                            // 刷新数据
                            var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
                            //刷新当前树
                            treeObj.reAsyncChildNodes(null, "refresh");
                        } else {
                            layer.msg("资源信息删除失败", {time:2000, icon:5, shift:6}, function(){
                            });
                        }
                    }
                });
                layer.close(cindex);
            },function(cindex){
                layer.close(cindex);
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
                    <td >
                        当前位置:权限管理>>权限维护
                    </td>
                    <td>

                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>


<!--  内容列表   -->
<form name="form2">
    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;权限列表&nbsp;</td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="22">
            <td>
                <div class="panel-body">
                    <ul id="permissionTree" class="ztree"></ul>
                </div>
            </td>
        </tr>

    </table>

</form>


</body>
</html>