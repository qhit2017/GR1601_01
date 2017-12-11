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
        <td>总分</td>
    </tr>
    <tr>
        <td>考试时长</td>
    </tr>
    <tr>
        <td>单选题: 简单<input type="text" name="" style="width:50px; height:20px;" >
            一般<input type="text" name="" style="width:50px; height:20px;" >
            困难<input type="text" name="" style="width:50px; height:20px;" >
        </td>

    </tr>
    <tr>
        <td>总题数:<input type="text" name="" style="width:50px; height:20px;" ></td>

    </tr>
    <tr>
        <td>每题分数:<input type="text" name="" style="width:50px; height:20px;" ></td>

    </tr>
    <tr>
        <td><button>创建试卷</button><button>取消</button></td>

    </tr>


</table>
</body>
</html>
