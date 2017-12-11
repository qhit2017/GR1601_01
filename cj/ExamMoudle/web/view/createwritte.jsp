
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">


<link rel="stylesheet" type="text/css" href="../css/writte.css">
<link rel="stylesheet" type="text/css" href="../css/thems.css">
<head>
    <title>创建试卷难度</title>

</head>


<body>
<div id="writte_main">

<div  id="writte_ton">

        <samp>方向</samp>
        <select name="select" id="select_k1" class="xla_k">
            <option value="0">java</option>
            <option value="1">G2</option>
            <option value="2">G3</option>
        </select>
    <samp>  阶段：</samp>
        <select name="select" id="select_k2" class="xla_k">
            <option value="0">1</option>
            <option value="1">G2</option>
            <option value="2">G3</option>
        </select>

    <samp> 考试科目：</samp>
        <select name="select" id="select_k9" class="xla_k">
            <option value="0">java</option>
            <option value="1">G2</option>
            <option value="2">G3</option>
        </select><br>
           <samp> 标题：</samp><input  type="text" style="width: 300px"><br>
         <samp> 总分：</samp><input  type="text">分
             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <samp>  考试时长：</samp><input type="text">分钟<br>
                <samp>  已选题数</samp>：<input  type="text" style="width: 80px">
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <samp> 每题分数</samp><input  type="text" style="width: 80px">

</div>






    <div  id="writte_zj">
        <textarea name="teacher_ins" id="" cols="300" rows="50"></textarea>"<br>

        <!--列表-->
        <!--右边底部-->
        <div class="r_foot">
            <div class="r_foot_m">



                <!--分页-->
                <div class="page">
                    <a href="" class="prev"><img src="/images/icon7.png" alt=""/></a>
                    <a class="now">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href="">6</a>
                    <a href="" class="next"><img src="/images/icon8.png" alt=""/></a>
                </div>
                <!--分页-->
            </div>
        </div>

    </div>

    <div  id="writte_dite">
        <a href="" class="btn">创建试卷</a>
        <a href="" class="btn">取消</a>
    </div>

</div>
</body>
</html>
