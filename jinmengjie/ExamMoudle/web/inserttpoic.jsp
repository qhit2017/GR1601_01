<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑试题</title>
</head>
<style>
    #bigdiv{
        margin: auto;
        width: 1000px;
        height: 600px;
        background: gainsboro;
    }


</style>
<body>
<form action="inserttestinfo" method="post">
<div id="bigdiv">
    <h1 style="text-align: center">编辑试题</h1>
    <table  border="1px" style ="width: 550px; text-align: center;margin: auto" >
        <tr>
            <td>科目名称:</td>
            <td ><input type="text" name="classnum"> </td>
        </tr>

        <tr>
            <td>类型：</td>
            <td >
                <select>
                    <option>单选</option>
                    <option>多选</option>
                </select></td>
        </tr>

        <tr>
        <td>题目内容<font color="red">*</font>：</td>
        <td ><textarea rows="5" cols="25" style="width: 200px;"></textarea></td>
        </tr>


        <tr>
            <td>选项<font color="red">*</font>：</td>
            <td>
                <input type="radio">A整个网页里面活动链接<%--的颜色--%><br>
                <input type="radio">B整个网页里面文字颜色<br>
                <input type="radio">C整个网页里面用户访问<%--过的数量--%><br>
                <input type="radio">D整个页面的背景为红色<br>
            </td>
        </tr>

        <tr>
            <td>难度<font color="red">*</font>：</td>
            <td >
                <select>
                    <option>简单</option>
                    <option>一般</option>
                    <option>困难</option>

                </select></td>
        </tr>

        <td>对应章节<font color="red">*</font>：</td>
        <td ><input type="text" ></td>
        </tr>




        <tr>
            <td colspan="2">

                <input  type="submit" name="login" value="添加" >
                <input  type="submit" name="reset" value="重置" ><br>
            </td>

        </tr>


    </table>


</div>
</form>
</body>
</html>
