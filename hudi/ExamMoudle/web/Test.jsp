<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/1
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script language="JavaScript">
        $(document).ready(function () {
            $("btn").click(function () {
                $.ajax({
                    url: "testController?name=" + $("name").val(),
                    type: "get",
                    success: function () {
                        Location.href = ""
                    }
                })
            });
        });
    </script>
</head>
<body>
<form action="testController" method="get">
    <input type="text" name="name" id="name">
    <input type="button" id="btn" value="提交">
</form>
</body>
</html>
