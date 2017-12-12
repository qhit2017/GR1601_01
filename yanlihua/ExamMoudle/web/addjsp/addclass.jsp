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
    <title>addclass</title>
</head>
<style>
    #bottomdiv{
        width: 100%;
        height: 700px;
        background-color: gainsboro;
    }
    #affirm{
        width: 100px;
        height: 30px;
    }
    #newclasstable{
        height: 600px;
        width: 500px;
        position: relative;
        left: 500px;
    }
</style>
<body>
<div id="bottomdiv">
    <table border="1" id="newclasstable" >
        <tr style="text-align: center"><td colspan="2" ><b>创建班级</b></td></tr>
        <tr><td>班级代码:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>班级名称:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>所属方向:</td>
            <td><select><option>请选择</option></select></td>
        </tr>
        <tr>
            <td>班主任:</td>
            <td><select><option>请选择</option></select></td>
        </tr>
        <tr>
            <td>讲师:</td>
            <td><select><option>请选择</option></select></td>
        </tr>
        <tr>
            <td>开班日期:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>G1开班人数:</td>
            <td><input type="text"></td>
        </tr>
        <tr><td>G2开班人数:</td>
            <td><input type="text"></td>
        </tr>
        <tr><td>G3开班人数:</td>
            <td><input type="text"></td>
        </tr>
        <tr><td>状态:</td>
            <td><select><option>启用</option><option>禁用</option></select></td>
        </tr>
        <tr><td>备注:</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center"><input id="affirm" type="button" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;<input style="width: 100px;height: 30px;" type="button" value="取消"></td>
        </tr>
    </table>
</div>
</body>
</html>
