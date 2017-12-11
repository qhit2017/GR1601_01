<%--
  Created by IntelliJ IDEA.
  User: 王英豪
  Date: 2017/11/22
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" >
    <tr>
    <tr><td>科目名称:<input type="text" name=""></td></tr>
    <tr><td>类型:<select name="ComboBox">
        <option value="0" selected>单选</option>
        <option value="1" selected>多选</option></select></td></tr>
    <tr><td>题目内容:<textarea cols='50' rows='10'></textarea></td></tr>
    <tr><td>选项
        <input type="radio" name="" value="A"/>A
        <input type="radio" name="" value="B"/>B
        <input type="radio" name="" value="C"/>C
        <input type="radio" name="" value="D"/>D</td></tr>
    <tr><td>难度:<select name="ComboBox">
        <option value="0" selected>困难</option>
        <option value="1" selected>简单</option></select></td></tr>
    <tr><td>对应章节:<input type="text" name=""></td> </tr>
    <tr><td><button>修改 </button><button>重置</button></td> </tr>
    </tr>
</table>
</body>
</html>
