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
    <title>pfwrittentestlist</title>
</head>
<style>
    #bigdiv {
        width: 100%;
        height: 700px;
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
        position: relative;
        left: 750px;
        top: 420px;
    }
    .div1 {
        /*本层要实现覆盖模式窗口以外全部内容的半透明效果*/
        background-color: #000000; /*背景色*/
        opacity: 0.5;
        position: absolute; /*绝对定位，必选，使层绝对依照top,left的标准显示，否则将不能实现覆盖*/
        top: 0; /*层与页面顶部距离*/
        left: 0; /*层与左侧边距离*/
        z-index: 1; /*当发生重叠时的优先级，数大的会覆盖数较小的，没进行设置的均可视为小于0*/
        display: none; /*层是否可见，初始化none不可见*/
        filter: Alpha(opacity=50); /*过滤颜色，设置透明度（可见度）30，数越小越透明*/
        opacity: 0.5;
    }

    /*层2的样式*/
    .div2 {
        /*本层显示在最前端，其它控件均不可用*/
        width: 100%; /*显示宽度*/
        height: 100%; /*显示高度*/
        position: absolute; /*绝对定位*/
        z-index: 2; /*优先级*/
        display: none; /*是否显示*/
        border: 1px inset darkgray; /*边框：宽度，样式，颜色*/
        background-color: gainsboro; /*背景色*/

    }

    #bottomdiv{
        width: 800px;
        height: 700px;
        background-color: gainsboro;
        margin: auto;
        /*z-index: 5;
       -moz-opacity: 0.9;*/


    }
    #wordtool{
        width: 700px;
        height: 200px;
        background-color: beige;
    }
    a{
          text-decoration: none;
      }

</style>
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script language="JavaScript">
    //显示的方法，说明：前缀的div1、div2、body等，均为Id值
    function show() {
        div1.style.display = "inline";//设置层1显示
        div1.style.width = bigdiv.clientWidth;//设置层1宽度等于body宽度，width=100%也可以，不过有一些误差，所以最好用这个
        div1.style.height = bigdiv.clientHeight;//设置层1高度满屏
        div2.style.display = "inline";//设置层2的显示
        div2.style.top = bigdiv.clientHeight / 2 - div2.clientHeight / 2;//设置层2的距顶位置居中算法
        div2.style.left = bigdiv.clientWidth / 2 - div2.clientWidth / 2;//设置层2的距左位置居中算法
    }

    //关闭显示
    function closeShow() {
        div1.style.display = "none";
        div2.style.display = "none";
        window.location.href="pfwrittentestlist.jsp";
    }

    function  deleteshow() {
        window.location.href="pfwrittentestlist.jsp";
    }
</script>
<script language="JavaScript" src="js/ajaxfileupload.js"></script>
<script language="JavaScript">
    $(function () {
        function shuaxin() {
            $.ajax({
                url:"selectquestion",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);
                    var str = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>类型</td> <td class='tablemargin'>题目内容</td> <td class='tablemargin'>选择A</td> <td class='tablemargin'>选择B</td> <td class='tablemargin'>选择C</td> <td class='tablemargin'>选择D</td> <td class='tablemargin'>答案</td> <td class='tablemargin'>难度</td> <td class='tablemargin'>对应章节</td></tr>";
                    for(var i=0;i<obj.length;i++){
                        str = str + "<tr style='background-color: darkgrey'> <td class='tablemargin'>"+obj[i].qid+"</td> <td class='tablemargin'>"+obj[i].qtype+"</td> <td class='tablemargin'>"+obj[i].qcontent+"</td> <td class='tablemargin'>"+obj[i].qa+"</td> <td class='tablemargin'>"+obj[i].qb+"</td> <td class='tablemargin'>"+obj[i].qc+"</td> <td class='tablemargin'>"+obj[i].qd+"</td> <td class='tablemargin'>"+obj[i].qanswer+"</td> <td class='tablemargin'>"+obj[i].qdifficulty+"</td> <td class='tablemargin'>"+obj[i].qchapter+"</td></tr>";
                    }
                    $("#questioninfoall").html(str)
                }
            })
        }
        shuaxin();
        $("#upfilequestion").click(function () {
            $.ajaxFileUpload({
                url:"uploadfilequestion",
                fileElementId:"upload",
                secureuri:"false",
                success:function () {
                    shuaxin();
                }
            });
        })
        /*$("#qtype").change(function () {
            var type = $("#qtype").val();
            var strinfo = "";
            if(type==0){
                strinfo="<input type='radio' name='qanswer' value='A'>A. <input type='text' name='qa' style='width: 400px'><br> <input type='radio' name='qanswer' value='B'>B. <input type='text' name='qb' style='width: 400px'><br> <input type='radio' name='qanswer' value='C'>C. <input type='text' name='qc' style='width: 400px'><br> <input type='radio' name='qanswer' value='D'>D. <input type='text' name='qd' style='width: 400px'>"
            }else {
                strinfo="<input type='checkbox' name='qanswer' value='A'>A. <input type='text' name='qa' style='width: 400px'><br> <input type='checkbox' name='qanswer' value='B'>B. <input type='text' name='qb' style='width: 400px'><br> <input type='checkbox' name='qanswer' value='C'>C. <input type='text' name='qc' style='width: 400px'><br> <input type='checkbox' name='qanswer' value='D'>D. <input type='text' name='qd' style='width: 400px'>"
            }
            $("#xuanxang").html(strinfo)
        })*/
    })
