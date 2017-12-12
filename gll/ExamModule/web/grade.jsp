<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/20
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/grade.css">
<html>
<head>
    <title>试卷管理模块</title>
</head>
<body>
<div id="m_best">
    <div id="m_top">
        <div id="m_top_info">
            *在线考试管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017年11月20日&nbsp;11:20&nbsp;&nbsp;&nbsp;&nbsp;[<a href="#">注销</a>]&nbsp;&nbsp;[<a href="#">退出系统</a>]
        </div>
        <table border="1px" height="100px" width="250px">
            <tr>
                <td width="80px"></td>
                <td>欢迎您郭先生</td>
            </tr>
        </table>

    </div>
    <div id="m_left">
        <table width="100px">
            <tr><td>后台功能</td></tr>
            <tr><td>教师管理</td></tr>
            <tr><td>班级管理</td></tr>
            <tr><td>学生管理</td></tr>
            <tr><td>题库管理</td></tr>
            <tr><td>试题管理</td></tr>
            <tr><td>成绩管理</td></tr>
            <tr><td>修改密码</td></tr>
        </table>
    </div>
    <div id="m_right">
        <div id="g_content">
            <%--成绩信息--%>
            <table>
                <tr>
                    <td>试卷列表</td>
                </tr>
            </table>
            方向：<select name="direction"><option>请选择</option></select>
            阶段：<select name="phase"><option>请选择</option></select>
            考试科目：<select name="phase"><option>请选择</option></select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                考试类型：<select name="phase"><option>请选择</option></select>
                &nbsp;&nbsp;&nbsp;
                状态：<select name="phase"><option>请选择</option></select>
                <input type="submit" value="查询"><br>
            <div id="q_content_1">
                <table border="1px" width="1350px">
                    <tr align="center" bgcolor="#808080">
                        <td>序号</td>
                        <td>类别</td>
                        <td>科目</td>
                        <td>标题</td>
                        <td>考试班级</td>
                        <td>考试时长(分钟)</td>
                        <td>操作</td>
                    </tr>
                    <tr align="center">
                        <td>1</td>
                        <td>笔试</td>
                        <td>[SCME G1]  ps/plash</td>
                        <td>3S考试</td>
                        <td>IT601</td>
                        <td>60</td>
                        <td><a href="#">查看成绩</a> <a href="#">查看试卷</a></td>
                    </tr>
                </table>
                <pre>               第一页，共3页 <a href="#">首页</a> <a href="#"上一页></a> <a href="#">下一页</a> <a href="#">末页</a></pre>
            </div>

        </div>
    </div>
</div>
</body>
</html>
