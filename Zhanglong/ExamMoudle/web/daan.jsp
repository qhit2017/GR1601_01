<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/22 0022
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>答案</title>
    <meta charset="UTF-8"><style type="text/css">
    #zong{
        width:100%;
        height:100%;
    }
    #up{
        width:100%;
        height:15%;
        position:relative;
        border-bottom: 2px solid #F0F8FF;

        /*background: crimson;*/
    }
    #up_1{
        width: 300px;
        height: 40px;
        position: absolute;
        /*background: red;*/
        margin-left: 300px;
        font-size: 20px;
        color: red;
        margin-top: 30px;
    }
    #up_2{
        width:250px;
        height: 40px;
        position: absolute;
        margin-left: 850px;
        /*background: red;*/
        margin-top: 30px;
    }
    #up_3{
        width:70px;
        height: 40px;
        position: absolute;
        margin-left: 1100px;
        /*   background: blue;*/
        margin-top: 30px;
        color:blue;
    }
    #up_4{
        width:100px;
        height: 40px;
        position: absolute;
        margin-left: 1170px;
        /*background: black;*/
        margin-top: 30px;
        color: blue;
    }

    #left{
        width: 19.7%;
        height: 85%;
        position: absolute;
        /* border-bottom: 2px solid red;*/
        /*background: black;*/
        border: 2px solid red;
    }
    #right{
        width: 80%;
        height: 85%;
        margin-left:20%;
        position: relative;
        border:2px solid blue ;
        /*background: blue;*/
    }
    #right_1{
        width: 200px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 20px;
        /* background: red;*/
        margin-left:400px;
    }
    #right_2{
        width: 100%;
        height: 100px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 50px;
        /*background: blue;*/
    }
    #right_3{
        width: 200px;
        height: 400px;
        position: absolute;
        /*background: red;*/
        margin-top: 160px;
        /*   background: green;*/
    }
    #right_4{
        width: 300px;
        height: 35px;
        margin-top: 500px;
        position: absolute;
        margin-left: 100px;

    }


</style>

</head>
<body>
<div id="zong">
    <div id="up">
        <div id="up_1">在线考试管理系统</div>
        <div id="up_2">2014年7月31日星期四8：36</div>
        <div id="up_3"><a href="">[注销]</a></div>
        <div id="up_4"><a href="">[退出系统]</a></div>
    </div>
    <div id="left">
        <table style="margin: auto;height:60%">
            <tr><td>后台功能</td></tr>
            <tr><td><a href="">教师管理</a></td></tr>
            <tr><td><a href="">班级管理</a></td></tr>
            <tr><td><a href="">学生管理</a></td></tr>
            <tr><td><a href="">题库管理</a></td></tr>
            <tr><td><a href="">试卷管理</a></td></tr>
            <tr><td><a href="">成绩管理</a></td></tr>
            <tr><td><a href="">修改密码</a></td></tr>

        </table>
    </div>
    <div id="right">
        <div id="right_1">生成试卷</div>
        <div id="right_2">
            <table border="0" width="100%">
            <tr>
                <td>科目:PS综合测试</td>
                <td>开考时间:2017-11-21 9:29:06</td>
                <td colspan="2">考试时长:60分钟</td>
            </tr>
            <tr>
                <td>总分:100分</td>
                <td>总题数:41</td>
                <td>倒计时:57分0秒</td>
                <td><input type="submit" value="完成考试"></td>
            </tr>
        </table>
        </div>
        <div id="right_3">
            <table border="1">
                <tr>
                    <td>1<input type="text" style="width: 50px;"></td>
                    <td>2<input type="text" style="width: 50px;"></td>
                    <td>3<input type="text" style="width: 50px;"></td>
                    <td>4<input type="text" style="width: 50px;"></td>
                    <td>5<input type="text" style="width: 50px;"></td>
                    <td>6<input type="text" style="width: 50px;"></td>
                    <td>7<input type="text" style="width: 50px;"></td>
                    <td>8<input type="text" style="width: 50px;"></td>
                    <td>9<input type="text" style="width: 50px;"></td>
                    <td>10<input type="text" style="width: 50px;"></td>
                </tr>
                <tr>
                    <td>11<input type="text" style="width: 50px;"></td>
                    <td>12<input type="text" style="width: 50px;"></td>
                    <td>13<input type="text" style="width: 50px;"></td>
                    <td>14<input type="text" style="width: 50px;"></td>
                    <td>15<input type="text" style="width: 50px;"></td>
                    <td>16<input type="text" style="width: 50px;"></td>
                    <td>17<input type="text" style="width: 50px;"></td>
                    <td>18<input type="text" style="width: 50px;"></td>
                    <td>19<input type="text" style="width: 50px;"></td>
                    <td>20<input  type="text" style="width: 50px;"></td>
                </tr>
                <tr>
                    <td>21<input type="text" style="width: 50px;"></td>
                    <td>22<input  type="text" style="width: 50px;"></td>
                    <td>23<input  type="text" style="width: 50px;"></td>
                    <td>24<input  type="text" style="width: 50px;"></td>
                    <td>25<input  type="text" style="width: 50px;"></td>
                    <td>26<input  type="text" style="width: 50px;"></td>
                    <td>27<input  type="text" style="width: 50px;"></td>
                    <td>28<input  type="text" style="width: 50px;"></td>
                    <td>29<input  type="text" style="width: 50px;"></td>
                    <td>20<input  type="text" style="width: 50px;"></td>
                </tr>
                <tr>
                    <td>31<input type="text" style="width: 50px;"></td>
                    <td>32<input type="text" style="width: 50px;"></td>
                    <td>33<input type="text" style="width: 50px;"></td>
                    <td>34<input type="text" style="width: 50px;"></td>
                    <td>35<input type="text" style="width: 50px;"></td>
                    <td>36<input type="text" style="width: 50px;"></td>
                    <td>37<input type="text" style="width: 50px;"></td>
                    <td>38<input type="text" style="width: 50px;"></td>
                    <td>39<input type="text" style="width: 50px;"></td>
                    <td>40<input type="text" style="width: 50px;"></td>
                </tr>
            </table>
        </div>
        <div id="right_4"><input type="submit"value="上一题"><input type="submit" value="下一题" ></div>
    </div>
</div>

</body>
</html>
