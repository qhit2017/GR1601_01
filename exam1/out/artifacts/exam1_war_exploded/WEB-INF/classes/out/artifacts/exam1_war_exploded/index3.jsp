<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-21
  Time: 下午4:15
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
        <p align="center">班级列表 <input type="submit" value="新建班级"></p><br>


        入学年份： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>
              </select>
        所属方向： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>
              </select>
        讲师： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>
              </select>
        班主任： <select>
        <option value="0">讲师</option>
        <option value="1">班主任</option>
              </select>



        <input type="submit" value="查询">
        <input type="submit" value="重置"><br>
        <table border="1" width="900px" height="400px"  align="center">

            <tr >
                <td height="20px">序号</td>
                <td>班级代码</td>
                <td>班级名称</td>
                <td>所属方向</td>
                <td>班主任</td>
                <td>讲师</td>
                <td>开班日期</td>
                <td >状态</td>
                 <td>操作</td>
            </tr>

            <tr>
                <td  height="30px" width="10px">2</td>
                <td >G3T52</td>
                <td>2011级计算机网络1班</td>
                <td>SCME</td>
                <td>殷云</td>
                <td>陈义锋</td>
                <td>2011-09-01</td>
                <td><a href="">启用</a></td>
                <td width="80px">
                    <a href="">编辑</a>

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
                <td >21</td>
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
                <td >21</td>
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
                <td >21</td>
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
                <td >21</td>
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
                <td >21</td>
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
                <td width="100px">21</td>
                <td>21</td>
                <td>21</td>
            </tr>
            <tr >
                <td height="30px" >2</td>
                <td>21</td>
                <td>21</td>
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
