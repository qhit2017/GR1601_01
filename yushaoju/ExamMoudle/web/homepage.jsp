<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <title>主页面</title>


    <script language="JavaScript" src="/js/jquery.min.js"></script>
    <script language="JavaScript">
        $(document).ready(function () {

            $.ajax({
                url:"teachershowlist",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);
                    alert("1515")
                    var str="";
                    for(var i=0;i<obj.length;i++){
                        str=str+"<tr><td>"+obj[i].tid+"</td><td>"+obj[i].tnumber+"</td><td>"+obj[i].tname+"</td><td>"+obj[i].tsex+"</td><td>"+obj[i].tbirthday+"</td><td>"+obj[i].tphone+"</td><td>"+obj[i].ttel+"</td><td>"+obj[i].tjob+"</td><td>编辑 删除 重置</td></tr>";
                    }
                    $("#showtable").html(str);
                }
            });
        });
    </script>



    <style type="text/css">
        html,body {
            overflow: hidden;
            height: 100%;
            margin: 0;
            padding: 0;
            font: 14px/1.8 Georgia, Arial, Simsun;
        }

        html {
            _padding: 110px 0;
        }

        #hd {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100px;



        }
        #div1{
            text-align:right;

        }
        #div2{
            text-align:left;
        }
        #bd {
            position: absolute;
            top: 110px;
            right: 0;
            bottom: 110px;
            left: 0;
            overflow: hidden;
            width: 100%;
            _height: 100%;
        }

        #side {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            /*background: #666;*/
        }

        #main {
            position: absolute;
            _position: static;
            top: 0;
            right: 0;
            bottom: 0;
            left: 210px;
            overflow: auto;
            _overflow: hidden;
            _height: 100%;
            _margin-left: 210px;
            /*background: #666;*/
        }

        #content {
            _overflow: auto;
            _width: 100%;
            _height: 100%;
        }

        #ft {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100px;
            /*background: #999;*/
        }

        .tit-layout {
            margin: 10px 0 0;
            font-size: 18px;
            text-align: right;
        }



        #feature {
            width: 200%;
            line-height: 4;
        }

        #feature .hd {
            padding: 20px 15px;
        }

        #feature .hd h2 {
            margin: 0;
            font-size: 16px;
        }

        #feature .bd ol {
            margin-top: 0;
        }

        #feature .bd h3 {
            margin: 0;
            padding: 0 15px;
            font-size: 14px;
        }

        #feature .ft {
            padding: 10px 15px 30px;
        }
        #s1{
            position: absolute;
            Left :250px;
        }
        #s2{
            position: absolute;
            left: 240px;
            top: 50px;
        }
        #s3{
            position: absolute;
            left:280px;
            top: 50px;
        }
        #s4{
            position: absolute;
            left: 450px;
            top: 50px;
        }
        #s5{
            position: absolute;
            left: 680px;
            top: 50px;
        }
        #s6{
            position: absolute;
            left:520px;
            top: 50px;
        }
        #s7{
            position: absolute;
            left: 720px;
            top: 55px;
        }
        #s8{
            position: absolute;
            left: 800px;
            top: 50px;
        }
        #he{
            position: absolute;
            left: 550px;
            top: 50px;
            font-size: 20px;
        }
        #he1{
            position: absolute;
            left: 280px;
            top:200px;
        }
        #ys{
            position: absolute;
            left: 300px;
            top: 200px;
        }
        #righttable{
            position: absolute;
            left: 300px;
            top: 120px;
        }

    </style>

</head>
<body>
<form method="get" action="teachershowlist">
<div id="hd">
    <h1 class="tit-layout">
        <div id="div1" ><a href="" style="text-decoration: none">注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>
        <div id="div2">在线考试</div>
    </h1>
</div>

<div id="bd">
    <div id="side">
        <table width="100%">
            <tr>
                <td>教师管理</td>
            </tr>
            <tr>
                <td>班级管理</td>
            </tr>
            <tr>
                <td>学生管理</td>
            </tr>
            <tr>
                <td>题库管理</td>
            </tr>
            <tr>
                <td>试题管理</td>
            </tr>
            <tr>
                <td>成绩管理</td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>

        </table>

    </div>


    <div id="main">
        <div id="content">
            <div id="feature" class="feature">

            </div>
        </div>
    </div>
    <button type="button" id="s1">添加教师</button>
    <div id="s2">账户:</div>
    <input type="text" id="s3"/>
    <div id="s4">教师姓名:</div>
    <input type="text" id="s6"/>
    <div id="s5">岗位：</div>
    <select name="select" id="s7">
        <option value="0">管理员</option>
        <option value="1">教师</option>
        <option value="2">学生</option>
    </select>
    <button type="button" id="s8">查询</button>
    <table border="1px" width="600px" id="righttable">

        <tr id="showtable">

        </tr>

    </table>



</div>
<div id="he">教师列表</div>
<div id="ys">
    <tr align="center" width="10px" >
        <td>序号</td>
        <td>账号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>生日</td>
        <td>学历</td>
        <td>联系电话</td>
        <td>岗位</td>
        <td>操作</td>
    </tr>
</div>
</form>
</body>
</html>