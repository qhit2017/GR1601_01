<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>开始考试</title>
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
    <table border="1px"  style="text-align: center">
        <tr>
            <td><input type="submit" value="开始考试"> <input type="submit" value="取消"></td>
        </tr>
        <tr colspan="3">
            <td>请选择参加考试的班级及开考时间</td>
        </tr>
        <tr>
            <td>班级</td>
            <td>开考时间</td>
            <td><input type="submit" value="添加"></td>
        </tr>
        <tr>
            <td>
                <select>
                <option>G3T53</option>
                </select>
            </td>
            <td>
              <input type="text">
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <select>
                <option>G3T54</option>
                </select>
            </td>
            <td> <input type="text"></td>
            <td><input type="submit" value="删除"></td>
        </tr>
    </table>
</div>
</body>

</html>
