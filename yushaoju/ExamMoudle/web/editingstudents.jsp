<%--
  Created by IntelliJ IDEA.
  User: Svip
  Date: 2017/11/20
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑学生</title>
    <style type="text/css">
        #zs{
            position: absolute;
            left: 550px;
            font-size: 30px;
            }

        #at1 {
            position: absolute;
            left: 200px;
            top: 110px;
        }

        #at3{
            position: absolute;
            left: 200px;
            top: 150px;
        }
        #at4{
            position: absolute;
            left: 280px;
            top: 150px;
        }
        #at5{
            position: absolute;
            left: 200px;
            top: 190px;
        }
        #at6{
            position: absolute;
            left: 280px;
            top: 190px;
        }
        #at7{
            position: absolute;
            left: 200px;
            top: 230px;
        }
        #at8{
            position: absolute;
            left: 280px;
            top: 230px;
        }
        #at9{
            position: absolute;
            left: 200px;
            top: 270px;
        }
        #at10{
            position: absolute;
            left:280px;
            top:270px;
        }
        #ats{
            position: absolute;
            left: 170px;
            top: 310px;
        }
        #ats1{
            position: absolute;
            left: 250px;
            top: 310px;
        }
        #ats2{
            position: absolute;
            left: 160px;
            top: 420px;
        }
        #ats3{
            position: absolute;
            left: 250px;
            top: 420px;
        }
        #ats4{
            position: absolute;
            left: 160px;
            top: 580px;
        }
        #ats5{
            position: absolute;
            left: 250px;
            top:580px;
            font-size: 30px;
        }
        #xins{
            position: absolute;
            left: 160px;
            top: 650px;
        }
        #xins1{
            position: absolute;
            left: 250px;
            top: 650px;
            font-size: 30px;
        }
        #ats6{
            position: absolute;
            left: 220px;
            top: 700px;
        }

        #ats7{
            position: absolute;
            left:300px;
            top: 700px;
        }

        #xin{
            position: absolute;
            left: 280px;
            top: 110px;
        }
       #xin1{
           position: absolute;
           left: 170px;
           top: 350px ;
       }
        #xin2{
            position: absolute;
            left: 250px;
            top: 350px;
        }
        #xin3{
            position: absolute;
            left: 170px;
            top:380px;
        }
        #xin4{
            position: absolute;
            left: 250px;
            top: 380px;
        }
        #xin5{
            position: absolute;
            left: 160px;
            top: 460px;
        }
        #xin6{
            position: absolute;
            left: 250px;
            top: 460px;
        }
        #xin7{
            position: absolute;
            left: 140px;
            top: 500px;
        }
        #xin8{
            position: absolute;
            left: 260px;
            top: 500px;
        }
        #xin9{
            position: absolute;
            left: 180px;
            top: 540px;
        }
        #xin10{
            position: absolute;
            left: 260px;
            top: 540px;
        }
        #dexter{
            position: absolute;
            left: 700px;
            top: 150px;

        }
        #dexter1{
            position: absolute;
            left:700px;
            top:250px;
        }
        #dexter2{
            position: absolute;
            left: 780px;
            top: 250px;
        }
        #dexter3{
            position: absolute;
            left: 700px;
            top: 290px;
        }
        #dexter4{
            position: absolute;
            left: 780px;
            top: 290px;
        }
        #dexter5{
            position: absolute;
            left: 700px;
            top: 330px;
        }
        #dexter6{
            position: absolute;
            left: 780px;
            top: 330px;
        }
        #dexter7{
            position: absolute;
            left: 700px;
            top: 360px;
        }
        #dexter8{
            position: absolute;
            left: 780px;
            top:360px
        }
        #dexter9{
            position: absolute;
            left: 640px;
            top: 400px;
        }
        #dexter10{
            position: absolute;
            left: 780px;
            top: 400px;
        }
        #dexter01{
            position: absolute;
            left: 700px;
            top: 440px;
        }
        #dexter02{
            position: absolute;
            left:780px ;
            top: 440px;
        }

    </style>
</head>
<body>

<div id="zs">编辑学生</div>
<div id="at1">学号：</div>
<input type="text" id="xin"/>

<div id="at3">姓名：</div>
<input type="text" id="at4"/>

<div id="at5">性别：</div>
<select name="select" id="at6">
    <option value="0">请选择</option>
    <option value="1">男</option>
    <option value="2">女</option>
</select>

<%--<div id="at7">生日:</div>--%>
<%--<input type="text" id="at8"/>--%>
<div id="at7">入学年月:</div>
<select name="select" id="at8">
    <option value="0">请选择</option>
    <option value="1">2000</option>
    <option value="2">2010</option>
</select>


<div id="at9">所属班级：</div>
<select name="select" id="at10">
    <option value="0">请选择</option>
    <option value="1">1601</option>
    <option value="2">1602</option>
    <option value="3">1603</option>
</select>



<div id="ats">生日:</div>
<input type="text" id="ats1"/>

<div id="xin1">身份证号:</div>
<input type="text" id="xin2"/>

<div id="xin3">省份:</div>
<%--<input type="text" id="xin4"/>--%>
<select name="select" id="xin4">
    <option value="0">请选择</option>
    <option value="1">北京</option>
    <option value="2">上海</option>
    <option value="3">深圳</option>
</select>


<div id="ats2">专业简称</div>
<select name="select" id="ats3">
    <option value="0">qhit</option>
    <option value="1">it</option>
</select>

<div id="xin5">联系电话:</div>
<input type="text" id="xin6"/>

<div id="xin7">家长联系电话:</div>
<input type="text" id="xin8"/>


<div id="xin9">宿舍:</div>
<select name="select" id="xin10">
    <option value="0">8388</option>
    <option value="1">8378</option>
</select>


<div id="ats4">基本情况:</div>

<input type="text" id="ats5"/>

<div id="xins">教育背景:</div>

<input type="text" id="xins1"/>

<button type="button" id="ats6">确定</button>
<button type="button" id="ats7">取消</button>



<%--右边--%>
<div id="dexter">照片:</div>
<div id="dexter1">政治面貌:</div>
<input type="text" id="dexter2"/>

<div id="dexter3">所属方向：</div>
<select name="select" id="dexter4">
    <option value="0">请选择</option>
    <option value="1">北京</option>
    <option value="2">上海</option>
</select>

<div id="dexter5">就读方向：</div>
<select name="select" id="dexter6">
    <option value="0">请选择</option>
    <option value="1">北京</option>
    <option value="2">上海</option>
</select>

<div id="dexter7">家庭住址：</div>
<input type="text" id="dexter8"/>

<div id="dexter9">监护人与学生关系：</div>
<input type="text" id="dexter10"/>

<div id="dexter01">宿舍号：</div>
<input type="text" id="dexter02"/>
</body>
</html>
