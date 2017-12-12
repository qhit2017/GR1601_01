<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20/020
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<html>
<head>
    <title>管理员主页面</title>
    <%@page contentType="text/html;charset=UTF-8" language="java" %>

    <link rel='stylesheet' type='text/css'
          href="https://account.metinfo.cn/templates/account/cache/account.css?20170919190632">
    <script language="JavaScript" src="js/jquery-3.2.1.js"></script>
    <script language="JavaScript" src="js/ajaxfileupload.js"></script>

</head>
<style>
    a {
        text-decoration-line: none;
    }

    a:hover {
        color: red;
        text-decoration-line: none;
    }

</style>

<body background="img/timg.jpeg">

<script type="text/javascript">

    $(document).ready(function () {

        //点击教师后显示教师相关界面
        $(".teacher").click(function () {
            $("#teacherdiv").show();
            $("#classdiv").hide();
            $("#studentdiv").hide();
            $("#questiondiv").hide();
            $("#testpaperdiv").hide();
            $("#gradediv").hide();
            $("#questionadiv").hide();
            $("#insertteacherdiv").hide();
            $("#insertclassdiv").hide();
            $("#insertstudentdiv").hide();
            $("#inserttestpaperdiv").hide();
            $("#createtestpaperdiv").hide();
            $("#selectgradeinfodiv").hide();
            $("#beginExamdiv").hide();
            $("#editteacherdiv").hide();
            $("#ceditclassdiv").hide();
        });

        //点击班级后显示教师相关界面
        $(".class").click(function () {
            $("#classdiv").show();
            $("#teacherdiv").hide();
            $("#studentdiv").hide();
            $("#questiondiv").hide();
            $("#testpaperdiv").hide();
            $("#gradediv").hide();
            $("#questionadiv").hide();
            $("#insertteacherdiv").hide();
            $("#insertclassdiv").hide();
            $("#insertstudentdiv").hide();
            $("#inserttestpaperdiv").hide();
            $("#createtestpaperdiv").hide();
            $("#selectgradeinfodiv").hide();
            $("#beginExamdiv").hide();
            $("#editteacherdiv").hide();
            $("#ceditclassdiv").hide();
        });

        //点击学生后显示教师相关界面
        $(".student").click(function () {
            $("#studentdiv").show();
            $("#classdiv").hide();
            $("#teacherdiv").hide();
            $("#questiondiv").hide();
            $("#testpaperdiv").hide();
            $("#gradediv").hide();
            $("#questionadiv").hide();
            $("#insertteacherdiv").hide();
            $("#insertclassdiv").hide();
            $("#insertstudentdiv").hide();
            $("#inserttestpaperdiv").hide();
            $("#createtestpaperdiv").hide();
            $("#selectgradeinfodiv").hide();
            $("#beginExamdiv").hide();
            $("#editteacherdiv").hide();
            $("#ceditclassdiv").hide();
        });

        //点击题库后显示教师相关界面
        $(".question").click(function () {
            $("#questiondiv").show();
            $("#studentdiv").hide();
            $("#classdiv").hide();
            $("#teacherdiv").hide();
            $("#testpaperdiv").hide();
            $("#gradediv").hide();
            $("#questionadiv").hide();
            $("#insertteacherdiv").hide();
            $("#insertclassdiv").hide();
            $("#insertstudentdiv").hide();
            $("#inserttestpaperdiv").hide();
            $("#createtestpaperdiv").hide();
            $("#selectgradeinfodiv").hide();
            $("#beginExamdiv").hide();
            $("#editteacherdiv").hide();
            $("#ceditclassdiv").hide();
        });

        //点击试卷后显示教师相关界面
        $(".testpaper").click(function () {
            $("#testpaperdiv").show();
            $("#studentdiv").hide();
            $("#classdiv").hide();
            $("#teacherdiv").hide();
            $("#questiondiv").hide();
            $("#gradediv").hide();
            $("#questionadiv").hide();
            $("#insertteacherdiv").hide();
            $("#insertclassdiv").hide();
            $("#inserttestpaperdiv").hide();
            $("#createtestpaperdiv").hide();
            $("#selectgradeinfodiv").hide();
            $("#beginExamdiv").hide();
            $("#editteacherdiv").hide();
            $("#ceditclassdiv").hide();
        });

        //点击成绩后显示教师相关界面
        $(".grade").click(function () {
            $("#gradediv").show();
            $("#studentdiv").hide();
            $("#classdiv").hide();
            $("#teacherdiv").hide();
            $("#questiondiv").hide();
            $("#testpaperdiv").hide();
            $("#questionadiv").hide();
            $("#insertteacherdiv").hide();
            $("#insertclassdiv").hide();
            $("#insertstudentdiv").hide();
            $("#inserttestpaperdiv").hide();
            $("#createtestpaperdiv").hide();
            $("#selectgradeinfodiv").hide();
            $("#beginExamdiv").hide();
            $("#editteacherdiv").hide();
            $("#ceditclassdiv").hide();
        });

        $("#questiona").click(function () {
            $("#questiondiv").hide();
            $("#questionadiv").show();
            $("#insertteacherdiv").hide();
        });

        //教师界面 -----》点击添加教师后出现的界面
        $("#insertteacher").click(function () {
            $("#teacherdiv").hide();
            $("#insertteacherdiv").show();
            reflesh();
        });

        //教师界面 -----》点击添加教师后出现的确定按钮
        $("#teacherinsertbut").click(function () {
            $("#insertteacherdiv").hide();
            $("#teacherdiv").show();
        });

        //教师界面 -----》点击添加教师后出现的取消按钮
        $(document).ready(function () {
            $("#teachercancel").click(function () {
                $("#insertteacherdiv").hide();
                $("#teacherdiv").show();
                reflesh();
            });
        });


        $("#insertclass").click(function () {
            $("#classdiv").hide();
            $("#insertclassdiv").show();
        });


        $("#classcancel").click(function () {
            $("#insertclassdiv").hide();
            $("#classdiv").show();
            refleshclass();
        });


        $("#insertstudentcancel").click(function () {
            $("#insertstudentdiv").hide();
            $("#studentdiv").show();
        });


        $("#insertstudent").click(function () {
            $("#studentdiv").hide();
            $("#insertstudentdiv").show();
        });

        $("#inserttestpaper").click(function () {
            $("#testpaperdiv").hide();
            $("#inserttestpaperdiv").show();
        });

        $("#testpapercancel").click(function () {
            $("#inserttestpaperdiv").hide();
            $("#testpaperdiv").show();
        });

        $("#insertortestpaper").click(function () {
            $("#inserttestpaperdiv").hide();
            $("#testpaperdiv").hide();
            $("#createtestpaperdiv").show();
        });

        $("#inserttestpapercancel").click(function () {
            $("#inserttestpaperdiv").hide();
            $("#testpaperdiv").show();
        });

        $("#createtestpapercancel").click(function () {
            $("#createtestpaperdiv").hide();
            $("#testpaperdiv").show();
        });

        $("#selectgradeinfo").click(function () {
            $("#gradediv").hide();
            $("#selectgradeinfodiv").show();
        });

        $("#beginExam").click(function () {
            $("#testpaperdiv").hide();
            $("#beginExamdiv").show();
        });

        $("#editbutyes").click(function () {
            $("#editteacherdiv").hide();
            $("#teacherdiv").show();
            reflesh();
        });

        $("#insertclassyes").click(function () {
            $("#insertclassdiv").hide();
            $("#classdiv").show();
            refleshclass();
        });

        $("#editbutno").click(function () {
            $("#editteacherdiv").hide();
            $("#teacherdiv").show();
            reflesh();
        });

        $("#editclasscancel").click(function () {
            $("#ceditclassdiv").hide();
            $("#classdiv").show();
            refleshclass();
        });

        $("#ceditclassyes").click(function () {
            $("#ceditclassdiv").hide();
            $("#classdiv").show();
//            refleshclass();
        });
    });
