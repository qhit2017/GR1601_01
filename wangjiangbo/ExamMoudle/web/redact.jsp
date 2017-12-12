<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/21
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑界面</title>
    <style>
        #main{
            width: 800px;
            height: 400px;
            border-style: groove;

        }
        #topic{
            width: 600px;
            height: 120px;
            border-style: solid;
        }
        #button1{
            text-align: center;
        }
    </style>
</head>
<body>
<div id="main">
      科目名称:<input type="text"><br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          类型:<select style="width: 50px">
                   <option style="height: 15px"></option>
                   <option></option>
               </select><br>
      题目内容:<div id="topic">
               </div>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="checkbox">A<input type="text"><br>
    &nbsp;
         选项:<input type="checkbox">B<input type="text"><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="checkbox">C<input type="text"><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="checkbox">D<input type="text"><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         难度:<select style="width: 50px">
                 <option style="height: 15px"></option>
                 <option></option>
              </select><br>
    题目内容:<input type="text"><br><br><br>
    <div id="button1"><input type="button" value="修改"><input type="button" value="重置"></div>
</div>
</body>
</html>
