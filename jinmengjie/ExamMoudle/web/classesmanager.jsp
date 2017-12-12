<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--selectfourtype 班级管理界面根据四个条件查询的控件id--%>
<head>
    <meta charset=utf-8"/>

    <title> 班级管理</title>

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

        #left_head {
            position: absolute;

            margin: 0 auto;
            width: 300px;
            height: 35px;
            background: gainsboro;

        }

        #table_left_div {
            position: absolute;
            width: 300px;
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
    <script language="JavaScript" type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script>
        $(document).ready(function () {
            //发送ajax
            //显示教师班级界面中的教师的所有数据
                $.ajax({
                    url: "showClassInfo",
                    type: "get",
                    success: function (msg) {
                        var obj = eval(msg);
                        var str = "<tr style='background-color: darkgrey'><td class='tablemargin'>班级代码</td><td class='tablemargin'>班级名称</td><td class='tablemargin'>所属方向</td><td class='tablemargin'>班主任</td><td class='tablemargin'>讲师</td><td class='tablemargin'>开班日期</td><td class='tablemargin'>状态</td><td class='tablemargin'>操作</td></tr>";
                        for (var i = 0; i < obj.length; i++) {
                            str = str + "<tr style='background-color: darkgrey'><td class='tablemargin'>" + obj[i].cnumber + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cname + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cdirection + "</td>" +
                                "<td class='tablemargin'>" + obj[i].tidh.tname + "</td>" +
                                "<td class='tablemargin'>" + obj[i].tidl.tname + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cbegin + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cstate + "</td>" +
                                "<td class='tablemargin'><a onclick='edit(" + obj[i].cid + ")'> 编辑</a></td></tr>";
                        }
                        $("#tableinfo").html(str);

                    }

                })

            //显示讲师姓名出现在下拉框
            $.ajax({
                url: "showteacherinfo0",
                type: "get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#tjob0").html(str);
                }

            })
            //显示班主任姓名出现在下拉框
            $.ajax({
                url: "showteacherinfo1",
                type: "get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#tjob1").html(str);
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
                    $("#showcbegininfo").html(str);

                }

            })
            //根据四个条件查询
            $("#selectfourtype").click(function () {
                $.ajax({
                    url: "selectfourinfo",
                    type: "post",
                    data:"begin="+$('#showcbegininfo').val()+"&direction="+$('#cdirection').val() +"&idl="+$('#tjob0').val()+"&idh="+$('#tjob1').val(),
                    success: function (msg) {
                        var obj = eval(msg);
                        var str = "<tr style='background-color: darkgrey'><td class='tablemargin'>班级代码</td><td class='tablemargin'>班级名称</td><td class='tablemargin'>所属方向</td><td class='tablemargin'>班主任</td><td class='tablemargin'>讲师</td><td class='tablemargin'>开班日期</td><td class='tablemargin'>状态</td><td class='tablemargin'>操作</td></tr>";
                        for (var i = 0; i < obj.length; i++) {
                            str = str + "<tr style='background-color: darkgrey'><td class='tablemargin'>" + obj[i].cnumber + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cname + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cdirection + "</td>" +
                                "<td class='tablemargin'>" + obj[i].tidh.tname + "</td>" +
                                "<td class='tablemargin'>" + obj[i].tidl.tname + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cbegin + "</td>" +
                                "<td class='tablemargin'>" + obj[i].cstate + "</td>" +
                                "<td class='tablemargin'><a onclick='edit(" + obj[i].cid + ")'> 编辑</a></td></tr>";

                        }

                        $("#tableinfo").html(str);

                    }

                })
            })
        });

        //班级页面的重置功能
        function congzjo() {
            window.location.href="classesmanager.jsp"
        }

        //班级页面的编辑操作
        function edit(a) {
            window.location.href="editnewclassesinfo?id="+a;

        }


    </script>
</head>
<body>

<div id="head">
    <table  style="height: 8px; width: 1500px ; position: relative ; text-align: center " >
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
            <tr>
                <td style="" colspan="7">班级列表</td>
            </tr>

            <tr>
                <td >
                    <a href="insertclasses.jsp">  <input type="submit" value="新建班级"></a>
                </td>
            </tr>

            <tr>
                <td>入学年份:<select id="showcbegininfo" name="cbegin" ></select></td>
                <td >所属方向:<select id="cdirection" name="cdirection">
                    <option value="">请选择</option>
                    <option value="高软">高软</option>
                    <option value="3G4G">3G4G</option>
                </select></td>
                <td>讲师:<select id="tjob0" name="tidl"></select></td>
                <td>班主任:<select id="tjob1" name="tidh"></select></td>
                <td><input type="button" value="查询" id="selectfourtype"></td>
                <td><input type="reset" id="reset" value="重置" onclick="congzjo()"></td>
            </tr>
        </table>

        <table border="1px" style="width: 1000px;height: 30px ;position: relative;top: 20px" id="tableinfo">
           <%-- <tr>
                <td>序号</td>
                <td>班级代码</td>
                <td>班级名称</td>
                <td>所属方向</td>
                <td>班主任</td>
                <td>讲师</td>
                <td>开班日期</td>
                <td>状态</td>
                <td>操作</td>

            </tr>
--%>

        </table>



    </div>


</body>
</html>

