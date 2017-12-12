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
    <title>testdetail</title>
    <style>
        #bottomdiv{
            width: 100%;
            height:700px;
            background-color: gainsboro;
            position: absolute;
            left: 0px;
            top: 0px;
        }
        #testdetailstable{
            width: 100%;
            height: 100px;
            margin: auto;
        }
        #titledetails{
            width: 100%;
        }
    </style>
</head>
<body>
<div id="bottomdiv">
    <table border="0" id="testdetailstable">
        <tr>
            <td>科目:struts考试1</td>
            <td>规定时长:60(分钟)</td>
            <td>总分:100</td>
            <td>总题数:11</td>
        </tr>
        <tr>
            <td colspan="2">开始时间:2017-11-21 9:29:06</td>
            <td colspan="2">结束时间:2017-11-21 12:00:00</td>
        </tr>
        <tr>
            <td colspan="2">考试姓名:</td>
            <td colspan="2">考试的分:66</td>
        </tr>
    </table>
    <hr>
    <table border="1" id="titledetails">
        <tr>
            <td></td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</div>
</body>
</html>
