<%--
  Created by IntelliJ IDEA.
  User: 王英豪
  Date: 2017/11/21
  Time: 9:32
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
            <tr><td>班级代码:<input type="text" name=""></td></tr>
            <tr><td>班级名称:<input type="text" name=""></td></tr>
            <tr><td>所属方向:<select name="ComboBox">
                <option value="0" selected>开发</option>
                <option value="1" selected>运营</option>
                <option value="2" selected>维护</option>  </select></td></tr>
            <tr><td>班主任:<select name="ComboBox">
                <option value="0" selected>男</option>
                <option value="1" selected>女</option>
            </select></td></tr>
            <tr><td>讲师:<select name="ComboBox">
                <option value="0" selected>男</option>
                <option value="1" selected>女</option>
            </select></td></tr>
            <tr><td>开班日期:<input type="text" name=""></td></tr>
            <tr><td>G1开班人数<input type="text" name=""></td></tr>
            <tr><td>G2开班人数<input type="text" name=""></td></tr>
            <tr><td>G3开班人数<input type="text" name=""></td></tr>
            <tr><td>状态：<select name="ComboBox">
                <option value="0" selected>启用</option>
                <option value="1" selected>关闭</option>
            </select></td></tr>
            <tr><td>备注：<input type="text" name=""></td></tr>
            <tr><td><input type="submit" value="确定"><input type="submit" value="取消"></td></tr>
        </td>
    </table>

</form>

</body>
</html>
