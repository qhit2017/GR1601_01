<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/5
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html">
    <title>班级</title>
    <script language="JavaScript" src="jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // 班级信息显示
            $.ajax({
                url: "showall",
                type: "get",
                success: function (msg) {
                    var pro = eval(msg)
                    var str1= "";
                    var table1 = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        var str1 = str1 + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].tidl + "</td> <td class='tablemargin'>" + pro[i].tidh + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a> <a onclick=''> </a></td> </tr>";

                    }
                    var allinfo1 = table1 + str1;
                    $("#ss").html(allinfo1);

                }
            })
            //根据四个下拉框的条件经行信息查询
            $("#hh").click(function () {
                var cbegin=$("#cbegin").val();
                var cdirection=$("#cdirection").val();
                var tidh=$("#tidh").val();
                var tidl=$("#tidl").val();
                $.ajax({
                    url:"select?cbegin="+cbegin+"&cdirection="+cdirection+"&tidl="+tidl+"&tidh="+tidh,
                    type:"get",
                    success:function (msg) {
                        var pro=eval(msg);
                        var tabletitle="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                        for (var i=0;i<pro.length;i++){
                          var tableinfo=tableinfo+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].teachersl.tname+"</td> <td class='tablemargin'>"+pro[i].teachersh.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>关闭</td> <td class='tablemargin'><a onclick='edit("+pro[i].cid+")'>编辑</a></td> </tr>";
                        }
                        var table=tabletitle+tableinfo;
                        $("#ss").html(table);
                    }
                });
            });

            //讲师信息下拉框
            $.ajax({
                url:"selectTeachersTjob0",
                type:"get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                    }
                    var title="<option value=''>请选择</option>";
                   var str1=title+str;
                    $("#tidh").html(str1);
                }
            })
            //班主任信息下拉框
            $.ajax({
                url:"selectTeachersTjob1",
                type:"get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    title="<option value='select'>请选择</option>";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                    }
                    var str1=title+str;
                    $("#tidl").html(str1);
                }
            })
        })


    </script>
</head>
<body>

<div>
    <a href="newclasses.jsp">新建班级</a>
    <span>入学年份：</span>
    <select name="select" id="cbegin" >
        <option value="0">2000</option>
        <option value="1">1999</option>
    </select>
    <span>所属方向：</span>
    <select name="select" id="cdirection" >
        <option value="0">高软</option>
        <option value="1">3G/4G</option>
    </select>
    <span>讲师：</span>
    <select name="selectTeachersTjob1" id="tidh" >
      <option></option>
    </select>
    <span>班主任：</span>
    <select name="select" id="tidl" >
        <option value="0">李</option>
        <option value="1">高</option>
    </select>
    <input type="button" value="查询" id="hh">
    <input type="reset" onclick="chongzhi()">

    <div>
        <form action="showall" method="get">
            <table id="ss">
            </table>
            <div>
            </div>
        </form>

    </div>

</div>

</body>
</html>
