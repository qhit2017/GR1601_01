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
    <title>subjectdtestlist</title>
    <style>
        #bottomdiv{
            width: 100%;
            height:700px;
            background-color: gainsboro;
        }
        #subjecttesttable{
            position:relative;
            width: 1000px;
            top: 20px;
            background-color: dimgray;
            text-align: center;
            margin: auto;
        }
        #subjecttitletable{
            width:1000px;
            position:relative;
            margin:auto;
            text-align:center;
        }
    </style>
</head>
<body>
    <div id="bottomdiv">
        <table id="subjecttitletable" border="1">
            <tr>
                <td colspan="3" ><h1>【struts考试1】成绩列表</h1></td>
            </tr>
            <tr>
                <td>班级:<select><option></option></select></td>
                <td>学生姓名:<input type="text"></td>
                <td><a href="testdetails.jsp"><input type="button" value="查询"></a></td>
            </tr>
            <tr>
                <td colspan="3">查询结果:总人数1      及格人数0       及格率0.0%</td>
            </tr>
        </table>
        <table border="1" id="subjecttesttable" >
            <tr style="background-color: darkgrey">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">姓名</td>
                <td class="tablemargin">班级</td>
                <td class="tablemargin">开考时间</td>
                <td class="tablemargin">结束时间</td>
                <td class="tablemargin">分数</td>
                <td class="tablemargin">操作</td>
            </tr>
        </table>
    </div>
</body>
</html>
