<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset=utf-8"/>

    <title> 主界面</title>
    <%--<script language="JavaScript" type="text/css" src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            //发送ajax
            $a.ajax({
                url:"showteachersview",
                type:"get",
                success:function (msg) {
                    var  obj = eval(msg)
                    var str="";
                    for (var  i=0;i<obj.length;i++){
                        str=str+obj[i].tname+"<br>"

                    }
                    $("#table_left_div").html(str);

                }

            })


        })
    </script>--%>

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
            <tr><td><a href="testmanager.jsp">试卷管理</a></td></tr>
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

            </table>

</div>


</body>
</html>
