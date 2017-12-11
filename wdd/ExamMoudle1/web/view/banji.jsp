<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">

<head>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/thems.css">

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>教师管理</title>

    <script language="JavaScript" src="js/jquery.min.js"></script>

    <script>
        //显示班级主界面
        $$=jQuery.noConflict();
        $$(document).ready(function () {
            //显示主页面
            //发送ajax
            $$.ajax({
                url: "showall",
                type: "get",
                success: function (msg) {
                    var pro = eval(msg)
                    var str1= "";
                    var table1 = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";

                    for (var i = 0; i < pro.length; i++) {

                           var str1 = str1 + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].tidl + "</td> <td class='tablemargin'>" + pro[i].tidh+ "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";

                    }

                    var allinfo1 = table1 + str1;
                    $$("#ss").html(allinfo1);


                }

            });
            //根据四个下拉框的条件进行信息查询
            $$("#hh").click(function () {
                var cbegin=$$("#cbegin").val();
                var cdirection=$$("#cdirection").val();
                var tidh=$$("#tidh").val();
                var tidl=$$("#tidl").val();
                $$.ajax({
                    url:"selectway?cbegin="+cbegin+"&cdirection="+cdirection+"&tidl="+tidl+"&tidh="+tidh,
                    type:"get",
                    success:function (msg) {
                        var pro=eval(msg);
                        var tabletitle="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                        for (var i=0;i<pro.length;i++){

                           // if(pro[i].teachersh==0){

                                var tableinfo=tableinfo+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].tidl+"</td> <td class='tablemargin'>"+pro[i].tidh+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit("+pro[i].cid+")'>编辑</a></td> </tr>";
                           // }
                           // if(pro[i].teachersh==1){

                               // var tableinfo=tableinfo+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].teachersl.tname+"</td> <td class='tablemargin'>"+pro[i].teachersh.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>关闭</td> <td class='tablemargin'><a onclick='edit("+pro[i].cid+")'>编辑</a></td> </tr>";
                          //  }
                        }
                        var table=tabletitle+tableinfo;
                        $$("#ss").html(table);
                    }
                });
            });
            //讲师信息下拉框
            $$.ajax({
                url:"selectTeachersTjob0",
                type:"get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                    }
                    var title="<option value=''>请选择</option>";
                    str1=title+str;
                    $$(tidh).html(str1);

                }

            })
            //班主任信息下拉框
            $$.ajax({
                url:"selectTeachersTjob1",
                type:"get",
                success:function (msg) {
                    var obj=eval(msg);
                    var str="";
                    for(var i=0;i<obj.length;i++) {
                        str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                    }
                    var title="<option value=''>请选择</option>";
                    str1=title+str;
                    $$(tidl).html(str1);

                }

            })

            //重置
        function chongzhi() {
            window.location.href="banji.jsp";

        }
          //编辑
        function edit(b) {
            window.location.href="QueryClasses?id="+b;

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
                            <span class="name">班级列表</span>

                        </div>
                        <!--查询-->
                        <div class="search">
                            <a href="chuangjianban.jsp" class="btn">新建班级</a>
                            <span>入学年份：</span>
                            <select name="select" id="cbegin" class="xla_k">
                                <option value="0">2000</option>
                                <option value="1">1999</option>
                            </select>
                            <span>所属方向：</span>
                            <select name="select" id="cdirection" class="xla_k">
                                <option value="0">高软</option>
                                <option value="1">3G4G</option>
                            </select>
                            <span>讲师：</span>
                            <select name="select" id="tidh" class="xla_k">
                                <option value="0">高软</option>
                                <option value="1">3G4G</option>
                            </select>
                            <span>班主任：</span>
                            <select name="select" id="tidl" class="xla_k">
                                <option value="0">李</option>
                                <option value="1">高</option>
                            </select>
                            <input type="button" value="查询" id="hh">
                                <input type="reset" onclick="chongzhi()">

                        </div>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->
                        <form action="showall" method="get">
                            <table cellpadding="0" cellspacing="0" class="list_hy" id="ss">
                                <tr>
                                <th class="xz" scope="col">序号</th>
                                <th scope="col">班级代码</th>
                                <th class="zt" scope="col">班级名称</th>
                                <th scope="col">所属方向</th>
                                <th scope="col">班主任</th>
                                <th scope="col">讲师</th>
                                <th scope="col">开班日期</th>
                                <th scope="col">状态</th>
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
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                            <!--列表-->
                            <!--右边底部-->
                          <%--  <div class="r_foot">--%><br><br><br><br>
                                <div class="r_foot_m">
                                    <a href="" class="btn">删除</a>
                                    <a href="" class="btn">刷新</a>
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

