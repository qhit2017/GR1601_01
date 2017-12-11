<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zhanglong.bean.Subject" %>
<html>
<head>
    <title>添加单个问题</title>
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
        width: 700px;
        height: 450px;
        position: absolute;
        /*font-size: 20px;*/
        margin-top: 80px;
        /*background: red;*/
        margin-left:150px;
    }
</style>
    <script>
        $(document).ready(function () {
            $("#update1").click(function () {
                var qtype = $("#qtype").val();
                var qcontent = $("#qcontent").val();
                alert(qtype+";"+qcontent);
                var qa = $("#qa").val();
                var qb = $("#qb").val();
                var qc = $("#qc").val();
                var qd = $("#qd").val();
                alert(qa + ";" + qb + ";" + qc + ";" + qd);
                var qdifficulty = $("#qdifficult").val();
                var qchapter = $("#qchapter").val();
                alert(qdifficulty+";"+qchapter);
                var chk_value = [];
                $('input[name="fouroptions"]:checked').each(function () {
                    chk_value.push($(this).val());
                })
                alert(chk_value);
                $.ajax({
                    url: "saveorupdatexinxi?qtype=" + qtype + "&qcontent=" + qcontent + "&qa=" + qa + "&qb=" + qb + "&qc=" + qc + "&qd=" + qd +
                    "&qdifficulty=" + qdifficulty + "&qchapter=" + qchapter + "&qanswer=" + chk_value,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        if (obj.result == "true") {
                            alert("添加成功");
                        }
                        else {
                            alert("添加失败");
                        }
                    }
                });

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
        <div id="right_1">添加考试题</div>
        <div id="right_2">
            <table border="0" width="100%" height="450px">
                <tr><td width="100px">科目名称:
                    <%
                    HttpSession httpSession = request.getSession();
                    Subject subject = (Subject) httpSession.getAttribute("subject");
                    String name = subject.getSucourse();
                %></td>
                    <td><input type="text"value="<%=name%>"></td>
                </tr>
                <tr>
                    <td>类型:</td>
                    <td><select id="qtype">
                        <option value="">请选择</option>
                        <option value="0">单选</option>
                        <option value="1">多选</option></select></td>
                </tr>
                <tr>
                    <td>题目内容:</td>
                    <td><textarea  id="qcontent" cols="20" rows="8"></textarea>"
                    </td>
                </tr>
                <tr>
                    <td>选项:</td>
                    <td colspan="4">
                        <input type="checkbox" name="fouroptions" id="a" value="A">A. <input style="width: 400px" id="qa"><br>
                        <input type="checkbox" name="fouroptions" id="b" value="B">B. <input style="width: 400px" id="qb"><br>
                        <input type="checkbox" name="fouroptions" id="c" value="C">C. <input style="width: 400px" id="qc"><br>
                        <input type="checkbox" name="fouroptions" id="d" value="D">D. <input style="width: 400px" id="qd">

                    </td>
                </tr>
                <tr>
                    <td>难度:</td>
                    <td><select id="qdifficult">
                        <option value="">请选择</option>
                        <option value="简单">简单</option>
                        <option value="中等">中等</option>
                        <option value="困难">困难</option>
                    </select></td>
                </tr>
                <tr>
                    <td>对应章节:</td>
                    <td><input type="text" id="qchapter"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <input type="button" value="修改" id="update1">&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="重置"></td>
                </tr>
            </table>
        </div>

    </div>
</div>

</body>
</html>
