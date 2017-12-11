<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/7
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生</title>
    <script language="JavaScript" src="jquery.min.js"></script>
    <script language="JavaScript">
        $(document).ready(function () {

            //显示主页面
            //发送ajax
            $.ajax({
                url: "showStudent",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    var table = "<tr style='background-color: darkgrey'><td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td><td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr> <td class='tablemargin'>" + obj[i].sid + "</td><td class='tablemargin'>" + obj[i].snumber + "</td> <td class='tablemargin'>" + obj[i].senter + "</td> <td class='tablemargin'>" + obj[i].sname + "</td> <td class='tablemargin'>" + obj[i].ssex + "</td> <td class='tablemargin'>" + obj[i].stel + "</td> <td class='tablemargin'><a onclick='chakan(" + obj[i].sid + ")' >查看</a> <a onclick='bianji(" + obj[i].sid + ")' >编辑</a><a onclick='chong(" + obj[i].sid + ")'> 重置密码</a> <a onclick='shan(" + obj[i].sid + ")'> 删除</td></a> </tr>";
                    }
                    var allinfo = table + str;
                    $("#qi").html(allinfo);
                }
            });
          $("#cx").click(function () {
              var snumber = $("#snumber").val();
              var sname =$("#sname").val();

              $.ajax({
                  url:"condition?snumber="+snumber+"&sname="+sname,
                  type:"get",
                  success:function (msg) {
                     var obj = eval(msg)
                     var str="";
                      for (var i = 0; i < obj.length; i++) {
                          str = str + "<tr> <td class='tablemargin'>" + obj[i].sid + "</td><td class='tablemargin'>" + obj[i].snumber + "</td> <td class='tablemargin'>" + obj[i].senter + "</td> <td class='tablemargin'>" + obj[i].sname + "</td> <td class='tablemargin'>" + obj[i].ssex + "</td> <td class='tablemargin'>" + obj[i].stel + "</td> <td class='tablemargin'><a onclick='chakan(" + obj[i].sid + ")' >查看</a> <a onclick='bianji(" + obj[i].sid + ")' >编辑</a><a onclick='chong(" + obj[i].sid + ")'> 重置密码</a> <a onclick='shan(" + obj[i].sid + ")'> 删除</td></a> </tr>";
                      }
                      $("#qi").html(str)
                  }
              })
          })
        })
    </script>
</head>
<body>
<div>
 <div>
      <span>
          <a href="insertstudent.jsp">增加</a>
      </span>
     <span>
         <input type="button" value="学生信息导出">
     </span>
     <span>
         <input type="button" value="学生信息导入">
     </span>
     <span>
         <input type="button" value="学生信息空模版下载">
     </span><br>
     <span>
         学号：<input type="text" id="snumber">
     </span>
     <span>
         姓名：<input type="text" id="sname">
     </span>
     <span>
         班级：   <select id="cid">
                       <option>请选择</option>
                        <option>2</option>
                        <option>4</option>
                  </select>
     </span>
     <span>
         入学年份：   <select id="sbirthday">
                       <option>请选择</option>
                  </select>
     </span>
     <span>
        就读方向：   <select id="fangxiang">
                       <option>请选择</option>
                  </select>
     </span>
     <input type="button" value="查询" id="cx">


 </div>
    <form action="showStudent" method="get">
        <table id="qi">

        </table>
    </form>


</div>

</body>
</html>
