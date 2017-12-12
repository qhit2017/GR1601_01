<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-21
  Time: 下午7:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

方向 <select>
    <option value="0">SCCE</option>
    <option value="1">教师</option>
    <option value="2">学生</option>
</select>
阶段 <select>
    <option value="0">G1</option>
    <option value="1">教师</option>
    <option value="2">学生</option>
</select>
科目 <select>
    <option value="0">ps</option>
    <option value="1">教师</option>
    <option value="2">学生</option>
</select><br>
标题 <input type="text"   name="pname" value=""><br>
总分 <input type="text"   name="pname" value=""><br>
考试时长 <input type="text"   name="pname" value="">分钟<br>
单选题：简单<input type="text"   name="pname" value="" size="3">
        一般<input type="text"   name="pname" value="" size="3">
        困难<input type="text"   name="pname" value="" size="3"><br>
多选题：简单<input type="text"   name="pname" value="" size="3">
        一般<input type="text"   name="pname" value="" size="3">
        困难<input type="text"   name="pname" value="" size="3"><br>
总题数<input type="text"   name="pname" value="" size="3"><br>
每题分数<input type="text"   name="pname" value="" size="3"><br>
<input type="submit" value="创建试卷">  <input type="submit" value="取消">
</body>
</html>
