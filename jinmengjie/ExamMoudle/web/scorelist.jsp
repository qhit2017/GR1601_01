<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩列表</title>
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
    <table>
        <tr >
            <td colspan="7">【struts考试1】成绩列表</td>
        </tr>
        <tr>
            <td>
                班级：<select>
                <option></option>
            </select>
            </td>
            <td>
                学生姓名：<input type="text" name="">
            </td>
            <td>
                <input type="submit" value="查询">
            </td>
        </tr>

        <tr>
            <td>查询结果：总人数1 及格人数0 及格率0.0%</td>
        </tr>


        <table border="1px">
            <tr>
                <td>序号</td>
                <td>姓名    </td>
                <td>班级</td>
                <td>开考时间</td>
                <td>结束时间</td>
                <td>分数</td>

                <td>操作</td>

            </tr>
        </table>

    </table>
</div>
</body>
</html>
