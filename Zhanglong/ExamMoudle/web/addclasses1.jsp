<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="core" %>
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
        /*font-size: 20px;*/
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
        });

        function saveorupdate1(cid) {
            alert(cid)
            var cnumber = $("#cnumber").val();
            var cname = $("#cname").val();
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
                url: "saveorupdate1?cid="+cid+"&cnumber=" + cnumber + "&cname=" + cname + "&cdirection=" + cdirection + "&tidh=" + banzhuren + "&tidl=" + jiangshi + "&cbegin=" + cbegin + "&cg1=" + cg1 + "&cg2=" + cg2 + "&cg3=" + cg3 + "&cstate=" + cstate + "&cremark=" + cremark,
                type: "get",
                success: function (msg) {
                    var obj = $.parseJSON(msg);
                    if (obj.result == "true") {
                        alert("修改成功")
                    }
                    else {
                        alert("修改失败")
                    }
                }
                });
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
                    <td><input type="text" id="cnumber" value="<s:property value="classes.cnumber"></s:property>" ></td>
                </tr>
                <tr>
                    <td>班级名称:</td>
                    <td><input type="text" id="cname" value="<s:property value="classes.cname"></s:property>"></td>
                </tr>
                <tr>
                    <td>所属方向:</td>
                    <td><select id="cdirection" value="<s:property value="classes.cdirection"></s:property>"><option value="">请选择</option>
                        <option value="高软">高软</option>
                        <option value="3G4G">3G4G</option>
                    </select></td>
                </tr>
                <tr>
                    <td>班主任:</td>
                    <td><select id="banzhuren" value="<s:property value="classes.teachersh"></s:property>">
                        <%--<option value="${classes.teachersh.tname}"><c:out value="${classes.teachersh.tname}"></c:out></option></select>--%>

                    </td>
                </tr>
                <tr>
                    <td>讲师:</td>
                    <td><select id="jiangshi" value="<s:property value="classes.teachersl"></s:property>">
                        <%--<option value="${classes.teachersl.tname}"><c:out value="${classes.teachersl.tname}"></c:out></option></select>--%>
                    </td>
                </tr>
                <tr>
                    <td >开班日期:</td>
                    <td><input type="text" id="cbegin" value="<s:property value="classes.cbegin"></s:property>"></td>
                </tr>
                <tr>
                    <td>G1开班人数:</td>
                    <td><input type="text" id="cg1" value="<s:property value="classes.cg1"></s:property>"></td>
                </tr>
                <tr>
                    <td>G2开班人数:</td>
                    <td><input type="text" id="cg2" value="<s:property value="classes.cg2"></s:property>"></td>
                </tr>
                <tr>
                    <td>G3开班人数:</td>
                    <td><input type="text" id="cg3" value="<s:property value="classes.cg3"></s:property>"></td>
                </tr>
                <tr>
                    <td>状态:</td><td>
                    <select id="cstate" value="<s:property value="classes.cstate"></s:property>"><option value="0">启用</option>
                        <option value="1">没启用</option>
                    </select></td>
                </tr>
                <tr><td>备注:</td>
                    <td id="cremark"><input type="text" value="<s:property value="classes.cremark"></s:property>"></td>
                </tr>
                <tr>
                    <td><input type="button" value="确定" onclick="saveorupdate1(<s:property value="classes.cid"></s:property>)"></td>
                    <td><input type="button" value="取消"></td>
                </tr>
            </table>

        </div>

    </div>
</div>

</body>
</html>
