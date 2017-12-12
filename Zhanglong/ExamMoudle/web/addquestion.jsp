<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.zhanglong.bean.Subject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ps/flah笔试题列表</title>
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
        width: 400px;
        height: 20px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 20px;
        /* background: red;*/
        margin-left:400px;
    }
    #right_2{
        width: 60%;
        height: 50px;
        position: absolute;
        /*background: red;*/
        margin-top: 60px;
        /*background: yellow;*/
    }
    #right_3{
        width: 100%;
        height: 390px;
        position: absolute;
        /*background: red;*/
        margin-top: 100px;
        /*   background: green;*/
    }
    #right_4{
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
                    url: "chaquestionbank",
                    type: "get",
                    success: function (msg) {
                        var obj = eval(msg);
                        var strtou = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>类型</td> <td class='tablemargin'>题目内容</td> <td class='tablemargin'>选择A</td> <td class='tablemargin'>选择B</td> <td class='tablemargin'>选择C</td> <td class='tablemargin'>选择D</td> <td class='tablemargin'>答案</td> <td class='tablemargin'>难度</td> <td class='tablemargin'>对应章节</td> <td class='tablemargin'>操作</td> </tr>"
                        var strinfo = "";
                        for (var i = 0; i < obj.length; i++) {
                            var job = obj[i].tjob;
                            if (obj[i].qtype == 0) {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].qid + "</td> <td class='tablemargin'>单选</td> <td class='tablemargin'>" + obj[i].qcontent + "</td> <td class='tablemargin'>" + obj[i].qa + "</td> <td class='tablemargin'>" + obj[i].qb + "</td> <td class='tablemargin'>" + obj[i].qc + "</td> <td class='tablemargin'>" + obj[i].qd + "</td> <td class='tablemargin'>" + obj[i].qanswer + "</td> <td class='tablemargin'>" + obj[i].qdifficulty + "</td> <td class='tablemargin'>" + obj[i].qchapter + "</td> <td class='tablemargin'>编辑  <a onclick='deleteid(" + obj[i].qid + ");'>删除</a></td> </tr>";
                            }
                            else {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].qid + "</td> <td class='tablemargin'>多选</td> <td class='tablemargin'>" + obj[i].qcontent + "</td> <td class='tablemargin'>" + obj[i].qa + "</td> <td class='tablemargin'>" + obj[i].qb + "</td> <td class='tablemargin'>" + obj[i].qc + "</td> <td class='tablemargin'>" + obj[i].qd + "</td> <td class='tablemargin'>" + obj[i].qanswer + "</td> <td class='tablemargin'>" + obj[i].qdifficulty + "</td> <td class='tablemargin'>" + obj[i].qchapter + "</td> <td class='tablemargin'>编辑  <a onclick='deleteid(" + obj[i].qid + ");'>删除</a></td> </tr>";
                            }
                        }
                        var table = strtou + strinfo;
                        $("#tablexianshi1").html(table);
                    }
                });
        })

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
        <div id="right_1">
            <%
            HttpSession httpSession = request.getSession();
            Subject subject = (Subject) httpSession.getAttribute("subject");
            String name = subject.getSucourse();
             %>
            <input type="text" id="suid" value="<%=name%>">笔试题列表</div>
        <div id="right_2">
            <table><tr>
                <td><a href="addonequestion.jsp"><input type="button" value="添加试题"></a></td>
                <td><input type="file" id="importinfo" name="importinfo" ><input type="button" value="导入" id="daoru"></td>
                <td><a href="filedown?filename=question.xlsx"><input type="button" value="下载考试试题模板"></a></td>
            </tr></table>
        </div>
        <div id="right_3">
            <table border="1" width="100%" id="tablexianshi1">
                <%--<tr><td>序号</td>
                    <td>类型</td>
                    <td>题目内容</td>
                    <td>选项A</td>
                    <td>选项B</td>
                    <td>选项C</td>
                    <td>选项D</td>
                    <td>答案</td>
                    <td>难度</td>
                    <td>对应章节</td>
                    <td>操作</td>
                </tr>--%>
            </table></div>
        <div id="right_4"><table>
            <tr><td><a href="">第1页</a></td><td><a href="">共2页</a></td><td><a href="">首页</a></td><td><a href="">上一页</a></td><td><a href="">下一页</a></td><td><a href="">末页</a></td></tr>
        </table>

        </div>
    </div>
</div>

</body>
</html>