</script>
<script>


    $(document).ready(function () {

        //教师界面 -----》主页加载完之后显示的教师信息
        $.ajax({
            url: "showteacherinfo",
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var str = " ";
                var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                for (var i = 0; i < obj.length; i++) {
                    str = str + "<tr><td class='tablemargin' id='btid'>" + obj[i].tid + "</td><td class='tablemargin'>" + obj[i].tnumber + "</td> <td class='tablemargin'>" + obj[i].tname + "</td> <td class='tablemargin'>" + obj[i].tsex + "</td> <td class='tablemargin'>" + obj[i].tbirthday + "</td> <td class='tablemargin'>" + obj[i].tedu + "</td> <td class='tablemargin'>" + obj[i].ttel + "</td> <td class='tablemargin'>" + obj[i].tjob + "</td> <td class='tablemargin'><input type='button' onclick='tedit(" + obj[i].tid + ")' value='编辑'> <input type='button' onclick='trepwd(" + obj[i].tid + ")' value='重置密码'><input type='button' onclick='tdelete(" + obj[i].tid + ")' value='删除'></td></tr>"
                }
                var alltable = titleinfo + str;
                $("#tableteacherinfo").html(alltable);
            }
        })

        //班级界面 -----》主页加载完之后显示的班级信息
        $.ajax({
            url: "showclassesinfo",
            type: "get",
            success: function (msg) {
                var pro = eval(msg);
                var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                //$("#tableclassinfo").html(tabletitle);
                for (var i = 0; i < pro.length; i++) {
                    var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><input type='button'  value='编辑' onclick='cedit(" + pro[i].cid + ")'></td> </tr>";
                }

                var table = tabletitle + tableinfo;

                $("#tableclassinfo").html(table);


            }
        })

        //学生界面 -----》主页加载完之后显示的学生信息
        $.ajax({
            url: "showstudentsinfo",
            type: "get",
            success: function (msg) {
                var pro = eval(msg);
                var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                for (var i = 0; i < pro.length; i++) {
                    var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].sid + "</td> <td class='tablemargin'>" + pro[i].snumber + "</td> <td class='tablemargin'>" + pro[i].classes.cid + "</td> <td class='tablemargin'>" + pro[i].sname + "</td> <td class='tablemargin'>" + pro[i].ssex + "</td> <td class='tablemargin'>" + pro[i].stel + "</td><td class='tablemargin'><input type='button'  value='编辑' onclick='sdit(" + pro[i].sid + ")'><input type='button'  value='重置密码' onclick='respwd(" + pro[i].sid + ")'><input type='button'  value='删除' onclick='sdetl(" + pro[i].sid + ")'></td></tr>";
                }
                var table = tabletitle + tableinfo;
                $("#tablestudentsinfo").html(table);
            }
        })

        //班主任的下拉框中出现姓名
        $.ajax({
            url: "selectallinfob",
            type: "get",
            success: function (msg) {
                var binfo = eval(msg);
                //alert("1231 ");
                var str = "";
                for (var i = 0; i < binfo.length; i++) {
                    str = str + "<option value='" + binfo[i].tid + "'>" + binfo[i].tname + "</option>";
                }
                var strtitle = "<option value=''>请选择</option>";
                str = strtitle + str;
                $("#tjob1").html(str);
            }
        })

        //讲师的下拉框中出现姓名
        $.ajax({
            url: "selectallinfoj",
            type: "get",
            success: function (msg) {
                var binfo = eval(msg);
                var str = "";
                for (var i = 0; i < binfo.length; i++) {
                    str = str + "<option value='" + binfo[i].tid + "'>" + binfo[i].tname + "</option>";
                }
                var strtitle = "<option value=''>请选择</option>";
                str = strtitle + str;
                $("#tjob2").html(str);
            }
        })
    })

    //教师界面 -----》重新返回到教师界面刷新信息
    function reflesh() {
        $.ajax({
            url: "showteacherinfo",
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var str = " ";
                var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                for (var i = 0; i < obj.length; i++) {
                    str = str + "<tr> <td class='tablemargin'  id='btid'>" + obj[i].tid + "</td><td class='tablemargin'>" + obj[i].tnumber + "</td> <td class='tablemargin'>" + obj[i].tname + "</td> <td class='tablemargin'>" + obj[i].tsex + "</td> <td class='tablemargin'>" + obj[i].tbirthday + "</td> <td class='tablemargin'>" + obj[i].tedu + "</td> <td class='tablemargin'>" + obj[i].ttel + "</td> <td class='tablemargin'>" + obj[i].tjob + "</td> <td class='tablemargin'><input type='button' onclick='tedit(" + obj[i].tid + ")' value='编辑'> <input type='button' onclick='trepwd(" + obj[i].tid + ")' value='重置密码'><input type='button' onclick='tdelete(" + obj[i].tid + ")' value='删除'></tr>"
                }
                var alltable = titleinfo + str;
                $("#tableteacherinfo").html(alltable);
            }
        })
    }

    //班级界面 -----》重新返回到班级界面刷新信息
    function refleshclass() {
        $.ajax({
            url: "showclassesinfo",
            type: "get",
            success: function (msg) {
                var pro = eval(msg);
                var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                //$("#tableclassinfo").html(tabletitle);
                for (var i = 0; i < pro.length; i++) {
                    var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><input type='button'  value='编辑' onclick='cedit(" + pro[i].cid + ")'></td> </tr>";
                }
                var table = tabletitle + tableinfo;
                $("#tableclassinfo").html(table);
            }
        })
    }


    //教师界面 -----》主页加载完之后点击编辑
    function tedit(edittid) {
        var ttid = edittid;
        $("#teacherdiv").hide();
        $.ajax({
            url: "editteacher?tid=" + ttid,
            type: "get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                $("#editteacherdiv").show();
                $("#tid2").val(obj.tid);
                $("#tnumber2").val(obj.tnumber);
                $(".ttjob").val(obj.tjob);
                $(".ttsex").val(obj.tsex);
                $(".ttname").val(obj.tname);
                $(".ttbirthday").val(obj.tbirthday);
                $(".ttedu").val(obj.tedu);
                $(".tttel").val(obj.ttel);
                $(".ttremark").val(obj.tremark);

            }
        })
    }

    //教师界面 -----》主页加载完之后点击重置密码
    function trepwd(repwdtid) {
        var ttid = repwdtid;
        $.ajax({
            url: "reteacherpwd?tid=" + ttid,
            type: "get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                if (obj.result = "true") {
                    alert("重置成功");
                } else {
                    alert("重置失败");
                }
            }
        })
    }

    //教师界面 -----》主页加载完之后点击删除
    function tdelete(deletetid) {
        var ttid = deletetid;
        $.ajax({
            url: "deleteteacher?tid=" + ttid,
            type: "get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                if (obj.result = "true") {
                    alert("删除成功");
                } else {
                    alert("删除失败");
                }
                reflesh();
            }
        })
    }

    //班级界面 -----》班级页面加载完之后点击编辑
    function cedit(editcid) {
        var cid = editcid;
        $("#classdiv").hide();
        $.ajax({
            url: "selectclassbyid?cid=" + cid,
            type: "get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                $("#ceditclassdiv").show();

                $("#ccid").val(obj.cid);
                $("#ccnumber").val(obj.cnumber);
                $("#ccname").val(obj.cname);
                $("#ccdirection").val(obj.cdirection);


                $("#ccbegin").val(obj.cbegin);
                $("#ccg1").val(obj.cg1);
                $("#ccg2").val(obj.cg2);
                $("#ccg3").val(obj.cg3);


            }
        })
    }


    //教师条件查询后显示信息
    $(document).ready(function () {
        $("#selectteacherbutton").click(function () {

            var number = $("#number").val();
            var name = $("#name").val();
            var job = $("#job").val();

            $.ajax({
                url: "showteacherbyThree?number=" + number + "&name=" + name + "&job=" + job,
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = " ";
                    var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td><td class='tablemargin'>" + obj[i].tnumber + "</td> <td class='tablemargin'>" + obj[i].tname + "</td> <td class='tablemargin'>" + obj[i].tsex + "</td> <td class='tablemargin'>" + obj[i].tbirthday + "</td> <td class='tablemargin'>" + obj[i].tedu + "</td> <td class='tablemargin'>" + obj[i].ttel + "</td> <td class='tablemargin'>" + obj[i].tjob + "</td> <td class='tablemargin'><input type='button' onclick='tedit(" + obj[i].tid + ")' value='编辑'> <input type='button' onclick='trepwd(" + obj[i].tid + ")' value='重置密码'><input type='button' onclick='tdelete(" + obj[i].tid + ")' value='删除'></td> </tr>"
                    }
                    var alltable = titleinfo + str;
                    $("#tableteacherinfo").html(alltable);
                }
            })
        })


        //点击添加教师后添加
        $("#insertteacher").click(function () {
            $.ajax({
                url: "getnumber",
                type: "get",
                success: function (msg) {
                    var obj = $.parseJSON(msg);

                    var number1 = obj.tnumber;
                    var id1 = obj.tid;

                    $("#tid1").val(id1);
                    $("#tnumber1").val(number1);
                }
            })
        })

        //教师界面 -----》点击添加教师后出现的界面的确定按钮
        $("#teacherinsertbut").click(function () {

            var tid = $("#tid1").val();
            var tnumber = $("#tnumber1").val();
            var tname = $(".ttname").val();
            var tsex = $(".tsex").val();
            var tbirthday = $(".tbirthday").val();
            var tedu = $(".tedu").val();
            var ttel = $(".ttel").val();
            var tjob = $(".tjob").val();
            var tremark = $(".tremark").val();
            $.ajax({
                url: "insertteacher?tnumber=" + tnumber + "&tid=" + tid
                + "&tname=" + tname + "&tsex=" + tsex + "&tbirthday=" + tbirthday + "&tedu= " + tedu + "&ttel=" + ttel + "&tjob=" + tjob + "&tremark=" + tremark,
                type: "get",
                success: function (msg) {
                    reflesh();
                }
            })
        })

        //教师界面 -----》点击编辑教师后出现的界面的确定按钮
        $("#editbutyes").click(function () {

            var tid = $("#tid2").val();
            var tnumber = $("#tnumber2").val();
            var tname = $(".ttname").val();
            var tsex = $(".ttsex").val();
            var tbirthday = $(".ttbirthday").val();
            var tedu = $(".ttedu").val();
            var ttel = $(".tttel").val();
            var tjob = $(".ttjob").val();
            var tremark = $(".ttremark").val();
            $.ajax({
                url: "editsaveteacher?tnumber=" + tnumber + "&tid=" + tid
                + "&tname=" + tname + "&tsex=" + tsex + "&tbirthday=" + tbirthday + "&tedu= " + tedu + "&ttel=" + ttel + "&tjob=" + tjob + "&tremark=" + tremark,
                type: "get",
                success: function (msg) {
                    reflesh();
                }
            })
        })

        //班级界面 -----》点击编辑班级后出现的界面的确定按钮
        $("#ceditclassyes").click(function () {

            var cid = $("#ccid").val();
            var cnumber = $("#ccnumber").val();
            var cname = $("#ccname").val();
            var cdirection = $("#ccdirection").val();
            var tidl = $("#cttjob1").val();
            var tidh = $("#cttjob2").val();
            var cg1 = $("#ccg1").val();
            var cg2 = $("#ccg2").val();
            var cg3 = $("#ccg3").val();
            var cbegin = $("#ccbegin").val();
            var cstate = $("#ccstate").val();
            var cremark = $("#ccremark").val();

            $.ajax({
                url: "editclass?cid=" + cid + "&cnumber=" + cnumber + "&cname=" + cname +
                "&cdirection=" + cdirection /*+ "&tidl=" + tidl + "&tidh= " + tidh*/ + "&cg1=" + cg1 +
                "&cg2=" + cg2 + "&cg3=" + cg3 + "&cstate=" + cstate + "&cremark=" + cremark + "&cbegin=" + cbegin,
                type: "get",
                success: function (msg) {
                    var obj = $.parseJSON(msg);
                    if (obj.result == "true") {
                        alert("修改成功");
                    }
                    if (obj.result != "true") {
                        alert("修改失败");
                    }
                    refleshclass();
                }
            })
        })

        //教师界面 -----》点击添加教师后出现的界面的取消按钮
        $("#teachercancel").click(function () {
            var tid = $("#tid1").val();
            $.ajax({
                url: "cancelteacher?tid=" + tid,
                type: "get",
                success: function (msg) {
                    reflesh();
                }
            })
        })

        //班级根据四个下拉框的条件经行信息查询
        $("#selectclassbtu").click(function () {

            var tjob1 = $("#tjob1").val();
            var tjob2 = $("#tjob2").val();
            var intime = $("#intime").val();
            var direction = $("#direction").val();

            $.ajax({
                url: "selectfour?cbegin=" + intime + "&cdirection=" + direction + "&tidl=" + tjob1 + "&tidh=" + tjob2,
                type: "get",
                success: function (msg) {
                    var pro = eval(msg);
                    var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><input type='button'  value='编辑' onclick='cedit(" + pro[i].cid + ")'></td> </tr>";
                    }
                    var table = tabletitle + tableinfo;
                    $("#tableclassinfo").html(table);
                }
            })
        })


        //点击添加班级后添加
        $("#insertclassyes").click(function () {

            var cnumber = $("#cnumber").val();
            var cname = $("#cname").val();
            var cdirection = $("#cdirection").val();
            var ttjob1 = $("#ttjob1").val();
            var ttjob2 = $("#ttjob2").val();
            var cbegin = $("#cbegin").val();
            var cg1 = $("#cg1").val();
            var cg2 = $("#cg2").val();
            var cg3 = $("#cg3").val();
            var cstate = $("#cstate").val();
            var cremark = $("#cremark").val();

            $.ajax({
                url: "insertclass?cnumber=" + cnumber + "&cname=" + cname +
                "&cdirection=" + cdirection + "&tidl=" + ttjob1 +
                "&tidh=" + ttjob2 + "&cbegin=" + cbegin + "&cg1=" + cg1 +
                "&cg2=" + cg2 + "&cg3=" + cg3 + "&cstate=" + cstate + "&cremark=" + cremark,
                type: "get",
                success: function (msg) {
                    $("#insertclassdiv").hide();
                    $("#classdiv").show();
                    var obj = $.parseJSON(msg);
                    if (obj.result == "true") {
                        alert("save成功");
                        refleshclass();
                    }
                    if (obj.result != "true") {
                        alert("save失败");
                        refleshclass();
                    }
                }
            })
        })


    })


