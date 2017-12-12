<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pfwrittentestlist</title>
</head>
<style>
    #bigdiv{
        width: 100%;
        height: 700px;
        background-color: bisque;
        position: fixed;
        left: 0px;
        top: 0px;
    }
    #topdiv{
        width: 100%;
        height: 60px;
        background-color: gainsboro;
        border-bottom:1px solid black;
    }
    #leftdiv{
        width: 299px;
        height: 640px;
        position: relative;
        background-color: beige;
        border-right:1px solid black;
    }
    #rightdiv{
        width: 1300px;
        height: 640px;
        position: relative;
        bottom:640px;
        left: 300px;
        background-color: lavender;
    }
    .tablemargin{
        text-align: center;
    }
    #title{
        position:relative;
        left: 400px;
        font-size: 20px
    }
    #onlinetitle{
        width:1000px;
        height:50px;
    }
    #onlinetable{
        width:1000px;
        position:relative;
        top:20px;
        text-align:center;
    }

    /*层1的样式*/
    .div1 {
        /*本层要实现覆盖模式窗口以外全部内容的半透明效果*/
        background-color: #000000; /*背景色*/
        opacity: 0.5;
        position: absolute; /*绝对定位，必选，使层绝对依照top,left的标准显示，否则将不能实现覆盖*/
        top: 0; /*层与页面顶部距离*/
        left: 0; /*层与左侧边距离*/
        z-index: 10; /*当发生重叠时的优先级，数大的会覆盖数较小的，没进行设置的均可视为小于0*/
        display: none; /*层是否可见，初始化none不可见*/
        filter: Alpha(opacity=30); /*过滤颜色，设置透明度（可见度）30，数越小越透明*/
    }
    /*层2的样式*/
    .div2 {
        /*本层显示在最前端，其它控件均不可用*/
        width: 100%; /*显示宽度*/
        height: 100%; /*显示高度*/
        position: absolute; /*绝对定位*/
        z-index: 11; /*优先级*/
        display: none; /*是否显示*/
        border: 1px inset darkgray; /*边框：宽度，样式，颜色*/
        background-color: gainsboro; /*背景色*/
        /* opacity: 0.8;*/
    }

    #testdetailstable{
        width: 100%;
        height: 80px;
        margin: auto;
        text-align: center;
    }
    #titledetails{
        width: 100%;
        text-align: center;
    }
    #buttondiv{
        width: 200px;
        height: 50px;
        position: relative;
        left: 50px;
        top: 240px;
    }
    .answertext{
        width: 45px;
        height: 30px;
    }

</style>

<script type="text/javascript" language="JavaScript"></script>
<script>
    //显示的方法，说明：前缀的div1、div2、body等，均为Id值
    function show() {
        div1.style.display = "inline";//设置层1显示
        div1.style.width = bigdiv.clientWidth;//设置层1宽度等于body宽度，width=100%也可以，不过有一些误差，所以最好用这个
        div1.style.height = bigdiv.clientHeight;//设置层1高度满屏
        div2.style.display = "inline";//设置层2的显示
        div2.style.top = bigdiv.clientHeight / 2 - div2.clientHeight / 2;//设置层2的距顶位置居中算法
        div2.style.left = bigdiv.clientWidth / 2 - div2.clientWidth / 2;//设置层2的距左位置居中算法
    }

    //关闭显示
    function closeShow() {
        div1.style.display = "none";
        div2.style.display = "none";
    }
</script>


