
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

<head>
    <title>增加班级</title>

</head>

<link rel="stylesheet" type="text/css" href="../css/insertteacher.css"/>

<body>
<form method="get" action="insertclass">
<!--添加班级-->
<div id="ton">添加班级</div>
<div  id="teacher">

    班级代码：<input type="text" id="cnumber"><br>
    班级名称：<input type="text" id="cname"><br>

    <span>所属方向：</span>
    <select name="select" id="cdirection" class="xla_k">
        <option value="0">Java</option>
        <option value="3G4G">3G4G</option>
    </select><br>
    <span>班主任：</span>
    <select name="select" id="tidh" class="xla_k">

        <option value="1">1</option>
    </select><br>

    <span>讲师：</span>
    <select name="select" id="tidl" class="xla_k">
        <option value="0">0</option>

    </select><br>

    开班日期:<input type="text" id="cbegin"><br>
    G1开班人数：<input type="text" id="cg1"><br>
    G2开班人数：<input type="text" id="cg2"><br>
    G3开班人数：<input type="text" id="cg3"><br>

    <span>状态</span>
    <select name="select" id="cstate" class="xla_k">
        <option value="0">启用</option>
        <option value="1">关闭</option>

    </select><br>
    备注:
    <input type="text" id="cremark"><br>
    <input type="submit" value="添加">
    <input type="submit" value="取消">


</div>

</form>
</body>

</html>
