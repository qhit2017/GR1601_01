<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20 0020
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
      <title>登录</title>
      <script src="js/jquery.min.js"></script>
      <%-- <script>
              $(document).ready(function () {
                  var name=$("#name").val();
                  var password=$("#password").val();
                  var role=$("#role").val();
                  $.ajax({
                      url:"teacherstudent?name="+name+"&password="+password+"&role="+role,
                      type:"get",
                      success:function (msg) {
                          var result=$.parseJSON(msg);
                          if(result.info=="true"){
                              window.location.href="teacherlist.jsp";
                          }
                          else {
                              alert("登录信息有误,请确认后重新登录！");
                              //window.location.href="login.jsp";
                          }
                      }
                  });
              })
       </script>--%>
</head>
<body>

<form action="teacherstudent" method="post">
<table>
       <tr><td colspan="2">登录</td></tr>
       <tr><td>用户名</td><td><input type="text" id="name" name="name"></td></tr>
       <tr><td>密码</td><td><input type="password" id="password" name="password"></td></tr>
       <tr><td>角色</td><td>
              <select name="role"><option value="0">管理员</option>
              <option value="1">教师</option>
              <option value="2">学生</option></select></td></tr>
       <tr><td><input type="submit" value="登录"></td><td><input type="submit" value="重置"></td></tr>

</table></form>
</body>
</html>
