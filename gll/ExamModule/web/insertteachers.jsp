<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/21
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="S" uri="/struts-tags" %>
<link rel="stylesheet" type="text/css" href="css/insertteacher.css">
<html>
<head>
    <title>添加教师界面</title>
    <script src="js/jquery.min.js" language="JavaScript"></script>
    <script>
        /*$$ = jQuery.noConflict();*/
        $(document).ready(function () {
            alert(${sessionScope.teachers.tnumber});
/*
            $.ajax({
                url:"findtnumber",
                type:"get",
                success: function (msg) {

                }
            });*/
        });

    </script>
</head>
<body>
<div id="it_add">
    <table width="400px">
        <tr><td align="center">添加教师</td></tr>
    </table>
    <form action="insertteacherinfo" method="get">
        <input type="text"name="tid" style="display: none">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    序号：${sessionScope.teachers.tnumber}<%--<input type="text" id="numberval" name="tnumber">--%><%--<S:property value="${sessionScope.teachers.tnumber};"></S:property>--%><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    姓名：<input type="text" name="tname"><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    性别：<select name="tsex">
                <option>男</option>
                <option>女</option>
          </select><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    生日：<input type="text" name="tbirthday"><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    学历：<input type="text" name="teducation"><br>
    联系电话：<input type="text" name="ttel"><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    岗位：<select name="tjob">
            <option value="0">讲师</option>
            <option value="1">班主任</option>
          </select><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    备注：<textarea rows="6" cols="20" name="tremark"></textarea><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="确定" id="it_ensure">&nbsp;&nbsp;&nbsp;<a href="teachers.jsp" style="text-decoration: none"><input type="submit" value="取消"></a>
    </form>
</div>
</body>
</html>
