<html>
<head>
<title>教师管理</title>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/thems.css">
<script type="text/javascript" src="js/jquery.min.js"></script>



    <script>
     $(document).ready(function () {
         <%--显示老师信息ajax--%>
         $.ajax({
            url:"showteachersinfo",
            type:"get",
            success:function (msg) {
                /*反解析*/
                var obj = eval(msg);
                var str = "";
                var teacherifo="<tr><td>序号</td><td>账号</td><td>姓名</td><td>性别</td> <td>生日</td> <td>学历</td> <td>联系电话</td> <td>岗位</td> <td>操作</td> </tr>"
                for(var i=0;i<obj.length;i++){
                    alert(obj[i].tid);
                    str=str+"<tr><td>"+obj[i].tid+"</td><td>"+obj[i].tnumber+"</td><td>"+obj[i].tname+"</td><td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td>"+obj[i].ttel+"</td> <td>"+obj[i].tjob+"</td> <td><a onclick='edit("+obj[i].tid+")'>编辑</a> <input type='button'  value='删除'> <input type='button' value='重置'></td> </tr>";
                }
                $("#teachers").html(teacherifo+""+str);
            }
        });

         /*根据条件查询老师信息*/
         $("#selectteachers").click(function () {
             /*获取控件值*/
             var number = $("#number").val();
             var name = $("#name").val();
             var job = $("#job").val();
               $.ajax({
                 url:"selectteachers?number=" + number + "&name=" + name + "&job=" + job,
                 type:"get",
                 success:function (msg) {
                     /*反解析*/
                     var obj = eval(msg);
                     var str = "";
                     var teacherifo="<tr><td>序号</td><td>账号</td><td>姓名</td><td>性别</td> <td>生日</td> <td>学历</td> <td>联系电话</td> <td>岗位</td> <td>操作</td> </tr>"
                     for(var i=0;i<obj.length;i++){
                         str=str+"<tr><td>"+obj[i].tid+"</td><td>"+obj[i].tnumber+"</td><td>"+obj[i].tname+"</td><td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td>"+obj[i].ttel+"</td> <td>"+obj[i].tjob+"</td> <td><input type='button' value='删除'>  </td> </tr>";
                     }
                     $("#teachers").html(teacherifo+""+str);
                 }
             });
         });
      });
 </script>
    <script>
        /*编辑*/
        function edit(a) {
          /* $.ajax({
               url:"editteachers?id="+a,
               type:"get",
               success:function () {*/
                   window.location.href="editteachers?id="+a;
           /*    }
           });*/

        }
    </script>

</head>

<div id="right_ctn">
	<div class="right_m">
		<!--会议列表-->
        <div class="hy_list">
        	<div class="box_t">
                <span class="name">教师列表</span>
            </div>
            <!--查询-->
            <div class="search">
            	<span >账号：</span>
                <input id="number" type="text">
                <span >教师姓名：</span>
                <input id="name" type="text">
                <span >岗位</span>
                <select id="job">
                    <option value="0">教师</option>
                    <option value="1">班主任</option>
                </select>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a id="selectteachers">查询</a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="insertteachers.jsp">添加教师</a>
            </div>
            <!--查询-->
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <form action="" method="get">
            <table cellpadding="0" cellspacing="0" class="list_hy" id="teachers">

            </table>
            <!--列表-->
            <!--右边底部-->
            <div class="r_foot">
            	<div class="r_foot_m">
                <!--分页-->
                <div class="page">
                	<a href="" class="prev"><img src="Assets/images/icon7.png" alt=""/></a>
                    <a class="now">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href="">6</a>
                    <a href="" class="next"><img src="Assets/images/icon8.png" alt=""/></a>
                </div>
                <!--分页-->
                </div>
            </div>
            </form>
            <!--右边底部-->
        </div>
        <!--会议列表-->
    </div>
</div>

</body>
</html>
