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
    <title>添加教师</title>
    <style type="text/css">

        #at1{
            position: absolute;
            left: 500px;
            top:110px;

        }
        #at2{
            position: absolute;
            left: 650px;
            top: 50px;
            font-size: 30px;
        }
        #at3{
            position: absolute;
            left: 500px;
            top: 150px;
        }
        #at4{
            position: absolute;
            left: 550px;
            top: 150px;
        }
        #at5{
            position: absolute;
            left: 500px;
            top: 190px;
        }
        #at6{
            position: absolute;
            left: 550px;
            top: 190px;
        }
        #at7{
            position: absolute;
            left: 500px;
            top: 230px;
        }
        #at8{
            position: absolute;
            left: 550px;
            top: 230px;
        }
        #at9{
            position: absolute;
            left: 500px;
            top: 270px;
        }
        #at10{
            position: absolute;
            left:550px;
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
            top: 350px;
        }
        #ats3{
            position: absolute;
            left: 550px;
            top: 350px;
        }
        #ats4{
            position: absolute;
            left: 500px;
            top: 500px;
        }
        #ats5{
            position: absolute;
            left: 550px;
            top:460px;
            font-size: 60px;
        }
        #ats6{
            position: absolute;
            left: 550px;
            top: 550px;
        }
        #ats7{
            position: absolute;
            left:600px;
            top: 550px;
        }




    </style>
</head>
<body>
<div id="at2">添加教师</div>
<div id="at1">账号:</div>
<div id="at3">姓名：</div>
<input type="text" id="at4"/>
<div id="at5">性别：</div>
<select name="select" id="at6">
    <option value="0">性别</option>
    <option value="1">男</option>
    <option value="2">女</option>
</select>
<div id="at7">生日:</div>
<input type="text" id="at8"/>
<div id="at9">学历：</div>
<input type="text" id="at10"/>
<div id="ats">联系电话:</div>
<input type="text" id="ats1"/>
<div id="ats2">岗位：</div>

<select name="select" id="ats3">
    <option value="0">讲师</option>
    <option value="1">男</option>
    <option value="2">女</option>
</select>

<div id="ats4">备注:</div>

<input type="text" id="ats5"/>


<button type="button" id="ats6">确定</button>
<button type="button" id="ats7">取消</button>
</body>
</html>
