<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/22 0022
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>【struts考试1】成绩列表</title>
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
        width: 600px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 50px;
        /*background: blue;*/
    }
    #right_3{
        width: 80%;
        height: 50px;
        position: absolute;
        /*background: red;*/
        margin-top: 90px;
        /*background: yellow;*/
    }
    #right_4{
        width: 100%;
        height: 390px;
        position: absolute;
        /*background: red;*/
        margin-top: 130px;
        /*   background: green;*/
    }
    #right_5{
        width: 300px;
        height: 35px;
        margin-top: 510px;
        position: absolute;
        /* background: red;*/
        margin-left: 700px;
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
        <div id="right_1">试卷列表</div>
        <div id="right_2"><table>
            <tr>
                <td>班级:<select><option>请选择</option></select></td>
                <td>学生姓名:<select><option>请选择</option></select></td>
                <td><input type="submit" value="查询"></td>
            </tr></table>
        </div>
        <div id="right_3">
            <table><tr>
                <td>查询结果:总人数1</td>
                <td>及格人数0</td>
                <td>及格率0.0%</td>

            </tr></table>
        </div>
        <div id="right_4">
            <table border="1" width="100%">
                <tr><td width="5%">序号</td>
                    <td width="5%">姓名</td>
                    <td width="15%">班级</td>
                    <td width="15%">开考时间</td>
                    <td width="15%">结束时间</td>
                    <td width="15%">分数</td>
                    <td width="15%">操作</td></tr>
            </table></div>
        <div id="right_5"><table>
            <tr><td><a href="">第1页</a></td><td><a href="">共2页</a></td><td><a href="">首页</a></td><td><a href="">上一页</a></td><td><a href="">下一页</a></td><td><a href="">末页</a></td></tr>
        </table>

        </div>
    </div>
</div>

</body>
</html>
