<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加班级页面</title>
</head>
<style>
    #bigdiv{
        position: absolute;
        width: 1000px;
        height: 600px;
        background: gainsboro;
        align-content: center;
        left: 300px;
    }


</style>
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script language="JavaScript">
    //添加页面中的取消
    function quxiao() {
        window.location.href="classesmanager.jsp";
    }

    $(document).ready(function () {
          //显示讲师姓名出现在下拉框
    $.ajax({
        url: "showteacherinfo0",
        type: "get",
        success:function (msg) {
            var obj=eval(msg);
            var str="";
            for(var i=0;i<obj.length;i++) {
                str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
            }
            var strtitle="<option value=''>请选择</option>";
            str=strtitle+str;
            $("#tjob0").html(str);
        }

    })
    //显示班主任姓名出现在下拉框
    $.ajax({
        url: "showteacherinfo1",
        type: "get",
        success:function (msg) {
            var obj=eval(msg);
            var str="";
            for(var i=0;i<obj.length;i++) {
                str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
            }
            var strtitle="<option value=''>请选择</option>";
            str=strtitle+str;
            $("#tjob1").html(str);
        }

    })


    })

</script>
<body>
<form action="insertclassesinfo" method="post">

<div id="bigdiv">

    <table  <%--border="1px"; --%>style =" table-layout: fixed; width: 550px; height: 400px; left: 150px; text-align: center; position: relative; bottom: 100px;"   >

        <caption style="text-align: center">班级管理</caption>
        <tr>
            <td>班级代码:</td>
            <td ><input type="text" name="classnum"> <font color="red">*</font></td>
        </tr><br>
        <tr>
            <td>班级名称：</td>
            <td><input type="text" name="clsaaname"> <font color="red">*</font></td>
        </tr><br>
        <tr>
            <td>所属方向：</td>
            <td >
                <select>
                    <option>高软</option>
                    <option>3G4G</option>
                </select><font color="red">*</font></td>
        </tr><br>
        <tr>
            <td>班主任：</td>
            <td >
                <select id="tjob1"></select></td>
        </tr><br>
        <tr>
            <td>讲师：</td>
            <td >
                <select id="tjob0"></select></td>
        </tr><br>
        <tr>
            <td>开班日期：</td>
            <td><input type="text" name="beginclass"> </td>
        </tr><br>
        <tr>
            <td>G1开班人数：</td>
            <td><input type="text" name=""></td>
        </tr><br>
        <tr>
            <td>G2开班人数：</td>
            <td><input type="text" name=""></td>
        </tr><br>
        <tr>
            <td>状态：</td>
            <td> <select>
                <option>启用</option>
                <option>未启用</option>
            </select></td>
        </tr><br>

        <tr>
            <td>备注：</td>
            <td ><input type="text" name=""></td>
        </tr><br>
        <tr style="text-align: center; position: relative; left: 300px">
            <td >

                <input  type="submit" name="login" value="添加" >
                <input  type="button" name="reset" value="取消" onclick="quxiao()" ><br></td>

        </tr>


    </table>



</div>
</form>
</body>
</html>