</script>

<body>
<div id="bigdiv">
    <div id="div1" class="div1" style="opacity: 0.9"></div><!--这是要覆盖网页的层，不必写任何东西-->

    <div  id="div2" class="div2" >
        <div id="bottomdiv">
            <form action="insertquestion" method="post">
            <table border="1"style="width:800px;height:650px;margin: auto">
                <tr>
                    <td>科目名称:</td>
                    <td><input type="text"  value="${sessionScope.sucourse}" readonly="true"><input type="text" name="suid.suid" value="${sessionScope.suid}" style="display: none"></td>
                </tr>
                <tr>
                    <td>类型:</td>
                    <td><select id="qtype" name="qtype"><option value="0">单选</option>
                        <option value="1">多选</option></select></td>
                </tr>
                <tr>
                    <td>题目内容:</td>
                    <td><div id="wordtool"><textarea cols="85" rows="9" id="qcontent" name="qcontent"></textarea></div></td>
                </tr>
                <tr>
                    <td>选项</td>
                    <td colspan="4" id="xuanxang">
                        <input type="radio" name="qanswer" value="A">A.<input type="text" name="qa" style="width: 400px"><br>
                        <input type="radio" name="qanswer" value="B">B.<input type="text" name="qb" style="width: 400px"><br>
                        <input type="radio" name="qanswer" value="C">C.<input type="text" name="qc" style="width: 400px"><br>
                        <input type="radio" name="qanswer" value="D">D.<input type="text" name="qd" style="width: 400px">
                    </td>
                </tr>
                <tr>
                    <td>难度:</td>
                    <td><select name="qdifficulty"><option value="">困难</option><option>中等</option><option>简单</option></select></td>
                </tr>
                <tr>
                    <td>对应章节:</td>
                    <td><input name="qchapter" value="${sessionScope.sucourse}"readonly="true"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <input style="width: 150px;height: 40px" type="submit" value="添加" onclick="closeShow()">&nbsp;&nbsp;
                        <input style="width: 150px;height: 40px" type="button" value="重置退出" onclick="deleteshow()">
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>

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
        <table border="0" style="width: 600px;height: 120px">
            <tr>
                <td colspan="4"><b id="title"><h1>${sessionScope.sucourse}</h1>笔试试题列表</b></td>
            </tr>
            <tr>
                <td><input type="button" value="添加试题" onclick="show()"></td>
                <td><input type="file" id="upload" name="upload"></td>
                <td><input type="button" id="upfilequestion" value="导入"></td>
                <td><a href="filedown?filename=question.xlsx"><input type="button" value="下载考试试题模板"></a></td>
            </tr>
        </table>
        <table border="1" id="questioninfoall" style="position:relative;width: 1000px;top: 20px;background-color: darkgrey">
            <%--<tr style="background-color: darkgrey">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">类型</td>
                <td class="tablemargin">题目内容</td>
                <td class="tablemargin">选择A</td>
                <td class="tablemargin">选择B</td>
                <td class="tablemargin">选择C</td>
                <td class="tablemargin">选择D</td>
                <td class="tablemargin">答案</td>
                <td class="tablemargin">难度</td>
                <td class="tablemargin">对应章节</td>
                <td class="tablemargin">操作</td>
            </tr>--%>
        </table>
    </div>
</div>
</div>
</body>
</html>
