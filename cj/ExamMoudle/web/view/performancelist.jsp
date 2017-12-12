<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/22
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" type="text/css" href="../css/performancelist.css">
<head>

    <title>查看成绩列表模块！！</title>

</head>
<body>
<form>
    <div id="main"><br>
        <div id="top">
            成绩列表<br><br>
        </div>
        班级：<select style="width: 60px">
            <option style="height: 20px"></option>
            <option></option>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        学生姓名：<input type="text">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        查询：<input type="button" value="查询"><br>
        <div id="selectinfo">
            <table border="0" 600px>
                <tr style="height: 20px">
                    <td style="width: 230px">查询结果：<input type="text"></td>
                    <td style="width: 230px">及格人数：<input type="text"></td>
                    <td style="width: 230px">及格率：<input type="text"></td>
                </tr><br><br>
            </table>
        </div>
        <div id="biaoge">
            <table border="1" width="100%">
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
                    <td>姓名</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
</form>
</body>
</html>
