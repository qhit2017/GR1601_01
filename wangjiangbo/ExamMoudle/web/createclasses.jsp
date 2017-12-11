<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/21
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建班级界面</title>
    <style>
        #sex{
            width: 80px;
            height:25px;
        }
        #job{
            width:80px;
            height:25px;
        }
        #remark{
            width:500px;
            height: 100px;
            border-style: solid;
        }
        #teach{
            width: 80px;
            height:25px;
        }
        #teach_1{
            width: 80px;
            height:25px;
        }
        #teach_2{
            width: 80px;
            height:25px;
        }

    </style>
</head>
<body>
<form>
    <center> <div id="main">
        班级代码：<input type="text"><br><br>
        班级名称：<input type="text"><br><br>
        所属方向：<select id="sex">
                     <option value=""></option>
                     <option value=""></option>
                  </select><br><br>
        班主任：<select id="teach">
                    <option value=""></option>
                    <option value=""></option>
               </select><br><br>
        讲师：<select id="teach_1">
                 <option value=""></option>
                 <option value=""></option>
              </select><br><br>
        开班日期：<input type="text"><br><br>
        开班人数：<input type="text"><br><br>
        状态：<select id="teach_2">
                    <option value=""></option>
                    <option value=""></option>
              </select><br><br>
        备注：<div id="remark">
              </div><br><br>
        <input type="button" name="" value="确定">  <input type="button" name="" value="取消">
    </div></center>
</form>
</body>
</html>
