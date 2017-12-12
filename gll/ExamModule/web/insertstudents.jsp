<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/21
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/insertstudent.css">
<html>
<head>
    <title>添加学生界面</title>
    <style>
       /* #upfile{
            position: relative;
            height: 170px;
            width: 200px;
            left: 300px;
            bottom: 590px;

            background-color: darkgray;
        }*/
    </style>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script language="JavaScript" src="js/ajaxfileupload.js"></script>
    <script language="JavaScript">
        $(document).ready(function () {
            $("#but_upload").click(function () {
                //发送ajax请求，把所选择的图上传到服务器内存
                $.ajaxFileUpload({
                    url:"uploadImg",
                    fileElementId:"upload",
                    secureuri:false,
                    type:"post",
                    dataType:"json",
                    success:function (msg) {
                        var obj  = $.parseJSON(msg);
                        alert(obj.path);
                        /*$("#imgresult").val( obj.path);*/
                        $("#imgid").attr("src",obj.path);
                    }
                });
            });

        });

    </script>
</head>
<body>
<div id="upfile">
    <input type="file" value="选择文件" name="upload" id="upload">
    (支持jpg、gif、png)<input type="button" value="确定" id="but_upload">
    照片：<img id="imgid" src="">
</div>
<div id="is_add">
    <table width="500px">
        <tr>
            <td align="center" colspan="2">添加学生</td>
        </tr>
        <tr>
            <td>学号：<input type="text"></td>
            <td>路径：<input type="text" id="pathid"></td>
        </tr>
        <tr>
            <td>姓名：<input type="text"></td>

        </tr>
        <tr>
            <td>性别：<select name="sex">
                            <option>男</option>
                            <option>女</option>
                        </select></td>
        </tr>
        <tr>
            <td>入学年份：<select name="year"><option>请选择</option></select></td>
        </tr>
        <tr>
            <td>所属班级：<select name="class"><option>请选择</option></select></td>
        </tr>
        <tr>
            <td>生日：<input type="text"></td>
        </tr>
        <tr>
            <td>身份证号：<input type="text"></td>
            <td>政治面貌：<input type="text"></td>
        </tr>
        <tr>
            <td>省份：<select><option>请选择</option></select></td>
            <td>城市：<select><option>请选择</option></select></td>
        </tr>
        <tr>
            <td>专业简称：<select><option>请选择</option></select></td>
            <td>就读方向：<select><option>请选择</option></select></td>
        </tr>
        <tr>
            <td>联系电话：<input type="text"></td>
            <td>家庭住址：<input type="text"></td>
        </tr>
        <tr>
            <td>家长联系电话：<input type="text"></td>
            <td>监护人与学生关系：<input type="text"></td>
        </tr>
        <tr>
            <td>宿舍：<select><option>请选择</option></select></td>
            <td>宿舍号：<input type="text"></td>
        </tr>
        <tr>
            <td>基本情况：<textarea rows="2" cols="30"></textarea></td>
        </tr>
        <tr>
            <td>教育背景：<textarea rows="2" cols="30"></textarea></td>
        </tr>
    </table>


    <%--<input type="submit" value="添加">&nbsp;&nbsp;&nbsp;<input type="submit" value="取消">--%>
</div>
</body>
</html>
