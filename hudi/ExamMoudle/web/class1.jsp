<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/4
  Time: 8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <SCRIPT LANGUAGE="JavaScript" SRC="js/jquery.min.js"></SCRIPT>
    <SCRIPT>

        $.AJAX({

            success:function (msg) {
                var obj= eval(msg);
                for(var i=0;i<obj.length;i++){

                    //画格
                    $.ajax({
                        
                        success:function () {
                            
                        }
                    });
                }

            }
        })
    </SCRIPT>
</head>
<body>
<a href="filedown?filename=student.xlsx">学生信息模板下载</a>

<a href="teacherdown?filename=teacher.xlsx">老师信息导出</a>



</body>
</html>
