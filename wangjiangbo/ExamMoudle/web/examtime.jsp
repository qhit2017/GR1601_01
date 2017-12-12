<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/22
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试时间页面！！</title>
    <style>
        #alltime{
            width: 800px;
            height: 600px;
            border-style: dotted;
        }
        #topic{
            text-align: center;
        }
        #time{
            position: absolute;
            width: 700px;
            height: 310px;
            border-style: inset;
            margin-top: 20px;
            margin-left: 50px;
        }
    </style>
</head>
<body>
<form>
    <div id="alltime"><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" value="开始考试"><input type="button" value="取消"><br><br><br>
        <div id="topic">
            请选择参加考试的班级及开考时间
        </div><br>
        <div id="time">
            <table width="100%" border="1">
                <tr style="height: 30px">
                    <td width="33%">班级</td>
                    <td>开考时间</td>
                    <td><input type="button" value="添加"></td>
                </tr>
                <tr style="height: 30px">
                    <td width="33%"></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height: 30px">
                    <td width="33%"></td>
                    <td></td>
                    <td><input type="button" value="删除"></td>
                </tr>
            </table>
        </div>
    </div>
</form>
</body>
</html>
