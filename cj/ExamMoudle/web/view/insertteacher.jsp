<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加老师</title>
    <link rel="stylesheet" type="text/css" href="../css/insertteacher.css"/>
    <script language="JavaScript" src="../js/jquery.min.js"></script>
    <script language="JavaScript">
        /*获取到的账号显示到账后框里*/
        $(document).ready(function () {
            /* 编辑老师信息*/
            $.ajax({

                url: "insertteacher",

                success: function (msg) {

                    var obj = $.parseJSON(msg);

                    var strnumber = obj.tnumber;

                    $("#tnumber").val(strnumber);
                }
            });
        });




    </script>

</head>

<body>
<!--添加老师-->
<form method="get" action="insertteacherall">
    <div id="ton">添加老师</div>
    <div id="teacher">
        <input type="text" readonly name="ttid" id="tid"><br><br>
        账号： <input type="text" name="tnumber" id="tnumber"><br>

        姓名：<input type="text" name="tname" id="tname"><br>

        <span>性别：</span>
        <select name="tsex" class="xla_k" id="tsex">
            <option value="男">男</option>
            <option value="女">女</option>
        </select><br>

        生日:<input type="text" name="tbirthday" id="tbirthday"><br>
        学历：<input type="text" name="tphone" id="tphone"><br>
        联系电话：<input type="text" name="ttel" id="ttel"><br>

        <span> 岗位</span>
        <select name="tjob" class="xla_k" id="tjob">
            <option value="0">讲师</option>
            <option value="1">班主任</option>

        </select><br>
        备注:
        <textarea name="tremark" id="tremark" cols="30" rows="3"></textarea>"<br>
        <input type="submit" value="确认" id="bmt">
        <input type="submit" value="取消">


    </div>

</form>
</body>
</html>
