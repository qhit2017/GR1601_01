<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 12/5/2017
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="JavaScript" src="js/jquery-3.2.1.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    html,body {
        overflow: hidden;
        height: 100%;
        margin: 0;
        padding: 0;
        font: 14px/1.8 Georgia, Arial, Simsun;
    }

    html {
        _padding: 110px 0;
    }

    #hd {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100px;
        background:#2a5caa ;
    }

    #bd {
        position: absolute;
        top: 110px;
        right: 0;
        bottom: 110px;
        left: 0;
        overflow: hidden;
        width: 100%;
        _height: 100%;
    }

    #side {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        overflow: auto;
        width: 200px;
        _height: 100%;
        background:#f6f5ec;
    }

    #main {
        position: absolute;
        _position: static;
        top: 0;
        right: 0;
        bottom: 0;
        left: 210px;
        overflow: auto;
        _overflow: hidden;
        _height: 100%;
        _margin-left: 210px;

    }

    #content {
        _overflow: auto;
        _width: 100%;
        _height: 100%;
    }

    #ft {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100px;
        background: #94d6da;
    }
    /* 与布局无关，一些说明性内容样式 */
    .tit-layout {
        margin: 30px 0 0;
        font-size: 18px;
        text-align: center;
    }

    .copyright {
        font-weight: bold;
        text-align: center;
    }

    #feature {
        width: 200%;
        line-height: 4;
    }

    #feature .hd {
        padding: 20px 15px;
    }

    #feature .hd h2 {
        margin: 0;
        font-size: 16px;
    }

    #feature .bd ol {
        margin-top: 0;
    }

    #feature .bd h3 {
        margin: 0;
        padding: 0 15px;
        font-size: 14px;
    }

    #feature .ft {
        padding: 10px 15px 30px;
    }
    a:link{                                      /*超链接正常状态下在样式*/
        color:red;                          /*红色*/
        text-decoration:none       /*无下划线*/
    }

</style>



