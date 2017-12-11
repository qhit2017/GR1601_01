<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17-11-21
  Time: 下午8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table width="300" height="90" align="center" border="0">
    <tr>
      <td> <input type="submit" value="开始考试" ></td>
      <td><input type="submit" value="取消" ><br></td>
  </tr>

</table>
<p align="center">请选择参加考试的班级及开考时间</p><br>
<table width="300" height="90" align="center" border="1">
<tr>
    <td>班级</td>
    <td>开考时间</td>
    <td><input type="submit" value="添加"></td>
</tr>
    <tr>
        <td><select width="30">
            <option value="G3T53" >G3T53</option>
            </select>
        </td>
        <td><input type="text"   name="pname" value=""></td>
        <td></td>
    </tr>
    <tr>
        <td><select width="30">
            <option value="G3T54">G3T54</option>
           </select >
        </td>
        <td><input type="text"   name="pname" value=""></td>
        <td><input type="submit" value="删除"></td>
    </tr>

</table>



</body>
</html>
