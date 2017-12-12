<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试卷列表</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
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
        width: 900px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 50px;
        /*background: blue;*/
    }
    #right_3{
        width: 80%;
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
                url: "selectTestpaper",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var strtitle = " <tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>类别</td> <td class='tablemargin'>科目</td> <td class='tablemargin'>标题</td> <td class='tablemargin'>考试班级</td> <td class='tablemargin'>考试时长(分钟)</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    var strinfo = "";
                    for (var i = 0; i < obj.length; i++) {
                        alert(obj[i].cname)
                        if (obj[i].tstate == "未开考") {
                            strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>"+ obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>未开考</td> <td class='tablemargin'>删除  开始考试  查看试卷</td> </tr>";
                            }
                            if (obj[i].tstate == "考试中") {
                            strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>"+ obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试中</td> <td class='tablemargin'>结束考试  查看成绩  查看试卷</td> </tr>";
                            }
                             else if (obj[i].tstate == "考试结束") {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>"+ obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试结束</td> <td class='tablemargin'>查看成绩  查看试卷</td> </tr>";
                            }
                        }
                    var alltable = strtitle + strinfo;
                    $("#tablexianshi1").html(alltable);
                }
            });

            $.ajax({
                url: "xialakuang",
                type: "get",
                success: function (msg) {
                    alert(obj)
                    var obj = eval(msg);
                    var str = "";
                    for (var i = 0; i < obj.length; i++) {
                        str=str+"<option value='"+obj[i].suid+"' onclick='sucourse("+obj[i].suid+")'>"+obj[i].sucourse+"</option>";
                    }
                    var strtitle = "<option value=''>请选择</option>";
                    str = strtitle + str;
                    $("#suid").html(str);
                }
            });

            $("#chaxun").click(function () {
                var suid = $("#suid").val();
                var ttype = $("#ttype").val();
                var tstate = $("#tstate").val();
                $.ajax({
                    url: "fivechaxun?suid=" + suid + "&ttype=" + ttype + "&tstate=" + tstate,
                    type: "get",
                    success: function (msg) {
                        var obj = eval(msg);
                        var strtitle = " <tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>类别</td> <td class='tablemargin'>科目</td> <td class='tablemargin'>标题</td> <td class='tablemargin'>考试班级</td> <td class='tablemargin'>考试时长(分钟)</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                        var strinfo = "";
                        for (var i = 0; i < obj.length; i++) {
                            alert(obj[i].cname)
                            if (obj[i].tstate == "未开考") {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>"+ obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>未开考</td> <td class='tablemargin'>删除  开始考试  查看试卷</td> </tr>";
                            }
                            if (obj[i].tstate == "考试中") {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>"+ obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试中</td> <td class='tablemargin'>结束考试  查看成绩  查看试卷</td> </tr>";
                            }
                            else if (obj[i].tstate == "考试结束") {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>"+ obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试结束</td> <td class='tablemargin'>查看成绩  查看试卷</td> </tr>";
                            }
                        }
                        var alltable = strtitle + strinfo;
                        $("#tablexianshi1").html(alltable);
                    }
                });

        })
        })
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
        <div id="right_1">试卷列表</div>
        <div id="right_2"><table>
            <tr>
            <td>方向:<select id="fangxiang"><option value="">请选择</option>
                <option value="高软">高软</option>
                <option value="3G4G">3G4G</option>
            </select></td>
            <td>阶段:<select id="jieduan"><option value="">请选择</option>
                <option value="G1">G1</option>
                <option value="G2">G2</option>
                <option value="G3">G3</option>
            </select></td>
            <td>考试科目:<select id="suid"><option value="">请选择</option></select></td>
                <td>考试类型:<select id="ttype"><option value="">请选择</option>
                    <option value="机试">机试</option>
                    <option value="笔试">笔试</option>
                </select></td>
            <td>状态:<select id="tstate"><option value="">请选择</option>
                <option value="未开考">未开考</option>
                <option value="考试中">考试中</option>
                <option value="考试结束">考试结束</option></select></td>
            <td><input type="button" value="查询" id="chaxun"></td>
        </tr></table>
        </div>
        <div id="right_3">
            <table><tr>
                <td><input type="submit" value="随机组卷"></td>
                <td><a href="createmanytest.jsp"><input type="button" value="选题组卷"></a> </td>
                <td><input type="submit" value="上机考试"></td>

            </tr></table>
        </div>
        <div id="right_4">
            <table border="1" width="100%" id="tablexianshi1">
               <%-- <tr><td width="5%">序号</td>
                    <td width="5%">类别</td>
                    <td width="15%">科目</td>
                    <td width="15%">标题</td>
                    <td width="15%">考试班级</td>
                    <td width="15%">考试时长(分钟)</td>
                    <td width="15%">状态</td>
                    <td width="15%">操作</td></tr>--%>
            </table></div>
        <div id="right_5"><table>
            <tr><td><a href="">第1页</a></td><td><a href="">共2页</a></td><td><a href="">首页</a></td><td><a href="">上一页</a></td><td><a href="">下一页</a></td><td><a href="">末页</a></td></tr>
        </table>

        </div>
    </div>
</div>

</body>
</html>
