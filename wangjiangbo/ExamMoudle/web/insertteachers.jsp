<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/11/21
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>添加教师界面</title>
    <style>
        #sex{
            width: 80px;
        }
        #job{
            width:80px;
        }
        #remark{
            width:500px;
            height: 100px;
            border-style: solid;
        }
        #number{
            border-style: none;
        }
        #tid{
            border-style: none;
            /*background-color: red;*/
        }
    </style>
    <script type="text/javascript"src="js/jquery.min.js"></script>
    <script>
        /*显示账号信息*/
        $(document).ready(function () {
            $.ajax({
                url:"insertnumber",
                type:"get",
                success:function (msg) {
                    var obj = $.parseJSON(msg);
                    var numberresult=obj.tnumber;
                    var tidresult=obj.tid;
                    $("#number").val(numberresult);
                    $("#tid").val(tidresult);
                }
            });
        });
    </script>

    <script>

</script>
</head>
<body>
<form action="insertteachers" method="post">
   <center> <div id="main">
       <div>添加教师</div><br>
              <input type="hidden" name="tid" id="tid"><br>
        账号：<input type="text" name="tnumber" readonly id="number"><br><br>
        姓名：<input type="text" name="tname" id="tname"><br><br>
        性别：<select id="sex" name="tsex">
                    <option value="" >男</option>
                    <option value="">女</option>
              </select><br><br>
        生日：<input type="text" name="tbirthday" id="tbirthday"><br><br>
        学历：<input type="text" name="ttel" id="ttel"><br><br>
        电话：<input type="text" name="tphone" id="tphone"><br><br>
        岗位：<select id="job" name="tjob">
                   <option value=""></option>
                   <option value=""></option>
              </select><br><br>
        备注：<input type="text" id="remark" name="tremark"><br>
        <input type="submit" name="" value="确定">
        <input type="submit" name="" value="取消">
   </div></center>
</form>
</body>
</html>
