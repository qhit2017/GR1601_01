<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/6
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="createTestPaper" method="post">
<input type="text" name="title">
<input type="text" name="score">
<input type="text" name="sum"><br>

<input type="checkbox" value="1" name="timu"><br>
<input type="checkbox" value="2"  name="timu"><br>
<input type="checkbox" value="3"  name="timu"><br>
<input type="checkbox" value="4"  name="timu"><br>
<input type="checkbox" value="5"  name="timu"><br>


</form>
<input type="submit" value="创建试卷">

</body>
</html>
