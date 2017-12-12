<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset=utf-8"/>

    <title>题库管理</title>

    <style type="text/css">
        html, body {
            overflow: hidden;
            height: 100%;
            margin: 0;
            padding: 0;
            width: 1900px;
            font: 14px/1.8 Georgia, Arial, Simsun;

        }

        html {
            _padding: 110px 0;
        }

        /*整个大层*/
        #head {
            position: absolute;
            top: 0;
            left: 0;
            width: 1900px;
            height: 100px;
            background: gainsboro;

        }

        /*身体部分*/
        #body {
            position: absolute;
            top: 110px;
            right: 0;
            bottom: 110px;
            left: 0;
            overflow: hidden;
            width: 1900px;
            _height: 100%;
        }



        /*左边导航*/
        #side {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 370px;
            _height: 100%;
            background: gainsboro;
        }
        #left_head{
            position: absolute;

            margin:0 auto;
            width:300px;
            height:35px;
            background: gainsboro;


        }
        #table_left_div{
            position: absolute;
            width:300px;
            bottom: 20%;
            background: gainsboro;
            padding-top: -25px;


        }

        /*主界面*/
        #main {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 380px;
            width: 1500px;
            background: gainsboro;

        }

        .fontsixze {
            text-align: left;
            font-size: 30px;

        }
    </style>
    <script type="text/javascript" language="JavaScript" src="js/jquery-3.2.1.js"></script>
    <script src="js/ajaxfileupload.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                url:"selectquestion",
                type:"get",
                success:function (msg) {
                    alert(msg)
                    var obj = eval(msg);
                    var str = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>类型</td> <td class='tablemargin'>题目内容</td> <td class='tablemargin'>选择A</td> <td class='tablemargin'>选择B</td> <td class='tablemargin'>选择C</td> <td class='tablemargin'>选择D</td> <td class='tablemargin'>答案</td> <td class='tablemargin'>难度</td> <td class='tablemargin'>对应章节</td></tr>";
                    for(var i=0;i<obj.length;i++){
                        str = str + "<tr style='background-color: darkgrey'> <td class='tablemargin'>"+obj[i].qid+"</td> <td class='tablemargin'>"+obj[i].qtype+"</td> <td class='tablemargin'>"+obj[i].qcontent+"</td> <td class='tablemargin'>"+obj[i].qa+"</td> <td class='tablemargin'>"+obj[i].qb+"</td> <td class='tablemargin'>"+obj[i].qc+"</td> <td class='tablemargin'>"+obj[i].qd+"</td> <td class='tablemargin'>"+obj[i].qanswer+"</td> <td class='tablemargin'>"+obj[i].qdifficulty+"</td> <td class='tablemargin'>"+obj[i].qchapter+"</td></tr>";
                    }
                    alert(str)
                    $("#questioninfoall").html(str)
                }

            })


        //学生界面上传模板
            $("#importbtn").click(function () {
                $.ajaxFileUpload({
                    url:"uploadquestioninfomodel",
                    //获取上传域的控件ID
                    fileElementId:"upload",
                    secureuri:false,
                    type:"post",
                    //接收返回值的类型
                    dataType:"json",
                    success:function (msg) {
                        var obj=$.parseJSON(msg);
                        alert(obj.result);
                        window.location.href="questioncomputer.jsp";
                    }
                })
            })

        })

    </script>
</head>
<body>

<div id="head">
    <table  style="height: 8px; width: 1500px ; position: relative ; text-align: center ">
        <tr>
            <td >在线考试管理系统</td>
            <td >2017年11月20日&nbsp;星期一&nbsp;15:55</td>
            <td><input type="submit" value="注销">
                <input type="submit" value="退出登录"></td>
        </tr>


    </table>


</div>

<%--身体部分--%>
<div id="body">
    <%--身体左边导航--%>
    <div id="side" align="center">
        <div  id="left_head">
            后台功能
        </div>

        <div id="table_left_div">
            <table border="1" style="height: 60px;width: 300px;left: 30px; position: relative;bottom: 150px" >
                <tr><td><a href="teachermanager.jsp">教师管理</a></td></tr>
                <br>
                <tr><td><a href="classesmanager.jsp">班级管理</a></td></tr>
                <br>
                <tr><td><a href="studentmanage.jsp">学生管理</a></td></tr>
                <br>
                <tr><td><a href="questionbank.jsp">题库管理</a></td></tr>
                <br>
                <tr><td><a href="questioncomputer.jsp">试卷管理</a></td></tr>
                <br>
                <tr><td><a href="scoremanager.jsp">成绩管理</a></td></tr>
                <br>
                <tr><td><a href="">修改密码</a></td></tr>
                <br>
            </table>
        </div>
    </div>


    <div id="main">
        <table border="1" style="width: 1000px;height: 30px ;position: relative;top: 20px;text-align: center" >
            <caption style="text-align: center">ps/flash笔试试题列表</caption>

            <tr>
                <td colspan="11" style="text-align: left">
                    <a href="inserttpoic.jsp">
                    <input type="submit" value="添加试题"></a>
                    <input type="button" value="导入" id="importbtn">
                    <input type="file" id="upload" name="upload">
                    <a href="questiondown?filename=question.xlsx"><b>下载考试试题模板</b></a>

                </td>
            </tr>


        </table>

        <table id="questioninfoall" border="1px" style="width: 1000px;height: 30px ;position: relative;top: 20px">
            <%--<tr>
                <td>序号</td>
                <td>类型</td>
                <td style="width: 300px; text-align: center">题目内容</td>
                <td>选项A</td>
                <td>选项B</td>
                <td>选项C</td>
                <td>选项D</td>

                <td>答案</td>
                <td>难度</td>
                <td>对应章节</td>

                <td >操作</td>

            </tr>--%>


        </table>
    </div>

    </div>




</body>
</html>


