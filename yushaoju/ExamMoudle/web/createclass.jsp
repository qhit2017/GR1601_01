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
    <title>添加班级</title>
    <style type="text/css">

        #at1 {
            position: absolute;
            left: 500px;
            top: 110px;
        }

        #at3{
            position: absolute;
            left: 500px;
            top: 150px;
        }
        #at4{
            position: absolute;
            left: 580px;
            top: 150px;
        }
        #at5{
            position: absolute;
            left: 500px;
            top: 190px;
        }
        #at6{
            position: absolute;
            left: 580px;
            top: 190px;
        }
        #at7{
            position: absolute;
            left: 500px;
            top: 230px;
        }
        #at8{
            position: absolute;
            left: 580px;
            top: 230px;
        }
        #at9{
            position: absolute;
            left: 500px;
            top: 270px;
        }
        #at10{
            position: absolute;
            left:580px;
            top:270px;
        }
        #ats{
            position: absolute;
            left: 470px;
            top: 310px;
        }
        #ats1{
            position: absolute;
            left: 550px;
            top: 310px;
        }
        #ats2{
            position: absolute;
            left: 500px;
            top: 420px;
        }
        #ats3{
            position: absolute;
            left: 550px;
            top: 420px;
        }
        #ats4{
            position: absolute;
            left: 500px;
            top: 470px;
        }
        #ats5{
            position: absolute;
            left: 550px;
            top:460px;
            font-size: 20px;
        }
        #ats6{
            position: absolute;
            left: 520px;
            top: 550px;
        }
        #ats7{
            position: absolute;
            left:600px;
            top: 550px;
        }

        #xin{
            position: absolute;
            left: 580px;
            top: 110px;
        }
       #xin1{
           position: absolute;
           left: 470px;
           top: 350px ;
       }
        #xin2{
            position: absolute;
            left: 550px;
            top: 350px;
        }
        #xin3{
            position: absolute;
            left: 470px;
            top:380px;
        }
        #xin4{
            position: absolute;
            left: 550px;
            top: 380px;
        }




    </style>
</head>
<body>
<div id="at1">班级代码：</div>
<input type="text" id="xin"/>

<div id="at3">班级名称：</div>
<input type="text" id="at4"/>

<div id="at5">所属方向：</div>
<select name="select" id="at6">
    <option value="0">请选择</option>
    <option value="1">北京</option>
    <option value="2">上海</option>
</select>

<%--<div id="at7">生日:</div>--%>
<%--<input type="text" id="at8"/>--%>
<div id="at7">班主任:</div>
<select name="select" id="at8">
    <option value="0">请选择</option>
    <option value="1">王老师</option>
    <option value="2">张老师</option>
</select>


<div id="at9">讲师：</div>
<select name="select" id="at10">
    <option value="0">请选择</option>
    <option value="1">胡老师</option>
    <option value="2">闫老师</option>
    <option value="3">马老师</option>
</select>



<div id="ats">开班日期:</div>
<input type="text" id="ats1"/>

<div id="xin1">G1班人数:</div>
<input type="text" id="xin2"/>

<div id="xin3">G2班人数:</div>
<input type="text" id="xin4"/>



<div id="ats2">状态</div>
<select name="select" id="ats3">
    <option value="0">启用</option>
    <option value="1">暂停</option>
</select>

<div id="ats4">备注:</div>

<input type="text" id="ats5"/>


<button type="button" id="ats6">确定</button>
<button type="button" id="ats7">取消</button>
</body>
</html>
