<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>教师管理</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/thems.css">
    <link rel="stylesheet" type="text/css" href="../css/teacher.css">


    <script language="JavaScript" src="../js/jquery.min.js"></script>
    <script language="JavaScript">
        /*显示老师信息*/
        $(document).ready(function () {
            $.ajax({
                url: "teacher",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    var teacherifo = "<tr><td>序号</td><td>账号</td><td>姓名</td><td>性别</td> <td>生日</td> <td>学历</td> <td>联系电话</td> <td>岗位</td> <td>操作</td> </tr>"
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr><td>" + (i + 1) + "</td><td>" + obj[i].tnumber + "</td><td>" + obj[i].tname + "</td><td>" + obj[i].tsex + "</td><td>" + obj[i].tbirthday + "</td> <td>" + obj[i].tphone + "</td> <td>" + obj[i].ttel + "</td> <td>" + obj[i].tjob + "</td> <td><a onclick='compile(" + obj[i].tid + "); '>编辑</a><a onclick='delete("+ obj[i].tid +")'>删除 </a> <a onclick='updatepassword(" + obj[i].tid + ");'>重置</a></td> </tr>";
                    }
                    $("#teachertable").html(teacherifo + "" + str);
                }
            });

            //s根据账号  姓名  角色查询
            $(document).ready(function () {
                $("#selectbut").click(function () {
                    /*取控件值*/
                    var tnumber = $("#tnumber").val();
                    var tname = $("#tname").val();
                    var tjob = $("#tjob").val()
                    $.ajax({
                        url: "selectteacher? tnumber=" + tnumber + "&tname=" + tname + "&tjob=" + tjob,
                        type: "get",
                        success: function (msg) {
                            var obj = eval(msg);
                            var str = "";
                            var teacherifo = "<tr><td>序号</td><td>账号</td><td>姓名</td><td>性别</td> <td>生日</td> <td>学历</td> <td>联系电话</td> <td>岗位</td> <td>操作</td> </tr>"
                            for (var i = 0; i < obj.length; i++) {
                                str = str + "<tr><td>" + (i + 1) + "</td><td>" + obj[i].tnumber + "</td><td>" + obj[i].tname + "</td><td>" + obj[i].tsex + "</td><td>" + obj[i].tbirthday + "</td> <td>" + obj[i].tphone + "</td> <td>" + obj[i].ttel + "</td> <td>" + obj[i].tjob + "</td> <td>编辑 删除 重置</td> </tr>";
                            }
                            $("#teachertable").html(teacherifo + "" + str);
                        }
                    });
                });
            });
        });
    </script>



    <%--编辑--%>

    <script>

        function compile(tid) {
            alert("456" + tid);
            $.ajax({
                url: "compileteacher?tid=" + tid,
                type: "get",
                success: function () {
             window.location.href="editteacher.jsp";
                }
            });
        }

    </script>

    <%--删除--%>
    <script>
        function updatepassword(tid) {

            $.ajax({
                url: "updatepassword?tid=" + tid,
                type: "get",
                success: function () {
                }
            });
        }

    </script>



    <%--重置密码--%>
    <script>
        function updatepassword(tid) {

            $.ajax({
                url: "updatepassword?tid=" + tid,
                type: "get",
                success: function () {


                }
            });
        }

    </script>


</head>
<body>
<form action="teacher" method="get">
    <div id="hd" style="background-color:#fcfff2">

        <div style="text-align: left"> 在线考试管理系统</div>

        <div style="text-align: right"><a href="" style="text-decoration: none" id="kong">注销</a>&nbsp&nbsp&nbsp<a
                href=""
                style="text-decoration: none">退出系统</a>
        </div>

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
                            <div class="box_t" style="text-align: center">
                                <span> <b>教师列表</b></span>

                            </div>
                            <!--查询-->
                            <div class="search" style="height: 100px">
                                <a href="insertteacher.jsp" class="btn">添加教师</a><br>

                                账号
                                <div class="s_text"><input type="text" id="tnumber"></div>
                                教师姓名
                                <div class="s_text"><input type="text" id="tname"></div>
                                岗位
                                <select id="tjob">
                                    <option value="0">班主任</option>
                                    <option value="1">讲师</option>

                                </select>
                                <a id="selectbut">查询</a>
                            </div>
                            <!--查询-->
                            <div class="space_hx">&nbsp;</div>
                            <!--列表-->

                            <table cellpadding="0" cellspacing="0" class="list_hy" width="100%" id="teachertable">

                            </table>


                            <!--右边底部-->
                        </div>

                    </div>
                </div>
                <!--会议列表-->
            </div>

        </div>

    </div>

    <!--列表-->
    <!--右边底部-->
    <!--分页-->
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

        </div>


    </div>
</form>
</body>
</html>

