<%--
  Created by IntelliJ IDEA.
  User: zmg
  Date: 2017/11/20
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">

<link rel="stylesheet" type="text/css" href="/css/main.css"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>班级管理</title>
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
            top: 0;
            left: 0;
            width: 100%;
            height: 100px;
            background: #ecfbde;


        }
        #div1{
            text-align:right;

        }
        #div2{
            text-align:left;
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
        }

        #side {
            position: absolute;
            top: 0;
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
            _height: 100%;
            _margin-left: 210px;
            background: #666;
        }

        #content {
            _overflow: auto;
            _width: 100%;
            _height: 100%;
        }

        #ft {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100px;
            background: #999;
        }

        .tit-layout {
            margin: 10px 0 0;
            font-size: 18px;
            text-align: right;
        }


        .copyright {
            font-weight: bold;
            text-align: center;
        }

        #feature {
            width: 200%;
            line-height: 4;
        }

        #feature .hd {
            padding: 20px 15px;
        }

        #feature .hd h2 {
            margin: 0;
            font-size: 16px;
        }

        #feature .bd ol {
            margin-top: 0;
        }

        #feature .bd h3 {
            margin: 0;
            padding: 0 15px;
            font-size: 14px;
        }

        #feature .ft {
            padding: 10px 15px 30px;
        }
        #s1{
            position: absolute;
            Left :250px;
        }
        #s2{
            position: absolute;
            left: 220px;
            top: 50px;
        }
        #xin1{
            position: absolute;
            left:280px;
            top: 50px;
        }
        #s4{
            position: absolute;
            left: 400px;
            top: 50px;
        }
        #s5{
            position: absolute;
            left: 580px;
            top: 50px;
        }
        #xin2{
            position: absolute;
            left:480px;
            top: 50px;
        }
        #xin3{
            position: absolute;
            left: 620px;
            top: 55px;
        }
        #s8{
            position: absolute;
            left: 820px;
            top: 50px;
        }
        #he{
            position: absolute;
            left: 550px;
            top: 50px;
            font-size: 20px;
        }
        #he1{
            position: absolute;
            left: 280px;
            top:200px;
        }
        #xin4 {
            position: absolute;
            left: 700px;
            top: 55px;
        }
        #xin5{
            position: absolute;
            left: 750px;
            top: 55px;
        }
        #xin6{
            position: absolute;
            left: 880px;
            top: 50px;
        }

    </style>
</head>
<body>
<div id="hd">
    <h1 class="tit-layout">
        <div id="div1" ><a href="" style="text-decoration: none">注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>
        <div id="div2">在线考试</div>
    </h1>
</div>

<div id="bd">
    <div id="side">
        <table width="100%">
            <tr>
                <td>教师管理</td>
            </tr>
            <tr>
                <td>班级管理</td>
            </tr>
            <tr>
                <td>学生管理</td>
            </tr>
            <tr>
                <td>题库管理</td>
            </tr>
            <tr>
                <td>试题管理</td>
            </tr>
            <tr>
                <td>成绩管理</td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>

        </table>

    </div>
    <div id="main">
        <div id="content">
            <div id="feature" class="feature">

            </div>
        </div>
    </div>
    <button type="button" id="s1">新建班级</button>
    <div id="s2">入学年份</div>
    <select name="select" id="xin1">
        <option value="0">请选择</option>
        <option value="1">2001</option>
        <option value="2">20002</option>
    </select>
    <div id="s4">所属方向：</div>
    <select name="select" id="xin2">
        <option value="0">请选择</option>
        <option value="1">北京</option>
        <option value="2">上海</option>
    </select>

    <div id="s5">讲师：</div>
    <select name="select" id="xin3">
        <option value="0">请选择</option>
        <option value="1">胡老师</option>
        <option value="2">闫老师</option>
        <option value="3">马老师</option>
    </select>

    <div id="xin4">班主任:</div>
    <select name="select" id="xin5">
        <option value="0">请选择</option>
        <option value="1">王老师</option>
        <option value="2">张老师</option>
    </select>


    <button type="button" id="s8">查询</button>
    <button type="button" id="xin6">重置</button>



</div>
<div id="he">班级列表</div>


<table id="he1"  border="1">
    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>

    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>

    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>

    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>

    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>

    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>>
    </tr>
    <tr>
        <td>序号</td>
        <td>班级代码</td>
        <td>班级名称</td>
        <td>所属方向</td>
        <td>班主任</td>
        <td>讲师</td>
        <td>开班日期</td>
        <td>状态</td>
        <td>操作</td>
    </tr>







</table>



</form>
</table>
</body>
</html>