<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/12/4
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="js/jquery.min.js"></script>
<html>
<head>
    <title>Title</title>
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

    </style>
    <%--<script>
        function update(tid) {
            alert(tid);
            var tname = $("#tname").val();
            var sex = $("#sex").val();
            var tbirthday = $("#tbirthday").val();
            var ttel = $("#ttel").val();
            var tphone = $("#tphone").val();
            var job = $("#job").val();
            var remark = $("#remark").val();
            alert(tname+":"+remark+":"+sex+":"+tbirthday+";"+ttel+";"+tphone);
         $.ajax({
             url:"update?tid"+id+"&tname"+tname+"&tsex"+sex+"&tbirthday"+tbirthday+"&ttel"+ttel+"&tphone"+tphone+"&tjob"+job+"&tremark"+remark,
            type:"get",
                 success:function (msg) {
                 var obj = $.parseJSON(msg);
                 if(obj.result=="true"){
                     alert("修改成功");
                 }else{
                     alert("修改失败");
                 }
             }
         });
      }
    </script>--%>

</head>
<body>
<form action="update" method="post">
    <div id="main"style="text-align: center">
        <div>添加教师</div><br>
        <input type="hidden" name="tid" value="<s:property value="teachers.tid"></s:property>"><br>
        账号：<input type="text" name="tnumber" readonly id="number" value="<s:property value="teachers.tnumber"></s:property>"><br><br>
        姓名：<input type="text" name="tname" id="tname" value="<s:property value="teachers.tname"></s:property>"><br><br>
        性别：<select id="sex" name="tsex" value="<s:property value="teachers.tsex"></s:property>">
                 <option value="男" >男</option>
                 <option value="女">女</option>
              </select><br><br>
        生日：<input type="text" name="tbirthday" id="tbirthday" value="<s:property value="teachers.tbirthday"></s:property>"><br><br>
        学历：<input type="text" name="ttel" id="ttel" value="<s:property value="teachers.ttel"></s:property>"><br><br>
        电话：<input type="text" name="tphone" id="tphone" value="<s:property value="teachers.tphone"></s:property>"><br><br>
        岗位：<select id="job" name="tjob" value="<s:property value="teachers.tjob"></s:property>">
                 <option value="0">讲师</option>
                 <option value="1">班主任</option>
              </select><br><br>
        备注：<input type="text" id="remark" name="tremark" value="<s:property value="teachers.tremark"></s:property>"><br>
              <input type="button" value="确定" onclick="update(<s:property value="teachers.tid"></s:property>)">
              <input type="button" value="取消">
    </div>
</form>
</body>
</html>
