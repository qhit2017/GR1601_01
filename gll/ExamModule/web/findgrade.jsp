<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/21
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/findgrade.css">
<html>
<head>
    <title>查看信息界面</title>
</head>
<body>
<div id="fg_center">
    <table width="400px">
        <tr><td align="center">【Struts考试1】成绩列表</td></tr>
    </table>
    班级：<select name="direction">
    <option>SECM</option>
    <option>SEEC</option>
</select>
    学生姓名：<input type="text">
    <input type="submit" value="查询"><br>
    查询结果：总人数1&nbsp;&nbsp;&nbsp;及格人数0&nbsp;&nbsp;及格率0.0%
    <table>
        <tr>
            <td>序号</td>
            <td>姓名</td>
            <td>班级</td>
            <td>开考时间</td>
            <td>结束时间</td>
            <td>分数</td>
            <td>操作</td>
        </tr>
        <tr>
            <td>1</td>
            <td>tom</td>
            <td>IT601</td>
            <td>2017-11-11 11:11:11</td>
            <td>2017-11-11 12:11:11</td>
            <td>60</td>
            <td><a href="#">查看详情</a></td>
        </tr>
    </table>
</div>
</body>
</html>