</script>


<script>
    $(document).ready(function () {
        //图片的上传
        $("#btn1").click(function () {
            //发送ajax请求，把所选择的图片上传到服务器内存中
            $.ajaxFileUpload({
                //控制器方法名
                url: "uploadimg",
                //所选上传文件的id
                fileElementId: "upload",
                //传输的安全性
                secureuri: false,
                //所有上传都要用post请求形式
                type: "post",
                //数据以json形式传输
                dataType: "json",
                success: function (msg) {
                    var obj = $.parseJSON(msg);
                    $("#imgresult").val(obj.path);
                    $("#img1").attr("src", obj.path);
                }
            })
        })

        //点击添加学生后添加
        $("#insertstudentyes").click(function () {

            var snumber = $("#snumber").val();
            var sname = $("#sname").val();
            var ssex = $("#ssex").val();
            var senter = $("#senter").val();
            var cid = $("#cid").val();
            var sbirthday = $("#sbirthday").val();
            var sidnumber = $("#sidnumber").val();
            var sprovince = $("#sprovince").val();
            var smahor = $("#smahor").val();
            var stel = $("#stel").val();
            var sptel = $("#sptel").val();
            var sdormitory = $("#sdormitory").val();
            var spolitics = $("#spolitics").val();
            var scity = $("#scity").val();
            var sattend = $("#sattend").val();
            var saddress = $("#saddress").val();
            var srelation = $("#srelation").val();
            var sbasicinfo = $("#sbasicinfo").val();
            var sdnumber = $("#sdnumber").val();
            var seducation = $("#seducation").val();
            //var sphoto = $("#sphoto").val();
            //alert(sphoto);

            $.ajax({
                url: "insertstudents?snumber=" + snumber + "&sname=" + sname + "&ssex=" + ssex +
                "&senter=" + senter + "&cid=" + cid + "&sbirthday=" + sbirthday +
                "&sidnumber=" + sidnumber + "&sprovince=" + sprovince + "&smahor=" + smahor +
                "&stel=" + stel + "&sdormitory=" + sdormitory + "&spolitics=" + spolitics +
                "&scity=" + scity + "&sattend=" + sattend + "&saddress=" + saddress +
                "&srelation=" + srelation + "&sbasicinfo=" + sbasicinfo + "&sdnumber=" + sdnumber +
                "&seducation=" + seducation
                /*+"&sphoto=" + sphoto*/,
                type: "get",
                success: function (msg) {
                    var obj = $.parseJSON(msg);
                    if (obj.result == "true") {
                        alert("save成功");
                    }
                    if (obj.result != "true") {
                        alert("save失败");
                    }
                }
            })
        })

        //学生根据5个下拉框的条件经行信息查询
        $("#selectstudentbut").click(function () {

            var ssnumber = $("#ssnumber").val();
            var ssname = $("#ssname").val();
            var cccid = $("#cccid").val();
            var sssenter = $("#sssenter").val();
            var sssmahor = $("#sssmahor").val();

            $.ajax({
                url: "selectfive?snumber=" + ssnumber + "&sname=" + ssname +
                "&cid=" + cccid + "&smahor=" + sssmahor + "&senter=" + sssenter,
                type: "get",
                success: function (msg) {
                    var pro = eval(msg);
                    var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                    for (var i = 0; i < pro.length; i++) {
                        var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].sid + "</td> <td class='tablemargin'>" + pro[i].snumber + "</td> <td class='tablemargin'>" + pro[i].classes.cid + "</td> <td class='tablemargin'>" + pro[i].sname + "</td> <td class='tablemargin'>" + pro[i].ssex + "</td> <td class='tablemargin'>" + pro[i].stel + "</td><td class='tablemargin'><input type='button'  value='编辑' onclick='sdit(" + pro[i].sid + ")'><input type='button'  value='重置密码' onclick='respwd(" + pro[i].sid + ")'><input type='button'  value='删除' onclick='sdetl(" + pro[i].sid + ")'></td></tr>";
                    }
                    var table = tabletitle + tableinfo;
                    $("#tablestudentsinfo").html(table);
                }
            })
        })
    })

    function sdetl(detlsid) {
        var sid = detlsid;
        $.ajax({
            url: "deletestudent?sid=" + sid,
            type: "get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                if (obj.result = "true") {
                    alert("删除成功");
                } else {
                    alert("删除失败");
                }
                refleshstudent();
            }
        })
    }

    function respwd(detlsid) {
        var sid = detlsid;
        $.ajax({
            url: "restudentpwd?sid=" + sid,
            type: "get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                if (obj.result = "true") {
                    alert("重置成功");
                } else {
                    alert("重置失败");
                }
                refleshstudent();
            }
        })
    }

    function refleshstudent() {
        $.ajax({
            url: "showstudentsinfo",
            type: "get",
            success: function (msg) {
                var pro = eval(msg);
                var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                for (var i = 0; i < pro.length; i++) {
                    var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].sid + "</td> <td class='tablemargin'>" + pro[i].snumber + "</td> <td class='tablemargin'>" + pro[i].classes.cid + "</td> <td class='tablemargin'>" + pro[i].sname + "</td> <td class='tablemargin'>" + pro[i].ssex + "</td> <td class='tablemargin'>" + pro[i].stel + "</td><td class='tablemargin'><input type='button'  value='编辑' onclick='sdit(" + pro[i].sid + ")'><input type='button'  value='重置密码' onclick='respwd(" + pro[i].sid + ")'><input type='button'  value='删除' onclick='sdetl(" + pro[i].sid + ")'></td></tr>";
                }
                var table = tabletitle + tableinfo;
                $("#tablestudentsinfo").html(table);
            }
        })
    }


