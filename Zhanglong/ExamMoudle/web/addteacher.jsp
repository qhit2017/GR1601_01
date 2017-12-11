<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<html>
<head>
    <title>添加教师信息</title>
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
        margin-left:260px;
    }

</style>
    <%--显示账号信息--%>
    <script>
       $(document).ready(function (){


           /*alert("11111111");*/
                $.ajax({
                    url:"addteachernumber",
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                         /*alert(obj.teachers);*/
                        var idresult=obj.teachers1;
                        var numberresult=obj.teachers;
                        var str="<table border='1' id='tianjia'><tr style='text-align: center;'> <td colspan='2'><input type='text' id='tid'>"+idresult+"</td> </tr> <tr> <td>账号:</td> <td ><a id='tnumber'>"+numberresult+"</a></td> </tr> <tr> <td>姓名:</td> <td><input type='text' id='tname'></td> </tr> <tr> <td>性别:</td> <td><select id='tsex'> <option value='男'>男</option> <option value='女'>女</option> </select></td> </tr> <tr> <td>生日:</td> <td><input type='text' id='tbirthday'></td> </tr> <tr> <td>学历:</td> <td><input type='text' id='tedu'></td> </tr> <tr> <td>联系电话:</td> <td><input type='text' id='ttel'></td> </tr> <tr> <td>岗位:</td> <td> <select id='tjob'> <option value='0'>讲师</option> <option value='1'>班主任</option> </select></td> </tr> <tr> <td>备注</td> <td><textarea cols='40' rows='3' id='tremark'></textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input class='affirm1' type='button' value='确认' onclick='save("+idresult+")' id='saveorupdateteacher'>&nbsp;&nbsp;&nbsp;&nbsp;<input class='affirm1' type='button' value='取消' onClick='closeShow()'></td> </tr> </table>";
                        $("#tianjia").html(str);

                    }


            });
        });
    </script>
    <script>
        function save(tid) {
            alert(tid);
            var tname=$("#tname").val();
            var tsex=$("#tsex").val();
            var tbirthday=$("#tbirthday").val();
            var tedu=$("#tedu").val();
            var ttel=$("#ttel").val();
            var tjob=$("#tjob").val();
            var tremark=$("#tremark").val();

            $.ajax({
                url:"saveorupdateteacher?tid="+tid+"&tname="+tname+"&tsex="+tsex+"&tbirthday="+tbirthday+"&tedu="+tedu+"&ttel="+ttel+"&tjob="+tjob+"&tremark="+tremark,
                type: "get",
                success: function (msg) {
                    var obj = $.parseJSON(msg);
                    alert(obj.result);
                    if(obj.result=="true"){
                        alert("save成功！！！");
                        closeShow();
                    }
                    else{
                        alert("save失败！！！");
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
        <div id="right_1">添加教师</div>
        <div id="right_2">
            <table border="0" width="100%" height="450px" id="tianjia">
              <%--<tr><td>账号:</td>
                    <td><input type="text" id="tnumber">&lt;%&ndash;disabled value="<%=session.getAttribute("teachers.getTnumber()")%>"&ndash;%&gt;</td>
                </tr>
                <tr>
                    <td>姓名:</td>
                    <td><input type="text" id="tname"></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select id="tsex"><option>男</option><option>女</option></select></td>
                </tr>
                <tr>
                    <td>生日:</td>
                    <td><input type="text" id="tbirthday"></td>
                </tr>
                <tr>
                    <td>学历:</td>
                    <td><input type="text" id="tedu"></td>
                </tr>
                <tr>
                    <td>联系电话:</td>
                    <td><input type="text" id="ttel"></td>
                </tr>
                <tr>
                    <td>岗位:</td><td>
                    <select id="tjob"><option>讲师</option></select></td>
                </tr>
                <tr><td>备注:</td>
                    <td id="tremark"><textarea cols="40" rows="3"></textarea></td>
                </tr>
                <tr>
                    <td rowspan="2"><input type="submit" value="确定" onclick="save()">
                        <input type="submit" value="取消" onclick="closeShow()"></td>
                </tr>--%>
            </table>
        </div>

    </div>
</div>

</body>
</html>
