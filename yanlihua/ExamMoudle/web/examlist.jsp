<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>examlist</title>
</head>
<style>
    #bigdiv {
        width: 100%;
        height: 700px;
        background-color: bisque;
        position: relative;
    }

    #topdiv {
        width: 100%;
        height: 60px;
        background-color: gainsboro;
        border-bottom: 1px solid black;
    }

    #leftdiv {
        width: 299px;
        height: 640px;
        position: relative;
        background-color: beige;
        border-right: 1px solid black;
    }

    #rightdiv {
        width: 1300px;
        height: 640px;
        position: relative;
        bottom: 640px;
        left: 300px;
        background-color: lavender;
    }

    .tablemargin {
        text-align: center;
    }

    #title {
        position: relative;
        left: 400px;
        font-size: 20px
    }

    #page {
        width: 320px;
        height: 40px;
        position: relative;
        top: 650px;
        left: 1050px;
        z-index: 10;
    }

    #randomtable {
        width: 800px;
        height: 600px;
        position: relative;
        left: 400px;
    }

    #bottomdiv {
        width: 100%;
        height: 700px;
        position: relative;
        display: none;
        background-color: gainsboro;
        margin: auto;
    }

    a {
        text-decoration: none;
    }

</style>

<script type="text/javascript" language="JavaScript"></script>
<script>
    function show() {
        bottomdiv.style.display = "block";
        bigdiv.style.display = "none";
    }
    function closeShow() {
        bottomdiv.style.display = "none";
        bigdiv.style.display = "block";
    }
</script>
<script src="js/jquery-3.2.1.js"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: "selecttestpaperallinfoway",
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var strtitle = " <tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>类别</td> <td class='tablemargin'>科目</td> <td class='tablemargin'>标题</td> <td class='tablemargin'>考试班级</td> <td class='tablemargin'>考试时长(分钟)</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                var strinfo = "";
                var classinfo = "";
                for (var i = 0; i < obj.length; i++) {
                    if (obj[i].tstate == "未开考") {
                        strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + "" + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>未开考</td> <td class='tablemargin'>删除  <a href='begintest?tid="+obj[i].tid+"'>开始考试</a>  查看试卷</td> </tr>";

                    } else {
                        if (obj[i].tstate == "考试中") {
                            strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试中</td> <td class='tablemargin'>结束考试  查看成绩  查看试卷</td> </tr>";

                        }
                        else if (obj[i].tstate == "考试结束") {
                            strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试结束</td> <td class='tablemargin'>查看成绩  查看试卷</td> </tr>";

                        }
                     /*   var a = obj[i].gradeSet;

                        for (var j = 0; j < a.length; j++) {
                            var flg = true;
                            var b = classinfo.split(",");
                            for (var z = 0; z < b.length; z++) {
                                if (a[j].students.classes.cnumber == b[z]) {
                                    flg = false;
                                    break;
                                }
                            }
                            if (flg == false) {
                                continue;
                            }

                            classinfo = classinfo + a[j].students.classes.cnumber + ",";
                        }
                        if (obj[i].tstate == "考试中") {
                            strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + classinfo + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试中</td> <td class='tablemargin'>结束考试  查看成绩  查看试卷</td> </tr>";

                        }
                        else if (obj[i].tstate == "考试结束") {
                            strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + classinfo + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试结束</td> <td class='tablemargin'>查看成绩  查看试卷</td> </tr>";

                        }*/
                    }


                }
                var alltable = strtitle + strinfo;
                $("#examinfo").html(alltable);
            }
        });

//查询所有的科目名字
        $.ajax({
            url: "selectsubjectinfoway",
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var str = "";
                for (var i = 0; i < obj.length; i++) {
                    str = str + "<option value='" + obj[i].suid + "' onclick='course(" + obj[i].suid + ")'>" + obj[i].sucourse + "</option>";
                }
                var strtitle = "<option value=''>请选择</option>";
                str = strtitle + str;
                $("#suid").html(str);
                $("#suid1").html(str);
            }
        });

