<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>randompaper</title>
    <style>
        #bottomdiv {
            width: 100%;
            height: 700px;
            background-color: gainsboro;
        }

        #randomtable {
            width: 800px;
            height: 600px;
            position: relative;
            left: 400px;
        }
    </style>
</head>
<body>
<div id="bottomdiv">
    <table id="randomtable" border="1">
        <tr>
            <td>方向:</td>
            <td><select>
                <option>SCCE</option>
            </select></td>
            <td>阶段:<select>
                <option>G1</option>
            </select></td>
            <td>科目:<select>
                <option>Ps</option>
            </select></td>
        </tr>
        <tr>
            <td>标题:</td>
            <td colspan="3"><input type="text"></td>

        </tr>
        <tr>
            <td>总分:</td>
            <td colspan="3"><input type="text">分</td>
        </tr>
        <tr>
            <td>考试时长:</td>
            <td colspan="3"><input type="text">分钟</td>
        </tr>
        <tr>
            <td>单选题:</td>
            <td>简单<input type="text" value="10"></td>
            <td>一般<input type="text" value="10"></td>
            <td>难度<input type="text" value="5"></td>
        </tr>
        <tr>
            <td>多选题:</td>
            <td>简单<input type="text" value="10"></td>
            <td>一般<input type="text" value="10"></td>
            <td>难度<input type="text" value="5"></td>
        </tr>
        <tr>
            <td>总题数:</td>
            <td colspan="3"><input type="text" value="50"></td>
        </tr>
        <tr>
            <td>每题分数:</td>
            <td colspan="3"><input type="text" value="2"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <input type="button" style="width: 150px;height: 40px" value="创建试题">&nbsp;&nbsp;
                <input type="button" style="width: 150px;height: 40px" value="取消">
            </td>

        </tr>
    </table>
</div>
</body>
</html>
