<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-21
  Time: 下午3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
 charset=utf-8" />
    <title></title>
    <style>
        #div1{

            border:1px solid ;
            width:800px;
            height:600px

        }
    </style>
</head>
<body>

<div id="div1"align="center"> 添加教师<br>

    账号 2012823004<br>
    姓名 <input type="text"   name="pname" value=""><br>
    性别 <select>
        <option value="0">男</option>
        <option value="1">女</option>

        </select><br>
    生日<input type="text"   name="pname" value=""><br>
    学历 <input type="text"   name="pname" value=""><br>
    联系电话 <input type="text"   name="pname" value=""><br>
    岗位： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>

    </select><br>
    备注<br>
    <textarea rows="10" cols="30"></textarea><br>

    <input type="submit" value="确定">  <input type="submit" value="取消">
</div>

</body>
</html>
