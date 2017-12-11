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
    <title>添加学生界面</title>
    <style>
        #main{
            width: 900px;
            height: 900px;
            border-style: solid;
        }
        #sex{
            width: 80px;
        }
        #job{
            width:80px;
        }
        #remark{
            width:500px;
            height: 100px;
            border-style: solid;
        }
        #age{
            width: 80px;
        }
        #class{
            width: 80px;
        }
        #province{
            width: 80px;
        }
        #major{
            width: 80px;
        }
        #dormitory{
            width: 80px;
        }
        #remark{
            width:500px;
            height: 100px;
            border-style: solid;

        }
        #remark_1{
            width:500px;
            height: 100px;
            border-style: solid;

        }
        #insertstudent{
            text-align: center;
        }
        #mainright{
            position: absolute;
            width: 400px;
            height: 500px;
            border-style: none;
            margin-left: 490px;
        }
        #photo{
            position: absolute;
            width: 150px;
            height: 150px;
            border-style: double;
            margin-left: 150px;
        }
        #city{
            width: 80px;
            height:20px;
        }
        #direction{
            width: 80px;
            height:20px;
        }
    </style>
    <script>
        /*上传*/
        $(document).ready(function () {


            $("#but1").click(function () {
               /*发送ajax请求*/
               $.ajaxFileUpload({
                  url:"uploadImg",
                   fileElementid:"upload",
                   secureuri:false,
                   type:"post",
                   dataType:"json",
                   success:function (msg) {
                       var obj = $.parseJSON(msg);
                       $("#img1").attr("src".obj.path);
                   }
               });
            });


        });
    </script>
</head>
<body>
<form>
     <div id="main">
        <div id="insertstudent">添加学生</div><br>
         <div id="mainright">
             <input type="button" value="选择文件">未选择文件<br>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             (支持jpg，jif，png格式)<input type="button" value="确定"><br>
             照片：<div id="photo"></div><br><br><br><br><br><br><br><br><br>
             政治面貌: <input type="text" value=""><br><br>
             城市：<select id="city">
                       <option value=""></option>
                       <option value=""></option>
                   </select><br><br>
             就读方向：<select id="direction">
                        <option value=""></option>
                        <option value=""></option>
                       </select><br><br>
             家庭住址：<input type="text"><br><br>
             监护人与学生人关系：<input type="text" ><br><br>
             宿舍号：<input type="text" ><br>
         </div>
        学号：<input type="text"><br><br>
        姓名：<input type="text"><br><br>
        性别：<select id="sex">
        <option value=""></option>
        <option value=""></option>
    </select><br><br>
        入学年份：<select id="age">
         <option value=""></option>
         <option value=""></option>
     </select><br><br>
        所属班级：<select id="class">
         <option value=""></option>
         <option value=""></option>
     </select><br><br>
        生日：<input type="text"><br><br>
        身份证：<input type="text"><br><br>
        省份：<select id="province">
                   <option value=""></option>
                   <option value=""></option>
              </select><br><br>
         专业简称：<select id="major">
                      <option value=""></option>
                      <option value=""></option>
                    </select><br><br>
         联系电话：<input type="text"><br><br>
         家长联系电话：<input type="text"><br><br>
         宿舍：<select id="dormitory">
                    <option value=""></option>
                    <option value=""></option>
               </select><br><br>
         基本情况：
         <input type="text" id="remark"><br><br>
         教育背景：
         <input type="text" id="remark_1">
    </div>
</form>
    <input type="file" id="upload" name="upload"><br>
    <input type="button" id="but1" value="上传"><br>
    照片：<img id="img1" src="">
</body>
</html>