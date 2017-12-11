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
    <title>questionbankmanage</title>
</head>
<style type="text/css">
    #bigdiv{
        width: 100%;
        height: 700px;
        background-color: bisque;
        position: absolute;
        left: 0px;
        top: 0px;
    }
    #topdiv{
        width: 100%;
        height: 60px;
        background-color: gainsboro;
        border-bottom:1px solid black;
    }
    #leftdiv{
        width: 299px;
        height: 640px;
        position: relative;
        background-color: beige;
        border-right:1px solid black;
    }
    #rightdiv{
        width: 1300px;
        height: 640px;
        position: relative;
        bottom:640px;
        left: 300px;
        background-color: lavender;
    }

    .subjectdiv{
        width: 400px;
        height: 100px;
        text-align: center;
        border:2px solid black;
    }

    a{
        text-decoration: none;
    }
    td {
        text-align:center; /*设置水平居中*/
        vertical-align:middle;/*设置垂直居中*/
    }

</style>
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script language="JavaScript">
    $(function () {
        function xianshi() {
            $.ajax({
                url:"selectsubject",
                type:"post",
                data:"sudirection="+$("#subjectsudirection").val()+"&sustage="+$("#subjectsustage").val(),
                success:function (msg) {
                    var obj = eval(msg);
                    var str = ""
                    for(var i= 0;i<obj.length;i++){
                        str = str+"<tr><td><a href='selectquestionbysuid?id="+obj[i].suid+"'><div class='subjectdiv'>"+obj[i].sucourse+" "+obj[i].sustage+"<br>笔试题:<a id='"+obj[i].suid +"'></a></a></div></td></tr>"
                        $.ajax({
                            url:"selectquestionnumber",
                            type:"post",
                            data:"id="+obj[i].suid,
                            success:function (msg) {
                                var num = $.parseJSON(msg);
                                $("#"+num.id+"").html(num.number)
                            }
                        })
                    }
                    $("#table1").html(str);
                }
            })
        }
        xianshi();
        $("#subjectsustage").change(function () {
            xianshi();
        })
    })
</script>
<body>
<div id="bigdiv">
    <div id="topdiv">
        <table width="1400px">
            <tr>
                <td width="1000px"><b style="font-size: 25px;position:relative;margin-left: 200px">在线考试管理系统</b></td>
                <td width="400px" >
                    2014年7月31日 星期四 8:36
                    [<a id="zhuxiao" style="color: royalblue">注销</a>]
                    [<a id="" style="color: royalblue">退出系统</a>]
                </td>
            </tr>
        </table>
    </div>
    <div id="leftdiv">
        <table style="margin: auto;height: 420px">
            <tr>
                <td><a href="teacherlist.jsp">教师管理</a></td>
            </tr>
            <tr>
                <td><a href="classlist.jsp">班级管理</a></td>
            </tr>
            <tr>
                <td><a href="studentlist.jsp">学生管理</a></td>
            </tr>
            <tr>
                <td><a href="questionbankmanage.jsp">题库管理</a></td>
            </tr>
            <tr>
                <td><a href="examlist.jsp">试卷管理</a></td>
            </tr>
            <tr>
                <td><a href="gradelist.jsp">成绩管理</a></td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>
        </table>
        </table>
    </div>
    <div id="rightdiv">
        <table border="0" style="width: 200px;height: 50px">
            <tr><td><select id="subjectsudirection"><option value="高软">高软</option></select></td>
                <td><select id="subjectsustage"><option value="G1">G1</option><option value="G2">G2</option><option value="G3">G3</option></select></td>
            </tr>
        </table>
        <table border="1" style="position:relative;width: 1000px;" id="table1">

        </table>
        <%--<tr>
                        <td><div class="subjectdiv">GBT   G1<br>机试题:0<br>笔试题:6</div></td>
                        <td><div class="subjectdiv">Ps   G1<br>机试题:0<br>笔试题:0</div></td>
                        <td><div class="subjectdiv">HTML   G1<br>机试题:0<br>笔试题:0</div></td>
                    </tr>
                    <tr>
                        <td><div class="subjectdiv">C# Base   G1<br>机试题:0<br>笔试题:6</div></td>
                        <td><div class="subjectdiv">Sql Base   G1<br>机试题:0<br>笔试题:0</div></td>
                        <td><div class="subjectdiv">C#   Winform   G1<br>机试题:0<br>笔试题:0</div></td>
                    </tr>
                    <tr>
                        <td><div class="subjectdiv">12   G1<br>机试题:0<br>笔试题:6</div></td>
                        <td><div class="subjectdiv">123   G1<br>机试题:0<br>笔试题:0</div></td>
                        <td><div class="subjectdiv">NNNNNNNN   G1<br>机试题:0<br>笔试题:0</div></td>
                    </tr>
                    <tr>
                        <td><div class="subjectdiv">MMMMM   G1<br>机试题:0<br>笔试题:6</div></td>
                    </tr>--%>
    </div>
</div>
</body>
</html>