<body>
<div id="bigdiv">
    <div id="div1" class="div1"></div><!--这是要覆盖网页的层，不必写任何东西-->
    <div id="div2" class="div2">

        <table border="0" id="testdetailstable">
            <tr>
                <td>科目:PS综合测试</td>
                <td>开考时间:2017-11-21 9:29:06</td>
                <td colspan="2">考试时长:60分钟</td>
            </tr>
            <tr>
                <td>总分:100分</td>
                <td>总题数:41</td>
                <td>倒计时:57分0秒</td>
                <td><input type="button" value="完成考试" onclick="closeShow()"></td>
            </tr>
        </table>
        <hr>
        <table border="1" id="titledetails">
            <tr>
                <td>1<br>
                    <input class="answertext" type="text">
                </td>
                <td>2<br>
                    <input class="answertext" type="text">
                </td>
                <td>3<br>
                    <input class="answertext" type="text">
                </td>
                <td>4<br>
                    <input class="answertext" type="text">
                </td>
                <td>5<br>
                    <input class="answertext" type="text">
                </td>
                <td>6<br>
                    <input class="answertext" type="text">
                </td>
                <td>7<br>
                    <input class="answertext" type="text">
                </td>
                <td>8<br>
                    <input class="answertext" type="text">
                </td>
                <td>9<br>
                    <input class="answertext" type="text">
                </td>
                <td>10<br>
                    <input class="answertext" type="text">
                </td>
            </tr>
            <tr>
                <td>11<br>
                    <input class="answertext" type="text">
                </td>
                <td>12<br>
                    <input class="answertext" type="text">
                </td>
                <td>13<br>
                    <input class="answertext" type="text">
                </td>
                <td>14<br>
                    <input class="answertext" type="text">
                </td>
                <td>15<br>
                    <input class="answertext" type="text">
                </td>
                <td>16<br>
                    <input class="answertext" type="text">
                </td>
                <td>17<br>
                    <input class="answertext" type="text">
                </td>
                <td>18<br>
                    <input class="answertext" type="text">
                </td>
                <td>19<br>
                    <input class="answertext" type="text">
                </td>
                <td>20<br>
                    <input class="answertext" type="text">
                </td>
            </tr>
            <tr>
                <td>21<br>
                    <input class="answertext" type="text">
                </td>
                <td>22<br>
                    <input class="answertext" type="text">
                </td>
                <td>23<br>
                    <input class="answertext" type="text">
                </td>
                <td>24<br>
                    <input class="answertext" type="text">
                </td>
                <td>25<br>
                    <input class="answertext" type="text">
                </td>
                <td>26<br>
                    <input class="answertext" type="text">
                </td>
                <td>27<br>
                    <input class="answertext" type="text">
                </td>
                <td>28<br>
                    <input class="answertext" type="text">
                </td>
                <td>29<br>
                    <input class="answertext" type="text">
                </td>
                <td>20<br>
                    <input class="answertext" type="text">
                </td>
            </tr>
            <tr>
                <td>31<br>
                    <input class="answertext" type="text">
                </td>
                <td>32<br>
                    <input class="answertext" type="text">
                </td>
                <td>33<br>
                    <input class="answertext" type="text">
                </td>
                <td>34<br>
                    <input class="answertext" type="text">
                </td>
                <td>35<br>
                    <input class="answertext" type="text">
                </td>
                <td>36<br>
                    <input class="answertext" type="text">
                </td>
                <td>37<br>
                    <input class="answertext" type="text">
                </td>
                <td>38<br>
                    <input class="answertext" type="text">
                </td>
                <td>39<br>
                    <input class="answertext" type="text">
                </td>
                <td>40<br>
                    <input class="answertext" type="text">
                </td>
            </tr>
            <tr>
                <td>41<br>
                    <input class="answertext" type="text">
                </td>
                <td>42<br>
                    <input class="answertext" type="text">
                </td>
                <td>43<br>
                    <input class="answertext" type="text">
                </td>
                <td>44<br>
                    <input class="answertext" type="text">
                </td>
                <td>45<br>
                    <input class="answertext" type="text">
                </td>
                <td>46<br>
                    <input class="answertext" type="text">
                </td>
                <td>47<br>
                    <input class="answertext" type="text">
                </td>
                <td>48<br>
                    <input class="answertext" type="text">
                </td>
                <td>49<br>
                    <input class="answertext" type="text">
                </td>
                <td>50<br>
                    <input class="answertext" type="text">
                </td>
            </tr>
        </table>
        <hr>
        <table border="1" style="width: 100%">
            <tr>
                <td>

                </td>
            </tr>
        </table>
        <div id="buttondiv">
            <input type="button" value="上一题">
            <input type="button" value="下一题">
        </div>
    </div>



    <div id="topdiv">
        <table width="1400px">
            <tr>
                <td width="1000px"><b style="font-size: 25px;position:relative;margin-left: 200px">在线考试管理系统</b></td>
                <td width="400px" >
                    2014年7月31日 星期四 8:36
                    [<a id="zhuxiao" style="color: royalblue">注销</a>]
                    [<a id="" style="color: royalblue">退出系统</a>]
                </td>

            </tr>
        </table>
    </div>
    <div id="leftdiv">
        <table style="margin: auto;height: 420px">
            <tr><td>个人信息</td></tr>
            <tr><td>在线考试</td></tr>
            <tr><td>笔试成绩</td></tr>
            <tr><td>机试成绩</td></tr>
            <tr><td>修改密码</td></tr>
        </table>
    </div>
    <div id="rightdiv">
        <table id="onlinetitle" border="1">
            <tr ><td><b id="title">请参加以下考试</b></td></tr>
        </table>
        <table border="1" id="onlinetable" >
            <tr style="background-color: darkgrey">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">类别</td>
                <td class="tablemargin">科目</td>
                <td class="tablemargin">标题</td>
                <td class="tablemargin">考试班级</td>
                <td class="tablemargin">开始时间</td>
                <td class="tablemargin">考试时长(分钟)</td>
                <td class="tablemargin">操作</td>
            </tr>
            <tr style="background-color: darkgrey">
                <td class="tablemargin">1</td>
                <td class="tablemargin">笔试</td>
                <td class="tablemargin">ok</td>
                <td class="tablemargin">ok</td>
                <td class="tablemargin">ok</td>
                <td class="tablemargin">ok</td>
                <td class="tablemargin">60</td>
                <td class="tablemargin" onclick="show()">开始考试</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>


