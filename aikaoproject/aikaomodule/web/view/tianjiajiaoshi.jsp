<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/5
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript" src="jquery.min.js"></script>
    <script language="JavaScript">
        $(document).ready(function () {
            $("#tnumber").click(function () {
                //发送ajax
                $.ajax({
                    url: "addTeachers",
                    type: "get",
                    success: function (msg) {
                        var obj=$.parseJSON(msg);
                        var Stringnumber=obj.result.tnumber;
                        var tid=obj.result.tid;
                        var table ="<tr style='background-color: darkgrey'> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td>  <td class='tablemargin'>备注</td><td><textarea cols='40' rows='3' id='tremark' >" + result.teachers.tremark + "</textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input type='button' value='确认' onclick='save(" + result.teachers.tid + ")' >&nbsp;&nbsp;&nbsp;&nbsp; <input type='button' value='取消' onclick='xiaoshi(),deletebytid(" + tid + "),refresh();'></td></tr>";

                        $("#quester").html(table);

                    }
                })
            })
            //教师信息添加保存
            function queren(tnumber) {
                alert(tnumber);
                var tname = $("#tname").val();
                var tsex = $("#tsex").val();
                var tbirthday = $("#tbirthday").val();
                var tphone = $("#tphone").val();
                var ttel = $("#ttel").val();
                var tjob = $("#tjob").val();
                var tremark = $("#tremark").val();
                $.ajax({
                    url: "saveString?tnumber=" + tnumber + "&tname=" + tname + "&tsex=" + tsex + "&tbirthday=" + tbirthday + "&tphone=" + tphone + "&ttel=" + ttel + "&tjob=" + tjob + "&tremark=" + tremark,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        alert(obj.result);
                        if (obj.result == "1") {
                            alert("添加成功");
                            xiaoshi();
                        }
                        else {
                            alert("添加失败");
                        }
                    }
                });

            }
            //信息修改
            function save(tid) {
                alert(tid);
                var tname = $("#tname").val();
                var tsex = $("#tsex").val();
                var tbirthday = $("#tbirthday").val();
                var tphone = $("#tphone").val();
                var ttel = $("#ttel").val();
                var tjob = $("#tjob").val();
                var tremark = $("#tremark").val();
                alert(tname+":"+tsex+":"+tbirthday+":"+tphone+";"+ttel+";"+tjob);
                $.ajax({
                    url: "xiuteacherinfo?tid=" + tid + "&tname=" + tname + "&tbirthday=" + tbirthday + "&tsex=" + tsex + "&tphone=" + tphone + "&ttel=" + ttel + "&tjob=" + tjob + "&tremark=" + tremark,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        alert(obj.result);
                        if (obj.result == "1") {
                            alert("修改成功");
                        }
                        else {
                            alert("修改失败");
                        }
                    }
                });

            }


        });


    </script>

</head>
<body>
<div id="quester">
    <form action="queryshow" method="get">
    <span>
        账号:<input type="text" name="tnumber" id="tnumber" readonly="true"><br>
    </span>
        <span>
        姓名:<input type="text" name="tname" id="tname"><br>
    </span>
        <span>
          性别： <select name="tsex"id="tsex">
                     <option value="0">男</option>
                     <option value="1">女</option>
                 </select><br>
        </span>
        <span>
        生日:<input type="text" name="tbirthday" id="tbirthday"><br>
    </span>
        <span>
        学历:<input type="text" name="tphone" id="tphone"><br>
    </span>
        <span>
        联系电话:<input type="text" name="ttel" id="ttel"><br>
    </span>
        <span>
          岗位： <select name="tjob"id="tjob">
                     <option value="0">讲师</option>
                     <option value="1">班主任</option>
                 </select><br>
        </span>
        <span>
        备注:<textarea name="tremark" rows="4" cols="40" id="tremark"></textarea><br>
    </span>
        <a href="teacher.jsp"><input  type="submit" name="login" value="确定" id="saveinfo" onclick="save(),queren()"></a>

        <input type="button" value="取消" onclick="xiaoshi(),refresh();">

    </form>
</div>



</body>
</html>
