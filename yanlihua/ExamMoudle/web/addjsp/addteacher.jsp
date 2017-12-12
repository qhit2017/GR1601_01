<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addteacher</title>
</head>
<style>
    #bottomdiv{
        width: 100%;
        height: 700px;
        position: relative;
        background-color: gainsboro;
    }
    #affirm{
        width: 100px;
        height: 30px;
    }
    #teachertable1{
        height: 600px;
        width: 500px;
        position: relative;
        left: 500px
    }
</style>
<body>
<div id="bottomdiv">
    <table border="1" id="teachertable1">
        <tr style="text-align: center"><td colspan="2" ><b>添加教师</b></td></tr>
        <tr><td>账号:</td>
            <td>2012823004</td>
        </tr>
        <tr>
            <td>姓名:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>性别:</td>
            <td><select><option>男</option><option>女</option></select></td>
        </tr>
        <tr>
            <td>生日:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>学历:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>联系电话:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>岗位:</td><td>
            <select><option>讲师</option></select></td>
        </tr>
        <tr><td>备注</td>
            <td><textarea cols="40" rows="3"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center"><input id="affirm" type="button" value="确认">&nbsp;&nbsp;&nbsp;&nbsp;
                <input style="width: 100px;height: 30px;" type="button" value="取消"></td>
        </tr>
    </table>
</div>
</body>
</html>
