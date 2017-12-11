<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>班级管理界面</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <meta charset="UTF-8"><style type="text/css">
    #zong{
        width:100%;
        height:100%;
    }
    #up{
        width:100%;
        height:15%;
        position:relative;
        border-bottom: 2px solid #F0F8FF;

        /*background: crimson;*/
    }
    #up_1{
        width: 300px;
        height: 40px;
        position: absolute;
        /*background: red;*/
        margin-left: 300px;
        font-size: 20px;
        color: red;
        margin-top: 30px;
    }
    #up_2{
        width:250px;
        height: 40px;
        position: absolute;
        margin-left: 850px;
        /*background: red;*/
        margin-top: 30px;
    }
    #up_3{
        width:70px;
        height: 40px;
        position: absolute;
        margin-left: 1100px;
        /*   background: blue;*/
        margin-top: 30px;
        color:blue;
    }
    #up_4{
        width:100px;
        height: 40px;
        position: absolute;
        margin-left: 1170px;
        /*background: black;*/
        margin-top: 30px;
        color: blue;
    }

    #left{
        width: 19.7%;
        height: 85%;
        position: absolute;
        /* border-bottom: 2px solid red;*/
        /*background: black;*/
        border: 2px solid red;
    }
    #right{
        width: 80%;
        height: 85%;
        margin-left:20%;
        position: relative;
        border:2px solid blue ;
        /*background: blue;*/
    }
    #right_1{
        width: 200px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 20px;
        /* background: red;*/
        margin-left:400px;
    }
    #right_2{
        width: 200px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 50px;
        /*background: blue;*/
    }
    #right_3{
        width: 70%;
        height: 50px;
        position: absolute;
        /*background: red;*/
        margin-top: 90px;
        /*background: yellow;*/
    }
    #right_4{
        width: 100%;
        height: 390px;
        position: absolute;
        /*background: red;*/
        margin-top: 130px;
        /*   background: green;*/
    }
    #right_5{
        width: 300px;
        height: 35px;
        margin-top: 510px;
        position: absolute;
        /* background: red;*/
        margin-left: 700px;
    }
</style>
    <script>
        $(document).ready(function () {
            $.ajax({
                url:"showclasseslist",
                tyep:"get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    var titleinfo ="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i=0;i<obj.length;i++){
                        str = str + "<tr> <td class='tablemargin'>"+obj[i].cid+"</td><td class='tablemargin'>"+obj[i].cnumber+"</td> <td class='tablemargin'>"+obj[i].cname+"</td> <td class='tablemargin'>"+obj[i].cdirection+"</td> <td class='tablemargin'>"+obj[i].teachersh.tname+"</td> <td class='tablemargin'>"+obj[i].teachersl.tname+"</td> <td class='tablemargin'>"+obj[i].cbegin+"</td> <td class='tablemargin'>"+obj[i].cstate+"</td> <td class='tablemargin'><a onclick='edit("+obj[i].cid+")'>编辑</td>  </tr>"
                    }
                    var alltable=titleinfo+str;
                    $("#tableteacherinfo").html(alltable);

                }
            })

            //讲师下拉框中出现姓名
            $.ajax({
                url:"selectjiangshi",
                type:"get",
                success:function (msg) {
                    var xianshi=eval(msg);
                    var str="";
                    for(var i=0;i<xianshi.length;i++) {
                        str=str+"<option value='"+xianshi[i].tid+"'>"+xianshi[i].tname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#jiangshi").html(str);
                }
            })
            $.ajax({
                url:"selectbanzhuren",
                type:"get",
                success:function (msg) {
                    var xianshi=eval(msg);
                    var str="";
                    for(var i=0;i<xianshi.length;i++) {
                        str=str+"<option value='"+xianshi[i].tid+"'>"+xianshi[i].tname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#banzhuren").html(str);
                }
            });

            $("#chaxunzhang").click(function () {
                var nian=$("#nian").val();
                var fang=$("#fang").val();
                var jiangshi=$("#jiangshi").val();
                var banzhuren=$("#banzhuren").val();

              alert(nian+";"+fang+";"+jiangshi+";"+banzhuren);
                $.ajax({
                    url:"selectchaxun?cbegin="+nian+"&cdirection="+fang+"&tidl="+jiangshi+"&tidh="+banzhuren,
                    type:"get",
                    success:function (msg) {
                        alert(msg)
                        var obj=eval(msg);
                        var tabletitle="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                        for (var i=0;i<obj.length;i++){
                            if(obj[i].cstate==0){
                                var tableinfo=tableinfo+"<tr><td class='tablemargin'>"+obj[i].cid+"</td> <td class='tablemargin'>"+obj[i].cnumber+"</td> <td class='tablemargin'>"+obj[i].cname+"</td> <td class='tablemargin'>"+obj[i].cdirection+"</td> <td class='tablemargin'>"+obj[i].teachersh.tname+"</td> <td class='tablemargin'>"+obj[i].teachersl.tname+"</td> <td class='tablemargin'>"+obj[i].cbegin+"</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit("+obj[i].cid+")'>编辑</a></td> </tr>";
                            }
                            if(obj[i].cstate==1){
                                var tableinfo=tableinfo+"<tr><td class='tablemargin'>"+obj[i].cid+"</td> <td class='tablemargin'>"+obj[i].cnumber+"</td> <td class='tablemargin'>"+obj[i].cname+"</td> <td class='tablemargin'>"+obj[i].cdirection+"</td> <td class='tablemargin'>"+obj[i].teachersh.tname+"</td> <td class='tablemargin'>"+obj[i].teachersl.tname+"</td> <td class='tablemargin'>"+obj[i].cbegin+"</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><a onclick='edit("+obj[i].cid+")'>编辑</a></td> </tr>";
                            }
                        }
                        var table=tabletitle+tableinfo;
                        $("#tableteacherinfo").html(table);
                    }
                });
            });




        });

    </script>
    <script>
        //教师页面编辑页面的操作
        function edit(a) {
            window.location.href="bianji?id="+a;
        }
    </script>

