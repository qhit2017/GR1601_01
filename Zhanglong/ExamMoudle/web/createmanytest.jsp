<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>生成试卷</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
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
        height: 100px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 50px;
        /*background: blue;*/
    }
    #right_3{
        width: 100%;
        height: 350px;
        position: absolute;
        /*background: red;*/
        margin-top: 160px;
        /*   background: green;*/
    }
    #right_4{
        width: 300px;
        height: 35px;
        margin-top: 460px;
        position: absolute;
        /* background: red;*/
        margin-left: 700px;
    }
    #right_5{
        width: 300px;
        height: 35px;
        margin-top: 500px;
        position: absolute;
        margin-left: 100px;

    }
</style>
   <script>
    $(document).ready(function () {
        $.ajax({
            url: "xialakuang",
            type: "get",
            success: function (msg) {
                alert(obj)
                var obj = eval(msg);
                var str = "";
                for (var i = 0; i < obj.length; i++) {
                    str=str+"<option value='"+obj[i].suid+"' onclick='sucourse("+obj[i].suid+")'>"+obj[i].sucourse+"</option>";
                }
                var strtitle = "<option value=''>请选择</option>";
                str = strtitle + str;
                $("#sucourse").html(str);
            }
        });

    })
   </script>
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
        <div id="right_2"><table>
            <tr><td>方向:</td>
                <td><select id="sudirection"><option value="">请选择</option>
                <option value="高软">高软</option>
                <option value="3G4G">3G4G</option></select></td>
                <td>阶段:<select id="sustage">
                <option value="">请选择</option>
                <option value="G1">G1</option>
                <option value="G2">G2</option>
                <option value="G3">G3</option></select>
            </td><td>考试科目<select id="sucourse"><option value="">请选择</option></select></td></tr>
            <tr><td>标题:</td><td colspan="3"><input type="text"></td></tr>
            <tr><td>总分:</td><td><input type="text">分</td><td>考试时长:</td><td><input type="text">分钟</td></tr>
            <tr><td>已选标题:</td><td><input type="text"></td><td>每题分数:</td><td><input type="text"></td></tr>

        </table>
        </div>
        <div id="right_3">
            <table border="1" width="100%">
                <tr><td width="10%"><input type="radio"></td>
                    <td width="10%">88</td>
                    <td width="10%">单选/td>
                    <td width="10%">简单</td>
                    <td width="10%">T4/td>
                    <td width="50%">操作</td></tr>
            </table></div>
        <div id="right_4"><table>
            <tr><td><a href="">第1页</a></td><td><a href="">共2页</a></td><td><a href="">首页</a></td><td><a href="">上一页</a></td><td><a href="">下一页</a></td><td><a href="">末页</a></td></tr>
        </table>
        </div>
        <div id="right_5"><input type="submit"value="创建试卷"><input type="submit" value="取消" ></div>
    </div>
</div>

</body>
</html>

