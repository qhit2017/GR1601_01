<%--
  Created by IntelliJ IDEA.
  User: 王英豪
  Date: 2017/11/20
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset=utf-8"/>
    <title> 教师管理</title>
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
        #pagediv{
            position: absolute;
            background: gainsboro;
            height: 60px;
            width: 300px;
            left: 1000px;
            bottom: 0px;
        }
        .fontsixze {
            text-align: left;
            font-size: 30px;
        }
        .pagetextsize{
            height: 40px;
            width: 50px;
        }
    </style>
    <script src="js/jquery-3.2.1.js"></script>
    <script>
        $(document).ready(function () {
            //发送ajax
            //显示教师管理界面中的教师的所有数据
            function showresult(p) {
                if(p==null){
                    p = 1;
                }
                $.ajax({
                    url: "showteachersview?pageIndex="+p,
                    type: "get",
                    success: function (msg) {
                        var obj = eval(msg);
                        // alert(obj);
                        var str = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                        for (var  i=0;i<obj.length;i++) {

                            //alert(obj[i].tname);
                            str = str+"<tr style='background-color: darkgrey'> <td class='tablemargin'>"+obj[i].tid+"</td> " +
                                "<td class='tablemargin'>"+obj[i].tnumber+"</td> " +
                                "<td class='tablemargin'>"+obj[i].tname+"</td> " +
                                "<td class='tablemargin'>"+obj[i].tsex+"</td> " +
                                "<td class='tablemargin'>"+obj[i].tbirthday+"</td>" +
                                " <td class='tablemargin'>"+obj[i].teducation+"</td> " +
                                "<td class='tablemargin'>"+obj[i].ttel+"</td> " +
                                "<td class='tablemargin'>"+obj[i].tjob+"</td>" +
                                " <td class='tablemargin'><a onclick='edit("+obj[i].tid+")'> 编辑</a> <a onclick= 'resetpwd("+obj[i].tid+")' > 重置密码</a> <a onclick= 'deleteinfo("+obj[i].tid+")' > 删除</a></td> </tr>";
                        }
                        $("#tableinfo").html(str);

                        //处理分页
                        $.ajax({
                            url:"showteacherinfopage?",
                            type:"get",
                            success:function (msg) {
                                var obj = $.parseJSON(msg);
                                $("#pageindex").val(obj.pageIndex);
                                $("#pagecount").val(obj.pageCount);
                                if (obj.uppage==true){
                                    pagedivsizeup.style.display="inline"

                                }else {
                                    pagedivsizeup.style.display="none"

                                }
                                if (obj.nextpage==true){
                                    pagedivsizelode.style.display="inline"

                                }else {
                                    pagedivsizelode.style.display="none"

                                }

                            }
                        })

                    }

                })
            }
            showresult();

            $("#pagedivsizeup").click(function () {
                var p = $("#pageindex").val();
                p--
                showresult(p);
            })
            $("#pagedivsizelode").click(function () {
                var p = $("#pageindex").val();
                p++
                showresult(p);
            })

            // 是对教师界面的根据条件查询后查询结果显示到table中，在测试的时候注意角色，讲师是0，班主任是1
            $("#select").click(function () {
                $.ajax({
                    url: "showselectresult",
                    type: "post",
                    data:"tnumber="+$('#tnumber').val()+"&tname="+$('#tname').val() +"&tjob="+$('#tjob').val(),
                    success: function (msg) {
                        var obj = eval(msg);
                        var str="";
                        if(obj==null){
                            str="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                        }else {
                            str="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                            for (var  i=0;i<obj.length;i++) {
                                //alert(obj[i].tname);
                                str = str+"<tr style='background-color: darkgrey'> <td class='tablemargin'>"+obj[i].tid+"</td> " +
                                    "<td class='tablemargin'>"+obj[i].tnumber+"</td> " +
                                    "<td class='tablemargin'>"+obj[i].tname+"</td> " +
                                    "<td class='tablemargin'>"+obj[i].tsex+"</td> " +
                                    "<td class='tablemargin'>"+obj[i].tbirthday+"</td>" +
                                    " <td class='tablemargin'>"+obj[i].teducation+"</td> " +
                                    "<td class='tablemargin'>"+obj[i].ttel+"</td> " +
                                    "<td class='tablemargin'>"+obj[i].tjob+"</td>" +
                                    "<td class='tablemargin'><a onclick= 'edit("+obj[i].tid+")' > 编辑</a><a onclick= 'resetpwd("+obj[i].tid+")' > 重置密码</a> <a onclick= 'deleteinfo("+obj[i].tid+")' > 删除</a></td> </tr>";
                            }
                        }
                        $("#tableinfo").html(str);

                    }

                })
            })

        });
        //教师页面编辑页面的操作
        function edit(a) {
            window.location.href="editnewteacher?id="+a;
        }

        //教师页面重置密码
        function resetpwd(a) {
            $.ajax({
                url:"resetpassword?tid=" + a,
                type:"get",
            })
            alert("重置成功")

        }

        //教师页面删除信息
        function  deleteinfo(a) {
            alert(a)
            $.ajax({
                url:"deleteteacherinfo?id="+a,
                type:"get",
            })
            alert("删除成功")
            window.location.href="teachermanager.jsp"
        }

    </script>
