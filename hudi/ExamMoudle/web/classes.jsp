<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/28
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>

    <script language="JavaScript">
        $(document).ready(function () {

            /*去版主任*/
            $.ajax({
                url:"queryJob0",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);

                    var str="";
                    for(var i=0;i<obj.length;i++){
                        str = str+' alue="'+obj[i].tid+'">'+obj[i].tname+'</option>';
                    }



                    $("#tjob0").html(str);
                }
            });

            /*去讲师*/
            $.ajax({
                url:"queryJob1",
                type:"get",
                success:function (msg) {
                    var obj = eval(msg);

                    var str="";
                    for(var i=0;i<obj.length;i++){
                        str = str+'<option value="'+obj[i].tid+'">'+obj[i].tname+'</option>';
                    }

                    $("#tjob1").html(str);
                }
            });


        });
    </script>

</head>
<body>


班主任 <select id="tjob0">


</select><br>

讲师 <select id="tjob1">


</select>

</body>
</html>
