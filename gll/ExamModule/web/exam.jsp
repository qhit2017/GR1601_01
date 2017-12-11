<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/21
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/exam.css">
<html>
<head>
    <title>开始考试界面</title>
</head>
<body>
<div id="e_begin">
    <input type="submit" value="开始考试"> <input type="submit" value="取消"><br>
    <table>
        <tr>
            <td>请选择参加考试的班级及开考时间</td>
        </tr>
    </table>
    <table>
        <tr>
            <td>班级</td>
            <td>开考时间</td>
            <td><input type="button" value="添加"></td>

        </tr>
        <tr>
            <td>
                <select name="class">
                    <option>IT1601</option>
                    <option>IT1602</option>
                </select>
            </td>
            <td><input type="text"></td>
            <td></td>
        </tr>
        <tr>
            <td>
                <select name="class">
                    <option>IT1701</option>
                    <option>IT1702</option>
                </select>
            </td>
            <td><input type="text"></td>
            <td><input type="button" value="删除"></td>
        </tr>
        <tr>
            <td>单选题</td>
            <td>简单：<input type="text"></td>
            <td>一般：<input type="text"></td>
            <td>困难：<input type="text"></td>
        </tr>
        <tr>
            <td>多选题</td>
            <td>简单：<input type="text"></td>
            <td>一般：<input type="text"></td>
            <td>困难：<input type="text"></td>
        </tr>
        <tr>
            <td>总题数：<input type="text"></td>
        </tr>
        <tr>
            <td>每题分数：<input type="text"></td>
        </tr>

        <tr>
            <td><input type="submit" value="创建试卷"> <input type="submit" value="取消"></td>
        </tr>
    </table>
</div>
</body>
</html>
