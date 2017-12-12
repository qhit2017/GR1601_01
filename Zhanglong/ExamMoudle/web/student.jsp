<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理界面</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script language="JavaScript" src="js/ajaxfileupload.js"></script>
    <meta charset="UTF-8"><style type="text/css">
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
        width: 100%;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 50px;
        /*background: blue;*/
    }
    #right_3{
        width: 100%;
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
            $.ajax({
                url:"chaxunsuoyou",
                type:"get",
                success:function (msg) {
                    var obj=eval(msg);
                    var xianshishuju="";
                    var xianshitou="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td>  <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                    for (var i=0;i<obj.length;i++){
                       /* alert(obj[i].sid+";"+obj[i].snumber+";"+obj[i].classes.cid+";"+obj[i].sname+";"+obj[i].ssex+";"+obj[i].stel)*/
                       xianshishuju=xianshishuju+"<tr> <td class='tablemargin'>" + obj[i].sid + "</td> <td class='tablemargin'>" + obj[i].snumber + "</td> <td class='tablemargin'>" + obj[i].classes.cname + "</td> <td class='tablemargin'>" + obj[i].sname + "</td> <td class='tablemargin'>" + obj[i].ssex + "</td>  <td class='tablemargin'>" + obj[i].stel + "</td><td class='tablemargin' > <a onclick='edit(" + obj[i].sid + ")'>查看</a>  <a onclick='edit(" + obj[i].sid + ")'>编辑</a>  <a onclick='resetpwd(" + obj[i].sid + ")'>重置密码</a>  <a onclick='deleteway(" + obj[i].sid + ")'>删除</a></td></tr>";
                    }
                    var table=xianshitou+xianshishuju;
                    $("#tablexinxi").html(table);
                }

            });
            $.ajax({
                url: "chaxunsuoyou",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<option value='" + obj[i].classes.cid + "'>" + obj[i].classes.cname + "</option>";
                    }
                    var strtitle = "<option value=''>请选择</option>";
                    str = strtitle + str;
                    $("#cid").html(str);
                }
            });
            $("#chaxun").click(function () {
                var snumber = $("#snumber").val();
                var sname = $("#sname").val();
                var cid = $("#cid").val();
                var nian = $("#nian").val();
                var fangxiang = $("#fangxiang").val();
                alert(snumber + ":" + sname + ";" + cid + ";" + nian + ";" + fangxiang);
                $.ajax({
                    url: "fivechaxun?snumber=" + snumber + "&sname=" + sname + "&cid=" + cid + "&senter=" + nian + "&smahor=" + fangxiang,
                    type: "get",
                    success: function (msg) {
                        var obj = eval(msg);
                        var tableinfo = "";
                        var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td>  <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                        for (var i = 0; i < obj.length; i++) {
                            tableinfo = tableinfo + "<tr> <td class='tablemargin'>" + obj[i].sid + "</td> <td class='tablemargin'>" + obj[i].snumber + "</td> <td class='tablemargin'>" + obj[i].classes.cname + "</td> <td class='tablemargin'>" + obj[i].sname + "</td> <td class='tablemargin'>" + obj[i].ssex + "</td>  <td class='tablemargin'>" + obj[i].stel + "</td><td class='tablemargin'><a onclick='edit(" + obj[i].sid + ")'>查看</a> <a onclick='edit(" + obj[i].sid + ")'> 编辑</a>  <a onclick='resetpwd(" + obj[i].sid + ")'>重置密码</a>  <a onclick='deleteobj(" + obj[i].sid + ")'>删除</a></td></tr>";
                        }
                        var table = tabletitle + tableinfo;
                        $("#tablexinxi").html(table);
                    }
                });
            });

        });
    </script>
    <script>
        $(document).ready(function () {
            $("#daoru").click(function () {
                alert("11111111111111");
                $.ajaxFileUpload({
                    //控制器方法名
                    url:"daorucontroller",
                    //所选上传文件的id
                    fileElementId: "importinfo",
                    //传输的安全性
                    secureuri: false,
                    //所有上传都要用post请求形式
                    type: "post",
                    //数据以json形式传输
                    dataType: "json",
                    success: function (msg) {
                        var obj=$.parseJSON(msg);
                        if (obj.result=="true"){
                            alert("导入成功")
                        }
                        else{
                            alert("导入失败")
                        }
                    }
                });
            });

        });
    </script>
    <script>
        //重置密码
        function resetpwd(b) {
            var sid = b;
            alert(sid);
            $.ajax({
                url:"chongzhi?sid="+sid,
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
            var sid = a;
            $.ajax({
                url:"shanchu?sid="+sid,
                type:"get",
                success: function (msg) {
                    var obj = $.parseJSON(msg);
                    /*alert(obj.result);*/
                    if (obj.result == "true") {
                        alert("删除成功！！！");
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
            window.location.href="addstudent1?id="+a;
        }

    </script>

</head>
<body>
<div id="zong">
    <div id="up">
        <div id="up_1">在线考试管理系统</div>
        <div id="up_2">2014年7月31日星期四8：36</div>
        <div id="up_3"><a href="">[注销]</a></div>
        <div id="up_4"><a href="">[退出系统]</a></div>
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
        <div id="right_1">学生列表</div>
        <div id="right_2"><table><tr>
            <td><a href="addstudent.jsp"><input type="submit" value="添加学生"></a></td>
            <td><a href="daochucontroller?filename=studentdaochu.xlsx"><input type="button" value="学生信息导出"></a></td>
            <td><input type="file" id="importinfo" name="importinfo" ><input type="button" value="学生信息导入" id="daoru"></a> </td>
            <td><a href="filedown?filename=student.xlsx"><input type="button" value="学生信息空模板下载"></a></td>
            </tr></table>
            </div>
        <div id="right_3">
            <table><tr><td>学号:<input type="text" id="snumber"></td>
                <td>姓名:<input type="text" id="sname"></td>
                <td>班级:<select id="cid"><option value="">请选择</option></select></td>
                <td>入学年份:<select id="nian"><option value="">请选择</option>
                    <option value="2015-9-1">2015-09-01</option>
                    <option value="2016-9-1">2016-09-01</option>
                    <option value="2017-9-1">2017-09-01</option></select></td>
                <td>就读方向:<select id="fangxiang"><option value="">请选择</option>
                         <option value="高软">高软方向</option>
                        <option value="3G4G">3G4G方向</option></select></td>
                <td><input type="button" value="查询" id="chaxun"></td>
            </tr></table>
        </div>
        <div id="right_4">
            <table border="1" width="100%" id="tablexinxi">
                <%--<tr><td width="10%">序号</td>
                    <td width="10%">学号</td>
                    <td width="10%">班级</td>
                    <td width="10%">姓名</td>
                    <td width="10%">性别</td>
                    <td width="15%">联系电话</td>
                    <td width="35%">操作</td></tr>--%>
            </table></div>
        <div id="right_5"><table>
            <tr><td><a href="">第1页</a></td><td><a href="">共2页</a></td><td><a href="">首页</a></td><td><a href="">上一页</a></td><td><a href="">下一页</a></td><td><a href="">末页</a></td></tr>
        </table>

        </div>
    </div>
</div>

</body>
</html>
