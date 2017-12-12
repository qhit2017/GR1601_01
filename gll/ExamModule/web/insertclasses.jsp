<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/21
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/insertclasses.css">
<html>
<head>
    <title>添加班级界面</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
           $("#but_add").click(function () {
                alert($("#cnumber").val());
                $.ajax({
                    url:"insertclassesinfo?cnumber="+$("#cnumber").val()+"&cname="+$("#cname").val()+"&cdirection="+$("#cdirection").val()+"&teachersl="+$("#teachersl").val()+"&teachersh="+$("#teachersh").val()+"&cbegin="+$("#cbegin").val()+"&cg1="+$("#cg1").val()+"&cg2="+$("#cg2").val()+"&cg3="+$("#cg3").val()+"&cstate="+$("#cstate").val()+"&cremark="+$("#cremark").val(),
                    type:"get",
                    success:function () {
                        window.location.href = "classes.jsp";
                    }
                });
            });
        });
    </script>
</head>
<body>
<div id="ic_add">

    班级代码：<input type="text" id="cnumber"><br>
    班级名称：<input type="text" id="cname"><br>
    所属方向：<select id="cdirection">
                <option value="JAVA">JAVA</option>
             </select><br>

    班主任：<select id="teachersl">
                <option value="王静">王静</option>
            </select><br>
    讲师：<select id="teachersh">
                <option value="胡迪">胡迪</option>
            </select><br>
    开班日期：<input type="text" id="cbegin"><br>
    TI开班人数：<input type="text" id="cg1"><br>
    T2开班人数：<input type="text" id="cg2"><br>
    T3开班人数：<input type="text" id="cg3"><br>
    状态：<select id="cstate">
                <option value="0">启用</option>
                <option value="1">禁用</option>
            </select><br>
    备注：<textarea rows="2" cols="20" id="cremark"></textarea><br>
    <input type="button" value="添加" id="but_add">&nbsp;&nbsp;&nbsp;<input type="button" value="取消">

</div>
</body>
</html>
