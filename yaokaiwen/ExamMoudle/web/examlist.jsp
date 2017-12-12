<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>examlist</title>
</head>
<style>
    #bigdiv {
        width: 1366px;
        height: 800px;
        background-color: bisque;
        position: absolute;
        left: 0px;
        top: 0px;
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
        width: 1050px;
        height: 768px;
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

    #randomtable {
        width: 800px;
        height: 600px;
        position: relative;
        left: 300px;
    }
    #bottomdiv {
        width: 100%;
        height: 700px;
        display: none;
        background-color: gainsboro;
        margin: auto;
        position: absolute;
        left: 0px;
        top: 0px;
    }
    a{
        text-decoration: none;
    }


</style>

<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
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
<script language="JavaScript">
    $(function () {
        function xianshi() {
            $.ajax({
                url:"selecttestpaper",
                type:"post",
                data:"id="+$("#sucourse").val()+"&state="+$("#tstate").val(),
                success:function (msg) {
                    var obj = eval(msg);
                    var str = "<tr style='background-color: darkgrey'><td class='tablemargin'>序号</td> <td class='tablemargin'>类别</td> <td class='tablemargin'>科目</td> <td class='tablemargin'>标题</td> <td class='tablemargin'>考试班级</td> <td class='tablemargin'>考试时长(分钟)</td><td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for(var i =0;i<obj.length;i++){
                        str = str + "<tr style='background-color: darkgrey'><td class='tablemargin'>"+obj[i].tid+"</td> <td class='tablemargin'>"+obj[i].ttype+"</td> <td class='tablemargin'>"+obj[i].suid.sucourse+"</td> <td class='tablemargin'>"+obj[i].ttitle+"</td> <td class='tablemargin'>考试班级</td> <td class='tablemargin'>"+obj[i].ttime+"</td><td class='tablemargin'>"+obj[i].tstate+"</td> <td class='tablemargin'>操作</td> </tr>";
                    }
                    $("#testpaperall").html(str);
                }
            })
        }
        xianshi();

        $("#selectbutton").click(function () {
            xianshi();

        })
        $("#sustage").change(function () {
            var sus = $("#sustage").val();
            var str1 = "<option value=''>请选择</option>"
            if(sus=="G1"){
                str1 = str1+"<option value='1'>java</option><option value='2'>sqlserver</option>"
            }else if(sus=="G2"){
                str1 = str1+"<option value='4'>jsp</option><option value='3'>struts2</option>"
            }else if(sus=="G3"){
                str1 =str1+ "<option value='5'>oracle</option><option value='6'>spring</option>"
            }
            $("#sucourse").html(str1);
        })
        $("#sustage1").change(function () {
            var sus = $("#sustage1").val();
            var str1 = "<option value=''>请选择</option>"
            if(sus=="G1"){
                str1 = str1+"<option value='1'>java</option><option value='2'>sqlserver</option>"
            }else if(sus=="G2"){
                str1 = str1+"<option value='4'>jsp</option><option value='3'>struts2</option>"
            }else if(sus=="G3"){
                str1 =str1+ "<option value='5'>oracle</option><option value='6'>spring</option>"
            }
            $("#suid1").html(str1);
        })
        $("#t01").focusout(function () {
            var num = 0;
            num = parseInt($("#t01").val())+parseInt($("#t02").val())+parseInt($("#t03").val())+parseInt($("#t11").val())+parseInt($("#t12").val())+parseInt($("#t13").val());
            $("#tsum").val(num)
            $("#teacherscore").val(parseInt($("#zongfen").val()/num));
        })
        $("#t02").focusout(function () {
            var num = 0;
            num = parseInt($("#t01").val())+parseInt($("#t02").val())+parseInt($("#t03").val())+parseInt($("#t11").val())+parseInt($("#t12").val())+parseInt($("#t13").val());
            $("#tsum").val(num)
            $("#teacherscore").val(parseInt($("#zongfen").val()/num));
        })
        $("#t03").focusout(function () {
            var num = 0;
            num = parseInt($("#t01").val())+parseInt($("#t02").val())+parseInt($("#t03").val())+parseInt($("#t11").val())+parseInt($("#t12").val())+parseInt($("#t13").val());
            $("#tsum").val(num)
            $("#teacherscore").val(parseInt($("#zongfen").val()/num));
        })
        $("#t11").focusout(function () {
            var num = 0;
            num = parseInt($("#t01").val())+parseInt($("#t02").val())+parseInt($("#t03").val())+parseInt($("#t11").val())+parseInt($("#t12").val())+parseInt($("#t13").val());
            $("#tsum").val(num)
            $("#teacherscore").val(parseInt($("#zongfen").val()/num));
        })
        $("#t12").focusout(function () {
            var num = 0;
            num = parseInt($("#t01").val())+parseInt($("#t02").val())+parseInt($("#t03").val())+parseInt($("#t11").val())+parseInt($("#t12").val())+parseInt($("#t13").val());
            $("#tsum").val(num)
            $("#teacherscore").val(parseInt($("#zongfen").val()/num));
        })
        $("#t13").focusout(function () {
            var num = 0;
            num = parseInt($("#t01").val())+parseInt($("#t02").val())+parseInt($("#t03").val())+parseInt($("#t11").val())+parseInt($("#t12").val())+parseInt($("#t13").val());
            $("#tsum").val(num)
            $("#teacherscore").val(parseInt($("#zongfen").val()/num));
        })
    })
