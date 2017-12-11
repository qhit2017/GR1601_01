
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>开始考试</title>

</head>
<link rel="stylesheet" type="text/css" href="../css/insertteacher.css"/>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/thems.css">
<link rel="stylesheet" type="text/css" href="../css/teacher.css">
<link rel="stylesheet" type="text/css" href="../css/writte.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<body>
<div id="beintain_ton">
    <a href="" class="btn">开始试卷</a>
    <a href="" class="btn">取消</a>

</div>
<div id="ton">请选择参加考试班级的开考时间</div>
<div  id="teacher"style="color: #BABABA" >
    <div id="main"  style= "width: 800px"  >
        <div id="content" style="color: #BABABA">
        </div>

            <table width="80%" border="1px" >

                <tr>
                    <td style="width: 300px"  height="40px">班级</td>
                    <td style="width: 300px">开始考试</td>
                    <td style="width: 100px"><a href="" class="btn">添加</a></td>
                </tr>

                <tr>
                    <td style="width: 300px" height="40px">

                        <select name="select" id="select_k3" class="xla_k">
                            <option value="0">G1</option>
                            <option value="1">2017</option>
                            <option value="2">2018</option>
                        </select></td>

                    <td style="width: 300px" height="40px">

                        <select name="select" id="select_k4" class="xla_k">
                            <option value="0">2016</option>
                            <option value="1">2017</option>
                            <option value="2">2018</option>
                        </select>
                    </td>

                    <td style="width: 300px" height="40px">
                       <%-- <select name="select" id="select_k5" class="xla_k">
                            <option value="0">2016</option>
                            <option value="1">2017</option>
                            <option value="2">2018</option>
                        </select>--%>
                    </td>
                </tr>

                    <tr>
                        <td>
                        <select name="select" id="select_k2" class="xla_k">
                            <option value="0">2016-1-5</option>
                            <option value="1">2017-5-6</option>
                            <option value="2">2018</option>
                        </select>
                    </td>

                        <td><select name="select" id="select_k1" class="xla_k">
                            <option value="0">2016-1-5</option>
                            <option value="1">2017-5-6</option>
                            <option value="2">2018</option>
                        </select>
                        </td>

                        <td>
                            <a href="" class="btn">添加</a>
                        </td>

                    </tr>

                </tr>




            </table>
        </div>
</div>

</body>
</html>
