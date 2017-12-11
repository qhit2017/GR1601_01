
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>创建试卷方向</title>

</head>
<link rel="stylesheet" type="text/css" href="../css/insertteacher.css"/>
<body>
<!--添加班级-->

<div  id="teacher">



    <span>方向：</span>
    <select name="select" id="select_k1" class="xla_k">
        <option value="0">开发</option>
        <option value="1">ui</option>
    </select>
    <span>阶段：</span>
    <select name="select" id="select_k2" class="xla_k">
        <option value="0">1</option>
        <option value="1">2</option>
    </select>

    <span>科目：</span>
    <select name="select" id="select_k3" class="xla_k">
        <option value="0">java</option>
        <option value="1">李老师</option>
    </select><br>

    标题:<input type="text" style="width: 300px"><br>
    总分：<input type="text"><br>
    考试时长：<input type="text"><br>
    <span>单选题</span>：   <span>简单</span><input type="text"style="width: 80px">
    <span>一般</span><input type="text"style="width: 80px">
    <span>困难</span><input type="text"style="width: 80px"><br>

    <span>多选题</span>：   <span>简单</span><input type="text"style="width: 80px">
    <span>一般</span><input type="text"style="width: 80px">
    <span>困难</span><input type="text"style="width: 80px"><br>

    <span>总题：</span> <input type="text"style="width: 80px"><br>
    <span>每题分数：</span> <input type="text"style="width: 80px"><br>



    <input type="submit" value="创建试卷">
    <input type="submit" value="取消">


</div>


</body>
</html>