</head>
<body>

<div id="head">
    <table style="height: 8px; width: 1500px ; position: relative ; text-align: center ">
        <tr>
            <td>在线考试管理系统</td>
            <td>2017年11月20日&nbsp;星期一&nbsp;15:55</td>
            <td><input type="submit" value="注销">
                <input type="submit" value="退出登录"></td>
        </tr>


    </table>
    <br>


</div>

<%--身体部分--%>
<div id="body">
    <%--身体左边导航--%>
    <div id="side" align="center">
        <div id="left_head">
            后台功能
        </div>
        <div id="table_left_div">
            <table border="1" style="height: 60px;width: 300px;left: 30px; position: relative;bottom: 150px">


                <%--   <s:if  test="session.role==1">--%>
                <tr>
                    <td><a href="teachermanager.jsp">教师管理</a></td>
                </tr>
                <%--  </s:if>--%>



                <br>
                <tr>
                    <td><a href="classesmanager.jsp">班级管理</a></td>
                </tr>
                <br>
                <tr>
                    <td><a href="studentmanage.jsp">学生管理</a></td>
                </tr>
                <br>
                <tr>
                    <td><a href="questionbank.jsp">题库管理</a></td>
                </tr>
                <br>
                <tr>
                    <td><a href="testmanager.jsp">试卷管理</a></td>
                </tr>
                <br>
                <tr>
                    <td><a href="scoremanager.jsp">成绩管理</a></td>
                </tr>
                <br>
                <tr>
                    <td><a href="">修改密码</a></td>
                </tr>
                <br>
            </table>
        </div>
    </div>


    <div id="main">


        <table border="1" style="width: 1000px;height: 30px ;position: relative;top: 20px;text-align: center">
            <tr>
                <td style="" colspan="7">教师列表</td>
            </tr>

            <tr>
                <td>
                    <a href="insertteacher.jsp"> <input type="submit" value="添加教师" id="getnum"></a>
                </td>
            </tr>

            <tr><td >帐号：</td><td><input type="text" id="tnumber" ></td><td>教师姓名：</td><td><input type="text" id="tname" ></td><td>岗位：</td><td><select id="tjob"><option value="">请选择</option><option value="0">讲师</option><option value="1">班主任</option></select></td><td><input type="submit" id="select" value="查询" ></td></tr>
        </table>

        <table border="1px" style="width: 1000px;height: 30px ;position: relative;top: 20px" id="tableinfo">
            <%--<tr>
                <td>序号</td>
                <td>帐号</td>
                <td>姓名</td>
                <td>性别</td>
                <td>生日</td>
                <td>学历</td>
                <td>联系电话</td>
                <td>岗位</td>
                <td>操作</td>
            </tr>--%>


        </table>
    </div>

    <div id="pagediv">
        <table border="0">
            <tr>
                <td><div id="pagedivsizeup">上一页</div></td>

                <td>第<input type="text" id="pageindex" class="pagetextsize">页</td>

                <td><div id="pagedivsizelode">下一页</div></td>

                <td>共<input type="text"  id="pagecount" class="pagetextsize">页</td>
            </tr>
        </table>


    </div>


</div>
</body>
</html>
