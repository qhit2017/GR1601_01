<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-21
  Time: 下午5:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
科目类型 <input type="password" name="pwd" value=""><br>
类型 <select>
    <option value="0">单选</option>
    <option value="1">教师</option>
    <option value="2">学生</option>
</select><br>
题目内容<br>
<textarea rows="10" cols="30"></textarea><br>
选项：<label><input name="Fruit" type="checkbox" value="" />A
    <input type="password" name="pwd" value=""></label><br>
<label><input name="Fruit" type="checkbox" value="" />B
    <input type="password" name="pwd" value=""></label><br>
<label><input name="Fruit" type="checkbox" value="" />C
    <input type="password" name="pwd" value=""> </label><br>
<label><input name="Fruit" type="checkbox" value="" />D
    <input type="password" name="pwd" value=""></label><br>
难度 <select>
    <option value="0">困哪</option>
    <option value="1">教师</option>
    <option value="2">学生</option>
</select><br>
对应章节 <input type="password" name="pwd" value=""><br>
<input type="submit" value="修改">  <input type="submit" value="重置">

</body>
</html>