</script>
<body>
<div id="bottomdiv">
    <form action="randominsertpaper" method="post">
    <table id="randomtable" border="1">
        <tr>
            <td>方向:</td><td><select id="sudirection1">
            <option value="高软">高软</option>
        </select></td>
            <td>阶段:<select id="sustage1">
                <option value="">请选择</option>
                <option value="G1">G1</option>
                <option value="G2">G2</option>
                <option value="G3">G3</option>
            </select></td>
            <td>科目:<select id="suid1" name="suid.suid">
                <option value=''>请选择</option>
            </select></td>
        </tr>
        <tr>
            <td>标题:</td>
            <td colspan="3"><input type="text" id="ttitle1" name="ttitle"></td>

        </tr>
        <tr>
            <td>总分:</td>
            <td ><input type="text"id="zongfen" value="100">分</td>
        </tr>
        <tr>
            <td>考试时长:</td>
            <td colspan="3"><input type="text" id="ttime" name="ttime">分钟</td>
        </tr>
        <tr>
            <td>单选题:</td>
            <td>简单<input type="text" id="t01" name="dtnumber.t01" value="0"></td>
            <td>一般<input type="text" id="t02" name="dtnumber.t02" value="0"></td>
            <td>难度<input type="text" id="t03" name="dtnumber.t03" value="0"></td>
        </tr>
        <tr>
            <td>多选题:</td>
            <td>简单<input type="text" id="t11" name="dtnumber.t11" value="0"></td>
            <td>一般<input type="text" id="t12" name="dtnumber.t12" value="0"></td>
            <td>难度<input type="text" id="t13" name="dtnumber.t13" value="0"></td>
        </tr>
        <tr>
            <td>总题数:</td>
            <td colspan="3"><input type="text"  id="tsum"  name="tsum" value="0" readonly="true"></td>
        </tr>
        <tr>
            <td>每题分数:</td>
            <td colspan="3"><input type="text"  id="teacherscore" name="teachscore" value="0" readonly="true"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <input type="submit" style="width: 150px;height: 40px" value="创建试题" id="createpaper">&nbsp;&nbsp;
                <input type="button" style="width: 150px;height: 40px" value="取消" onclick="closeShow()">
            </td>
        </tr>
    </table>
    </form>
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
                <td colspan="5"><b id="title">试卷列表</b></td>
            </tr>
            <tr>
                <td>方向:<select>
                    <option>高软</option>
                </select></td>
                <td>阶段:<select id="sustage">
                    <option value="">请选择</option>
                    <option value="G1">G1</option>
                    <option value="G2">G2</option>
                    <option value="G3">G3</option>
                </select></td>
                <td>考试科目:<select id="sucourse">
                    <option value="">请选择</option>
                </select></td>
                <td>考试类型:<select>
                    <option value="笔试">笔试</option>
                </select></td>
                <td>状态:<select id="tstate">
                    <option value="">请选择</option>
                    <option value="未开考">未开考</option>
                    <option value="正在考试">正在考试</option>
                    <option value="考试结束">考试结束</option>
                </select></td>
                <td><input id="selectbutton" type="button" value="查询"></td>
            </tr>
        </table>
        <table>
            <tr>
                <td><input type="button" value="随机组卷" onclick="show()"></td>
                <td><a href="createpaper.jsp"><input type="button" value="选题组卷"></a></td>
            </tr>
        </table>
        <table border="1" id="testpaperall" style="position:relative;width: 1000px;top: 20px;">
            <tr style="background-color: darkgrey">
                <td class="tablemargin">类别</td>
                <td class="tablemargin">科目</td>
                <td class="tablemargin">标题</td>
                <td class="tablemargin">考试班级</td>
                <td class="tablemargin">考试时长(分钟)</td>
                <td class="tablemargin">操作</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
