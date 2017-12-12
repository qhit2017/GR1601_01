<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20 0020
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页面</title>
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
    <div id="right"></div>
</div>

</body>
</html>
