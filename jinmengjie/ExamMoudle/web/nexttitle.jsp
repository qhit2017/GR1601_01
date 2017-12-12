<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建后的试卷</title>
</head>
<style>
    #bigdiv{
        position: absolute;
        width: 1000px;
        height: 600px;
        background: gainsboro;
        align-content: center;
        left: 300px;

    }


</style>
<body>
<div id="bigdiv">
    <table border="1" style="text-align: left ; left: 35px;"   >

        <tr>
            <td>
                方向：<select>
                <option>请选择</option>
            </select>
            </td>

            <td>
                阶段：<select>
                <option>请选择</option>
            </select>
            </td>
            <td>
                考试科目：<select>
                <option>请选择</option>
            </select><font color="red">*</font>
            </td>
        </tr>

        <tr >
            <td> 标题：<input type="text" name=""><font color="red">*</font></td>
        </tr>
        <tr>
            <td>总分：<input type="text" name="">分<font color="red">*</font></td>
            <td>考试分钟：<input type="text" name="">分钟</td>
        </tr>

        <tr>
            <td>已选题数：<input type="text" name="">分<font color="red">*</font></td>
            <td>每题分数：<input type="text" name=""></td>
        </tr>

    </table>
    <table>
        <tr>
            <td>1</td>
        </tr>
    </table>
</div>


</html>
