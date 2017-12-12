<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-20
  Time: 下午8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
<script language="JavaScript" src="js/jquery.min.js"></script>

        <script>
       $$=jQuery.noConflict();

        $$(document).ready(function () {
            //发送ajax


            $$.ajax({
                url:"showteacherlist",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);
                    var str="";
                    var titleinfo ="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i=0;i<obj.length;i++){
                        /* var a=obj[i].tname;
                         alert(a);*/
                        str = str + "<tr> <td class='tablemargin'>"+obj[i].tid+"</td><td class='tablemargin'>"+obj[i].tnumber+"</td> <td class='tablemargin'>"+obj[i].tname+"</td> <td class='tablemargin'>"+obj[i].tsex+"</td> <td class='tablemargin'>"+obj[i].tbirthday+"</td> <td class='tablemargin'>"+obj[i].tedu+"</td> <td class='tablemargin'>"+obj[i].ttel+"</td> <td class='tablemargin'>"+obj[i].tjob+"</td> <td class='tablemargin'>编辑  重置密码  删除</td> </tr>"
                    }
                    var alltable=titleinfo+str;
                    $$("#tableteacherinfo").html(alltable);

                }
            })


        });




        </script>


    <style>
    #div1{

    border:1px solid ;
    width:1200px;
    height:600px

    }
 #div2{

    border:1px solid ;
    width:1200px;
    height:100px
    }
 #div3{

     border:1px solid ;
     width:150px;
     height:500px



 }
    #div4{
     position: absolute;
     top: 110px;
     left: 160px;

     border:1px solid ;
     width:1050px;
     height:500px



 }

    </style>
</head>
<body>

<div id="div1"  >
<div id="div2" align="center" >
             在线考试系统<br>
    <a href="">注销</a><br>
    <a href="">退出系统</a><br>
</div>
<div id="div3" align="center">
        <a href="">后台功能</a><br>
        <a href="">教师管理</a><br>
        <a href="">班级管理</a><br>
        <a href="">学生管理</a><br>
        <a href="">题库管理</a><br>
        <a href="">试卷管理</a><br>
        <a href="">成绩管理</a><br>
        <a href="">修改密码</a><br>
</div>
<div id="div4"  >
    <p align="center">教师列表 <input type="submit" value="添加教师"></p><br>

    账号 <input type="text" id="stnumber" >
    教师名字 <input type="text" id="sname" >
    岗位： <select id="sjob">
    <option value="0">讲师</option>
    <option value="1">班主任</option>

           </select>
    <input type="submit" value="查询" id="cx"><br>
    <table border="1" width="900px" height="400px"  align="center" >

        <tr  id="tableteacherinfo">
            <td ></td>
            <td ></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td ></td>
        </tr>
    </table>

    
</div>
</div>

</body>
</html>
