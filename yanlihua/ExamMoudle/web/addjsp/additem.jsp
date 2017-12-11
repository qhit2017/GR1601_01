<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>additem</title>
    <style>
        #bottomdiv{
            width: 100%;
            height: 700px;
            background-color: gainsboro;
            margin: auto;
        }
        #wordtool{
            width: 700px;
            height: 200px;
            background-color: beige;
        }
    </style>
</head>
<body>
    <div id="bottomdiv">
        <table border="1"style="width:800px;height:700px;margin: auto">
            <tr>
                <td>科目名称:</td>
                <td><input type="text" value="ps/flash"></td>
            </tr>
            <tr>
                <td>类型:</td>
                <td><select><option>单选</option></select></td>
            </tr>
            <tr>
                <td>题目内容:</td>
                <td><div id="wordtool"></div></td>
            </tr>
            <tr>
                <td>选项</td>
                <td colspan="4">
                    <input type="radio" name="fouroptions">A整个网页里面活动链接的颜色<br>
                    <input type="radio" name="fouroptions">B整个网页里面文字颜色<br>
                    <input type="radio" name="fouroptions">C整个网页里面用户访问过的数量<br>
                    <input type="radio" name="fouroptions">D整个网页里面背景为红色
                </td>
            </tr>
            <tr>
                <td>难度:</td>
                <td><select><option>困难</option><option>中等</option><option>简单</option></select></td>
            </tr>
            <tr>
                <td>对应章节:</td>
                <td><input value="T2"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <input style="width: 150px;height: 40px" type="button" value="修改">&nbsp;&nbsp;
                    <input style="width: 150px;height: 40px" type="button" value="重置">
                </td>

            </tr>

        </table>
    </div>
</body>
</html>