//根据5个条件经行查询
        $("#fiveselect").click(function () {
            var suid = $("#suid").val();
            var ttype = $("#ttype").val();
            var tstate = $("#tstate").val();
            $.ajax({
                url: "selectinfobyfiveconditionway?suid=" + suid + "&ttype=" + ttype + "&tstate=" + tstate,
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var strtitle = " <tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>类别</td> <td class='tablemargin'>科目</td> <td class='tablemargin'>标题</td> <td class='tablemargin'>考试班级</td> <td class='tablemargin'>考试时长(分钟)</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    var strinfo = "";
                    for (var i = 0; i < obj.length; i++) {
                        if (obj[i].tstate == "未开考") {
                            /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------点击开始考试调控制器*/
                            strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + "" + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>未开考</td> <td class='tablemargin'>删除  <a href='begintest?tid="+obj[i].tid+"'>开始考试</a>  查看试卷</td> </tr>";

                        } else {
                            if (obj[i].tstate == "考试中") {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试中</td> <td class='tablemargin'>结束考试  查看成绩  查看试卷</td> </tr>";

                            }
                            else if (obj[i].tstate == "考试结束") {
                                strinfo = strinfo + "<tr> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].ttype + "</td> <td class='tablemargin'>" + obj[i].subject.sucourse + "</td> <td class='tablemargin'>" + obj[i].ttitle + "</td> <td class='tablemargin'>" + obj[i].cname + "</td> <td class='tablemargin'>" + obj[i].ttime + "</td> <td class='tablemargin'>考试结束</td> <td class='tablemargin'>查看成绩  查看试卷</td> </tr>";

                            }
                        }
                    }
                    var alltable = strtitle + strinfo;
                    $("#examinfo").html(alltable);
                }
            });
        });
        $("#mkn").bind('input propertychange', function () {
            //alert(2);
            //单选多选中每个等级的题数
            var ojd = $("#ojd").val();
            var oyb = $("#oyb").val();
            var okn = $("#oyb").val();
            //alert("单选"+ojd+";"+oyb+";"+okn);
            var mjd = $("#mjd").val();
            var myb = $("#myb").val();
            var mkn = $("#myb").val();
            //alert("多选"+mjd+";"+myb+";"+mkn);
            //alert(Number(ojd) + Number(oyb));
            var alltotal = Number(ojd) + Number(oyb) + Number(okn) + Number(mjd) + Number(myb) + Number(mkn);
            //alert(alltotal);
            $("#tsum1").val(alltotal);
            var totalpain = $("#totalpain").val();
            var regu = /^[0-9]*[1-9][0-9]*$/;
            var everone = totalpain / alltotal
            if (regu.test(everone)) {
                $("#teacherscore1").val(everone);
            }
            else {
                var everone1 = Math.ceil(everone);
                $("#teacherscore1").val(everone1);
            }


        });

    });

    function course(a) {

        //创建试卷按键(保存)
        $("#createpaper").click(function () {
            var suid = a;
            alert("a");
            //考试类型在数据库中进行处理ttype  tstate(不需要传值)
            var ttitle = $("#ttitle1").val();
            var ttime = $("#ttime1").val();
            //总题数
            var tsum = $("#tsum1").val();
            //每题分数
            var teachscore = $("#teacherscore1").val();

            var ojd = $("#ojd").val();
            var oyb = $("#oyb").val();
            var okn = $("#oyb").val();
            alert("单选" + ojd + ";" + oyb + ";" + okn);
            var mjd = $("#mjd").val();
            var myb = $("#myb").val();
            var mkn = $("#myb").val();
            alert("多选" + mjd + ";" + myb + ";" + mkn);


            $.ajax({
                url: "savetestpaperinfo?ttitle=" + ttitle + "&ttime=" + ttime + "&tsum=" + tsum + "&teachscore=" + teachscore + "&suid=" + suid +
                "&ojd=" + ojd + "&oyb=" + oyb + "&okn=" + okn + "&mjd=" + mjd + "&myb=" + myb + "&mkn=" + mkn,
                type: "get",
                success: function (msg) {
                    var res = $.parseJSON(msg);
                    if (res.result == "true") {
                        alert("试题创建成功！！！");
                    }
                    else {
                        alert("试题创建失败！！！");
                    }
                }

            });
        });

    }
