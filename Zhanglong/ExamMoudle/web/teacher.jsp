<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师管理界面</title>
</head>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <meta charset="UTF-8">
    <style type="text/css">
    #zong{
        width:100%;
        height:100%;
    }
    #up{
        width:100%;
        height:15%;
        position:relative;
        border-bottom: 2px solid #F0F8FF;

        /*background: crimson;*/
    }
    #up_1{
        width: 300px;
        height: 40px;
        position: absolute;
        /*background: red;*/
        margin-left: 300px;
        font-size: 20px;
        color: red;
        margin-top: 30px;
    }
    #up_2{
        width:250px;
        height: 40px;
        position: absolute;
        margin-left: 850px;
        /*background: red;*/
        margin-top: 30px;
    }
    #up_3{
        width:70px;
        height: 40px;
        position: absolute;
        margin-left: 1100px;
        /*   background: blue;*/
        margin-top: 30px;
        color:blue;
    }
    #up_4{
        width:100px;
        height: 40px;
        position: absolute;
        margin-left: 1170px;
        /*background: black;*/
        margin-top: 30px;
        color: blue;
    }
    #up_5{
        width:300px;
        height: 60px;
        position: absolute;
        margin-left: 70px;
        /*background: black;*/
        margin-top: 30px;
        color:blue;
        font-size: 30px;
    }

    #left{
        width: 19.7%;
        height: 85%;
        position: absolute;
        /* border-bottom: 2px solid red;*/
        /*background: black;*/
        border: 2px solid red;
    }
    #right{
        width: 80%;
        height: 85%;
        margin-left:20%;
        position: relative;
        border:2px solid blue ;
        /*background: blue;*/
    }
    #right_1{
        width: 200px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 20px;
       /* background: red;*/
        margin-left:400px;
    }
    #right_2{
        width: 200px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 50px;
        /*background: blue;*/
    }
    #right_3{
        width: 60%;
        height: 50px;
        position: absolute;
        /*background: red;*/
        margin-top: 90px;
        /*background: yellow;*/
    }
    #right_4{
        width: 100%;
        height: 390px;
        position: absolute;
        /*background: red;*/
        margin-top: 130px;
     /*   background: green;*/
    }
    #right_5{
        width: 300px;
        height: 35px;
        margin-top: 510px;
        position: absolute;
       /* background: red;*/
        margin-left: 700px;
    }
</style>
    <script>
        $(document).ready(function () {
            //发送ajax
            $.ajax({
                url:"showteacherlist",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);
                    var str="";
                    var titleinfo ="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i=0;i<obj.length;i++){
                       /* var a=obj[i].tname;
                     alert(a);*/
                     str = str + "<tr> <td class='tablemargin'>"+obj[i].tid+"</td><td class='tablemargin'>"+obj[i].tnumber+"</td> <td class='tablemargin'>"+obj[i].tname+"</td> <td class='tablemargin'>"+obj[i].tsex+"</td> <td class='tablemargin'>"+obj[i].tbirthday+"</td> <td class='tablemargin'>"+obj[i].tedu+"</td> <td class='tablemargin'>"+obj[i].ttel+"</td> <td class='tablemargin'>"+obj[i].tjob+"</td> <td class='tablemargin'> <a onclick='edit(" + obj[i].tid + ")'>编辑</a> <a onclick='resetpwd(" + obj[i].tid + ")'>重置密码</a> <a onclick='deleteway(" + obj[i].tid + ")'> 删除</a></td> </tr>"
                     }
                    var alltable=titleinfo+str;
                    $("#tableteacherinfo").html(alltable);

                }
            });
        });

    </script>
