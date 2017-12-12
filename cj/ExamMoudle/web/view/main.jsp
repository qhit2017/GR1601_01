<%--
  Created by IntelliJ IDEA.
  User: cj
  Date: 2017/11/20
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主界面</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css"/>

</head>
<body>

<div id="hd">

      <div  style="text-align: left"> 在线考试管理系统</div>

    <div style="text-align: right"><a href="" style="text-decoration: none" id="kong" >注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>

</div>
<div id="bd">
    <div id="side">后台功能
        <table width="100%" >
            <tr >
                <td><a href="teacher.jsp" style="text-decoration: none" >教师管理</a></td>
            </tr>

            <tr>
                <td><a href="class.jsp">班级管理</a></td>
            </tr>

            <tr>
                <td><a href="student.jsp">学生管理</a></td>
            </tr>

            <tr>
                <td>题库管理</td>
            </tr>
            <tr >
                <td>试卷管理</td>
            </tr>
            <tr>
                <td>成绩管理</td>
            </tr>

            <tr>
                <td>修改密码</td>
            </tr>

        </table>


    </div>
    <div id="main">
        <div id="content">
            <div id="feature" class="feature">
                <div class="hd">


                </div>
                <div class="bd">

                </div>
                <div class="ft">

                </div>
            </div>
        </div>
    </div>
</div>


<div id="ft">
</div>


</body>
</html>
