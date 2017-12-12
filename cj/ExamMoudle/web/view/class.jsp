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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>


    <title>班级管理</title>
    <script language="JavaScript" src="../js/jquery.min.js"></script>
    <script language="JavaScript">

        <%--显示班级信息--%>
        $(document).ready(function () {
            $.ajax({
                url: "selectclassall",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    var classinfo = "<tr><td>序号</td><td>班级代号</td><td>班级名称</td><td>所属方向</td> <td>班主任</td> <td>讲师</td> <td>开班日期</td> <td>状态</td> <td>操作</td> </tr>"
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr><td>" + (i + 1) + "</td><td>" + obj[i].cnumber + "</td><td>" + obj[i].cname + "</td><td>" + obj[i].cdirection + "</td><td>" + obj[i].tidh + "</td><td>" + obj[i].tidl + "</td> <td>" + obj[i].cbegin + "</td> <td>" + obj[i].cstate + "</td>  <td>编辑 </a></td> </tr>";
                    }
                    $("#classtable").html(classinfo + "" + str);
                }
            });
            /*根据条件查询*/
            $.ajax({
                url: "selectconditionclass？cbegin="+cbegin+"&cdirection="+cdirection+"&tidl"+tidl+"&tidh"+tidh,
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    var classinfo = "<tr><td>序号</td><td>班级代号</td><td>班级名称</td><td>所属方向</td> <td>班主任</td> <td>讲师</td> <td>开班日期</td> <td>状态</td> <td>操作</td> </tr>"
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr><td>" + (i + 1) + "</td><td>" + obj[i].cnumber + "</td><td>" + obj[i].cname + "</td><td>" + obj[i].cdirection + "</td><td>" + obj[i].tidh + "</td><td>" + obj[i].tidl + "</td> <td>" + obj[i].cbegin + "</td> <td>" + obj[i].cstate + "</td>  <td>编辑 </a></td> </tr>";
                    }
                    $("#classtable").html(classinfo + "" + str);
                }
            });


        });
    </script>


</head>
<body>
<div id="hd" style="background-color:#fcfff2">

    <div style="text-align: left"> 在线考试管理系统</div>

    <div style="text-align: right"><a  style="text-decoration: none" id="kong">注销</a>&nbsp&nbsp&nbsp<a style="text-decoration: none">退出系统</a>
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
                            <span><b>班级管理</b></span>

                        </div>
                        <!--查询-->
                        <div class="search" style="height: 60px">
                            <a href="insertclass.jsp" class="btn">新建班级</a>
                            <span>入学年份：</span>
                            <select name="select" id="cbegin" class="xla_k">
                                <option value="2017-6-6">2017-6-6</option>
                                <option value="2016-6-6">2016-6-6</option>

                            </select>
                            <span>所属方向：</span>
                            <select name="select" id="cdirection" class="xla_k">
                                <option value="Java">JAVA</option>
                                <option value="3G4G">3G4G</option>
                            </select>

                            <span>讲师：</span>
                            <select name="select" id="tidl" class="xla_k">
                                <option value="0"></option>
                            </select>

                            <span>班主任</span>
                            <select name="select" id="tidh" class="xla_k">
                                <option value="1"></option>
                            </select>

                            <a href="" class="btn">查询</a>
                            <a href="" class="btn">取消</a>
                        </div>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->
                        <form action="" method="post">
                            <table cellpadding="0" cellspacing="0" class="list_hy" id="classtable">

                            </table>

                        </form>
                        <!--右边底部-->
                    </div>
                    <!--会议列表-->
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

</body>
</html>