<script>
    $(document).ready(function (){
        $("#selectteacher").click(function () {
            var number = $("#number").val();
            var name = $("#name").val();
            var job = $("#job").val();
            alert(number+""+name+""+job);
            $.ajax({
                url:"selectname?tnumber="+number+"&tname="+name+"&tjob="+job,
                type:"get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = " ";
                    var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td><td class='tablemargin'>" + obj[i].tnumber + "</td> <td class='tablemargin'>" + obj[i].tname + "</td> <td class='tablemargin'>" + obj[i].tsex + "</td> <td class='tablemargin'>" + obj[i].tbirthday + "</td> <td class='tablemargin'>" + obj[i].tedu + "</td> <td class='tablemargin'>" + obj[i].ttel + "</td> <td class='tablemargin'>" + obj[i].tjob + "</td> <td class='tablemargin'><a  onclick='edit(" + obj[i].tid + ")'>编辑</a> <a onclick='resetpwd(" + obj[i].tid + ")' 重置密码</a><a onclick='deleteway(" + obj[i].tid + ")'  删除</a></td> </tr>"
                    }
                    var alltable = titleinfo + str;
                    $("#tableteacherinfo").html(alltable);
                }
            });
        });
        });
</script>
<script>
    //重置密码
    function resetpwd(b) {
        var tid = b;
        /*alert(tid);*/
        $.ajax({
            url:"chongzhi?tid="+tid,
            type:"get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                if(obj.result=="true"){
                    alert("密码重置成功！！！");
                }
                else{
                    alert("密码重置失败！！！");
                }
            }
        });
    }
    //删除
    function deleteway(a) {
        var tid = a;
        $.ajax({
            url:"shanchu?tid="+tid,
            type:"get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                /*alert(obj.result);*/
                if (obj.result == "true") {
                    alert("删除成功！！！");
                    //刷新界面
                    refresh();
                }
                else {
                    alert("删除失败！！！");
                }
            }
        });

    };

</script>
<script>
    //教师页面编辑页面的操作
    function edit(a) {
        window.location.href="addteacher1?id="+a;
    }

</script>


<body>
<div id="zong">
    <div id="up">
        <div id="up_1">在线考试管理系统</div>
        <div id="up_2">2014年7月31日星期四8：36</div>
        <div id="up_3"><a href="">[注销]</a></div>
        <div id="up_4"><a href="">[退出系统]</a></div>
        <div id="up_5">欢迎你,<%=session.getAttribute("name")%></div>
    </div>
    <div id="left">
        <table style="margin: auto;height:60%">
            <tr><td>后台功能</td></tr>
            <tr><td><a href="teacher.jsp">教师管理</a></td></tr>
            <tr><td><a href="classes.jsp">班级管理</a></td></tr>
            <tr><td><a href="student.jsp">学生管理</a></td></tr>
            <tr><td><a href="question.jsp">题库管理</a></td></tr>
            <tr><td><a href="test.jsp">试卷管理</a></td></tr>
            <tr><td><a href="report.jsp">成绩管理</a></td></tr>
            <tr><td><a href="">修改密码</a></td></tr>

        </table>
    </div>
    <div id="right">
        <div id="right_1">教师列表</div>
        <div id="right_2"><a href="addteacher.jsp"><input type="submit" value="添加教师"></a></div>
        <div id="right_3">
            <table><tr><td>账号:<input type="text" id="number"></td>
                       <td>教师姓名:<input type="text" id="name"></td>
                       <td>岗位:<select id="job"><option value="0">讲师</option><option value="1">班主任</option></select></td>
                       <td><input type="submit" value="查询" id="selectteacher"></td>
            </tr></table>
        </div>
        <div id="right_4">
            <table border="1" style="width:100%;position: relative"  id="tableteacherinfo">
            <%--<tr><td>序号</td>
            <td>账号</td>
            <td>姓名<div id="td1"></div></td>
            <td>性别</td>
            <td>生日</td>
            <td>学历</td>
            <td>联系电话</td>
            <td>岗位</td>
            <td>操作</td></tr>--%>
        </table></div>
        <div id="right_5"><table>
            <tr><td><a href="">第1页</a></td><td><a href="">共2页</a></td><td><a href="">首页</a></td><td><a href="">上一页</a></td><td><a href="">下一页</a></td><td><a href="">末页</a></td></tr>
        </table>

        </div>
    </div>
</div>

</body>
</html>
