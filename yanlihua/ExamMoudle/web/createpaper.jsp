<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>createpaper</title>
    <style>
        #bottomdiv {
            width: 100%;
            height: 700px;
            background-color: gainsboro;
            position: fixed;
        }

        #createpaper {
            width: 800px;
            height: 200px;
            position: relative;
            left: 400px;
        }

        #paperinfo {
            width: 800px;
            position: relative;
            top: 10px;
            left: 400px;
        }

        #page {
            width: 320px;
            height: 40px;
            position: relative;
            top: 650px;
            left: 1050px;
            z-index: 10;
        }

        #buttondiv {
            width: 350px;
            height: 50px;
            position: relative;
            top: 330px;
            left: 500px;
        }

        #buttondiv input {
            width: 150px;
            height: 35px;
        }
    </style>
    <script src="js/jquery-3.2.1.js"></script>
    <script>
        var pageindex;
        var pageConunt;
        $(document).ready(function () {
            $.ajax({
                url: "selectallquestionbankinfo",
                type: "get",
                success: function (msg) {
                    var pro = eval(msg);
                    var strtitle = "<tr style='background-color: darkgrey'> <td>选择框</td> <td>序号</td> <td>类型</td> <td>程度</td> <td>对应章节</td> <td>题目</td> </tr>";
                    var strinfo = "";
                    for (var i = 0; i < pro.length; i++) {
                        if (pro[i].qtype == 0) {
                            var strinfo = strinfo + "<tr><td> <input type='checkbox' value='" + pro[i].qid + "'></td> <td>" + pro[i].qid + "</td> <td>单选</td> <td>" + pro[i].qdifficulty + "</td> <td>" + pro[i].qchapter + "</td> <td>" + pro[i].qcontent + "</td> </tr>";
                        }
                    }
                    var alltable = strtitle + strinfo;
                    $("#paperinfo").html(alltable);
                    getPageInfo();
                }

            });
//首页
            $("#page2").click(function () {
                $.ajax({
                    url: "selectallquestionbankinfo?pageindex=" + 0,
                    type: "get",
                    success: function (msg) {
                        var pro = eval(msg);

                        var strtitle = "<tr style='background-color: darkgrey'> <td>选择框</td> <td>序号</td> <td>类型</td> <td>程度</td> <td>对应章节</td> <td>题目</td> </tr>";
                        var strinfo = "";
                        for (var i = 0; i < pro.length; i++) {
                            if (pro[i].qtype == 0) {
                                var strinfo = strinfo + "<tr><td> <input type='checkbox' value='" + pro[i].qid + "'></td> <td>" + pro[i].qid + "</td> <td>单选</td> <td>" + pro[i].qdifficulty + "</td> <td>" + pro[i].qchapter + "</td> <td>" + pro[i].qcontent + "</td> </tr>";
                            }
                        }
                        var alltable = strtitle + strinfo;
                        $("#paperinfo").html(alltable);
                        //画分页效果
                        getPageInfo();

                    }

                });
            });

            //上一页
            $("#uppage").click(function () {
                pageindex--;
                $.ajax({
                    url: "selectallquestionbankinfo?pageindex=" + pageindex,
                    type: "get",
                    success: function (msg) {
                        var pro = eval(msg);

                        var strtitle = "<tr style='background-color: darkgrey'> <td>选择框</td> <td>序号</td> <td>类型</td> <td>程度</td> <td>对应章节</td> <td>题目</td> </tr>";
                        var strinfo = "";
                        for (var i = 0; i < pro.length; i++) {
                            if (pro[i].qtype == 0) {
                                var strinfo = strinfo + "<tr><td> <input type='checkbox' value='" + pro[i].qid + "'></td> <td>" + pro[i].qid + "</td> <td>单选</td> <td>" + pro[i].qdifficulty + "</td> <td>" + pro[i].qchapter + "</td> <td>" + pro[i].qcontent + "</td> </tr>";
                            }
                        }
                        var alltable = strtitle + strinfo;
                        $("#paperinfo").html(alltable);
                        //画分页效果
                        getPageInfo();

                    }

                });

            });

            //下一页
            $("#nextpage").click(function () {
                pageindex++;
                $.ajax({
                    url: "selectallquestionbankinfo?pageindex=" + pageindex,
                    type: "get",
                    success: function (msg) {
                        var pro = eval(msg);

                        var strtitle = "<tr style='background-color: darkgrey'> <td>选择框</td> <td>序号</td> <td>类型</td> <td>程度</td> <td>对应章节</td> <td>题目</td> </tr>";
                        var strinfo = "";
                        for (var i = 0; i < pro.length; i++) {
                            if (pro[i].qtype == 0) {
                                var strinfo = strinfo + "<tr><td> <input type='checkbox' value='" + pro[i].qid + "'></td> <td>" + pro[i].qid + "</td> <td>单选</td> <td>" + pro[i].qdifficulty + "</td> <td>" + pro[i].qchapter + "</td> <td>" + pro[i].qcontent + "</td> </tr>";
                            }
                        }
                        var alltable = strtitle + strinfo;
                        $("#paperinfo").html(alltable);
                        //画分页效果
                        getPageInfo();

                    }
                });
            });
            //尾页
            $("#page5").click(function () {
                $.ajax({
                    url: "selectallquestionbankinfo?pageindex=" + pageConunt,
                    type: "get",
                    success: function (msg) {
                        var pro = eval(msg);

                        var strtitle = "<tr style='background-color: darkgrey'> <td>选择框</td> <td>序号</td> <td>类型</td> <td>程度</td> <td>对应章节</td> <td>题目</td> </tr>";
                        var strinfo = "";
                        for (var i = 0; i < pro.length; i++) {
                            if (pro[i].qtype == 0) {
                                var strinfo = strinfo + "<tr><td> <input type='checkbox' value='" + pro[i].qid + "'></td> <td>" + pro[i].qid + "</td> <td>单选</td> <td>" + pro[i].qdifficulty + "</td> <td>" + pro[i].qchapter + "</td> <td>" + pro[i].qcontent + "</td> </tr>";
                            }
                        }
                        var alltable = strtitle + strinfo;
                        $("#paperinfo").html(alltable);
                        //画分页效果
                        getPageInfo();

                    }

                });
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
                }
            });


            //点击创建按钮
            $("#createpaperbtn").click(function () {
                var suid = $("#suid").val();
                //alert(suid);
                //题的标题
                var ttitle = $("#ttitle").val();
                var alltime = $("#alltime").val();
                var testtime = $("#testtime").val();
                //总题数
                var number = $("input[type='checkbox']:checked").length;
                var chk_value = [];
                $('input[name="checkname"]:checked').each(function () {
                    chk_value.push($(this).val());
                });
                //alert(chk_value);
                var eachscore = $("#eachscore").val();
                // alert("eachscore" + eachscore);
                $.ajax({
                    url: "selecttopicgroup?suid=" + suid + "&ttitle=" + ttitle + "&ttime=" + testtime + "&tsum=" + number + "&teachscore=" + eachscore + "&selecttopic=" + chk_value,
                    //url: "selecttopicgroup?selecttopic="+chk_value,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        if (obj.result == "true") {
                            alert("随机创建试卷成功！！！");
                        }
                        else {
                            alert("随机创建试卷失败！！！");
                        }
                    }
                });
            });

        });
        //根据suid进行科目查询
        function course(suid) {
            // alert(suid);
            $.ajax({
                url: "selectsubjectinfobysuidway?suid=" + suid,
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    //alert(obj);
                    var str = "";
                    for (var i = 0; i < obj.length; i++) {
                        if (obj[i].qtype == 0) {
                            str = str + "<tr> <td><input type='checkbox'value='" + obj[i].qid + "' name='checkname' onclick='numbercheckbox(" + suid + ")'></td> <td>" + obj[i].qid + "</td> <td>单选</td> <td>" + obj[i].qdifficulty + "</td> <td>" + obj[i].qchapter + "</td> <td>" + obj[i].qcontent + "</td> </tr>";

                        }
                        if (obj[i].qtype == 1) {
                            str = str + "<tr> <td><input type='checkbox'value='" + obj[i].qid + "' name='checkname' onclick='numbercheckbox(" + suid + ")'></td> <td>" + obj[i].qid + "</td> <td>多选</td> <td>" + obj[i].qdifficulty + "</td> <td>" + obj[i].qchapter + "</td> <td>" + obj[i].qcontent + "</td> </tr>";

                        }
                    }
                    $("#paperinfo1").html(str);
                }
            });
        }
        //选中的复选框的个数checkbox
        function numbercheckbox(suid) {
            //哪个科的题
            var suid = suid;
            $("#pitchup").val(number);
            var alltime = $("#alltime").val();
            //总题数
            var number = $("input[type='checkbox']:checked").length;
            //每题分数
            var eachscore = alltime / number;
            //正则表达式
            var regu = /^[0-9]*[1-9][0-9]*$/;
            if (regu.test(eachscore)) {
                $("#eachscore").val(eachscore);
            }
            else {
                var eachscore1 = Math.ceil(eachscore);
                $("#eachscore").val(eachscore1);
            }
            $("#pitchup").val(number);


        }
        //画分页效果（每次发请求都画一次，去调用这个方法）
        function getPageInfo() {
            $.ajax({
                url: "getpage",
                type: "get",
                success: function (msg) {
                    var page = $.parseJSON(msg);
                    pageindex = page.pageIndex;
                    pageConunt = page.pageCount;
                    $("#page1").html("第" + pageindex + "页&nbsp;" +

                        "共" + page.pageCount +
                        "页&nbsp;");

                    if (page.uppage == true) {
                        $("#page3").css(
                            "display", "block");
                        $("#page3-1").css("display", "none");
                    }
                    else {
                        $("#page3").css("display", "none");
                        $("#page3-1").css("display", "block");
                    }
                    if (page.nextpage == true) {
                        $("#page4").css("display", "block");
                        $("#page4-1").css("display", "none");
                    }
                    else {
                        $("#page4").css("display", "none");
                        $("#page4-1").css("display", "block");
                    }


                }
            });
        }

    </script>
