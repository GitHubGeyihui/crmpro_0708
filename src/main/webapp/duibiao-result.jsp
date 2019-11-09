<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>对标管理</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/eacharjs/echarts.common.min.js"></script>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
    <tr>
        <td height="26" background="skin/images/newlinebg3.gif">
            <table width="58%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td >
                        当前位置:对标管理>>对标分析
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<div id="box" style="width:800px;height:600px;"></div>

<script type="application/javascript">
    var mychart=echarts.init($("#box")[0]);

    var option={
        title:{
            text:'营业额分析图'
        },
        legend:{
            data:['营业额']
        },
        xAxis:{
            data:[]
        },
        yAxis:{
            type:'value',
            axisLabel:{
                formatter:'{value}(亿)',
            },
        },
        series:[{
            name:'营业额',
            type:'bar',
            data:[]
        }],
    };
    mychart.setOption(option);
    //1、显示数据加载提示动画
    mychart.showLoading();
    //准备存储x轴数据，姓名数组
    var names=[];
    //准备成绩数组
    var scores=[];
    //2、启动ajax，请求数据
    $.ajax({
        type:'post',
        url:'${pageContext.request.contextPath}/db/showDaInfo?mark=3',
        dataType:'json',
        success:function(response){
            //判断返回值是否存在
            if(response){
                //json，遍历
                for(var i=0;i<response.length;i++){
                    var date = new Date(response[i].datime);
                    names.push(date.getFullYear()+"年");
                    scores.push(response[i].daturnover);
                }
                //隐藏加载动画
                mychart.hideLoading();
                //设置图表属性，把相关数据设置进去
                mychart.setOption({
                    xAxis:{
                        data:names
                    },
                    series:[{
                        name:'营业额',
                        type:'line',
                        data:scores
                    }]
                });
            }
        }
    });
</script>
</body>
</html>