
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/jquery-3.2.1.js"></script>
<%--    <style>
        #loginTopDIV
        {
            width: 100%;
            height: 22px;
            text-align:center;
            background-color: blue;
            display: none;
            cursor: move;
            z-index: 10;
        }

    </style>--%>
    <script>

        $(function () {
            alert("请重新登录")
            $("#tablestyle_l").click(function () {
                alert("fdfsdf");
                $("loginTopDIV").show();
            });
        })
    </script>
</head>
<body>
<div id="bigdiv" >
    <form action="login" method="post">
    <table id="tablestyle" border="0">
        <tr><td colspan="2"><h1 id="tablestyle_l">登  录</h1></td></tr>
        <tr class="tr"><td>用户名:</td><td><input type="text" name="name"></td></tr>
        <tr class="tr"><td>密码:</td><td><input type="password" name="password"></td></tr>
        <tr class="tr"><td>角色:</td>
            <td>
                <select name="rola">
                    <option value="0">管理员</option>
                    <option value="1">教师</option>
                    <option value="2">学生</option></select>
            </td>
        </tr>
        <tr >
            <td style="text-align: right"><input type="submit" id="submit" value="登  录"></td>
            <td style="text-align: center"><input type="button" id="button" value="重  置"></td>
        </tr>
    </table>
    </form>
</div>

<%--<div id="loginTopDIV">用DIV模拟的对话框</div>--%>

</body>
</html>