</script>

<div id="teacherbiggestdiv" style="width: 100%;height: 750px;">

    <div id="headdiv" style="width: 100%;height: 120px;">
        <table width="100%" height="100px">
            <tr>
                <td width="18%" align="center"><h2>欢迎你，<%=session.getAttribute("username")%>
                </h2></td>
                <td><h2>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp后台管理</h2></td>
            </tr>
        </table>
    </div>

    <div id="function" style="width:20%;height: 600px; position: absolute;" align="center">
        <h1>后台功能</h1>
        <h3><a class="teacher">教师管理</a></h3>
        <h3><a class="class">班级管理</a></h3>
        <h3><a class="student">学生管理</a></h3>
        <h3><a class="question">题库管理</a></h3>
        <h3><a class="testpaper">试卷管理</a></h3>
        <h3><a class="grade">成绩管理</a></h3>
        <h3><a class="pword">修改密码</a></h3>
    </div>

    <div id="teacherdiv"
         style="width: 80%; height: 600px;position: absolute;
         left: 290px; display:block; z-index: 1">
        <div width="100%" height="50px" align="center"><h3>教师列表</h3></div>
        <span style="font-size: 20px;"><input type="button" value="添加教师" id="insertteacher"></span><br>
        <span style="font-size: 20px;">
            账号：<input type="text" id="number" style="width: 180px; height: 25px">
            教师姓名：<input type="text" id="name" style="width: 180px; height: 25px">
            岗位：<select style="height: 30px;" id="job">
                        <option value="0">讲师</option>
                        <option value="1">班主任</option>
                  </select>
            <input type="button" value="查找" style=" height: 32px;" id="selectteacherbutton">
        </span><br>

        <div id="teachertabl" style="width: 95%;height: 30px;">
            <table class="tableteacher" border="1" style="width:100%;position: relative" id="tableteacherinfo">
                <tbody>
                &nbsp
                </tbody>
            </table>
        </div>

    </div>


    <div id="insertteacherdiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display: none;">
        <br>
        <form>
            <table width="70%" height="500px">
                <tr style="text-align: center; height: 40px;">
                    <td colspan="2"><span style="font-size: 20px;">添加教师</span></td>
                </tr>

                <input name='tid1' id="tid1" type='hidden'>

                <tr>
                    <td align="right"><span style="font-size: 20px;">账号：</span></td>
                    <td><span style="font-size: 20px;"><input id="tnumber1" type='text'
                                                              disabled='disabled'></span>
                    </td>
                </tr>
                <tr>
                    <td align="right"><span style="font-size: 20px;">姓名：</span></td>
                    <td><span style="font-size: 20px;"><input type="text" class="ttname"></span></td>
                </tr>
                <tr>
                    <td align="right"><span style="font-size: 20px;">性别：</span></td>
                    <td><span style="font-size: 20px;"><select class="tsex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select></span>
                    </td>
                </tr>
                <tr>
                    <td align="right"><span style="font-size: 20px;">生日：</span></td>
                    <td><span style="font-size: 20px;"><input type="text" class="tbirthday"></span></td>
                </tr>
                <tr>
                    <td align="right"><span style="font-size: 20px;">学历：</span></td>
                    <td><span style="font-size: 20px;"><input type="text" class="tedu"></span></td>
                </tr>
                <tr>
                    <td align="right"><span style="font-size: 20px;">联系电话：</span></td>
                    <td><span style="font-size: 20px;"><input type="text" class="ttel"></span></td>
                </tr>

                <tr>
                    <td align="right"><span style="font-size: 20px;">岗位：</span></td>
                    <td><span style="font-size: 20px;"><select class="tjob">
                        <option value="0">讲师</option>
                        <option value="1">班主任</option>
                    </select></span>
                    </td>
                </tr>

                <tr>
                    <td align="right"><span style="font-size: 20px;">备注：</span></td>
                    <td><span style="font-size: 20px;"><textarea cols="40" rows="3" class="tremark"></textarea></span>
                    </td>
                </tr>

                <tr align="center"><span style="font-size: 20px;">
                <td colspan="2">
                    <input type="button" value="确定" style="height: 32px; width:80px;" id="teacherinsertbut">
                    <input type="button" value="取消" id="teachercancel" style="height: 32px; width:80px;">
                 </td></span>
                </tr>
            </table>
        </form>
    </div>

    <div id="editteacherdiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display: none;">
        <br>
        <form>
            <table width='70%' height='500px'>
                <tr style='text-align: center; height: 40px;'>
                    <td colspan='2'><span style='font-size: 20px;'>添加教师</span></td>
                </tr>
                <input name='tid2' id="tid2" type='hidden'>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>账号：</span></td>
                    <td><span style='font-size: 20px;'><input id='tnumber2' type='text' disabled='disabled'></span></td>
                </tr>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>姓名：</span></td>
                    <td><span style='font-size: 20px;'><input type='text' class='ttname'></span></td>
                </tr>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>性别：</span></td>
                    <td><span style='font-size: 20px;'><select class='ttsex'> <option value='男'>男</option> <option
                            value='女'>女</option> </select></span></td>
                </tr>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>生日：</span></td>
                    <td><span style='font-size: 20px;'><input type='text' class='ttbirthday'></span></td>
                </tr>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>学历：</span></td>
                    <td><span style='font-size: 20px;'><input type='text' class='ttedu'></span></td>
                </tr>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>联系电话：</span></td>
                    <td><span style='font-size: 20px;'><input type='text' class='tttel'></span></td>
                </tr>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>岗位：</span></td>
                    <td><span style='font-size: 20px;'><select class='ttjob'> <option value='0'>讲师</option> <option
                            value='1'>班主任</option> </select></span></td>
                </tr>
                <tr>
                    <td align='right'><span style='font-size: 20px;'>备注：</span></td>
                    <td><span style='font-size: 20px;'><textarea cols='40' rows='3' class='ttremark'></textarea></span>
                    </td>
                </tr>
                <tr align='center'>
                    <span style='font-size: 20px;'>
                        <td colspan='2'>
                            <input type='button' value='确定' style='height: 32px; width:80px;' id="editbutyes">
                            <input type='button' value='取消' style='height: 32px; width:80px;' id="editbutno">
                        </td>
                    </span></tr>
            </table>
        </form>


    </div>

    <div id="classdiv" style="width: 80%; height: 600px;position: absolute;
    left: 290px; display: none">
        <div width="100%" height="50px" align="center"><h3>班级列表</h3></div>
        <span style="font-size: 20px;"><input type="button" value="添加班级" id="insertclass"></span><br>
        <span style="font-size: 20px;">
            入学年份：<select style="height: 30px; width:90px;" id="intime">
                        <option value="">请选择</option>
                        <option value="2016-09-07">2016</option>
                        <option value="2017-09-07">2017</option>
                  </select>

            所属方向：<select style="height: 30px; width:90px;" id="direction">
                        <option value="">请选择</option>
                        <option value="开发">开发</option>
                        <option value="测试">测试</option>
                  </select>

            讲师：<select style="height: 30px; width:90px;" id="tjob1">

                  </select>

            班主任：<select style="height: 30px; width:90px;" id="tjob2">

                  </select>

            <input type="button" value="查询" id="selectclassbtu" style="height: 32px;">
            <input type="button" value="重置" id="reclassbtu" style="height: 32px;">

        </span><br>

        <div id="classtable" style="width: 95%;height: 30px;">
            <table class="tableclass" border="1" style="width:100%;position: relative" id="tableclassinfo">
                <tbody>
                &nbsp
                </tbody>
            </table>
        </div>

    </div>

    <div id="insertclassdiv" style="width: 70%; height: 600px;
    position: absolute;left: 290px; display: none;">
        <br>
        <table bgcolor="red" width="70%" height="500px">
            <tr style="text-align: center">
                <td colspan="2"><span style="font-size: 20px;">添加班级</span></td>
            </tr>
            <tr>
                <td colspan="2" height="10px">
                </td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">班级代号：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="cnumber"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">班级名称：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="cname"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">所属方向：</span></td>
                <td><span style="font-size: 20px;"><select id="cdirection">
                    <option>请选择</option>
                    <option value="开发">开发</option>
                    <option value="测试">测试</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">班主任：</span></td>
                <td><span style="font-size: 20px;"><select id="ttjob1">
                    <option>请选择</option>
                    <option value="1">Tom</option>
                    <option value="400">Jane</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">讲师：</span></td>
                <td><span style="font-size: 20px;"><select id="ttjob2">
                    <option>请选择</option>
                    <option value="391">Jerry</option>
                    <option value="401">Dog</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">开班日期：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="cbegin"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">G1开班人数：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="cg1"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">G2开班人数：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="cg2"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">G3开班人数：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="cg3"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">状态：</span></td>
                <td><span style="font-size: 20px;"><select id="cstate">
                    <option value="0">启用</option>
                    <option value="1">禁用</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">备注：</span></td>
                <td height="30px"><span style="font-size: 20px;"><input type="text" id="cremark"></span></td>
            </tr>
            <tr>
                <td colspan="2" height="20px">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="确定" style="height: 32px; width:80px;" id="insertclassyes">
                    <input type="button" value="取消" id="classcancel" style="height: 32px; width:80px;">
                </td>
            </tr>
        </table>
    </div>

    <div id="ceditclassdiv" style="width: 70%; height: 600px;
    position: absolute;left: 290px; display: none;">
        <br>
        <table bgcolor="red" width="70%" height="500px">
            <tr style="text-align: center">
                <td colspan="2"><span style="font-size: 20px;">修改班级</span></td>
            </tr>
            <tr>
                <td colspan="2" height="10px">
                </td>
            </tr>
            <<input type="hidden" id="ccid">
            <tr>
                <td align="right"><span style="font-size: 20px;">班级代号：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="ccnumber"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">班级名称：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="ccname"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">所属方向：</span></td>
                <td><span style="font-size: 20px;"><select id="ccdirection">
                    <option>请选择</option>
                    <option value="开发">开发</option>
                    <option value="测试">测试</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">班主任：</span></td>
                <td><span style="font-size: 20px;"><select id="cttjob1">
                    <option value="1">Tom</option>
                    <option value="400">Jane</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">讲师：</span></td>
                <td><span style="font-size: 20px;"><select id="cttjob2">
                    <option value="391">Jerry</option>
                    <option value="401">Dog</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">开班日期：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="ccbegin"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">G1开班人数：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="ccg1"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">G2开班人数：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="ccg2"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">G3开班人数：</span></td>
                <td><span style="font-size: 20px;"><input type="text" id="ccg3"></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">状态：</span></td>
                <td><span style="font-size: 20px;"><select id="ccstate">
                    <option value="0">启用</option>
                    <option value="1">禁用</option>
                </select></span></td>
            </tr>
            <tr>
                <td align="right"><span style="font-size: 20px;">备注：</span></td>
                <td height="30px"><span style="font-size: 20px;"><input type="text" id="ccremark"></span></td>
            </tr>
            <tr>
                <td colspan="2" height="20px">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="确定" style="height: 32px; width:80px;" id="ceditclassyes">
                    <input type="button" value="取消" id="editclasscancel" style="height: 32px; width:80px;">
                </td>
            </tr>
        </table>
    </div>

    <div id="studentdiv"
         style="width: 80%; height: 600px;position: absolute;
             left: 290px; display:none;">
        <div width="100%" height="50px" align="center"><h3>学生列表</h3></div>

        <span style="font-size: 20px;">
            <input type="button" value="添加学生" id="insertstudent">
            <input type="button" value="学生信息导出">
            <input type="button" value="学生信息导入">
            <input type="button" value="学生信息空模版下载">
        </span><br>

        <span style="font-size: 20px;">
            学号：<input type="text" name="number" style="width: 150px; height: 25px" id="ssnumber">
            姓名：<input type="text" name="number" style="width: 120px; height: 25px" id="ssname">
            班级：<select style="height: 30px; width:90px;" id="cccid">
                        <option value="null">请选择</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                </select>
            入学年份：<select style="height: 30px; width:90px;" id="sssenter">
                        <option value="null">请选择</option>
                        <option value="2016-09-07">2016</option>
                        <option value="2017-09-07">2017</option>
                  </select>
            就读方向：<select style="height: 30px; width:90px;" id="sssmahor">
                        <option value="null">请选择</option>
                        <option value="开发">开发</option>
                        <option value="测试">测试</option>
                  </select>
            <input type="button" value="查找" style="height: 32px;" id="selectstudentbut">
        </span><br>

        <div id="studenttable" style="width: 95%;height: 30px;">
            <table class="table" id="tablestudentsinfo">


            </table>
        </div>
    </div>

    <div id="insertstudentdiv" style="width: 70%; height: 600px;
    position: absolute;left: 290px; display: none;">
        <br>
        <table bgcolor="red" width="70%" height="500px">
            <tr>
                <td colspan="4" style="text-align: center;"><h3>添加学生</h3></td>
            </tr>
            <tr>
                <td align="right">学号：</td>
                <td><input type="text" id="snumber"></td>
                <td colspan="2"></td>

            </tr>
            <tr>
                <td align="right">姓名：</td>
                <td><input type="text" id="sname"></td>
                <td colspan="2"></td>

            </tr>
            <tr>
                <td align="right">性别：</td>
                <td><select id="ssex">
                    <option>请选择</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select></td>
                <td rowspan="4" align="right">照片：</td>
            </tr>
            <tr>
                <td align="right">入学年份：</td>
                <td><select id="senter">
                    <option>请选择</option>
                    <option value="2016-09-07">2016-09-07</option>
                    <option value="2017-09-07">2017-09-07</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">所属班级：</td>
                <td><select id="cid">
                    <option>请选择</option>
                    <option value="1">1601</option>
                    <option value="2">1701</option>
                </select></td>

            </tr>
            <tr>
                <td align="right">生日：</td>
                <td><input type="text" id="sbirthday"></td>

            </tr>
            <tr>
                <td align="right">身份证号：</td>
                <td><input type="text" id="sidnumber"></td>
                <td align="right">政治面貌：</td>
                <td><input type="text" id="spolitics"></td>
            </tr>
            <tr>
                <td align="right">省份：</td>
                <td><select id="sprovince">
                    <option>请选择</option>
                    <option value="河南">河南</option>
                    <option value="河北">河北</option>
                </select></td>
                <td align="right">城市：</td>
                <td><select id="scity">
                    <option>请选择</option>
                    <option>周口</option>
                    <option>保定</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">专业简称：</td>
                <td><select id="smahor">
                    <option>请选择</option>
                    <option value="KF">开发</option>
                    <option value="CS">测试</option>
                </select></td>
                <td align="right">就读方向：</td>
                <td><select id="sattend">
                    <option>请选择</option>
                    <option value="KF">开发</option>
                    <option value="3/4G">3/4G</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">联系电话：</td>
                <td><input type="text" id="stel"></td>
                <td align="right">家庭住址：</td>
                <td><input type="text" id="saddress"></td>
            </tr>
            <tr>
                <td align="right">家长电话：</td>
                <td><input type="text" id="sptel"></td>
                <td align="right">监护人与学生关系：</td>
                <td><input type="text" id="srelation"></td>
            </tr>
            <tr>
                <td align="right">宿舍：</td>
                <td>
                    <select id="sdormitory">
                        <option>请选择</option>
                        <option value="8000">8000</option>
                        <option value="7000">7000</option>
                    </select></td>
                <td align="right">宿舍号：</td>
                <td><input type="text" id="sdnumber"></td>
            </tr>
            <tr>
                <td align="right">基本情况：</td>
                <td colspan="3" rowspan="1"><textarea cols="80" rows="2" id="sbasicinfo"></textarea></td>
            </tr>
            <tr>
                <td align="right">教育背景：</td>
                <td colspan="3" rowspan="1"><textarea cols="80" rows="2" id="seducation"></textarea></td>
            </tr>

            <tr>
                <td colspan="4" rowspan="1" height="10px"></td>
            </tr>

            <tr align="center"><span style="font-size: 20px;">
                <td colspan="4">
                    <input type="button" value="确定" style="height: 32px; width:80px;" id="insertstudentyes">
                    <input type="button" value="取消" style="height: 32px; width:80px;" id="insertstudentcancel">
                </td></span>
            </tr>

            <input type="hidden" id="imgresult" style="display: none"><br>
        </table>
        <div style="width: 200px; height: 200px; margin-left: 495px; margin-top: -485px;">
            <input type="file" id="upload" name="upload">
            <input type="button" value="提交" id="btn1">
            <img id="img1" src="" style="width: 180px;height: 100px;" id="sphoto">
        </div>

    </div>


    <div id="questiondiv" style="width: 80%; height: 600px;position: absolute;
     left: 290px; display:none;">
        <br><br>
        <span style="font-size: 20px;">
            <select style="height: 30px; width:90px;">
                        <option value="1">SCCE</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            <select style="height: 30px; width:90px;">
                        <option value="1">G1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>
        </span><br>

        <a id="questiona">
            <div id="question1" style="width: 200px;
        height: 100px; margin-left: 100px; margin-top: 50px">
                <table width="100%" height="100%">
                    <tr align="center">
                        <td>1</td>
                    </tr>
                    <tr align="center">
                        <td>2</td>
                    </tr>
                    <tr align="center">
                        <td>3</td>
                    </tr>
                </table>
            </div>
        </a>

        <div id="question2" style="width: 200px;
        height: 100px; margin-left: 450px; margin-top: -100px ;position: absolute">
            <table width="100%" height="100%">
                <tr align="center">
                    <td>1</td>
                </tr>
                <tr align="center">
                    <td>2</td>
                </tr>
                <tr align="center">
                    <td>3</td>
                </tr>
            </table>
        </div>

        <div id="question3" style="width: 200px;
        height: 100px; margin-left: 800px; margin-top: -100px ;position: absolute">
            <table width="100%" height="100%">
                <tr align="center">
                    <td>1</td>
                </tr>
                <tr align="center">
                    <td>2</td>
                </tr>
                <tr align="center">
                    <td>3</td>
                </tr>
            </table>
        </div>
    </div>

    <div id="questionadiv"
         style="width: 80%; height: 600px;position: absolute;
             left: 290px; display:none;">
        <div width="100%" height="50px" align="center"><h3>PS/flash笔试试题列表</h3></div>
        <br>

        <form class="form-inline" role="form">

            <div class="form-group">
                <input type="button" value="添加试题" id="inserttest">
            </div>

            <div class="form-group">
                <input type="file" id="inputfile">
            </div>

            <div class="form-group">
                <input type="button" value="导入">
            </div>

            <div class="form-group">
                <input type="button" value="下载考试试题模板">
            </div>
        </form>


        <div id="questionatablediv" style="width: 95%;height: 30px;">
            <table class="table">
                <thead>
                <tr>
                    <th width="50px" style="vertical-align: middle !important;text-align: center;">序号</th>
                    <th width="100px" style="vertical-align: middle !important;text-align: center;">类型</th>
                    <th width="220px" style="vertical-align: middle !important;text-align: center;">题目内容</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">选项A</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">选项B</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">选项C</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">选项D</th>
                    <th width="50px" style="vertical-align: middle !important;text-align: center;">答案</th>
                    <th width="100px" style="vertical-align: middle !important;text-align: center;">程度</th>
                    <th width="100px" style="vertical-align: middle !important;text-align: center;">对应章节</th>
                    <th width="160px" style="vertical-align: middle !important;text-align: center;">操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <%--<div id="insertquestionadiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display:block; background-color: red">
        <table>
        </table>

    </div>--%>


    <div id="testpaperdiv" style="width: 80%; height: 600px;position: absolute;
         left: 290px; display:none;">
        <div width="100%" height="50px" align="center"><h3>试卷列表</h3></div>
        <br>
        <span style="font-size: 20px;">

            方向：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            阶段：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            考试科目：<select style="height: 30px; width:150px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            考试类型：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            状态：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            <input type="button" value="查询" style="width: 100px;">
        </span><br>

        <span style="font-size: 20px;">
            <input type="button" value="随机组卷" style="width: 100px;" id="inserttestpaper">
            <input type="button" value="选择组卷" style="width: 100px;" id="insertortestpaper">
            <input type="button" value="上机考试" style="width: 100px;">
        </span>

        <div id="testpapertable" style="width: 95%;height: 30px;">
            <br>
            <table class="table">
                <thead>
                <tr>
                    <th width="50px" style="vertical-align: middle !important;text-align: center;">序号</th>
                    <th width="100px" style="vertical-align: middle !important;text-align: center;">类别</th>
                    <th width="220px" style="vertical-align: middle !important;text-align: center;">科目</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">标题</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">考试类型</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">考试时长(分钟)</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">状态</th>
                    <th style="vertical-align: middle !important;text-align: center;">操作</th>

                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div id="inserttestpaperdiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display:none;">
        <table id="createpaper" width="70%" height="400px">
            <tr>
                <td align="right" width="80px">方向：</td>
                <td width="180px"><select>
                    <option>SCCE</option>
                </select></td>
                <td align="right" width="100px">阶段：<select>
                    <option>G1</option>
                </select></td>
                <td align="left" width="300px">科目：<select>
                    <option>Ps</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">标题：</td>
                <td colspan="3"><input type="text" style="width: 400px"></td>
            </tr>
            <tr>
                <td align="right">总分：</td>
                <td><input type="text">分</td>
                <td align="right">考试时长：</td>
                <td><input type="text">分钟</td>
            </tr>
            <tr>
                <td align="right">已选题数：</td>
                <td><input type="text" value="0"></td>
                <td align="right">每题分数：</td>
                <td><input type="text" value="0"></td>
            </tr>
        </table>
        <br>
        <div id="buttondiv" align="center" style="width: 75%;">
            <input type="button" value="创建试卷">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="取   消" id="inserttestpapercancel">
        </div>
    </div>

    <div id="createtestpaperdiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display:none;">
        <br><br>
        <table>
            <tr>
                <td>方向:</td>
                <td><select>
                    <option>SCCE</option>
                </select></td>
                <td>阶段:<select>
                    <option>G1</option>
                </select></td>
                <td>科目:<select>
                    <option>Ps</option>
                </select></td>
            </tr>
            <tr>
                <td>标题:</td>
                <td colspan="3"><input type="text"></td>
            </tr>
            <tr>
                <td>总分:</td>
                <td><input type="text">分</td>
                <td>考试时长:</td>
                <td><input type="text">分钟</td>
            </tr>
            <tr>
                <td>已选题数:</td>
                <td><input type="text" value="0"></td>
                <td>每题分数:</td>
                <td><input type="text" value="0"></td>
            </tr>
        </table>
        <table id="paperinfo">
            <tr>
                <td width="50px">选择框</td>
                <td width="50px">序号</td>
                <td width="50px">类型</td>
                <td width="50px">程度</td>
                <td width="100px">对应章节</td>
                <td width="250px">题目</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>1</td>
                <td>单选</td>
                <td>简单</td>
                <td>T4</td>
                <td>产生当前日期的方法是().</td>
            </tr>
        </table>
        <table border="0" id="page" width="550px">
            <tr>
                <td colspan="9" style="text-align: right">
                    第1页，
                    共1页&nbsp;
                    首页&nbsp;
                    上一页&nbsp;
                    下一页&nbsp;
                    末页
                </td>
            </tr>
        </table>
        <div>
            <input type="button" value="创建试卷">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" value="取   消" id="createtestpapercancel">
        </div>
        </table><br>
    </div>


    <div id="beginExamdiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display:none;">
        <br><br>
        <div>
            <input type="button" value="开始考试">
            <input type="button" value="取消">
        </div>

        <div align="center" style=" width: 800px; height: 40px;"><h3>请选择参加考试的班级及开考时间</h3></div>
        <br>
        <table id="timetable">
            <tr align="center">
                <td width="200px">班级</td>
                <td width="400px">开考时间</td>
                <td width="150px"><input type="button" value="添加" style="width: 150px;"></td>
            </tr>
            <tr align="center">
                <td><select style="width: 150px;">
                    <option>G3T53</option>
                </select></td>
                <td><input type="text" value="2014-08-01 09:30" style="width: 250px;"></td>
                <td></td>
            </tr>
            <tr align="center">
                <td><select style="width: 150px;">
                    <option>G3T54</option>
                </select></td>
                <td><input type="text" value="2014-08-01 09:30" style="width: 250px;"></td>
                <td><input type="button" value="删除" style="width: 150px;"></td>
            </tr>
        </table>
    </div>


    <div id="gradediv" style="width: 80%; height: 600px;position: absolute;
         left: 290px; display:none;">
        <div width="100%" height="50px" align="center"><h3>试卷列表</h3></div>
        <br>
        <span style="font-size: 20px;">

            方向：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            阶段：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            考试科目：<select style="height: 30px; width:150px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            考试类型：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            <input type="button" value="查询" style="width: 100px;">
        </span><br>

        <div id="gradetable" style="width: 95%;height: 30px;">
            <table class="table">
                <thead>
                <tr>
                    <th width="50px" style="vertical-align: middle !important;text-align: center;">序号</th>
                    <th width="100px" style="vertical-align: middle !important;text-align: center;">类别</th>
                    <th width="220px" style="vertical-align: middle !important;text-align: center;">科目</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">标题</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">考试班级</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">考试时长(分钟)</th>
                    <th style="vertical-align: middle !important;text-align: center;">操作</th>

                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div id="selectgradeinfodiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display:none;">
        <br><br>
        <table id="subjecttitletable" width="800px" height="200px">
            <tr align="center">
                <td colspan="3"><h1>【struts考试1】成绩列表</h1></td>
            </tr>
            <tr>
                <td>班级:<select style="width: 100px;">
                    <option></option>
                </select></td>
                <td>学生姓名:<input type="text"></td>
                <td><input type="button" value="查询"></td>
            </tr>
            <tr>
                <td colspan="3">查询结果:总人数1 及格人数0 及格率0.0%</td>
            </tr>
        </table>
        <table border="1" id="subjecttesttable" width="800px" height="50px">
            <tr style="background-color: darkgrey" align="center">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">姓名</td>
                <td class="tablemargin">班级</td>
                <td class="tablemargin">开考时间</td>
                <td class="tablemargin">结束时间</td>
                <td class="tablemargin">分数</td>
                <td class="tablemargin">操作</td>
            </tr>
        </table>
    </div>

    <%--<div id="selectgradeinfodetailsdiv" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display:none;">
        <br><br>
        <table border="0" id="testdetailstable">
            <tr>
                <td>科目:struts考试1</td>
                <td>规定时长:60(分钟)</td>
                <td>总分:100</td>
                <td>总题数:11</td>
            </tr>
            <tr>
                <td colspan="2">开始时间:2017-11-21 9:29:06</td>
                <td colspan="2">结束时间:2017-11-21 12:00:00</td>
            </tr>
            <tr>
                <td colspan="2">考试姓名:20123</td>
                <td colspan="2">考试的分:66</td>
            </tr>
        </table>
        <hr>
        <table border="1" id="titledetails">
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>--%>

</div>

</body>
</html>
