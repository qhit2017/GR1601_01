<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/4
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
   <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <%--<link rel="stylesheet" type="text/html" href="/js/jquery.min.js">--%>
    <title>Title</title>
    <script type="text/javascript" src="jquery.min.js"></script>
<%--<script language="JavaScript" src="web/js/jquery.min.js"></script>--%>
    <script language="JavaScript">
        $(document).ready(function () {
            $.ajax({
                url: "queryshow",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg)
                    var table = "<tr style=' display: inline color: #000033'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < obj.length; i++) {
                     var   str = str + "<tr style=' display: inline color: #000033'> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].tnumber + "</td> <td class='tablemargin'>" + obj[i].tname + "</td> <td class='tablemargin'>" + obj[i].tsex + "</td> <td class='tablemargin'>" + obj[i].tbirthday + "</td> <td class='tablemargin'>" + obj[i].tphone + "</td> <td class='tablemargin'>" + obj[i].ttel + "</td> <td class='tablemargin'>" + obj[i].tjob + "</td>  <td class='tablemargin'><a onclick='bianji("+obj[i].tid +")'>编辑</a> <a onclick='chong(" + obj[i].tid + ")'> 重置密码</a> <a onclick='shan(" + obj[i].tid + ")'> 删除</a></td> </tr>";
                    }
                    var allinfo = table + str;
                    $("#cs").html(allinfo);
                }
            });
            //多条件查询
            $("#cx").click(function () {
                var tnumber = $("#tnumber").val();
                var tname = $("#tname").val();
                var tjob = $("#tjob").val();
                $.ajax({
                    url:"selectall?tnumber=" + tnumber + "&tname=" + tname + "&tjob=" + tjob,
                    type:"get",
                    success:function (msg) {
                        var obj=eval(msg);

                        var table="<tr style='background-color: yellow'> <th class='tablemargin'>序号</th> <th class='tablemargin'>账号</th> <th class='tablemargin'>姓名</th> <th class='tablemargin'>性别</th> <th class='tablemargin'>生日</th> <th class='tablemargin'>学历</th> <th class='tablemargin'>联系电话</th> <th class='tablemargin'>岗位</th> <th class='tablemargin'>操作</th> </tr>";
                           for (var i=0;i< obj.length;i++){
                          var  str = str+"<tr> <td class='tablemargin'>"+ obj[i].tid+"</td> <td class='tablemargin'>"+ obj[i].tnumber+"</td> <td class='tablemargin'>"+ obj[i].tname+"</td> <td class='tablemargin'>"+ obj[i].tsex+"</td> <td class='tablemargin'>"+ obj[i].tbirthday+"</td> <td class='tablemargin'>"+ obj[i].tphone+"</td> <td class='tablemargin'>"+ obj[i].ttel+"</td> <td class='tablemargin'>"+ obj[i].tjob+"</td>  <td class='tablemargin'><a onclick='bianji(" +obj[i].tid + ")'> 编辑</a> <a onclick='chong(" + obj[i].tid + ")'> 重置密码</a> <a onclick='deletebytid(" + obj[i].tid + ")'> 删除 </a></td> </tr>";

                        }
                        var allinfo =table+str;
                        $("#cs").html(allinfo);
                    }
                });

            });

            //编辑
            function bianji(add) {
                var tid = add;
                $.ajax({
                    url: "xiuteacherinfo?tid=" + tid,
                    type: "get",
                    success: function (msg) {
                        var result = $.parseJSON(msg);
                        var info = " <tr style='text-align: center;'> <td colspan='2' ><b>+添加教师</b></td></tr><tr> <td >账号:</td><td >" + result.teachers.tnumber + "</td> </tr> <tr> <td>姓名:</td> <td><input type='text'id='tname' value='" + result.teachers.tname + "'></td> </tr> <tr> <td>性别:</td><td><select id='tsex'> <option value='男'>男</option> <option value='女'>女</option> </select></td> </tr> <tr> <td>生日:</td><td><input type='text' id='tbirthday' value='" + result.teachers.tbirthday + "'></td> </tr> <tr> <td>学历:</td> <td><input type='text' id='tphone' value='" + result.teachers.tphone + "'></td> </tr> <tr> <td>联系电话:</td><td><input type='text'id='ttel' value='" + result.teachers.ttel + "'></td> </tr> <tr> <td>岗位:</td><td> <select id='tjob'> <option value='0'>讲师</option><option value='1'>班主任</option> </select></td> </tr> <tr> <td>备注</td> <tr> <td><textarea cols='40' rows='3' id='tremark' >" + result.teachers.tremark + "</textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input type='button' value='确认' onclick='save(" + result.teachers.tid + ")' >&nbsp;&nbsp;&nbsp;&nbsp; <input type='button' value='取消' onclick='xiaoshi(),deletebytid(" + tid + "),refresh();'></td> </tr>";
                        $("#quester").html(info);
                        $("#quester").xiaoshi();

                    }
                });
            }
            //重置密码
            function chong(b) {
                var tid = b;
                $.ajax({
                    url:"resetpassword?tid="+tid,
                    type:"get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        if(obj.result=="1"){
                            alert("密码重置成功！！！");
                        }
                        else{
                            alert("密码重置失败！！！");
                        }
                    }
                });
            }

            //删除
            function deletebytid(c) {
                var tid = c;
                $.ajax({
                    url:"deleteinfo?tid="+tid,
                    type:"get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);

                        if (obj.result == "1") {
                            alert("删除成功！！！");
                            //刷新界面
                            refresh();
                        }
                        else {
                            alert("删除失败！！！");
                        }
                    }
                });
            }


            });


    </script>
</head>
<body>
<div>
    <div>
        <a href="tianjiajiaoshi.jsp" id="add" onclick="string();">增加</a>
        账号：<input type="text" id="tnumber">&nbsp;&nbsp;&nbsp;
        教师姓名:<input type="text" id="tname">&nbsp;&nbsp;&nbsp;
        岗位：<select name="select" id="tjob">
            <option value="0">请选择</option>
            <option value="1">班主任</option>
            <option value="2">讲师</option>
        </select>&nbsp;&nbsp;&nbsp;
       <input type="button" value="查询" id="cx">
    </div>

<form action="queryshow" method="get">
      <table id="cs" cellpadding="0" cellspacing="0">
         <%-- <tr>
              <th>序号</th>
              <th>账号</th>
              <th>姓名</th>
              <th>性别  </th>
              <th>生日</th>
              <th>学历</th>
              <th>联系电话</th>
              <th>岗位</th>
              <th>操作</th>
          </tr>
          <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
          </tr>
          <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
          </tr>--%>
      </table>

</form>
   <div>
      <a onclick="shan();"> 删除</a>
       <a onclick="refresh();">刷新</a>

   </div>


</div>

</body>
</html>
