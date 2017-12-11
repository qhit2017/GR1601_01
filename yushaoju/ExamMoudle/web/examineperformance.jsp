<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" width="900px" height="500px">
    <tr>
        <td colspan="7">
            【struts2考试1】成绩列表
        </td>

    </tr>
    <tr>班级:
        <select name="ComboBox">
            <option value="0" selected>SCCE</option>
            <option value="1" selected>JAVA</option>
            <option value="2" selected>JS</option>
        </select>
        学号姓名:<input type="text" name="">
        <button>查询</button>
    </tr>

    <tr>
        <td colspan="7">
            查询结果 及格人数 及格率
        </td>

    </tr>
    <tr>
        <td>序号	</td>
        <td>姓名	</td>
        <td>	班级</td>
        <td>开考时间	</td>
        <td>结束时间	</td>
        <td>	分数</td>
        <td>	操作</td>


    </tr>
    <tr>
        <td>序号	</td>
        <td>姓名	</td>
        <td>	班级</td>
        <td>开考时间	</td>
        <td>结束时间	</td>
        <td>	分数</td>
        <td>	操作</td>


    </tr>
</table>
</body>
</html>
