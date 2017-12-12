<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-20
  Time: 上午11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<form action="loginway" method="post">
  账号 <input type="text"   name="loname" >
  密码 <input type="password" name="lopwd" >
  角色 <select name="role">
    <option value="0">管理员</option>
    <option value="1">教师</option>
    <option value="2">学生</option>
  </select>
  <input type="submit" value="登录">
</form>
  </body>
</html>
