<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/5
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>测试</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script language="JavaScript" src="jquery.min.js"></script>
    <script type="text/javascript">
/*       $(document).ready(function () {
               //讲师信息下拉框
               $.ajax({
               url:"selectTeacherTjob0",
               type:"get",
               success:function (msg) {
                   var obj=eval(msg);
                   var str="";

                   for(var i=0;i<obj.length;i++) {
                       str=str+'<option value="'+obj[i].cid+'">'+obj[i].tname+'</option>';
                   }
                   $("#tidh").html(str);
               }
           });
       });*/

    </script>


</head>
<body>
<form action="selectTeacherTjob0" method="get">
<select id="tidh">
    <option></option>
</select>
</form>
</body>
</html>
