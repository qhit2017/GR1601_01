<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/22 0022
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>开始考试</title>
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
        margin-left:100px;
    }
    #right_2{
        width: 400px;
        height: 40px;
        position: absolute;
        margin-top: 60px;
        /*background: blue;*/
        margin-left: 300px;
    }
    #right_3{
        width: 700px;
        height: 400px;
        position: absolute;
        /*font-size: 20px;*/
        margin-top: 100px;
        /*background: red;*/
        margin-left:150px;
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
        <div id="right_1"><input type="submit" value="开始考试"><input type="submit" value="取消"></div>
        <div id="right_2">请选择参加考试的班级及开考时间</div>

        <div id="right_3">
            <table border="0" width="100%">
                <tr height="40px">
                    <td>班级</td>
                    <td>开考时间</td>
                    <td><input type="button" value="添加"></td>
                </tr>
                <tr height="40px">
                    <td><select><option>G3T53</option></select></td>
                    <td><input type="text" value="2014-08-01 09:30"></td>
                    <td></td>
                </tr>
                <tr height="40px">
                    <td><select><option>G3T54</option></select></td>
                    <td><input type="text" value="2014-08-01 09:30"></td>
                    <td><input  type="button" value="删除"></td>
                </tr>
            </table>

        </div>

    </div>
</div>

</body>
</html>
