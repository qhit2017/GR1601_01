<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/28/028
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>编辑新的教师信息</title>
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
<script language="JavaScript" src="js/jquery-3.2.1.js"></script>
<script>
</script>
<body>
<form action="insertteacherinfo" method="post">
    <div id="bigdiv">
        <table <%-- border="1px";--%> style ="width: 550px; height: 400px; left: 150px; text-align: center; position: relative; bottom: 100px;" id="showallinfo" >

            <caption style="text-align: center"><input value="<s:property value="teachers.tid"></s:property>" type="text" name="tid" id="tid" readonly="true" style="display:none">编辑新的教师信息</caption>
            <tr>

                <td >账号:</td><%--showexisttnumber显示已经存在的账号--%>
                <td ><input type="text" name="tnumber" readonly="true" value="<s:property value="teachers.tnumber"></s:property>" id="showexisttnumber"></td>
            </tr><br>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="tname" value="<s:property value="teachers.tname"></s:property>" > <font color="red">*</font></td>
            </tr><br>
            <tr>
                <td>性别：</td>
                <td >
                    <select name="tsex" value="<s:property value="teachers.tsex"></s:property>">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select><font color="red">*</font></td>
            </tr><br>
            <tr>
                <td>生日：</td>
                <td><input type="text" name="tbirthday" value="<s:property value="teachers.tbirthday"></s:property>"> </td>
            </tr><br>
            <tr>
                <td>学历：</td>
                <td><input type="text" name="teducation" value="<s:property value="teachers.teducation"></s:property>" ></td>
            </tr><br>
            <tr>
                <td>联系电话：</td>
                <td><input type="text" name="ttel" value="<s:property value="teachers.ttel"></s:property>" ></td>
            </tr><br>
            <tr>
                <td>岗位：</td>
                <td> <select name="tjob" value="<s:property value="teachers.tjob"></s:property>" >
                    <option value="0">讲师</option>
                    <option value="1">班主任</option>
                </select><font color="red">*</font></td>
            </tr><br>

            <tr>
                <td>备注：</td>
                <td ><textarea rows="3" cols="20" name="tremark" value="<s:property value="teachers.tremark"></s:property>"></textarea></td>
            </tr><br>
            <tr style="text-align: center; position: relative; left: 300px">
                <td >

                    <input  type="submit" name="login" value="确定" id="">
                  <a href="teachermanager.jsp"><input  type="button" name="reset" value="取消" ></a>  <br></td>

            </tr>


        </table>


    </div>
</form>
</body></html>
