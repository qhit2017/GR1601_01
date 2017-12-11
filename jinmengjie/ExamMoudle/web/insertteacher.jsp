<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/20/020
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="core" %>
<html>
<head>
    <title>添加教师页面</title>
</head>
<style>
    #bigdiv{
        position: absolute;
        width: 1000px;
        height: 600px;
        background: gainsboro;
        align-content: center;
        left: 300px;
    }


</style>
<script language="JavaScript" src="js/jquery-3.2.1.js"></script>
<script>

    //接收控制器中账号生成的值并显示到界面
  $(document).ready(function () {
      //是对添加教师界面的教师增加中的(显示教师信息的编号)的操作（针对添加教师insertteacher界面的操作）
      $.ajax({
          url:"addAndupdate",
          type:"get",
          success:function (msg) {
              var obj = eval(msg);
              $("#showtnumber").val(obj[0].tnumber);
              $("#tid").val(obj[0].tid);
          }
      })
  })

    function qvxiao() {
        var tid = $("#tid").val();
        alert(tid)
        window.location.href="cancelteacherinfo?tid="+tid;
    }

</script>
<body>
<form action="insertteacherinfo" method="post">
    <div id="bigdiv">
    <table <%-- border="1px";--%> style ="width: 550px; height: 400px; left: 150px; text-align: center; position: relative; bottom: 100px;" >

        <caption style="text-align: center"><input type="text" name="tid" id="tid" readonly="true" style="display:none">添加教师</caption>
        <tr>

            <td >账号:</td>
            <td ><input type="text" name="tnumber" id="showtnumber" readonly="true"></td>
        </tr><br>
        <tr>
            <td>姓名：</td>
            <td><input type="text" name="tname"> <font color="red">*</font></td>
        </tr><br>
        <tr>
            <td>性别：</td>
            <td >
                <select name="tsex">
                <option value="男">男</option>
                <option value="女">女</option>
            </select><font color="red">*</font></td>
        </tr><br>
        <tr>
            <td>生日：</td>
            <td><input type="text" name="tbirthday"> </td>
        </tr><br>
        <tr>
            <td>学历：</td>
            <td><input type="text" name="teducation"></td>
        </tr><br>
        <tr>
            <td>联系电话：</td>
            <td><input type="text" name="ttel"></td>
        </tr><br>
        <tr>
            <td>岗位：</td>
            <td> <select name="tjob">
                <option value="0">讲师</option>
                <option value="1">班主任</option>
            </select><font color="red">*</font></td>
        </tr><br>

        <tr>
            <td>备注：</td>
            <td ><textarea rows="3" cols="20" name="tremark"></textarea></td>
     </tr><br>
        <tr style="text-align: center; position: relative; left: 300px">
            <td >

                <input  type="submit" name="login" value="确定" id="showinsertteacherinfo">
                <input  type="button" name="reset" value="取消" onclick="qvxiao()" ><br></td>
        </tr>
</form>

    </table>


</div>

</body>
</html>
