<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/20
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<head>
    <title>主页面！！</title>
    <style type="text/css">
        html,body {
            overflow: hidden;
            height: 100%;
            margin: 0;
            padding: 0;
            font: 14px/1.8 Georgia, Arial, Simsun;
        }

        html {
            _padding: 110px 0;
        }

        #hd {
            position: absolute;
            font-size: 30px;
            color: red;
            padding-top: 25px;
            top: 0;
            left: 0;
            width: 100%;
            height: 80px;
            background: #999;
        }

        #bd {
            position: absolute;
            top: 110px;
            right: 0;
            bottom: 110px;
            left: 0;
            overflow: hidden;
            width: 100%;
            _height: 100%;
            text-align: center;
        }

        #side {
            position: absolute;
            font-size: 20px;
            color: lime;
            top: 0;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }
        #side_1 {
            position: absolute;
            top: 50px;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }
        #side_2{
            position: absolute;
            top: 80px;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }

        #side_3{
            position: absolute;
            top: 110px;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }
        #side_4{
            position: absolute;
            top: 140px;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }
        #side_5{
            position: absolute;
            top: 170px;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }
        #side_6{
            position: absolute;
            top: 200px;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }
        #side_7{
            position: absolute;
            top: 230px;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background: #666;
        }

        #main {
            position: absolute;
            _position: static;
            top: 0;
            right: 0;
            bottom: 0;
            left: 210px;
            overflow: auto;
            _overflow: hidden;
            _margin-left: 210px;
            width: 100%;
            height: 100%;
            background: #666;
        }
    </style>

</head>
<body>
<div>
      <center><div id="hd" >
             在线考试管理系统！！
      </div></center>
<div id="bd">
    <div id="side">后台功能</div>
    <div id="side_1"><a href="" style="text-decoration: none">教师管理</a></div>
    <div id="side_2"><a href="" style="text-decoration: none">班级管理</a></div>
    <div id="side_3"><a href="" style="text-decoration: none">学生管理</a></div>
    <div id="side_4"><a href="" style="text-decoration: none">题库管理</a></div>
    <div id="side_5"><a href="" style="text-decoration: none">试卷管理</a></div>
    <div id="side_6"><a href="" style="text-decoration: none">成绩管理</a></div>
    <div id="side_7"><a href="" style="text-decoration: none">修改密码</a></div>
    <div id="main">

        </div>
    </div>
</div>
</div>
</body>
</html>