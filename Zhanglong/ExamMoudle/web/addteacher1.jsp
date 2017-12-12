<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <script>
        function saveorupdate(tid) {
            alert(tid);
            /*var tnumber=$("#tnumber").val();*/
            var tname1=$("#tname").val();
            var tsex1=$("#tsex").val();
            var tbirthday1=$("#tbirthday").val();
            var tedu1=$("#tedu").val();
            var ttel1=$("#ttel").val();
            var tjob1=$("#tjob").val();
            //var tremark1=$("#tremark").val();
            alert(tname1+":"+tsex1+":"+tbirthday1+":"+tedu1+";"+ttel1+";"+tjob1);
            $.ajax({
                //url:"saveorupdateteacher?tid="+tid+"&tname="+tname1+"&tsex="+tsex1+"&tbirthday="+tbirthday1+"&tedu="+tedu1+"&ttel="+ttel1+"&tjob="+tjob1,
                url:"saveorupdateteacher?tid="+tid+"&tname="+tname1+"&tsex="+tsex1+"&tbirthday="+tbirthday1+"&tedu="+tedu1+"&ttel="+ttel1+"&tjob="+tjob1,
                type: "get",
                success: function (msg) {
                    var obj = $.parseJSON(msg);
                    /*alert(obj.result);*/
                    if(obj.result=="true"){
                        alert("信息修改成功！！！");
                    }
                    else{
                        alert("信息修改失败！！！");
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

        <form action="addteacher1" method="post">
        <div id="right_2">
            <table border="0" width="100%" height="450px" id="tianjia">
               <%--<caption style="text-align: center">
                   <input value="<s:property value="chateachers.tid"></s:property>" type="text" name="tid" id="tid" readonly="true" style="display:none">编辑新的教师信息</caption>--%>
                <%--<tr><td>ID</td>
                <td><input type="text"  value="<s:property value="chateachers.tid"></s:property>" id="tid"></td>
                </tr>
--%>
                   <tr><td>账号:</td>
                      <td><input type="text" readonly="true" value="<s:property value="chateachers.tnumber"></s:property>" id="tnumber"></td>
                  </tr>
                  <tr>
                      <td>姓名:</td>
                      <td><input type="text" id="tname" value="<s:property value="chateachers.tname"></s:property>"></td>
                  </tr>
                  <tr>
                      <td>性别:</td>
                      <td><select id="tsex" value="<s:property value="chateachers.tsex"></s:property>"><option value="男">男</option><option value="女">女</option></select></td>
                  </tr>
                  <tr>
                      <td>生日:</td>
                      <td><input type="text" id="tbirthday" value="<s:property value="chateachers.tbirthday"></s:property>"></td>
                  </tr>
                  <tr>
                      <td>学历:</td>
                      <td><input type="text" id="tedu" value="<s:property value="chateachers.tedu"></s:property>"></td>
                  </tr>
                  <tr>
                      <td>联系电话:</td>
                      <td><input type="text" id="ttel" value="<s:property value="chateachers.ttel"></s:property>"></td>
                  </tr>
                  <tr>
                      <td>岗位:</td><td>
                      <select id="tjob" value="<s:property value="chateachers.tjob"></s:property>"><option value="0">讲师</option><option value="1">班主任</option></select></td>
                  </tr>
                  <tr><td>备注:</td>
                      <td id="tremark" value="<s:property value="chateachers.tremark"></s:property>"><textarea cols="40" rows="3"></textarea></td>
                  </tr>
                  <tr>
                      <td rowspan="2"><input type="button" value="确定" onclick="saveorupdate(<s:property value="chateachers.tid"></s:property>)">
                          <input type="submit" value="取消"></td>
                  </tr>
            </table>
        </div>

        </form></div>
</div>

</body>
</html>