<%--
  Created by IntelliJ IDEA.
  User: 王英豪
  Date: 2017/11/20
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>登录</title>
    <script src="view/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript ">
    </script>

</head>
<style type="text/css">
    #bigdiv{
        position: absolute;
        width:500px;
        height:300px;
        left:50%;
        top:50%;
        margin-left:-250px;
        margin-top:-100px;
        border: solid 3px gainsboro;
    }
    .text{
        width:150px;
        height:40px;
    }
</style>
<body>
<div id="bigdiv" align="center">
    <form action="login" method="post">

        用户名  &nbsp;&nbsp;<input  type="text" name="username"  class="text" ><br><br><br>
        密   码 &nbsp;&nbsp;<input  type="password" name="pwd" class="text"><br><br><br><br>
        角   色 <select name="role">
        <option value="0">管理员</option>
        <option value="1">教师</option>
        <option value="2">学生</option>
    </select><br><br><br>
        <input  type="submit" name="login" value="登录" >
        <input  type="submit" name="reset" value="重置" ><br>
    </form>
</div>

</body>
</html>
