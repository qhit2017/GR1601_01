<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addstudent</title>
    <style>
        #bottomdiv{
            width: 100%;
            height: 700px;
            background-color: gainsboro;
            margin: auto;
        }
        #studenttable{
            width:1000px;
            height: 680px;
            position:relative;
            left: 255px
        }
    </style>
</head>
<body>
    <div id="bottomdiv">
        <table border="1" id="studenttable">
            <tr><td colspan="4" style="text-align: center;">添加学生</td></tr>
            <tr>
                <td>学号:</td><td><input type="text"></td>
                <td  colspan="2"><input type="button" value="选择文件">未选择文件</td>
            </tr>
            <tr>
                <td>姓名:</td><td><input type="text"></td>
                <td colspan="2"><a style="color: red">(支持jpg,gif,png格式)</a><input type="button" value="提交"></td>
            </tr>
            <tr>
                <td>性别:</td><td><select><option>请选择</option></select></td>
                <td colspan="3" rowspan="4" >照片:</td>
            </tr>
            <tr>
                <td>入学年份:</td>
                <td><select><option>请选择</option></select></td>
            </tr>
            <tr>
                <td>所属班级:</td><td><select><option>请选择</option></select></td>

            </tr>
            <tr>
                <td>生日:</td><td><input type="text"></td>

            </tr>
            <tr>
                <td>身份证号:</td><td><input type="text"></td>
                <td>政治面貌:</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>省份:</td>
                <td><select><option>请选择</option></select></td>
                <td>城市</td>
                <td><select><option>请选择</option></select></td>
            </tr>
            <tr>
                <td>专业简称:</td>
                <td><select><option>请选择</option></select></td>
                <td>就读方向:</td>
                <td><select><option>请选择</option></select></td>
            </tr>
            <tr>
                <td>联系电话:</td>
                <td><input type="text"></td>
                <td>家庭住址:</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>家长联系电话:</td>
                <td><input type="text"></td>
                <td>监护人与学生关系:</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>宿舍:</td><td>
                <select><option>请选择</option></select></td>
                <td>宿舍号:</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td >基本情况:</td>
                <td colspan="3" rowspan="1"><textarea cols="80" rows="2"></textarea></td>
            </tr>
            <tr>
                <td >教育:</td>
                <td colspan="3" rowspan="1"><textarea cols="80" rows="2"></textarea></td>
            </tr>

        </table>
    </div>
</body>
</html>
