
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>修改试卷</title>

</head>
<link rel="stylesheet" type="text/css" href="../css/insertteacher.css"/>
<body>
<!--添加班级-->
<div id="ton">添加试卷</div>
<div  id="teacher">

    科目名称：<input type="text"><br>


    <span>类型：</span>
    <select name="select" id="select_k1" class="xla_k">
        <option value="0">单选</option>
        <option value="1">多选</option>
    </select><br>
    备注:
    <textarea name="teacher_ins" id="" cols="30" rows="3"></textarea>"<br>
    选项：<input type="checkbox">A<input type="text"><br>
    <input type="checkbox">  B<input type="text"><br>
    <input type="checkbox"> C<input type="text"><br>
    <input type="checkbox">D<input type="text"><br>



    <span>难度：</span>
    <select name="select" id="select_k2" class="xla_k">
        <option value="0">困难</option>
        <option value="1">简单</option>
    </select><br>



    对应章节:<input type="text"><br>




    <input type="submit" value="修改">
    <input type="submit" value="重置">


</div>


</body>
</html>
