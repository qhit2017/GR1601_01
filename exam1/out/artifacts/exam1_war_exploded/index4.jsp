<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-21
  Time: 下午4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
 charset=utf-8" />
    <title>Title</title>

    <style>
        #div1{

            border:1px solid ;
            width:800px;
            height:600px

        }
    </style>
</head>
<body>
<div id="div1"align="center"> 添加班级<br>

    班级代码 <input type="text"   name="pname" value=""><br>
    班级名称 <input type="text"   name="pname" value=""><br>
    所属方向 <select>
        <option value="0">男</option>
        <option value="1">女</option>

      </select><br>
    班主任 <select>
        <option value="0">男</option>
        <option value="1">女</option>

    </select><br>
    讲师 <select>
        <option value="0">男</option>
        <option value="1">女</option>

    </select><br>

    开班日期<input type="text"   name="pname" value=""><br>
    G1开班人数 <input type="text"   name="pname" value=""><br>
    G2开班人数 <input type="text"   name="pname" value=""><br>
    G3开班人数 <input type="text"   name="pname" value=""><br>

    状态： <select>
        <option value="0">启用</option>
         </select><br>
    备注<br>
    <textarea rows="2" cols="30"></textarea><br>

    <input type="submit" value="添加">  <input type="submit" value="取消">
</div>



</body>
</html>
