<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加班级页面</title>
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
        width: 500px;
        height: 450px;
        position: absolute;
        /*font-shhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ize: 20px;*/
        margin-top: 80px;
        /*background: red;*/
        margin-left:200px;
    }
</style>
    <script>
        $(document).ready(function () {
            //讲师下拉框中出现姓名
            $.ajax({
                url:"selectjiangshi",
                type:"get",
                success:function (msg) {
                    var xianshi=eval(msg);
                    var str="";
                    for(var i=0;i<xianshi.length;i++) {
                        str=str+"<option value='"+xianshi[i].tid+"'>"+xianshi[i].tname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#jiangshi").html(str);
                }
            })
            $.ajax({
                url:"selectbanzhuren",
                type:"get",
                success:function (msg) {
                    var xianshi=eval(msg);
                    var str="";
                    for(var i=0;i<xianshi.length;i++) {
                        str=str+"<option value='"+xianshi[i].tid+"'>"+xianshi[i].tname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#banzhuren").html(str);
                }
            });

            $("#tianjia").click(function () {

                var cnumber = $("#cnumber").val();
                var cname = $("#cname").val();
                alert(cname);
                var cdirection = $("#cdirection").val();
                var banzhuren = $("#banzhuren").val();
                var jiangshi = $("#jiangshi").val();
                var cbegin = $("#cbegin").val();
                var cg1 = $("#cg1").val();
                var cg2 = $("#cg2").val();
                var cg3 = $("#cg3").val();
                var cstate = $("#cstate").val();
                var cremark = $("#cremark").val();
                $.ajax({
                    url: "saveorupdate?cnumber=" + cnumber + "&cname=" + cname + "&cdirection=" + cdirection +" &tidh=" + banzhuren + "&tidl="+jiangshi +"&cbegin=" + cbegin + "&cg1=" + cg1 + "&cg2=" + cg2 + "&cg3=" + cg3 + "&cstate=" + cstate + "&cremark=" + cremark,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        if (obj.result == "true") {
                            alert("添加成功")
                        }
                        else {
                            alert("添加失败")
                        }
                    }
                })
            })
        });
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
            <tr><td><a href="">教师管理</a></td></tr>
            <tr><td><a href="">班级管理</a></td></tr>
            <tr><td><a href="">学生管理</a></td></tr>
            <tr><td><a href="">题库管理</a></td></tr>
            <tr><td><a href="">试卷管理</a></td></tr>
            <tr><td><a href="">成绩管理</a></td></tr>
            <tr><td><a href="">修改密码</a></td></tr>


        </table>
    </div>
    <div id="right">
        <div id="right_1">添加班级</div>
        <div id="right_2">
            <table border="0" width="100%" height="450px">
                <tr><td width="100px">班级代码:</td>
                    <td><input type="text" id="cnumber"></td>
                </tr>
                <tr>
                    <td>班级名称:</td>
                    <td><input type="text" id="cname"></td>
                </tr>
                <tr>
                    <td>所属方向:</td>
                    <td><select id="cdirection"><option value="">请选择</option>
                    <option value="高软">高软</option>
                    <option value="3G4G">3G4G</option>
                    </select></td>
                </tr>
                <tr>
                    <td>班主任:</td>
                    <td><select id="banzhuren"><option value="">请选择</option></select></td>
                </tr>
                <tr>
                    <td>讲师:</td>
                    <td><select id="jiangshi"><option value="">请选择</option></select></td>
                </tr>
                <tr>
                    <td >开班日期:</td>
                    <td><input type="text" id="cbegin"></td>
                </tr>
                <tr>
                    <td>G1开班人数:</td>
                    <td><input type="text" id="cg1"></td>
                </tr>
                <tr>
                    <td>G2开班人数:</td>
                    <td><input type="text" id="cg2"></td>
                </tr>
                <tr>
                    <td>G3开班人数:</td>
                    <td><input type="text" id="cg3"></td>
                </tr>
                <tr>
                    <td>状态:</td><td>
                    <select id="cstate"><option value="0">启用</option>
                                        <option value="1">没启用</option>
                    </select></td>
                </tr>
                <tr><td>备注:</td>
                    <td id="cremark"><input type="text"></td>
                </tr>
                <tr>
                    <td><input type="button" value="确定" id="tianjia"></td>
                    <td><input type="submit" value="取消"></td>
                </tr>
            </table>
        </div>

    </div>
</div>

</body>
</html>

