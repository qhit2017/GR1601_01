<%--
  Created by IntelliJ IDEA.
  User: zmg
  Date: 2017/11/20
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>

<html>

<link rel="stylesheet" type="text/css" href="../css/main.css"/>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/thems.css">
<link rel="stylesheet" type="text/css" href="../css/teacher.css">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>


    <title>学生管理</title>
    <script language="JavaScript" src="../js/jquery.min.js"></script>
    <script language="JavaScript">
        /*显示学生信息*/
        $(document).ready(function () {
            $.ajax({
                url: "selectstudentall",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    var studentinfo = "<tr><td>序号</td><td>学号</td><td>班级</td>" +
                        "<td>姓名</td> <td>性别</td> <td>联系电话</td> <td>操作</td></tr> ";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr><td>" + (i + 1) + "</td><td>" + obj[i].snumber + "</td>" +
                            "<td>" + obj[i].cnumber + "</td><td>" + obj[i].sname + "</td>" +
                            "<td>" + obj[i].ssex + "</td> <td>" + obj[i].stel + "</td> " +
                            "<td><a onclick='compile(" + obj[i].tid + "); '>编辑</a> 删除 <a onclick='updatepassword(" + obj[i].sid + "); '>重置</a></td> </tr>";
                    }
                    $("#studenttable").html(studentinfo + "" + str);
                }
            });




        });
    </script>
</head>
<body>
<form action="" method="post">
<div id="hd" style="background-color:#fcfff2">

    <div  style="text-align: left"> 在线考试管理系统</div>

    <div style="text-align: right"><a href="" style="text-decoration: none" id="kong" >注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>

</div>

<div id="bd">
    <div id="side" style="background-color: #fcfff2">
        <table width="100%">
            <tr>
                <td>教师管理</td>
            </tr>
            <tr>
                <td>班级管理</td>
            </tr>
            <tr>
                <td>学生管理</td>
            </tr>
            <tr>
                <td>题库管理</td>
            </tr>
            <tr>
                <td>试题管理</td>
            </tr>
            <tr>
                <td>成绩管理</td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>

        </table>

    </div>
    <div id="main">
        <div id="content">


            <div id="right_ctn">
                <div class="right_m">
                    <!--会议列表-->
                    <div class="hy_list">
                        <div class="box_t"style="text-align: center">
                            <span  >学生列表</span>

                        </div>
                        <!--查询-->
                        <div class="search"  style="height: 100px">&nbsp&nbsp&nbsp
                            <a href="insertstudent.jsp" >添加学生</a>&nbsp&nbsp&nbsp&nbsp
                            <a href="">学生信息导出</a>&nbsp&nbsp&nbsp&nbsp
                            <a href="">学生信息导入</a>&nbsp&nbsp&nbsp&nbsp
                            <a href="">学生信息空模版下载</a><br>
                            学号：
                            <div class="s_text"><input name="" type="text"></div>
                            姓名：
                            <div class="s_text"><input name="" type="text"></div>

                            班级：
                            <select name="select" id="select_k1" class="xla_k">
                                <option value="0">G1601</option>
                                <option value="1">G1601</option>
                                <option value="2">G1601</option>
                            </select>

                            入学年份：
                            <select name="select" id="select_k2" class="xla_k">
                                <option value="0">2000</option>
                                <option value="1">2001</option>
                                <option value="2">2016</option>
                            </select>

                            就读方向：
                            <select name="select" id="select_k3" class="xla_k">
                                <option value="0">java</option>
                                <option value="1">Ui</option>
                                <option value="2">测试</option>
                            </select>


                            <a href="" class="btn">查询</a>
                        </div>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->

                            <table cellpadding="0" cellspacing="0" class="list_hy" id="studenttable">

                            </table>


                    </div>

                </div>
            </div>

        </div>
    </div>

    <!--列表-->
    <!--右边底部-->
    <div class="r_foot">
        <div class="r_foot_m">

            <a href="" class="btn">删除</a>
            <a href="" class="btn">刷新</a>

            <!--分页-->
            <div class="page">
                <a href="" class="prev"><img src="/images/icon7.png" alt=""/></a>
                <a class="now">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="">4</a>
                <a href="">5</a>
                <a href="">6</a>
                <a href="" class="next"><img src="/images/icon8.png" alt=""/></a>
            </div>
            <!--分页-->
        </div>
    </div>
</div>
</form>
</body>
</html>

