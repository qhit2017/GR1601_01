<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset=utf-8"/>

    <title> 学生管理</title>

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
    <script  language="JavaScript" src="js/jquery-3.2.1.js"></script>
    <script src="js/ajaxfileupload.js" language="JavaScript"></script>
    <script type="text/javascript" >
        //编辑页面信息
        function edit(a) {
            window.location.href="editstudentinfo?id="+a;
        }
        $(document).ready(function () {
            //查询所有的学生信息并显示到table
            //发送ajax
            $.ajax({
                url:"showallstudentinfo",
                type:"get",
                success:function (msg) {
                    var pro = eval(msg);
                    var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td>  <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                    for (var i = 0; i < pro.length; i++) {
                        tabletitle = tabletitle + "<tr> <td class='tablemargin'>" + pro[i].sid + "</td> <td class='tablemargin'>" + pro[i].snumber + "</td> <td class='tablemargin'>" + pro[i].cid.cname + "</td>" +
                            " <td class='tablemargin'>" + pro[i].sname + "</td> " +
                            "<td class='tablemargin'>" + pro[i].ssex + "</td> " +
                            " <td class='tablemargin'>" + pro[i].stel + "</td>" +
                            "<td class='tablemargin' ><a onclick='edit(" + pro[i].sid + ")'>查看编辑</a>  " + "<a onclick='resetpwd(" + pro[i].sid + ")'>重置密码</a>  " + "<a onclick='deleteinfo(" + pro[i].sid + ")'>删除</a></td></tr>";
                    }
                    $("#tableinfo").html(tabletitle);
                }
            })


            //学生界面动态获取班级信息
            $.ajax({
                url: "getclassesinfo",
                type: "get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].cid+"'>"+obj[i].cname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#classesname").html(str);
                }
            })


            //显示开班日期信息出现在下拉框
            $.ajax({
                url: "showbeginclassesdata",
                type: "get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i]+"'>"+obj[i]+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#cbeginstudy").html(str);

                }

            })




            $("#fiveinfo").click(function () {
                //根据5个条件进行查询
                $.ajax({
                    url: "selectstudentbyfive",
                    type: "post",
                    data:"number="+$('#snumber').val()+"&name="+$('#sname').val() +"&classesname="+$('#classesname').val()+"&cbeginstudy="+$('#cbeginstudy').val()+"&studentstudydirection="+$('#studentstudydirection').val(),
                    success: function (msg) {
                        alert(msg);
                        var pro = eval(msg);
                        var tableinfo = "";
                        var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td>  <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                        for (var i = 0; i < pro.length; i++) {
                            tabletitle = tabletitle + "<tr> <td class='tablemargin'>" + pro[i].sid + "</td> <td class='tablemargin'>" + pro[i].snumber + "</td> <td class='tablemargin'>" + pro[i].cid.cname + "</td>" +
                                " <td class='tablemargin'>" + pro[i].sname + "</td> " +
                                "<td class='tablemargin'>" + pro[i].ssex + "</td> " +
                                " <td class='tablemargin'>" + pro[i].stel + "</td>" +
                                "<td class='tablemargin' ><a onclick='edit(" + pro[i].sid + ")'>查看编辑</a>  " + "<a onclick='resetpwd(" + pro[i].sid + ")'>重置密码</a>  " + "<a onclick='deleteinfo(" + pro[i].sid + ")'>删除</a></td></tr>";
                        }
                        var table = tabletitle + tableinfo;
                        $("#tableinfo").html(table);
                    }
                })
            })
            //学生界面上传模板
            $("#importbtn").click(function () {
                $.ajaxFileUpload({
                    url:"uploadstudentinfomodel",
                    //获取上传域的控件ID
                    fileElementId:"upload",
                    secureuri:false,
                    type:"post",
                    //接收返回值的类型
                    dataType:"json",
                    success:function (msg) {
                         var obj=$.parseJSON(msg);
                         alert(obj.result);
                         window.location.href="studentmanage.jsp";
                    }
                })
            })




        })

        //学生页面重置密码
        function resetpwd(a) {
            $.ajax({
                url:"resetpassword?id=" + a,
                type:"get",
            })
            alert("重置成功")

        }
        //学生页面删除信息
        function  deleteinfo(a) {
            alert(a)
            $.ajax({
                url:"deletestudentinfo?id="+a,
                type:"get",
            })
            alert("删除成功")
            window.location.href="studentmanage.jsp"
        }


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
                <caption style="text-align: center">学生列表</caption>

                <tr>
                    <td style=" left: 20px;" colspan="7">
                      <a href="insertstudent.jsp"><input type="submit" value="添加学生"></a>
                        <a href="studentdown?filename=studentinfo.xlsx"><b>学生信息导出</b></a>
                        <input type="button" value="导入" id="importbtn">
                        <input type="file" id="upload" name="upload">
                        <a href="filedown?filename=student.xlsx"><b>学生信息空模板下载</b></a>
                    </td>
                </tr>

                <tr>
                    <td>学号:</td>
                    <td><input type="text" id="snumber" ></td>

                    <td>姓名:</td>
                    <td><input type="text" id="sname"></td>


                    <td>班级：</td>
                    <td>  <select id="classesname">
                        <option value="">请选择</option>
                        <option value="1">2016</option>
                    </select></td>

                    <td >入学年份：</td>
                    <td>
                        <select id="cbeginstudy">
                            <option value="">请选择</option>
                            <option value="2017-12-01">2017-12-01</option>
                        </select>
                    </td>
                    <td>就读方向：</td>
                    <td>  <select id="studentstudydirection">
                        <option value="">请选择</option>
                        <option value="高软">高软</option>
                        <option value="3G4G">3G4G</option>
                    </select></td>

                    <td>
                        <input type="submit" value="查询" id="fiveinfo">
                    </td>
                </tr>
            </table>

            <table border="1px" style="width: 1000px;height: 30px ;position: relative;top: 20px" id="tableinfo">
             <%--   <tr>
                    <td>序号</td>
                    <td>学号</td>
                    <td>班级</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>联系电话</td>
                    <td style="width: 300px; text-align: center">操作</td>
                </tr>--%>
            </table>

        </div>


</div>

</body>
</html>

