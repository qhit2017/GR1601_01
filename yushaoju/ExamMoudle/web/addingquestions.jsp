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
    <title>添加试题</title>
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








        #ats4{
            position: absolute;
            left: 160px;
            top: 190px;
        }
        #ats5{
            position: absolute;
            left: 280px;
            top:190px;
            font-size: 50px;
        }
        #ats6{
            position: absolute;
            left: 220px;
            top: 600px;
        }

        #ats7{
            position: absolute;
            left:300px;
            top: 600px;
        }

        #xin{
            position: absolute;
            left: 280px;
            top: 110px;
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
        #ad1{
            position: absolute;
            left: 180px;
            top: 350px;
        }



    </style>
</head>
<body>

<div id="zs">添加试题</div>
<div id="at1">科目类型：</div>
<input type="text" id="xin"/>

<div id="at3">类型：</div>
<select name="select" id="at4">
    <option value="0">单选</option>
    <option value="1">多选</option>
</select>


<div id="ad1">选项</div>



<div id="xin7">对应章节:</div>
<input type="text" id="xin8"/>


<div id="xin9">难度:</div>
<select name="select" id="xin10">
    <option value="0">1</option>
    <option value="1">2</option>
</select>


<div id="ats4">题目内容:</div>
<input type="text" id="ats5"/>

<button type="button" id="ats6">修改</button>
<button type="button" id="ats7">重置</button>


</body>
</html>
