<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/5
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>新建班级</title>
    <script language="JavaScript" src="jquery.min.js"></script>
    <script language="JavaScript">
        //取消刷新
        function xiao() {
            window.location.href="classes.jsp";
        }
        $(document).ready(function () {
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
                    str1=title+str;
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
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].tjob+"'>"+obj[i].cname+"</option>";
                    }
                    var title="<option value=''>请选择</option>";
                    str1=title+str;
                    $("#tidl").html(str1);

                }

            })
            // 添加
            $.ajax({
                url: "saveOrupdateClasses",
                type: "get",
                success: function (msg) {
                    var pro = eval(msg)
                    var str1= "";
                    var table1 = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        var str1 = str1 + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].tidl + "</td> <td class='tablemargin'>" + pro[i].tidh + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a> <a onclick=''> </a></td> </tr>";

                    }
                    var allinfo1 = table1 + str1;
                    $("#tianjia").html(allinfo1);

                }
            })



        })


    </script>
</head>
<body>
<div>
    <form action="saveOrupdateClasses" method="get">
     <span>班级代码: <input type="text" id="cnumber"></span><br>
        <span>班级名称: <input type="text" id="cname"></span><br>
        <span>所属方向:
            <select name="select" id="cdirection">
                     <option value="0">高软</option>
                     <option value="1">3G4G</option>
            </select>
        </span><br>
        <span>班主任:
            <select name="idl" id="tidl">
                     <option value="0">1</option>
                     <option value="1">2</option>
            </select>
        </span><br>
        <span>讲师:
            <select name="idh" id="tidh">
                     <option value="0">1</option>
                     <option value="1">2</option>
            </select><br>
        </span>
        <span>开班日期: <input type="text"></span><br>
        <span>G1开班人数: <input type="text"></span><br>
        <span>G2开班人数: <input type="text"></span><br>
        <span>G3开班人数: <input type="text"></span><br>
        <span>状态:
            <select name="select" id="teachersh">
                     <option value="0">开启</option>
                     <option value="1">关闭</option>
            </select>
        </span><br>
        <span>
          备注: <textarea name="" rows="4" cols="20"></textarea>
        </span><br>
        <span>
             <input  type="submit" name="i" id="tianjia" value="添加" >&nbsp;&nbsp;&nbsp;&nbsp;
            <input  type="button" name="reset" value="取消" onclick="xiao()">
        </span>


    </form>




</div>


</body>
</html>
