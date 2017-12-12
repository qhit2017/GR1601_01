<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/21
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>随机组卷界面!!</title>
    <style>
        #all{
            width: 800px;
            height: 600px;
            border-style: dotted;
            text-align: center;
        }
        #all_li{
            width: 500px;
            height: 400px;
            border-style: none;
            margin-top: 100px;
            margin-left: 100px;
        }
        #last{
            text-align: center;
        }
    </style>
</head>
<body>
 <form>
     <div id="all">
          <div id="all_li">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              方向：<select style="width: 50px">
                     <option style="height: 20px"></option>
                     <option></option>
                   </select>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              阶段：<select style="width: 50px">
                     <option style="height: 20px"></option>
                     <option></option>
                   </select>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              科目：<select style="width: 70px">
                     <option style="height: 20px"></option>
                     <option></option>
                   </select><br><br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              标题：<input type="text"><br><br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              总分：<input type="text"><br><br>
          考试时长：<input type="text"><br><br>
              &nbsp;&nbsp;
            单选题：简单：<input type="text" style="width: 30px">一般：<input type="text" style="width: 30px">困难：<input type="text" style="width: 30px"><br><br>
              &nbsp;&nbsp;
            多选题：简单：<input type="text" style="width: 30px">一般：<input type="text" style="width: 30px">困难：<input type="text" style="width: 30px"><br><br>
              &nbsp;&nbsp;
            总题数：<input type="text"><br><br>
          每题分数：<input type="text"><br><br>
              <div id="last"><input type="button" value="创建试卷"><input type="button" value="取消"></div>
          </div>
     </div>
 </form>
</body>
</html>
