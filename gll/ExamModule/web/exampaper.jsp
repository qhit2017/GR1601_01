<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/20
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/exampaper.css">
<html>
<head>
    <title>试卷管理模块</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            var title = " <tr align='conter'> <td>序号</td> <td>类别</td> <td>科目</td> <td>标题</td> <td>考试班级</td> <td>考试时长(分钟)</td> <td>状态</td> <td>操作</td> </tr>";
            alert("666");
            $.ajax({
                url:"testpaperlist",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    for (i=0;i<obj.length;i++){
                        alert(obj[i].ttype);
                       if (obj[i].tstate=="0"){
                           var str = "<tr align='conter'> <td>"+(i+1)+"</td> <td>"+obj[i].ttype+"</td> <td>["+obj[i].subject.sudirection+"&nbsp"+obj[i].subject.sustage+"]"+obj[i].subject.sucourse+"</td> <td>"+obj[i].ttitle+"</td> <td></td> <td>"+obj[i].ttime+"</td> <td>"+obj[i].tstate+"</td> <td><a href='#'>结束考试</a> <a href='#'>查看成绩</a> <a href='#'>查看试卷</a></td> </tr>";
                       }
                    }
                    $("#tp_table").html(title + str);
                }
            });
           $("#tp_select").click(function () {
               var sudirction = $("#direction").val();
               var sustage = $("#sustage").val();
               var sucourse = $("#sucourse").val();
               var ttype = $("#ttype").val();
               var tstate = $("#tstate").val();

               $.ajax({
                   url:"selecttestpaperlist?sudirction="+sudirction+"&sustage="+sustage+"&ttype="+ttype+"&sustage="+sustage+"&tstate="+tstate,
                   type:"get",
                   success:function (msg) {
                       var obj = eval(msg);
                       var str = "";
                       for (i==0;i<obj.length;i++){
                           if (obj[i].tstate=="0"){
                               var str = "<tr align='conter'> <td>"+(i+1)+"</td> <td>"+obj[i].ttype+"</td> <td>["+obj[i].subject.sudirection+"&nbsp"+obj[i].subject.sustage+"]"+obj[i].subject.sucourse+"</td> <td>"+obj[i].ttitle+"</td> <td>"+obj[i].subject.classes.cname+"</td> <td>"+obj[i].ttime+"</td> <td>"+obj[i].tstate+"</td> <td><a href='#'>结束考试</a> <a href='#'>查看成绩</a> <a href='#'>查看试卷</a></td> </tr>";
                           }
                       }
                       $("#tp_table").html(title + str);
                   }
               });
           });
        });
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
        <div id="ep_content">
            <%--试卷信息--%>
            <table>
                <tr>
                    <td>试卷列表</td>
                </tr>
            </table>
            方向：<select id="direction"><option>请选择</option></select>
            阶段：<select id="sustage"><option>请选择</option></select>
            考试科目：<select id="sucourse"><option>请选择</option></select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                考试类型：<select id="ttype"><option>请选择</option></select>
                &nbsp;&nbsp;&nbsp;
                状态：<select id="tstate"><option>请选择</option></select>
                <input type="button" value="查询" id="tp_select"><br>
                <input type="button" value="随机组卷">
                <input type="button" value="选择组卷">
                <input type="button" value="上机考试">
            <div id="ep_content_1">
                <table id="tp_table">
                   <%-- <tr>
                        <td>序号</td>
                        <td>类别</td>
                        <td>科目</td>
                        <td>标题</td>
                        <td>考试班级</td>
                        <td>考试时长(分钟)</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>--%>
                    <%--<tr>
                        <td>1</td>
                        <td>笔试</td>
                        <td>[SCME G1]  ps/plash</td>
                        <td>3S考试</td>
                        <td>IT601</td>
                        <td>60</td>
                        <td>考试中</td>
                        <td><a href="#">结束考试</a> <a href="#">查看成绩</a> <a href="#">查看试卷</a></td>
                    </tr>--%>
                </table>
            </div>

        </div>
    </div>
</div>
</body>
</html>
