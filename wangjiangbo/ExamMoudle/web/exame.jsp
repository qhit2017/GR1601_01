<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/22
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试界面！！</title>
    <style>
        #main{
          width: 800px;
          height: 550px;
          border-style: dotted;
        }
        #middle{
            width: 700px;
            height: 200px;
            border-style: outset;
            margin-left: 50px;
        }
    </style>
</head>
<body>
<form>
    <div id="main">
        <table width="100%" <%--border="1"--%>>
            <tr style="height: 25px">
                <td width="60px">科目：</td>
                <td width="100px">ps综合测试</td>
                <td width="100px">开考时间</td>
                <td width="100px"><input type="text" style="width: 100px"></td>
                <td width="100px">考试时长</td>
                <td width="100px"><input type="text"></td>
            </tr>
            <tr style="height: 25px">
                <td width="100px">总分：</td>
                <td width="100px"></td>
                <td width="100px">总体数：</td>
                <td width="100px"></td>
                <td width="100px">倒计时：</td>
                <td width="100px"></td>
                <td width="100px"><input type="button" value="完成考试"></td>
            </tr><br>
        </table><br>
        <div id="middle">
            <table border="1" width="100%">
            <tr style="height: 30px">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
                <tr style="height: 30px">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height: 30px">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height: 30px">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height: 30px">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
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