</head>
<body>
<div id="zong">
    <div id="up">
        <div id="up_1">在线考试管理系统</div>
        <div id="up_2">2014年7月31日星期四8：36</div>
        <div id="up_3"><a href="">[注销]</a></div>
        <div id="up_4"><a href="">[退出系统]</a></div>
    </div>
    <div id="left">
        <table style="margin: auto;height:60%">
            <tr><td>后台功能</td></tr>
            <tr><td><a href="teacher.jsp">教师管理</a></td></tr>
            <tr><td><a href="classes.jsp">班级管理</a></td></tr>
            <tr><td><a href="student.jsp">学生管理</a></td></tr>
            <tr><td><a href="question.jsp">题库管理</a></td></tr>
            <tr><td><a href="test.jsp">试卷管理</a></td></tr>
            <tr><td><a href="report.jsp">成绩管理</a></td></tr>
            <tr><td><a href="">修改密码</a></td></tr>

        </table>
    </div>
    <div id="right">
        <div id="right_1">班级列表</div>
        <div id="right_2"><a href="addclasses.jsp"><input type="submit" value="新建班级"></a></div>
        <div id="right_3">
            <table id="tableshuju"><tr><td>入学年份:<select id="nian"><option value="">请选择</option>
             <option value="2015-09-01">2015-09-01</option>
                <option value="2016-09-01">2016-09-01</option>
                <option value="2017-09-01">2017-09-01</option>
            </select></td>
                <td>所属方向:<select id="fang"><option value="">请选择</option>
                <option value="高软">高软</option>
                <option value="3G4G">3G 4G</option>
                </select></td>
                <td>讲师:<select id="jiangshi" value=""><option>请选择</option></select></td>
                <td>班主任:<select id="banzhuren" value=""><option>请选择</option></select></td>
                <td><input type="submit" value="查询" id="chaxunzhang"></td>
                <td><input type="submit" value="重置"></td>
            </tr></table>
        </div>
        <div id="right_4">
            <table border="1" width="100%" id="tableteacherinfo">
                <%--<tr><td>序号</td>
                    <td>班级代码</td>
                    <td>班级名称</td>
                    <td>所属方向</td>
                    <td>班主任</td>
                    <td>讲师</td>
                    <td>开班日期</td>
                    <td>状态</td>
                    <td>操作</td></tr>--%>
            </table></div>
        <div id="right_5"><table>
            <tr><td><a href="">第1页</a></td><td><a href="">共2页</a></td><td><a href="">首页</a></td><td><a href="">上一页</a></td><td><a href="">下一页</a></td><td><a href="">末页</a></td></tr>
        </table>

        </div>
    </div>
</div>

</body>
</html>
