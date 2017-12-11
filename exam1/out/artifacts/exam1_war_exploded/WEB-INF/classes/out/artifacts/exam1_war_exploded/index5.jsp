<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-21
  Time: 下午4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
 charset=utf-8" />
    <title>Title</title>

    <style>
        #div1{

            border:1px solid ;
            width:1200px;
            height:600px

        }
        #div2{

            border:1px solid ;
            width:1200px;
            height:100px
        }
        #div3{

            border:1px solid ;
            width:150px;
            height:500px

        }
        #div4{
            position: absolute;
            top: 110px;
            left: 160px;

            border:1px solid ;
            width:1050px;
            height:500px



        }

    </style>
</head>
<body>
<div id="div1"  >
    <div id="div2" align="center" >
        在线考试系统<br>
        <a href="">注销</a><br>
        <a href="">退出系统</a><br>
    </div>
    <div id="div3" align="center">
        后台功能<br>
        <a href="">教师管理</a><br>
        <a href="">班级管理</a><br>
        <a href="">学生管理</a><br>
        <a href="">题库管理</a><br>
        <a href="">试卷管理</a><br>
        <a href="">成绩管理</a><br>
        <a href="">修改密码</a><br>
    </div>
    <div id="div4"  >
        <p align="center">学生列表
        <input type="submit" value="添加学生">
        <input type="submit" value="学生信息导出">
        <input type="submit" value="学生信息导入">
        <input type="submit" value="学生信息空模板下载"></p><br>

        学号 <input type="text"   name="pname" value="">
        姓名 <input type="password" name="pwd" value="">
        班级： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>
               </select>
        入学年份： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>
                </select>
        就读方向： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>
                  </select>
        <input type="submit" value="查询"><br>
        <table border="1" width="900px" height="400px"  align="center">

            <tr >
                <td height="20px">序号</td>
                <td>学号</td>
                <td>班级</td>
                <td>姓名</td>
                <td>性别</td>
                <td >电话</td>
                <td>操作</td>
            </tr>

            <tr>
                <td  height="30px" width="10px">2</td>
                <td >000111</td>
                <td>G3T52</td>
                <td>tom</td>
                <td>男</td>

                <td>100224547</td>

                <td width="150px">
                    <a href="">查看</a>
                    <a href="">编辑</a>
                    <a href="">重置密码</a>
                    <a href="">删除</a>

                </td>
            </tr>
            <tr >
                <td height="30px">2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>里</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td  height="30px">2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td height="30px">2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td  height="30px">2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td  height="30px">2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td  height="30px">2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td  height="30px">2</td>
                <td>21</td>
                <<td>21</td>
                <td>21</td>
                <td width="100px">21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td height="30px" >2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td width="100px">21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td  >2</td>
                <td>21</td>
                <td>21</td>
                <td>21</td>
                <td width="100px">21</td>
                <td>21</td>
                <td>21</td>
            </tr>

        </table>


    </div>
</div>




</body>
</html>