<script>
    $(document).ready(function () {
        $.ajax({
            url: "showteacherinfo",
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var str = " ";
                var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>地址</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>操作</td> </tr>";
                for (var i = 0; i < obj.length; i++) {
                    str = str + "<tr> <td class='tablemargin'>" + obj[i].mid + "</td><td class='tablemargin'>" + obj[i].mname + "</td> <td class='tablemargin'>" + obj[i].maddr + "</td> <td class='tablemargin'>" + obj[i].mage + "</td> <td class='tablemargin'>" + obj[i].msex + "</td> <td class='tablemargin'>" + obj[i].mphone + "</td>  <td class='tablemargin'><input type='button' onclick='edit(" + obj[i].tid + ")' value='编辑'> <input type='button' onclick='repwd(" + obj[i].mid + ")' value='重置密码'><input type='button' onclick='delete1(" + obj[i].mid + ")' value='删除'></td></tr>"
                }
                var alltable = titleinfo + str;
                $("#tableteacherinfo").html(alltable);
            }
        })


        //条件查询的方法
        $("#tijiao").click(function () {

           var varmid = $("#mid").val();
            var varmname = $("#mname").val();

            $.ajax({
                url: "SelectMessage?mid="+varmid+"&mname="+varmname,
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = " ";
                    var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>地址</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr> <td class='tablemargin'>" + obj[i].mid + "</td><td class='tablemargin'>" + obj[i].mname + "</td> <td class='tablemargin'>" + obj[i].maddr + "</td> <td class='tablemargin'>" + obj[i].mage + "</td> <td class='tablemargin'>" + obj[i].msex + "</td> <td class='tablemargin'>" + obj[i].mphone + "</td>  <td class='tablemargin'><input type='button' onclick='edit(" + obj[i].tid + ")' value='编辑'> <input type='button' onclick='repwd(" + obj[i].tid + ")' value='重置密码'><input type='button' onclick='delete1(" + obj[i].tid + ")' value='删除'></td></tr>"
                    }
                    var alltable = titleinfo + str;
                    $("#tableteacherinfo").html(alltable);
                }
            })
        });







        //条件查询的方法
        $("#tijiao").click(function () {

            var varmid = $("#mid").val();
            var varmname = $("#mname").val();

            $.ajax({
                url: "SelectMessage?mid="+varmid+"&mname="+varmname,
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = " ";
                    var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>地址</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr> <td class='tablemargin'>" + obj[i].mid + "</td><td class='tablemargin'>" + obj[i].mname + "</td> <td class='tablemargin'>" + obj[i].maddr + "</td> <td class='tablemargin'>" + obj[i].mage + "</td> <td class='tablemargin'>" + obj[i].msex + "</td> <td class='tablemargin'>" + obj[i].mphone + "</td>  <td class='tablemargin'><input type='button' onclick='edit(" + obj[i].mid + ")' value='编辑'> <input type='button' onclick='repwd(" + obj[i].mid + ")' value='重置密码'><input type='button' onclick='delete1(" + obj[i].mid + ")' value='删除'></td></tr>"
                    }
                    var alltable = titleinfo + str;
                    $("#tableteacherinfo").html(alltable);
                }
            })
        });

    });

    //条件查询的方法
    $("#tijiao").click(function () {

        var varmid = $("#mid").val();
        var varmname = $("#mname").val();

        $.ajax({
            url: "SelectMessage?mid="+varmid+"&mname="+varmname,
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var str = " ";
                var titleinfo = "<tr style='background-color: darkgrey'> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>地址</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>其他</td> <td class='tablemargin'>操作</td> </tr>";
                for (var i = 0; i < obj.length; i++) {
                    str = str + "<tr> <td class='tablemargin'>" + obj[i].mid + "</td><td class='tablemargin'>" + obj[i].mname + "</td> <td class='tablemargin'>" + obj[i].maddr + "</td> <td class='tablemargin'>" + obj[i].mage + "</td> <td class='tablemargin'>" + obj[i].msex + "</td> <td class='tablemargin'>" + obj[i].mphone + "</td>  <td class='tablemargin'><input type='button' onclick='edit(" + obj[i].mid + ")' value='编辑'> <input type='button' onclick='repwd(" + obj[i].mid + ")' value='重置密码'><input type='button' onclick='delete1(" + obj[i].mid + ")' value='删除'></td></tr>"
                }
                var alltable = titleinfo + str;
                $("#tableteacherinfo").html(alltable);
            }
        })
    });


    //教师界面 -----》主页加载完之后点击删除
    function  delete1(deletetid) {
        var dmid = deletetid;
        $.ajax({
            url: "deleteteacher?mid="+dmid,
            type: "get",
            success: function (msg) {
                var obj = $.parseJSON(msg);
                if (obj.result = "true") {
                    alert("删除成功");
                } else {
                    alert("删除失败");
                }
                reflesh();
            }
        })
    }


</script>



</head>


<body>

<div id="hd">
    <h1 class="tit-layout">在线考试管理系统</h1>
</div>
<div id="bd">
    <div id="side">

    </div>
    <div id="main">
        <div id="content">
            <div id="feature" class="feature">
                <div>

                    <table   width="1000px" height="80px">
                        <tr>
                            <td width="45%" ><a href="teachertest.html"><input type="button" value="添加教师"> </a></td>
                            <td width="30%"><b>教师列表</b></td>
                            <td width="30%"></td>
                        </tr>
                        <tr>
                            <td width="30%">账号：<input type="text" name="mid" id="mid"></td>

                            <td width="30%">教师名字：<input type="text" name="mname" id="mname"></td>
                            <td width="30%">

                              <input type="submit" value="查询" id="tijiao">

                            </td>
                        </tr>
                    </table>


                        <table class="tableteacher" border="1" style="width:800px;position: relative" id="tableteacherinfo">
                            <tbody>
                            &nbsp
                            </tbody>
                        </table>

                </div>

                <div class="bd">


                </div>

            </div>
        </div>
    </div>
</div>


</body>
</html>