</head>
<body>
<div id="bottomdiv">
    <table id="createpaper" border="1">
        <tr>
            <td>方向:</td>
            <td>
                <select id="sudirection">
                    <option value="">请选择</option>
                    <option value="高软">高软</option>
                    <option value="3G4G">3G4G</option>
                </select></td>
            <td>阶段: <select id="sustage">
                <option value="">请选择</option>
                <option value="G1">G1</option>
                <option value="G2">G2</option>
                <option value="G3">G3</option>
            </select>
            </td>
            <td>科目:<select id="suid">

            </select></td>
        </tr>
        <tr>
            <td>标题:</td>
            <td colspan="3"><input type="text" id="ttitle"></td>
        </tr>
        <tr>
            <td>总分:</td>
            <td><input type="text" id="alltime">分</td>
            <td>考试时长:</td>
            <td><input type="text" id="testtime">分钟</td>
        </tr>
        <tr>
            <td>已选题数:</td>
            <td><input type="text" id="pitchup"></td>
            <td>每题分数:</td>
            <td><input type="text" id="eachscore"></td>
        </tr>
    </table>
    <table id="paperinfo1" border="1" style="position:relative;left: 400px;width: 800px">
        <%--<tr>
             <td>选择框</td>
             <td>序号</td>
             <td>类型</td>
             <td>程度</td>
             <td>对应章节</td>
             <td>题目</td>
         </tr>--%>

    </table>

    <div id="buttondiv">
        <input type="button" value="创建试卷" id="createpaperbtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="examlist.jsp"><input type="button" value="取   消"></a>
    </div>

</div>

<%--<table border="0" id="page">
    <tr>
        <td style="text-align: right">
            <div id="page1"></div>
        </td>
        <td>
            <div id="page2">首页&nbsp;</div>
        </td>
        <td>
            <div id="page3"><a id="uppage">上一页&nbsp;</a></div>
            <div id="page3-1" style="display: none">上一页&nbsp;</div>
        </td>
        <td>
            <div id="page4"><a id="nextpage">下一页&nbsp;</a></div>
            <div id="page4-1" style="display: none">下一页&nbsp;</div>
        </td>
        <td>
            <div id="page5"><a id="end">末页</a></div>
        </td>
    </tr>
</table>--%>

</body>
</html>