</script>
<body>
<div id="bottomdiv">
    <table id="randomtable" border="1">
        <tr>
            <td>方向:</td>
            <td><select id="sudirection1">
                <option value="">请选择</option>
                <option value="高软">高软</option>
                <option value="3G4G">3G4G</option>
            </select></td>
            <td>阶段:<select id="sustage1">
                <option value="">请选择</option>
                <option value="G1">G1</option>
                <option value="G2">G2</option>
                <option value="G3">G3</option>
            </select></td>
            <td>科目:<select id="suid1">

            </select></td>
        </tr>
        <tr>
            <td>标题:</td>
            <td colspan="3"><input type="text" id="ttitle1"></td>

        </tr>
        <tr>
            <td>总分:</td>
            <td colspan="3"><input type="text" id="totalpain">分</td>
        </tr>
        <tr>
            <td>考试时长:</td>
            <td colspan="3"><input type="text" id="ttime1">分钟</td>
        </tr>
        <tr>
            <td>单选题:</td>
            <td>简单<input type="text" id="ojd"></td>
            <td>一般<input type="text" id="oyb"></td>
            <td>困难<input type="text" id="okn"></td>
        </tr>
        <tr>
            <td>多选题:</td>
            <td>简单<input type="text" id="mjd"></td>
            <td>一般<input type="text" id="myb"></td>
            <td>困难<input type="text" id="mkn"></td>
        </tr>
        <tr>
            <td>总题数:</td>
            <td colspan="3"><input type="text" id="tsum1"></td>
        </tr>
        <tr>
            <td>每题分数:</td>
            <td colspan="3"><input type="text" id="teacherscore1"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <input type="button" style="width: 150px;height: 40px" value="创建试题" id="createpaper">&nbsp;&nbsp;
                <input type="button" style="width: 150px;height: 40px" value="取消" onclick="closeShow()">
            </td>

        </tr>
    </table>
</div>


<div id="bigdiv">
    <div id="topdiv">
        <table width="1400px">
            <tr>
                <td width="1000px"><b style="font-size: 25px;position:relative;margin-left: 200px">在线考试管理系统</b></td>
                <td width="400px">
                    2014年7月31日 星期四 8:36
                    [<a id="zhuxiao" style="color: royalblue">注销</a>]
                    [<a id="" style="color: royalblue">退出系统</a>]
                </td>

            </tr>
        </table>
    </div>
    <div id="leftdiv">
        <table style="margin: auto;height: 420px">
            <tr>
                <td><a href="teacherlist.jsp">教师管理</a></td>
            </tr>
            <tr>
                <td><a href="classlist.jsp">班级管理</a></td>
            </tr>
            <tr>
                <td><a href="studentlist.jsp">学生管理</a></td>
            </tr>
            <tr>
                <td><a href="questionbankmanage.jsp">题库管理</a></td>
            </tr>
            <tr>
                <td><a href="examlist.jsp">试卷管理</a></td>
            </tr>
            <tr>
                <td><a href="gradelist.jsp">成绩管理</a></td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>
        </table>
    </div>
    <div id="rightdiv">
        <table border="0" style="width: 1000px;height: 120px">
            <tr>
                <td colspan="6"><b id="title">试卷列表</b></td>
            </tr>
            <tr>
                <td>方向:<select id="sudirection">
                    <option value="">请选择</option>
                    <option value="高软">高软</option>
                    <option value="3G4G">3G4G</option>
                </select></td>
                <td>阶段:<select id="sustage">
                    <option value="">请选择</option>
                    <option value="G1">G1</option>
                    <option value="G2">G2</option>
                    <option value="G3">G3</option>
                </select></td>
                <td>考试科目:<select id="suid">

                </select></td>
                <td>考试类型:<select id="ttype">
                    <option value="">请选择</option>
                    <option value="笔试">笔试</option>
                    <option value="机试">机试</option>
                </select></td>
                <td>状态:<select id="tstate">
                    <option value="">请选择</option>
                    <option value="未开考">未开考</option>
                    <option value="考试中">考试中</option>
                    <option value="考试结束">考试结束</option>
                </select></td>
                <td><input type="button" value="查询" id="fiveselect"></td>
            </tr>
            <tr>
                <td><input type="button" value="随机组卷" onclick="show()"></td>
                <td><a href="createpaper.jsp"><input type="button" value="选择组卷"></a></td>
                <td colspan="4"><input type="button" value="上机考试"></td>
            </tr>
        </table>
        <table border="1" style="position:relative;width: 1000px;top: 20px;" id="examinfo">
            <%-- <tr style="background-color: darkgrey">
                 <td class="tablemargin">序号</td>
                 <td class="tablemargin">类别</td>
                 <td class="tablemargin">科目</td>
                 <td class="tablemargin">标题</td>
                 <td class="tablemargin">考试班级</td>
                 <td class="tablemargin">考试时长(分钟)</td>
                 <td class="tablemargin">状态</td>
                 <td class="tablemargin">操作</td>
             </tr>--%>
        </table>

    </div>
</div>

<table border="1" id="page">
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
</body>
</html>
