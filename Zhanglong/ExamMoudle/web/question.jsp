<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>题库管理试卷</title>
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
        width: 200px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 40px;
        margin-left: 40px;
        /*background: blue;*/
    }
    #right_3{
        width: 300px;
        height: 35px;
        margin-top: 75px;
        position: absolute;
         /*background: red;*/
        margin-left: 40px;
    }
</style>
    <script>
        $(document).ready(function () {
            //查询信息
            $("#jieduan").bind("change", function () {
                var sudirection = $("#fangxiang").val();
                var sustage = $("#jieduan").val();
                alert(sudirection+";"+sustage)
                $.ajax({
                    url:"chaxunxinxi?sudirection="+sudirection+"&sustage="+sustage,
                    type: "get",
                    success: function (msg) {
                        alert(msg)
                        var obj = eval(msg);
                        alert(obj)
                        var str = "";
                        for (var i = 0; i < obj.length; i++) {
                            str = str + "<td><div class='subject'>" + obj[i].sucourse + "   " + obj[i].sustage + "<br>机试题:0<br>笔试题:<a  href='chaname?suid=" + obj[i].suid + "' id=" + obj[i].suid + "></a></div></td>";
                          $.ajax({
                                url: "chashumu?suid=" + obj[i].suid,
                                type: "get",
                                success: function (msg) {
                                    var num = $.parseJSON(msg);
                                    $("#" + num.id + "").html(num.number);
                                }
                            });
                        }
                        $("#tablexianshi").html(str);
                    }

                });

            });

        });
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
            <tr><td><a href="teacher.jsp">教师管理</a></td></tr>
            <tr><td><a href="classes.jsp">班级管理</a></td></tr>
            <tr><td><a href="student.jsp">学生管理</a></td></tr>
            <tr><td><a href="question.jsp">题库管理</a></td></tr>
            <tr><td><a href="test.jsp">试卷管理</a></td></tr>
            <tr><td><a href="report.jsp">成绩管理</a></td></tr>
            <tr><td><a href="">修改密码</a></td></tr>

        </table>
    </div>
    <div id="right">
        <div id="right_1">试卷管理</div>
        <div id="right_2">
            <select id="fangxiang">
                <option value="">请选择</option>
            <option value="高软">高软</option>
            <option value="3G4G">3G4G</option>
        </select>
            <select id="jieduan">
                <option value="">请选择</option>
                <option value="G1">G1</option>
                <option value="G2">G2</option>
                <option value="G3">G3</option></select>
        </div>
        <div id="right_3">
            <table border="1" style="position:relative; width: 900px; ">
                  <tr id="tablexianshi"></tr>
                <%--<tr>
                    <td align="center">GBT   G1<br>机试题:0<br>笔试题:0</td>
                    <td align="center">Ps   G1<br>机试题:0<br>笔试题:6</td>
                    <td align="center">HTML   G1<br>机试题:0<br>笔试题:0</td>
                </tr>
                <tr>
                    <td align="center">C# Base   G1<br>机试题:0<br>笔试题:6</td>
                    <td align="center">Sql Base   G1<br>机试题:0<br>笔试题:0</td>
                    <td align="center">C#   Winform   G1<br>机试题:0<br>笔试题:0</td>
                </tr>
                <tr>
                    <td align="center">12   G1<br>机试题:0<br>笔试题:6</td>
                    <td align="center">123   G1<br>机试题:0<br>笔试题:0</td>
                    <td align="center">NNNNNNNN   G1<br>机试题:0<br>笔试题:0</td>
                </tr>
                <tr>
                    <td align="center">MMMMM   G1<br>机试题:0<br>笔试题:6</td>
                </tr>--%>
            </table>
        </div>
        </div>
    </div>

</body>
</html>

