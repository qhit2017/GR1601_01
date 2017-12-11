<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/20
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/classes.css">
<html>
<head>
    <title>班级界面</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {

            var title="<tr align='center'><td>序号</td> <td>班级代码</td> <td>班级名称</td> <td>所属方向</td> <td>班主任</td> <td>讲师</td> <td>开班日期</td> <td>状态</td> <td>操作</td> </tr>";
            $.ajax({
                url:"classesshowlist",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    for (var i=0;i<obj.length;i++){
                        alert(obj[i].cname);
                        if (obj[i].cstate=="0"){
                            str = str+"<tr align='center'><td>"+(i+1)+"</td> <td>"+obj[i].cnumber+"</td> <td>"+obj[i].cname+"</td> <td>"+obj[i].cdirection+"</td>><td>"+obj[i].teachersh.tname+"</td> <td>"+obj[i].teachersl.tname+"</td> <td>"+obj[i].cbegin+"</td> <td>启用</td> <td><a onclick='redact("+obj[i].cid+");'>编辑</a></td> </tr>";
                        }
                        if (obj[i].cstate=="1"){
                            str = str+"<tr align='center'><td>"+(i+1)+"</td> <td>"+obj[i].cnumber+"</td> <td>"+obj[i].cname+"</td> <td>"+obj[i].cdirection+"</td>><td>"+obj[i].teachersh.tname+"</td> <td>"+obj[i].teachersl.tname+"</td> <td>"+obj[i].cbegin+"</td> <td>禁用</td> <td><a>编辑</a></td> </tr>";
                        }

                    }
                    $("#c_table").html(title + str);
                }
            });
            $("#c_select").click(function () {
                $.ajax({

                    url:"selectclassbycbeginorcdirectionorteacherslorteachersh?cbegin="+$("#cbegin").val()+"&cdirection="+$("#cdirection").val()+"&teachersl="+$("#teachersl").val()+"&teachersh="+$("#teachersh").val(),
                    type:"get",
                    success:function () {
                        var obj = eval(msg);
                        var str = "";
                        for (var i=0;i<obj.length;i++){
                            if (obj[i].cstate=="0"){
                                str = str+"<tr align='center'><td>"+(i+1)+"</td> <td>"+obj[i].cnumber+"</td> <td>"+obj[i].cname+"</td> <td>"+obj[i].cdirection+"</td>><td>"+obj[i].teachersh.tname+"</td> <td>"+obj[i].teachersl.tname+"</td> <td>"+obj[i].cbegin+"</td> <td>启用</td> <td><a>编辑</a></td> </tr>";
                            }
                            if (obj[i].cstate=="1"){
                                str = str+"<tr align='center'><td>"+(i+1)+"</td> <td>"+obj[i].cnumber+"</td> <td>"+obj[i].cname+"</td> <td>"+obj[i].cdirection+"</td>><td>"+obj[i].teachersh.tname+"</td> <td>"+obj[i].teachersl.tname+"</td> <td>"+obj[i].cbegin+"</td> <td>禁用</td> <td><a>编辑</a></td> </tr>";
                            }

                        }
                        $("#c_table").html(title + str);
                    }
                });
            });
            $("#newclass").click(function () {
                $.ajax({
                    url:"findclasses",
                    type:"get",
                    success:function () {
                        window.location.href="insertclasses.jsp";
                    }
                });
            });

        });
    </script>
    <script>
        //编辑
        function redact(cid) {
            alert(cid);
            $.ajax({
                url:"updateclass?cid="+cid,
                type:"get",
                success:function () {
                    window.location.href = "updateclasses.jsp";
                }
            });
        }
    </script>
</head>
<body>
<div id="m_best">
    <div id="m_top">
        <div id="m_top_info">
            *在线考试管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017年11月20日&nbsp;11:20&nbsp;&nbsp;&nbsp;&nbsp;[<a href="#">注销</a>]&nbsp;&nbsp;[<a href="#">退出系统</a>]
        </div>
        <table border="1px" height="100px" width="250px">
            <tr>
                <td width="80px"></td>
                <td>欢迎您郭先生</td>
            </tr>
        </table>

    </div>
    <div id="m_left">
        <table width="100px">
            <tr><td>后台功能</td></tr>
            <tr><td>教师管理</td></tr>
            <tr><td>班级管理</td></tr>
            <tr><td>学生管理</td></tr>
            <tr><td>题库管理</td></tr>
            <tr><td>试题管理</td></tr>
            <tr><td>成绩管理</td></tr>
            <tr><td>修改密码</td></tr>
        </table>
    </div>
    <div id="m_right">
        <div id="c_content">
            <table border="1px" width="1350px">
                <tr>
                    <td align="center" colspan="5">班级列表</td>
                </tr>
                <tr>
                    <td><input type="button" value="新建班级" id="newclass"></td>
                </tr>
                <tr>
                    <td width="200px">入学年份：<select id="cbegin"><option value="2016-10-1">2016-10-1</option></select></td>
                    <td>所属方向：<select id="cdirection"><option value="JAVA">JAVA</option></select></td>
                    <td>讲师：<select id="teachersl"><option value="tom">tom</option><option value="jerry">jerry</option></select></td>
                    <td>班主任：<select id="teachersh"><option value="tom">tom</option><option value="jerry">jerry</option></select></td>
                    <td><input type="button" value="查询" id="c_select"></td>
                </tr>
            </table>
            <%--班级信息--%>
            <table border="1px" width="1350px" id="c_table">
               <%-- <tr align="center">
                    <td>序号</td>
                    <td>班级代码</td>
                    <td>班级名称</td>
                    <td>所属方向</td>
                    <td>班主任</td>
                    <td>讲师</td>
                    <td>开班日期</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                <tr align="center">
                    <td>1</td>
                    <td>IT1601</td>
                    <td>软件开发</td>
                    <td></td>
                    <td>王静</td>
                    <td>胡迪</td>
                    <td>2016-9-8</td>
                    <td>启用</td>
                    <td>编辑</td>
                </tr>--%>
            </table>
        </div>
    </div>
</div>
</body>
</html>
