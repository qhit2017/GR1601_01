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
    <title>begintest</title>
    <style>
        #bottomdiv{
            width: 100%;
            height:700px;
            background-color: gainsboro;
        }
        #buttondiv{
            width: 400px;
            height: 50px;
            left: 350px;
            top:15px;
            position: relative;
        }
        #buttondiv input{
            width: 150px;
            height: 35px;
            font-size: 20px;
        }
        #timetable{
            width: 800px;
            height: 200px;
            position: relative;
            left: 350px;
        }
    </style>
</head>
<body>
    <div id="bottomdiv">
        <div id="buttondiv">
            <input type="button" value="开始考试">
            <input type="button" value="取消">
        </div>
        <h1 style="text-align: center">请选择参加考试的班级及开考时间</h1>
        <table border="1" id="timetable">
            <tr>
                <td>班级</td>
                <td>开考时间</td>
                <td><input type="button" value="添加"></td>
            </tr>
            <tr>
                <td><select><option>G3T53</option></select></td>
                <td><input type="text" value="2014-08-01 09:30"></td>
                <td></td>
            </tr>
            <tr>
                <td><select><option>G3T54</option></select></td>
                <td><input type="text" value="2014-08-01 09:30"></td>
                <td><input  type="button" value="删除"></td>
            </tr>
        </table>
    </div>

</body>
</html>
