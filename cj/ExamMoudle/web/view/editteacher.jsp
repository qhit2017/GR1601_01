<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑老师</title>
    <link rel="stylesheet" type="text/css" href="../css/insertteacher.css"/>
    <script language="JavaScript" src="../js/jquery.min.js"></script>
    <script language="JavaScript">

        $(document).ready(function () {
            alert("edit");
            /* 编辑老师信息*/
            $("#tnumber").val(${sessionScope.teachers.tnumber});
            alert($("#tnumber").val(${sessionScope.teachers.tnumber}));
            $("#tname").val(${sessionScope.teachers.tname});
            alert($("#tname").val(${sessionScope.teachers.tname}));
            $("#tsex").val(${sessionScope.teachers.tsex});
            $("#ttel").val(${sessionScope.teachers.ttel});
            $("#tjob").val(${sessionScope.teachers.tjob});


        });
    </script>

</head>

<body>
<!--编辑老师-->
<form method="get" action="compileteacher">
    <div id="ton">编辑老师</div>
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
