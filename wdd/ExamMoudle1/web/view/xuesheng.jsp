
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">


<head>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/thems.css">

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script language="JavaScript" src="js/jquery.min.js"></script>

    <title>学生管理</title>
    <!--框架高度设置-->
    <script type="text/javascript">
        $(function(){
            //自适应屏幕宽度
            window.onresize=function(){ location=location };

            var w_height=$(window).height();
            $('.bg_img').css('height',w_height+'px');

            var bg_wz=1920-$(window).width();
            $('.bg_img img').css('margin-left','-'+bg_wz/2+'px')

            $('.language .lang').click(function(){
                $(this).siblings('.lang_ctn').toggle();
            });
        })
    </script>
    <script>
        $(document).ready(function () {
            //显示主页面
            //发送ajax
            $.ajax({
                url: "showdd",
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "";
                    var table = "<tr style='background-color: darkgrey'><td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td><td class='tablemargin'>操作</td> </tr>";

                    for (var i = 0; i < obj.length; i++) {

                        str = str + "<tr> <td class='tablemargin'>" + obj[i].sid + "</td><td class='tablemargin'>" + obj[i].snumber + "</td> <td class='tablemargin'>" + obj[i].senter + "</td> <td class='tablemargin'>" + obj[i].sname + "</td> <td class='tablemargin'>" + obj[i].ssex + "</td> <td class='tablemargin'>" + obj[i].stel + "</td> <td class='tablemargin'><a onclick='chakan(" + obj[i].sid + ")' >查看</a> <a onclick='bianji(" + obj[i].sid + ")' >编辑</a><a onclick='chong(" + obj[i].sid + ")'> 重置密码</a> <a onclick='shan(" + obj[i].sid + ")'> 删除</td></a> </tr>";

                    }
                    var allinfo = table + str;
                    $("#bdd").html(allinfo);
                }
            });

            //条件查询
            $("#ww").click(function () {
                var snumber = $("#snumber").val();
                var sname = $("#sname").val();
                var senter=$("#senter").val();
                $.ajax({
                    url: "selectStudentinfo?snumber=" + snumber + "&sname=" + sname + "&senter=" + senter,
                    type:"get",
                    success:function (msg) {
                        var obj= eval(msg)
                        var str="";
                        var table = "<tr style='background-color: darkgrey'><td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td><td class='tablemargin'>操作</td> </tr>";

                        for(var i=0;i<obj.length;i++){

                            str = str + "<tr> <td class='tablemargin'>" + obj[i].sid + "</td><td class='tablemargin'>" + obj[i].snumber + "</td> <td class='tablemargin'>" + obj[i].senter + "</td> <td class='tablemargin'>" + obj[i].sname + "</td> <td class='tablemargin'>" + obj[i].ssex + "</td> <td class='tablemargin'>" + obj[i].stel + "</td> <td class='tablemargin'><a onclick='chakan(" + obj[i].sid + ")' >查看</a> <a onclick='bianji(" + obj[i].sid + ")' >编辑</a><a onclick='chong(" + obj[i].sid + ")'> 重置密码</a> <a onclick='shan(" + obj[i].sid + ")'> 删除</td></a> </tr>";

                        }
                        var allinfo=table+str;
                        $("#bdd").html(allinfo);

                    }

                });

            });
            //编辑
            function bianji(ff) {
                var sid = ff;
                $.ajax({
                    url: "stringinfo?sid=" + sid,
                    type: "get",
                    success: function (msg) {
                        var result = $.parseJSON(msg);
                        var table = "<tr style='background-color: darkgrey'><td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td><td class='tablemargin'>操作</td> </tr>";
                        $("#str").html(table);

                    }
                });
            }
            //重置密码
            function chong(b) {
                var sid = b;
                $.ajax({
                    url:"resetinfo?sid="+sid,
                    type:"get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);

                        if(obj.result=="true"){
                            alert("密码重置成功！！！");
                        }
                        else{
                            alert("密码重置失败！！！");
                        }
                    }
                });
            }
            //删除
            function shan(c) {
                var sid = c;
                $$.ajax({
                    url:"deleteinfo?sid="+sid,
                    type:"get",
                    success: function (msg) {
                        var obj = $$.parseJSON(msg);

                        if (obj.result == "true") {
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
            //查看
             function chakan(cc) {
                 var sid = cc;
                 $.ajax({
                     url: "saveOrupdateStudents?sid=" + sid,
                     type: "get",
                     success: function (msg) {
                         var result = $.parseJSON(msg);
                         var table = "<tr style='background-color: darkgrey'><td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>联系电话</td><td class='tablemargin'>操作</td> </tr>";
                         $("#str").html(table);

                     }
                 });
             }

        })


    </script>


</head>
<body>
<div id="hd">
    <h1 class="tit-layout">
        <div id="div1" ><a href="" style="text-decoration: none">注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>
        <div id="div2">在线考试</div>
    </h1>
</div>

<div id="bd">
    <div id="side" style="background-color: #fcfff2">
        <table width="100%">
            <tr>
                <td>教师管理</td>
            </tr>
            <tr>
                <td>班级管理</td>
            </tr>
            <tr>
                <td>学生管理</td>
            </tr>
            <tr>
                <td>题库管理</td>
            </tr>
            <tr>
                <td>试题管理</td>
            </tr>
            <tr>
                <td>成绩管理</td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>

        </table>

    </div>
    <div id="main">
        <div id="content">


            <div id="right_ctn">
                <div class="right_m">
                    <!--会议列表-->
                    <div class="hy_list">
                        <div class="box_t">
                            <span class="name">学生列表</span>

                        </div>
                        <!--查询-->
                        <div class="search">
                            <a href="tianjiaxuesheng.jsp" class="btn" readonly="true" id="ff">添加学生</a>
                            <input type="button" value="学生信息导出" id="dao">
                            <input type="file"/>
                            <a href="insertteacher.jsp" class="btn">学生信息导入</a>
                            <a href="insertteacher.jsp" class="btn">学生信息空模</a>
                           <br/>
                            <span>学号：</span>
                            <div class="s_text"><input name="" type="text" id="snumber"></div>
                            <span>姓名：</span>
                            <input name="" type="text" id="sname">
                            <span>班级</span>
                            <select name="select" id="senter" class="xla_k">
                                <option value="0">G1</option>
                                <option value="1">G2</option>
                                <option value="2">G3</option>
                            </select>
                            <span>入学年份</span>
                            <select name="select" id="sidnumber" class="xla_k">
                                <option value="0">2000</option>
                                <option value="1">1999</option>
                                <option value="2">1998</option>
                            </select>
                            <span>就读方向</span>
                            <select name="select" id="sprovince" class="xla_k">
                                <option value="0">高软</option>
                                <option value="1">3G4G</option>
                            </select>

                            <input type="button" value="查询" id="ww">

                        </div>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <br/>
                        <!--列表-->
                        <form action="showdd" method="get">
                            <table cellpadding="0" cellspacing="0" class="list_hy" id="bdd">
                               <%-- <tr>
                                    <th class="xz" scope="col">序号</th>
                                    <th scope="col">学号</th>
                                    <th class="zt" scope="col">班级</th>
                                    <th scope="col">姓名</th>
                                    <th scope="col">性别</th>
                                    <th scope="col">联系电话</th>
                                    <th scope="col">操作</th>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>--%>
                            </table>

                            <!--列表-->
                            <!--右边底部-->
                           <%-- <div class="r_foot">--%>
                                <div class="r_foot_m">
                                    <a href="" class="btn" onclick="shan()">删除</a>
                                    <a href="" class="btn" onclick="refresh()">刷新</a>
                                    <!--分页-->
                                    <div class="page">
                                        <a href="" class="prev"><img src="/images/icon7.png" alt=""/></a>
                                        <a class="now">1</a>
                                        <a href="">2</a>
                                        <a href="">3</a>
                                        <a href="">4</a>
                                        <a href="">5</a>
                                        <a href="">6</a>
                                        <a href="" class="next"><img src="/images/icon8.png" alt=""/></a>
                                    </div>
                                    <!--分页-->
                                </div>
                          <%--  </div>--%>
                        </form>
                        <!--右边底部-->
                    </div>
                    <!--会议列表-->
                </div>
            </div>





        </div>
    </div>
</div>

</body>
</html>

