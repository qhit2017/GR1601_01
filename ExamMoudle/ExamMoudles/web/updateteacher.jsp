<%--
  Created by IntelliJ IDEA.
  User: 王英豪
  Date: 2017/11/20
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>

    <table>
        <td>
            <tr><td>添加教师</td></tr>
            <tr><td>账号：<input type="text" name=""></td></tr>
        <tr><td>姓名：<input type="text" name=""></td></tr>
        <tr><td>性别：<select name="ComboBox">
            <option value="0" selected>男</option>
            <option value="1" selected>女</option>
        </select></td></tr>
        <tr><td>生日：<input type="text" name=""></td></tr>
        <tr><td>学历：<input type="text" name=""></td></tr>
        <tr><td>联系电话：<input type="text" name=""></td></tr>
        <tr><td>岗位：<select name="ComboBox">
            <option value="0" selected>讲师</option>
            <option value="1" selected>班主任</option>
        </select></td></tr>
        <tr><td>备注： <textarea cols='50' rows='10'></textarea></td></tr>
            <tr><td><input type="submit" value="修改"><input type="submit" value="取消"></td></tr>
        </td>
    </table>

</form>
</body>
</html>
