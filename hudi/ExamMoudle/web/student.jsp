<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/29
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script language="JavaScript" src="js/ajaxfileupload.js"></script>
    <script language="JavaScript">
        $(document).ready(function () {
            $("#btn1").click(function () {
                //发送ajax请求，把所选择的图上传到服务器内存
                $.ajaxFileUpload({
                    url:"uploadImg",
                    fileElementId:"upload",
                    secureuri:false,
                    type:"post",
                    dataType:"json",
                    success:function (msg) {
                       var obj  = $.parseJSON(msg);
                        alert(obj.path);
                       /*$("#imgresult").val( obj.path);*/
                        $("#img1").attr("src",obj.path);
                    }
                });
            });

        });

    </script>
</head>
<body>



<form action="" method="post">
    <input type="text" name="snumber"><br>
    <input type="text" name="sname"><br>
    <select name="ssex">
        <option value="男">男</option>
        <option value="女">女</option>
    </select><br>

    <select name="senter">
        <option value="2016">2016</option>
        <option value="2017">2017</option>
    </select><br>

    <select name="cid">

    </select>
      <br>
    <input type="text" id="imgresult"><br>

    <input type="submit" value="添加">

</form>

<input type="file" id="upload" name="upload"><br>

<input type="button" id="btn1" value="上传"><br>
照片：<img id="img1" src="">
</body>
</html>
