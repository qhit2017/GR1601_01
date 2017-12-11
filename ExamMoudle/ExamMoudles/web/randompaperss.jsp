<%--
  Created by IntelliJ IDEA.
  User: 王英豪
  Date: 2017/11/22
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1" width="900px" height="500px">
    <tr>方向:
        <select name="ComboBox">
            <option value="0" selected>SCCE</option>
            <option value="1" selected>JAVA</option>
            <option value="2" selected>JS</option>
        </select>
        阶段:
        <select name="ComboBox">
            <option value="0" selected>G1</option>
            <option value="1" selected>G2</option>
            <option value="2" selected>G3</option>
        </select>
        科目:
        <select name="ComboBox">
            <option value="0" selected>G1</option>
            <option value="1" selected>G2</option>
            <option value="2" selected>G3</option>
        </select>

    <tr><td>
        标题:<input type="text" name=""></td>
    </tr>
    </tr>
    <tr>
        <td>总分:<input type="text" name=""></td>
    </tr>
    <tr>
        <td>考试时长:<input type="text" name=""></td>
    </tr>
    <tr>
        <td>已选题数: <input type="text" name="">分数:<input type="text" name=""></td>
    </tr>
    <tr>
        <td>
            <textarea cols='50' rows='10'></textarea></td>
    </tr>
    <tr>
        <td><button>创建试卷</button><button>取消</button></td>

    </tr>


</table>
</body>
</html>
