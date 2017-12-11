<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/24
  Time: 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="login" method="post">
    <input type="text" name="username"><br>
    <input type="password" name=" "><br>
    <select name="role">
        <option value="0">管理员</option>
        <option value="1">教师</option>
        <option value="2">学生</option>
    </select><br>
    <input type="submit" value="登录">
</form>
</body>
</html>
