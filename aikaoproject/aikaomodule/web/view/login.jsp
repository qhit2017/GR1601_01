<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/4
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript" src="/js/jquery.min.js"></script>
    <script language="JavaScript">
    $(document).ready(function () {
        $("#submit").click(function () {
            var uname=$("#uname").val();
            var upwd=$("#upwd").val();
            var loginselect=$("#loginselect").val();
            alert(uname+""+upwd+""+loginselect);
            $.ajax({
                url: "text?uname="+uname+"&upwd="+upwd+"&loginselect"+loginselect,
                type: "get",
                success: function (msg) {
                    var resulet=$.parseJSON(msg);
                    alert(resulet.info);
                    if (resulet.info=="0"){
                        alert("输入用户名密码错误，请重新输入！");
                    }else {
                        window.location.href="teacher.jsp";
                    }
                }
            });
        });
    });


    </script>
</head>
<body>
 <form action="login" method="get">
<input type="text" name="uname">
<input type="password" name="upwd">
     <select name="loginselect">
         <option value="0">管理员</option>
         <option value="1">教师</option>
         <option value="2">学生</option>
     </select>


<input type="submit" id="submit" value="登录">
<input type="reset" value="重置">
 </form>
</body>
</html>
