<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
    <script language="javascript" src="js/jquery.min.js"></script>
    <script>

      $$ =jQuery.noConflict();

      $$(document).ready(function () {

          //发送ajax
          $$.ajax({
              url:"showteacherlist",
              type:"get",
              success:function(msg){
                  var obj =  eval(msg)
                  var str="";
                  for(var i=0;i<obj.length;i++){
                      str = str+obj[i].tid+"&nbsp&nbsp&nbsp&nbsp";
                      str = str+obj[i].tnumber+"&nbsp&nbsp&nbsp&nbsp";
                      str = str+obj[i].tname+"<br>";

                  }
                  $$("#teacherlist").html(str);
              }
           });

          $$("#cx").click(function () {
              $$.ajax({
                  url:"showteacherlist",
                  type:"get",
                  success:function(msg){
                      var obj =  eval(msg)
                      var str="";
                      for(var i=0;i<obj.length;i++){
                          str = str+obj[i].tid+"&nbsp&nbsp&nbsp&nbsp";
                          str = str+obj[i].tnumber+"&nbsp&nbsp&nbsp&nbsp";
                          str = str+obj[i].tname+"<br>";

                      }
                      $$("#teacherlist").html(str);
                  }
              });

          });



          }
      );

    </script>
  </head>



  <body>



  <table>

    <tr>
      <td>

      <div style="


      margin-right: 50px">


          <div><a>教师管理</a></div>
          <div><a>班级管理</a></div>
          <div><a>学生管理</a></div>
          <div><a>题库管理</a></div>

        <div><a>试卷管理</a></div>
        <div><a>成绩管理</a></div>
        <div><a>在线考试</a></div>
      </div>

      </td>
      <td>
        <div><a href="addteacher">添加></a></div>

        <div>账号<input type="text"> 姓名<input type="text">
        岗位  <select >

                <option value="0">班主任</option>
                <option value="1">讲师</option>
          </select>

          <a id="cx">查询</a>
        </div>


        教师管理界面 b
        <div id="teacherlist"></div>

      </td>

    </tr>

  </table>

  </body>
</html>
