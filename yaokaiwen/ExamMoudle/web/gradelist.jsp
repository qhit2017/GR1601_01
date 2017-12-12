<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>examlist</title>
</head>
<style>
    #bigdiv {
        width: 1400px;
        height: 800px;
        background-color: bisque;
        position: fixed;
    }
    #topdiv {
        width: 100%;
        height: 60px;
        background-color: gainsboro;
        border-bottom: 1px solid black;
    }
    #leftdiv {
        width: 299px;
        height: 640px;
        position: relative;
        background-color: beige;
        border-right: 1px solid black;
    }
    #rightdiv {
        width: 1100px;
        height: 640px;
        position: relative;
        bottom: 640px;
        left: 300px;
        background-color: lavender;
    }
    .tablemargin {
        text-align: center;
    }
    #title {
        position: relative;
        left: 400px;
        font-size: 20px
    }
    #page {
        position: relative;
        left: 750px;
        top: 420px;
    }
    a{
        text-decoration: none;
    }
</style>

<script type="text/javascript" language="JavaScript"></script>

<body>
<div id="bigdiv">
    <div id="topdiv">
        <table width="1400px">
            <tr>
                <td width="1000px"><b style="font-size: 25px;position:relative;margin-left: 200px">在线考试管理系统</b></td>
                <td width="400px">
                    2014年7月31日 星期四 8:36
                    [<a id="zhuxiao" style="color: royalblue">注销</a>]
                    [<a id="" style="color: royalblue">退出系统</a>]
                </td>

            </tr>
        </table>
    </div>
    <div id="leftdiv">
        <table style="margin: auto;height: 420px">
            <tr>
                <td><a href="teacherlist.jsp">教师管理</a></td>
            </tr>
            <tr>
                <td><a href="classlist.jsp">班级管理</a></td>
            </tr>
            <tr>
                <td><a href="studentlist.jsp">学生管理</a></td>
            </tr>
            <tr>
                <td><a href="questionbankmanage.jsp">题库管理</a></td>
            </tr>
            <tr>
                <td><a href="examlist.jsp">试卷管理</a></td>
            </tr>
            <tr>
                <td><a href="gradelist.jsp">成绩管理</a></td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>
        </table>
    </div>
    <div id="rightdiv">
        <table border="0" style="width: 1000px;height: 120px">
            <tr>
                <td colspan="5"><b id="title">试卷列表</b></td>
            </tr>
            <tr>
                <td>方向:<select id="sudirection">
                    <option value="">请选择</option>
                    <option value="高软">高软</option>
                    <option value="3G4G">3G4G</option>
                </select>
                <td>阶段:<select id="sustage">
                    <option value="">请选择</option>
                    <option value="G1">G1</option>
                    <option value="G2">G2</option>
                    <option value="G3">G3</option>
                </select></td>
                <td>考试科目:<select id="suid">

                </select></td>
                <td>考试类型:<select id="ttype">
                    <option value="">请选择</option>
                    <option value="笔试">笔试</option>
                    <option value="机试">机试</option>
                </select></td>
                <td><input type="button" value="查询"></td>
            </tr>
        </table>
        <table border="1" style="position:relative;width: 1000px;top: 20px;">
            <tr style="background-color: darkgrey">
                <td class="tablemargin">类别</td>
                <td class="tablemargin">科目</td>
                <td class="tablemargin">标题</td>
                <td class="tablemargin">考试班级</td>
                <td class="tablemargin">考试时长(分钟)</td>
                <td class="tablemargin">操作</td>
            </tr>
        </table>
        <table border="1" id="page">
            <tr>
                <td colspan="9" style="text-align: right">
                    第1页，
                    共1页&nbsp;
                    首页&nbsp;
                    上一页&nbsp;
                    下一页&nbsp;
                    末页
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>